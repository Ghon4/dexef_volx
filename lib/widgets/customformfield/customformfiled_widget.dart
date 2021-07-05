import 'package:flutter/material.dart';

// Widget defaultFormField({
//   Function(String)? onChange,
//   Function()? onTap,
//   bool isPassword = false,
//   @required String? Function(String?)? validate,
//   @required String? label,
//   @required IconData? prefix,
//   IconData? suffix,
//   Function()? suffixPressed,
//   bool isClickable = true,
// }) =>
//     TextFormField(
//       controller: controller,
//       keyboardType: type,
//       obscureText: isPassword,
//       enabled: isClickable,
//       onFieldSubmitted: onSubmit,
//       onChanged: onChange,
//       onTap: onTap,
//       validator: validate,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(
//           prefix,
//         ),
//         suffixIcon: suffix != null
//             ? IconButton(
//                 onPressed: suffixPressed,
//                 icon: Icon(
//                   suffix,
//                 ),
//               )
//             : null,
//         border: OutlineInputBorder(),
//       ),
//     );

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    required this.controler,
    required this.kbType,
    required this.onSubmit,
    required this.label,
    required this.valid,
    this.isPassword = false,
  });

  final TextEditingController? controler;
  final TextInputType kbType;
  final Function(String) onSubmit;
  final String label;
  final String? Function(String?) valid;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,

      keyboardType: kbType, //TextInputType.emailAddress
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: valid,
      obscureText: isPassword,
    );
  }
}
