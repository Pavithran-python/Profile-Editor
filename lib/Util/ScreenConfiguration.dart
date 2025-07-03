

import 'package:flutter/cupertino.dart';

class ScreenConfiguration{

  //Screen Size
  double screenWidth = 428;
  double screenHeight = 926;

  //Convert width and height according to different device
  double convertWidth({required double screenWidth,required double getWidth}){
    return screenWidth*(getWidth/this.screenWidth);
  }

  double convertHeight({required double screenHeight,required double getHeight}){
    return screenHeight*(getHeight/this.screenHeight);
  }

  //To create an Empty Container for width & height
  SizedBox emptyHeight({required double getScreenHeight,required double getHeight}){
    return SizedBox(height: convertHeight(screenHeight: getScreenHeight, getHeight: getHeight),);
  }

  SizedBox emptyWidth({required double getScreenWidth,required double getWidth}){
    return SizedBox(width: convertHeight(screenHeight: getScreenWidth, getHeight: getWidth),);
  }

}