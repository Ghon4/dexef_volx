import 'package:dexef_vol/model/report.dart';
import 'package:flutter/material.dart';

class DesignTest extends StatelessWidget {
  const DesignTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportModel? reportModel;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              color: Colors.grey[400],
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(reportModel!.categoryTrans!['categoryName']
                          .toString()),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
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
                  buildCategoryRow('Total Quant : 5 ', 'Total Balance : 5'),
                  SizedBox(height: 12),
                ],
              ),
            ),
            SizedBox(height: 60),
            Container(
              color: Colors.grey[400],
              child: Column(
                children: [
                  Container(
                      height: 40,
                      color: Colors.blue,
                      child: buildCategoryRow(
                          '1 - Date : 1-1-1', 'Trans Num: 2415')),
                  SizedBox(height: 12),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Transactions : data')),
                  SizedBox(height: 12),
                  buildCategoryRow('Quantity : 20', 'Balance : 2'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
}
