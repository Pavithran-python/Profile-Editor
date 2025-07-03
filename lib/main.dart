import 'package:editor/Util/Constant.dart';
import 'package:editor/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Blocs/Profile/ProfileBloc.dart';
import 'Blocs/Profile/ProfileEvent.dart';
import 'Repositories/ProfileRepository.dart';
import 'Services/ProfileService.dart';

void main() {
  final repo = ProfileRepository(profileService: ProfileService());
  runApp(MyApp(profileRepository: repo));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.profileRepository});
  final ProfileRepository profileRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: profileRepository,
      child: BlocProvider(
        create: (_) => ProfileBloc(profileRepo: profileRepository)..add(LoadProfile()),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false, // ✅ debug banner off
          title: 'ProfileCraft',
          routerConfig: appRouter,
          theme: getThemeData,
        ),
      ),
    );
  }
}
