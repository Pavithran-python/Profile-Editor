import 'package:editor/Models/Profile.dart';
import 'package:editor/Services/ProfileService.dart';

class ProfileRepository {
  final ProfileService profileService;
  ProfileRepository({required this.profileService});

  Future<Profile> getProfile(){
    return profileService.fetchProfile();
  }

  Future<Profile> putProfile({required Profile updateProfileData}){
    return profileService.updateProfile(getProfileData: updateProfileData);
  }

}
