import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dexef_vol/cubit/states.dart';
import 'package:dexef_vol/model/report.dart';
import 'package:dexef_vol/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportCubit extends Cubit<ReportStates> {
  ReportCubit() : super(AppReportInitialState());
  static ReportCubit get(context) => BlocProvider.of(context);

  ReportModel? reportModel;
  // List<dynamic> reportModel = [];
  void getReportData() {
    emit(AppReportLoadingState());
    DioHelper.getData(
      url: 'Dexef_HR_WebService.asmx/getCategoryTrans',
    ).then((value) {
      reportModel = ReportModel.fromJson(json.decode(value.data));
      // print(value.data.toString());
      //   reportModel = value.data['category_trans'];

      emit(AppReportSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppReportFailState(error.toString()));
    });
  }
}
