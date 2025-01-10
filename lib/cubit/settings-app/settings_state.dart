part of 'settings_cubit.dart';

@immutable
sealed class SettingsAppState {}

final class SettingsAppInitial extends SettingsAppState {}

final class SelectLanguagesState extends SettingsAppState {}
