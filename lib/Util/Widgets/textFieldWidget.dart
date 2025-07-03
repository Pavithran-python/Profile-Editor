

import 'package:editor/Util/Constant.dart';
import 'package:editor/Util/ScreenConfiguration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class textFieldWidget extends StatelessWidget{
  textFieldWidget({super.key,required this.label,required this.controller,required this.validation,required this.maxLines,required this.maxLength,required this.keyboard,});
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final int? maxLines;
  final int? maxLength;
  final TextInputType keyboard;


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(bottom: ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: textFieldBottomPadding)),
      child: TextFormField(
        controller: controller,
        maxLength:maxLength,
        maxLines: maxLines,
        keyboardType: keyboard,
        textInputAction: keyboard==TextInputType.streetAddress?TextInputAction.done:TextInputAction.next,
        validator: validation,
        inputFormatters:keyboard==TextInputType.phone?[FilteringTextInputFormatter.allow(RegExp('[0-9]'))]:keyboard==TextInputType.name?[FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))]:null,
        decoration: InputDecoration(
          counterText: '',
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: textFieldBorderRadius))),
        ),
        style: TextStyle(fontSize: ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: textFieldFontSize),),
      ),
    );
  }

}