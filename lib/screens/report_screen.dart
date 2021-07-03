import 'package:dexef_vol/cubit/cubit.dart';
import 'package:dexef_vol/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ReportCubit()..getReportData(),
        child: BlocConsumer<ReportCubit, ReportStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var list = ReportCubit.get(context).reportModel;
            return SafeArea(
              child: Scaffold(
                  body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.grey[400],
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Category :'
                                    '${list?.categoryTrans?[0].categoryName}'), //'category name'
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward_ios))
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 12),
                            buildCategoryRow('From :1-1-1', 'To : 2-2-2'),
                            SizedBox(height: 12),
                            buildCategoryRow('Branch : head', 'Store : main'),
                            SizedBox(height: 12),
                            buildCategoryRow(
                                'Total Quant : 5 ', 'Total Balance : 5'),
                            // SizedBox(height: 12),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .6,
                        child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Container(
                                      color: Colors.grey[400],
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(10),
                                              height: 40,
                                              color: Colors.blue,
                                              child: buildCategoryRow(
                                                  'Date : '
                                                      '${list?.categoryTrans?[index].dealingDt}',
                                                  'Trans Num: '
                                                      '${list?.categoryTrans?[index].dealingNum}')),
                                          SizedBox(height: 12),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text('Transactions : '
                                                '${list?.categoryTrans?[index].dealingName}'),
                                          ), //'Transactions : data'
                                          SizedBox(height: 5),
                                          buildCategoryRow(
                                            'Quantity : '
                                                '${list?.categoryTrans?[index].quantity}',
                                            'Balance : '
                                                '${list?.categoryTrans?[index].balance}',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 0.0,
                                    color: Colors.grey,
                                  ),
                                ),
                            itemCount: list?.categoryTrans != null
                                ? list!.categoryTrans!.length - 1
                                : 0),
                      ),
                    ],
                  ),
                ),
              )),
            );
          },
        ));
  }
}

Row buildCategoryRow(
  String firstText,
  String secondText,
) {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(firstText),
      SizedBox(
        width: 40,
      ),
      Text(secondText),
    ],
  );
}
