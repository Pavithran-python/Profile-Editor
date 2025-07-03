import 'package:editor/Blocs/Profile/ProfileBloc.dart';
import 'package:editor/Blocs/Profile/ProfileEvent.dart';
import 'package:editor/Blocs/Profile/ProfileState.dart';
import 'package:editor/Models/Profile.dart';
import 'package:editor/Util/Constant.dart';
import 'package:editor/Util/ScreenConfiguration.dart';
import 'package:editor/Util/Validator.dart';
import 'package:editor/Util/Widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EditProfilePage extends HookWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bloc  = context.read<ProfileBloc>();
    final state = context.watch<ProfileBloc>().state;
    
    // Treat Loaded, Saving, Saved as all showing the same form
    final bool loadedLike = state is ProfileLoaded || state is ProfileSaved || state is ProfileSaving;
    if (!loadedLike) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // Keep last known profile across Saving state using useRef
    final profileRef = useRef<Profile?>((state is ProfileLoaded) ? state.profile : (state is ProfileSaved) ? state.profile : null);

    if (state is ProfileLoaded) profileRef.value = state.profile;
    if (state is ProfileSaved)  profileRef.value = state.profile;

    // Safety — profile will be non‑null after first load
    final profile = profileRef.value!;

    // Controllers (hooks keep them alive) ───
    final nameController  = useTextEditingController(text: profile.name);
    final bioController   = useTextEditingController(text: profile.bio);
    final mailController  = useTextEditingController(text: profile.email);
    final codeController    = useTextEditingController(text: profile.countryCode);
    final phoneController   = useTextEditingController(text: profile.phone);              
    final locationController  = useTextEditingController(text: profile.location);
    final form   = useMemoized(() => GlobalKey<FormState>(), []);
    final saving = state is ProfileSaving;
    
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSaved) {
          // navigate back AFTER current frame completes
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Profile updated successfully!'),
                behavior: SnackBarBehavior.fixed,   // looks like a toast
                duration: Duration(seconds: 2),
              ),
            );
            context.pop();
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Edit Profile')),
        resizeToAvoidBottomInset: true,
        // body scrolls; bottom padding keeps last field visible
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: editProfileHorizontalPadding)),
          child: Form(
            key: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScreenConfiguration().emptyHeight(getScreenHeight: screenHeight, getHeight: editProfileTopPadding),
                textFieldWidget(label: 'Name', controller: nameController, validation: Validators.required, maxLines: 1, maxLength: 100, keyboard: TextInputType.name),
                textFieldWidget(label: 'Bio', controller:  bioController, validation: Validators.required, maxLines: 3, maxLength: 1000, keyboard: TextInputType.text),
                textFieldWidget(label: 'Email', controller: mailController, validation: Validators.email, maxLines: 1, maxLength: null, keyboard:TextInputType.emailAddress),
                // ── Phone row ──
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: textFieldWidget(label: 'Code', controller: codeController, validation: Validators.countryCode, maxLines: 1, maxLength: 4, keyboard: TextInputType.phone),
                    ),
                    ScreenConfiguration().emptyWidth(getScreenWidth: screenWidth, getWidth: textFieldInBetweenSpace),
                    Flexible(
                      flex: 5,
                      child:textFieldWidget(label: 'Mobile', controller: phoneController, validation: Validators.mobile, maxLines: 1,maxLength: 21, keyboard: TextInputType.phone),
                    ),
                  ],
                ),
                textFieldWidget(label: 'Location',controller: locationController,validation:Validators.required,maxLines: 1,maxLength: 150,keyboard: TextInputType.streetAddress),
              ],
            ),
          ),
        ),
        // ─── bottom bar with Cancel / Save ───
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: bottomNavigationHorizontalPadding),vertical: ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: bottomNavigationVerticalPadding)),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 7,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: buttonHeight),
                  child: OutlinedButton(
                    onPressed: () {
                      if(!saving){
                        context.pop();
                      }
                    },
                    style:OutlinedButton.styleFrom(
                      side: BorderSide(color: primaryColor,width: ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: buttonBorderWidth)),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: buttonBorderRadius))),
                    ),
                    child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.w500,color: primaryColor,fontSize:ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: buttonTextSize)),),
                  ),
                ),
              ),
              ScreenConfiguration().emptyWidth(getScreenWidth: screenWidth, getWidth: bottomNavigationButtonPadding),
              Expanded(
                child: Container(
                  height: ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: buttonHeight),
                  child: ElevatedButton(
                    onPressed:  ()  {
                      if(!saving){
                        if (form.currentState!.validate()) {
                          bloc.add(SubmitProfileUpdate(profileUpdated: profile.copyWith(name: nameController.text, bio: bioController.text, email: mailController.text, countryCode: codeController.text, phone: phoneController.text, location: locationController.text,),));
                          //context.pop();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: buttonBorderRadius))),
                    ),
                    child: (saving) ? SizedBox.square(dimension: (buttonHeight/2), child: CircularProgressIndicator(strokeWidth: ScreenConfiguration().convertWidth(screenWidth: screenWidth, getWidth: 3), color: Colors.white,),)
                        : Text('Save',style: TextStyle(fontWeight: FontWeight.w500,fontSize:ScreenConfiguration().convertHeight(screenHeight: screenHeight, getHeight: buttonTextSize))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


