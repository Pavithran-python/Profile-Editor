import 'package:editor/Models/Profile.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {}

class SubmitProfileUpdate extends ProfileEvent {
  final Profile profileUpdated;
  SubmitProfileUpdate({required this.profileUpdated});

  @override
  List<Object?> get props => [profileUpdated];

}