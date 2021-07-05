import 'package:dexef_vol/cubit/login/login_cubit.dart';
import 'package:dexef_vol/cubit/login/login_states.dart';
import 'package:dexef_vol/widgets/custombutton_widget.dart';
import 'package:dexef_vol/widgets/customformfield/customformfiled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var companyNameController = TextEditingController();
  var routerIpController = TextEditingController();
  var dataBaseNameController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var xxcontrol = TextEditingController();
  String dropdownValue = 'One';
  Map? model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LoginCubit()..createDataBase(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cube = LoginCubit.get(context);
            var list = LoginCubit.get(context).companyData;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white, // Color(0xFF3399ff),
                elevation: 0.0,
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        DropdownButton(
                          value: dropdownValue,

                          // items: <String>['One', 'Two', 'Free', 'Four']
                          //     .map<DropdownMenuItem<String>>((String value) {
                          //   return DropdownMenuItem<String>(
                          //     value: value,
                          //     child: Text(value),
                          //   );
                          // }).toList(),
                          //

                          items: <String>['One', 'Two', 'Free', 'Four']
                              .map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                        ),

                        // PopupMenuButton(
                        //     itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        //           const PopupMenuItem(child: Text('Item A')),
                        //           const PopupMenuItem(child: Text('Item B')),
                        //         ]),
                        //    DropdownMenuItem(),

                        CustomFormField(
                          controler: companyNameController,
                          valid: (String? value) {
                            if (value!.isEmpty) {
                              return 'Email Address Can\'t be empty';
                            }
                          },
                          kbType: TextInputType.emailAddress,
                          label: 'Company Name',
                          onSubmit: (val) {},
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        CustomFormField(
                          valid: (String? value) {
                            if (value!.isEmpty) {
                              return 'Router IP Can\'t be empty';
                            }
                          },
                          label: 'Router IP',
                          controler: routerIpController,
                          kbType: TextInputType.number,
                          onSubmit: (val) {},
                        ),
                        SizedBox(
                          height: 15.0,
                        ),

                        CustomFormField(
                          controler: dataBaseNameController,
                          valid: (String? value) {
                            if (value!.isEmpty) {
                              return 'Database name Can\'t be empty';
                            }
                          },
                          label: 'Database name',
                          kbType: TextInputType.text,
                          onSubmit: (val) {},
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        CustomFormField(
                          controler: userNameController,
                          valid: (String? value) {
                            if (value!.isEmpty) {
                              return 'User Name Can\'t be empty';
                            }
                          },
                          label: 'User name',
                          kbType: TextInputType.text,
                          onSubmit: (val) {},
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        CustomFormField(
                          controler: passwordController,
                          valid: (String? value) {
                            if (value!.isEmpty) {
                              return 'password Can\'t be empty';
                            }
                          },
                          label: 'Password',
                          kbType: TextInputType.text,
                          onSubmit: (val) {},
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),

                        // Text(
                        //   '${model?['companyName']}',
                        // ),
                        CustomButton(
                          onPress: () => {
                            if (formKey.currentState!.validate())
                              {
                                cube.insertDatabase(
                                  companyNameController.text,
                                  routerIpController.text,
                                  dataBaseNameController.text,
                                  userNameController.text,
                                  passwordController.text,
                                ),
                              }
                            else
                              {}
                          },
                          label: 'Login',
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
// companyNameController?.text != null
// ? companyNameController!.text
//     : "",
// routerIpController?.text != null
// ? routerIpController!.text
//     : "",
// dataBaseNameController?.text != null
// ? dataBaseNameController!.text
//     : "",
// userNameController?.text != null
// ? userNameController!.text
//     : "",
// passwordController?.text != null
// ? passwordController!.text
//     : "",
