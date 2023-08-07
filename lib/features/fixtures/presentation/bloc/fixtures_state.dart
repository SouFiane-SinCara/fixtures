// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fixtures_bloc.dart';

abstract class FixturesState extends Equatable {
  const FixturesState();

  @override
  List<Object> get props => [];
}

class FixturesInitial extends FixturesState {}
class GettingFixtures extends FixturesState{}
class LoadedFixtures extends FixturesState {
  final List<FixtureModel> fixtures;
  const LoadedFixtures({
    required this.fixtures,
  });
}

class ErrorFixtures extends FixturesState {
  final String error;
  const ErrorFixtures({
    required this.error,
  });
}
