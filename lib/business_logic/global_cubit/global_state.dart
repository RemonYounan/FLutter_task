// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class LoadingState extends GlobalState {}

class FilterSelectedState extends GlobalState {}

class HelpListLoadedState extends GlobalState {
  final List<HelpModel> helpList;

  HelpListLoadedState({
    required this.helpList,
  });
}

