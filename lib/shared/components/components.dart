import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void navigateToWithoutReturn(context,Widget screen)
=> Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
        builder: (context)=>screen
    ),
        (Route<dynamic>route) => false);
void navigateToWithReturn(context,Widget screen)
=> Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context)=>screen
    ));

Widget defaultTextForm({
  required TextEditingController controller,
  Widget? suffixIcon,
  required IconData prefix,
  required String hintText,
  required FormFieldValidator validate,
  bool obscure=false,
  required Function onSubmitted,
  required Function onChanged,
  required TextInputType type,
})
=> TextFormField(
  controller: controller,
  decoration: InputDecoration(
    prefixIcon: Icon(prefix),
    suffixIcon: suffixIcon,
    label: Text(hintText),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  style: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  ),
  validator: validate,
  obscureText:obscure ,
  keyboardType: type,
  onFieldSubmitted:onSubmitted(),
);

enum ToastState {SUCCESS,ERROR,WARNING}
Future<bool?> showToast({
  required String message,
  required ToastState state,
})
=> Fluttertoast.showToast(
  msg:message,
  gravity: ToastGravity.BOTTOM,
  textColor: Colors.white,
  toastLength: Toast.LENGTH_LONG,
  timeInSecForIosWeb: 5,
  backgroundColor: chooseToastColor(state),
);

Color chooseToastColor(ToastState state)
{
  late Color color;
  switch(state){
    case ToastState.SUCCESS:
      color=Colors.green;
      break;
    case ToastState.ERROR:
      color=Colors.red;
      break;
    case ToastState.WARNING:
      color=Colors.amber;
      break;
  }
  return color;
}
