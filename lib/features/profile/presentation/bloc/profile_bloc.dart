import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
       on<ShowBottomModalSheetEvent>(showBottomModalSheetEvent);
       on<ShowImagePickerOptionEvent>(showImagePickerOptionEvent);

  }

  FutureOr<void> showBottomModalSheetEvent(ShowBottomModalSheetEvent event, Emitter<ProfileState> emit) {
    emit(ShowBottomModalSheetState(newBio: event.newBio));
    log('state emitted');
  }

  FutureOr<void> showImagePickerOptionEvent(ShowImagePickerOptionEvent event, Emitter<ProfileState> emit) {
    emit(ShowImagePickerOptionState());
  }
}
