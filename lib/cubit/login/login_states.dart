abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginCreateDBState extends LoginInitialState {}

class LoginInsertDBState extends LoginInitialState {}

class LoginLoadingState extends LoginInitialState {}

class LoginOpenAndReadDBState extends LoginInitialState {}
