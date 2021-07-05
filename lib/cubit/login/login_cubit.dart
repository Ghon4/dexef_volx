import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dexef_vol/cubit/login/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  Database? _database;
  List<Map> companyData = [];

  Future<void> createDataBase() async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final stringType = 'TEXT NOT NULL';

    openDatabase(
      'login.db',
      version: 1,
      onCreate: (database, version) async {
        await database
            .execute(
          'CREATE TABLE loginData (id $idType, companyName $stringType, routerIp $stringType, DBName $stringType, userName $stringType, password $stringType)',
        )
            .then((value) {
          print('database created');
        }).catchError((error) => print('onError $error'));
      },
      onOpen: (database) {
        getDataFromDatabase(database);

        print('DB opened');
      },
    ).then(
      (value) {
        _database = value;
        emit(LoginCreateDBState());
    );      },

}

  getDataFromDatabase(_database) {
    emit(LoginLoadingState());
    _database.rawQuery('SELECT * FROM loginData').then((value) {
      companyData = value;
      // print('data is :: $companyData');

      companyData.forEach((element) {
        print(element['companyName']);
      });

      // value.forEach((element) {
      //   companyData.add(element);
      //   print(element['companyName']);
      // });
      // print(value.toString());

      emit(LoginOpenAndReadDBState());
    });
  }

  insertDatabase(
    String companyName,
    String routerIp,
    String DBName,
    String userName,
    String password,
  ) async {
    // _database!.insert('loginData', {
    //   'companyName': "$companyName",
    //   'routerIp': "$routerIp",
    //   'DBName': "$DBName",
    //   'userName': "$userName",
    //   'password': "$password",
    // }).then((value) {
    //   emit(LoginInsertDBState());
    //   getDataFromDatabase(_database);
    //   print('$value raw inserted');
    // }).catchError((onError) {
    //   print('$onError raw not inserted');
    // });
    // ("$companyName","$routerIp","$DBName","$userName",,"$password")
    await _database
        ?.rawInsert(
            'INSERT INTO loginData (companyName,routerIp,DBName,userName,password) VALUES ("$companyName","$routerIp","$DBName","$userName","$password")')
        .then((value) {
      emit(LoginInsertDBState());
      getDataFromDatabase(_database);
      print('$value raw inserted');
    }).catchError((onError) {
      print('$onError raw not inserted');
    });

    // await _database?.transaction((txn) {

    //   txn
    //       .rawInsert(
    //           'INSERT INTO loginData (companyName,routerIp,DBName,userName,password) VALUES
    //                                  ("$companyName","$routerIp","$DBName","$userName",,"$password")')
    //       .then((value) {
    //     emit(LoginInsertDBState());
    //     getDataFromDatabase(_database);
    //     print('$value raw inserted');
    //   }).catchError((onError) {
    //     print('$onError raw not inserted');
    //   });
    //   return null;
    // });
  }
}
