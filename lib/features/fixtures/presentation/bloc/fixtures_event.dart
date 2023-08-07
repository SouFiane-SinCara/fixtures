// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fixtures_bloc.dart';

abstract class FixturesEvent extends Equatable {
  const FixturesEvent();

  @override
  List<Object> get props => [];
}

class GetFixturesByDayEvent extends FixturesEvent {
  final String day;
  final int leagueId;
  const GetFixturesByDayEvent({
    required this.day,
    required this.leagueId
  });
}
