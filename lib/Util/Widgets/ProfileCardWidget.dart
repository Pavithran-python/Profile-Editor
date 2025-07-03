import 'package:editor/Models/Profile.dart';
import 'package:editor/Util/Constant.dart';
import 'package:editor/Util/ScreenConfiguration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'InfoCardWidget.dart';

class ProfileCardWidget extends StatelessWidget{
  const ProfileCardWidget({super.key,required this.getProfileDetail});
  final Profile getProfileDetail;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: profileViewHorizontalPadding)),
      child: Card(
        elevation: 10,
        color: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: cardRadius))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: profileViewHorizontalPadding), vertical: ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: profileViewVerticalPadding),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: profileIconOuterSize),
                height: ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: profileIconOuterSize),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: profileIconOuterSize)), border: Border.all(color: primaryColor,width: ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: buttonBorderWidth)),),
                child: Icon(Icons.person, size: ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth:profileIconSize), color: primaryColor),
              ),
              ScreenConfiguration().emptyHeight(getScreenHeight: screenHeight, getHeight: profileViewVerticalPadding),
              Text(getProfileDetail.name, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              ScreenConfiguration().emptyHeight(getScreenHeight: screenHeight, getHeight: profileViewVerticalPadding),
              Text(getProfileDetail.bio, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700])),
              ScreenConfiguration().emptyHeight(getScreenHeight: screenHeight, getHeight: profileViewVerticalPadding),
              const Divider(),
              InfoCardWidget(iconData: Icons.email, getValue: getProfileDetail.email,),
              InfoCardWidget(iconData: Icons.phone, getValue: "+${getProfileDetail.countryCode} ${getProfileDetail.phone}",),
              InfoCardWidget(iconData: Icons.location_on, getValue: getProfileDetail.location,),
              const Divider(),
              ScreenConfiguration().emptyHeight(getScreenHeight: screenHeight, getHeight: profileViewVerticalPadding),
              Container(
                width: ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: profileViewButtonWidth),
                height: ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: buttonHeight),
                child: ElevatedButton(
                  onPressed:  ()  {
                    context.push('/edit');
                  },
                  style: ElevatedButton.styleFrom(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: buttonBorderRadius))),
                  ),
                  child: Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.w500,fontSize:ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: buttonTextSize))),
                ),
              ),
              ScreenConfiguration().emptyHeight(getScreenHeight: screenHeight, getHeight: profileViewVerticalPadding),
            ],
          ),
        ),
      ),
    );
  }

}