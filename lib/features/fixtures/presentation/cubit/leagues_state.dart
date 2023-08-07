// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'leagues_cubit.dart';

abstract class LeaguesState extends Equatable {
  const LeaguesState();

  @override
  List<Object> get props => [];
}

class LeaguesInitial extends LeaguesState {}

class LeaguesGettingState extends LeaguesState {}

class LeaguesErrorState extends LeaguesState {
  final String error;
  const LeaguesErrorState({
    required this.error,
  });
}

class LoadedLeaguesState extends LeaguesState {
 final List<FixtureModel> leagues;
  const LoadedLeaguesState({
    required this.leagues,
  });
}
