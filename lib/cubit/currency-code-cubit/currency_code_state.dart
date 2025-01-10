part of 'currency_code_cubit.dart';

@immutable
sealed class CurrencyCodeState {}

final class CurrencyCodeInitial extends CurrencyCodeState {}

final class CurrencyCodeChanged extends CurrencyCodeState {}

final class CurrencyCodeSuccess extends CurrencyCodeState {}

final class CurrencyCodeFailure extends CurrencyCodeState {}

final class CurrencyCodeLoading extends CurrencyCodeState {}
