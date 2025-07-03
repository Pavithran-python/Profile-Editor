import 'package:dio/dio.dart';
import 'package:editor/Models/Profile.dart';

class ProfileService {
  Dio dio = Dio();

  Profile profile = Profile(name: 'Pavithran Muthaiah', bio: 'Mobile Application Developer', email: 'pavithran123@gmail.com',countryCode: '91' ,phone: '1234567890',location: 'Theni, Tamilnadu',);

  Future<Profile> fetchProfile() async {
    await Future.delayed(const Duration(seconds: 2));
    return profile;
  }

  Future<Profile> updateProfile({required Profile getProfileData}) async {
    await Future.delayed(const Duration(seconds: 2));
    profile = getProfileData;
    return profile;
  }
}
