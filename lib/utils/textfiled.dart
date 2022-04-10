import 'package:flutter/material.dart';

class TextFieldSingleton{

  static TextFieldSingleton _instance = TextFieldSingleton._();
  TextFieldSingleton._();
  static TextFieldSingleton get instance => _instance;


  TextField buildTextField(TextEditingController newPasswordController, String hintText , String lableText, double radius , int maxLength ) {
    return TextField(
      controller: newPasswordController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: Color(0xFFADADAD), width: 1.0),
          borderRadius: BorderRadius.circular(radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: Color(0xFFADADAD), width: 1.0),
          borderRadius: BorderRadius.circular(radius),
        ),
        hintStyle: TextStyle(color: Color(0xAAADADAD) ,fontFamily: 'IRANSansMobile'),
        labelStyle: TextStyle(color: Color(0xAAADADAD) ,fontFamily: 'IRANSansMobile'),
        // color of hint
        hintText: hintText,
        labelText: lableText,

        prefixIcon: Container(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.access_alarm)
        ),


        counterText: '', // to hide length counter
      ),
      cursorColor: Color(0xFFADADAD),
      style: TextStyle(color: Color(0xFFFFADADAD)),
      textInputAction: TextInputAction.done,
      // keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // obscureText: true,
      maxLength: maxLength,
    );
  }

}