

import 'package:editor/Util/Constant.dart';
import 'package:editor/Util/ScreenConfiguration.dart';
import 'package:flutter/cupertino.dart';

class InfoCardWidget extends StatelessWidget{
  const InfoCardWidget({super.key,required this.iconData,required this.getValue});
  final IconData iconData;
  final String getValue;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: infoCardWidgetVerticalPadding)),
      child: Row(children: [
        Icon(iconData, color: primaryColor,size: ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: iconWidth),),
        ScreenConfiguration().emptyWidth(getScreenWidth: screenWidth, getWidth: paddingBetweenIconText),
        Expanded(child: Text(getValue, style: TextStyle(fontSize: ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: infoWidgetCardTextSize)))),
      ]),
    );
  }

}