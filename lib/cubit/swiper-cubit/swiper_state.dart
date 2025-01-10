part of 'swiper_cubit.dart';

@immutable
sealed class SwiperState {}

final class SwiperInitial extends SwiperState {}

final class SwiperSuccess extends SwiperState {}

final class SwiperLoading extends SwiperState {}

final class SwiperFailure extends SwiperState {
  final String massError;

  SwiperFailure({required this.massError});
}

final class LocalImagePickerState extends SwiperState {}

final class AddImageSuccess extends SwiperState {}

final class AddImageLoading extends SwiperState {}

final class AddImageFailure extends SwiperState {
  final String massError;

  AddImageFailure({required this.massError});
}

final class MakeBannerImageNullState extends SwiperState {}

final class UpdateOrDeleteImageSuccess extends SwiperState {}

final class UpdateOrDeleteImageLoading extends SwiperState {}

final class UpdateOrDeleteImageFailure extends SwiperState {
  final String massError;

  UpdateOrDeleteImageFailure({required this.massError});
}
