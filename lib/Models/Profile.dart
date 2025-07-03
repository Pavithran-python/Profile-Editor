
class Profile {
  final String name;
  final String bio;
  final String email;
  final String countryCode;
  final String phone;
  final String location;

  Profile({required this.name, required this.bio, required this.email,required this.countryCode ,required this.phone, required this.location,});

  factory Profile.fromJson(Map<String, dynamic> profileJson) => Profile(
    name: profileJson['name']??"",
    bio: profileJson['bio']??"",
    email: profileJson['email']??"",
    countryCode: profileJson['code'],
    phone: profileJson['phone']??"",
    location: profileJson['location']??"",
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'bio': bio,
    'email': email,
    'code':countryCode,
    'phone': phone,
    'location': location,
  };

  Profile copyWith({String? name, String? bio, String? email,String? countryCode , String? phone, String? location,}){
    return Profile(name: name ?? this.name, bio: bio ?? this.bio, email: email ?? this.email,countryCode: countryCode?? this.countryCode, phone: phone ?? this.phone, location: location ?? this.location,);
  }

}
