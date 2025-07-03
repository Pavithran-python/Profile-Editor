import 'package:editor/Repositories/ProfileRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ProfileEvent.dart';
import 'ProfileState.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepo;

  ProfileBloc({required this.profileRepo}) : super(ProfileInitial()) {
    on<LoadProfile>(_onLoad);
    on<SubmitProfileUpdate>(_onUpdate);
  }

  Future<void> _onLoad(LoadProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final profileData = await profileRepo.getProfile();
      emit(ProfileLoaded(profile: profileData));
    } catch (e) {
      emit(ProfileError(message:e.toString()));
    }
  }

  Future<void> _onUpdate(SubmitProfileUpdate event, Emitter<ProfileState> emit) async {
    emit(ProfileSaving());
    try {
      final updatedProfile = await profileRepo.putProfile(updateProfileData:event.profileUpdated);
      emit(ProfileSaved(profile: updatedProfile));
    } catch (e) {
      emit(ProfileError(message:e.toString()));
    }
  }
}