import 'package:editor/Blocs/Profile/ProfileBloc.dart';
import 'package:editor/Blocs/Profile/ProfileState.dart';
import 'package:editor/Models/Profile.dart';
import 'package:editor/Util/Widgets/GradientHeader.dart';
import 'package:editor/Util/Widgets/ProfileCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileViewPage extends StatelessWidget {
  const ProfileViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Public Profile'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(width: screenWidth,height: screenHeight,child: GradientHeader(),),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return  CircularProgressIndicator(color: Colors.white,);
              }
              if (state is ProfileLoaded || state is ProfileSaved) {
                final getProfile = (state as dynamic).profile as Profile;
                return ProfileCardWidget(getProfileDetail: getProfile);
              }
              if (state is ProfileError) {
                return Text('Error: ${state.message}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),);
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
