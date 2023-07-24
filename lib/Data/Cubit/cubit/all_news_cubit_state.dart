part of 'all_news_cubit_cubit.dart';

@immutable
abstract class AllNewsCubitState {}

class AllNewsCubitInitial extends AllNewsCubitState {}

class AllNewsCubitLoading extends AllNewsCubitState {}

class AllNewsCubiSuccess extends AllNewsCubitState {
  final LlNewsModel ourresponse;
  AllNewsCubiSuccess({required this.ourresponse});
}

class AllNewsCubitError extends AllNewsCubitState {}
