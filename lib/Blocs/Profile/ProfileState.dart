import 'package:editor/Models/Profile.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {

  @override
  List<Object?> get props => [];

}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile profile;
  ProfileLoaded({required this.profile});

  @override
  List<Object?> get props => [profile];

}

class ProfileSaving extends ProfileState {}

class ProfileSaved extends ProfileState {
  final Profile profile;
  ProfileSaved({required this.profile});

  @override
  List<Object?> get props => [profile];

}

class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});
  
  @override
  List<Object?> get props => [message];

}