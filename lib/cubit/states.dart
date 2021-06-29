abstract class ReportStates {}

class AppReportInitialState extends ReportStates {}

class AppReportLoadingState extends ReportStates {}

class AppReportSuccessState extends ReportStates {}

class AppReportFailState extends ReportStates {
  final String error;

  AppReportFailState(this.error);
}
