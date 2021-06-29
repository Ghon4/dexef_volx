import 'package:dexef_vol/cubit/cubit.dart';
import 'package:dexef_vol/cubit/states.dart';
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
            return Scaffold(
              body: TextButton(
                onPressed: () {},
                child: Center(child: Text("INVOKE")),
              ),
            );
          },
        ));
  }
}
