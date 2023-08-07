import 'package:fixtures_app/features/fixtures/domain/entites/fixture.dart';

class FixtureModel extends Fixture {
  final String leagueName;
  final String leagueLogo;
  final int leagueId;
  final String homeNameClub;
  final int homeIdClub;
  final int homeScore;
  final String homeLogoClub;
  final String eventTime;
  final String awayNameClub;
  final int awayidClub;
  final int awayScore;
  final String awayLogoClub;

  const FixtureModel(
      {required this.leagueName,
      required this.leagueLogo,
      required this.leagueId,
      required this.homeNameClub,
      required this.homeIdClub,
      required this.homeScore,
      required this.homeLogoClub,
      required this.eventTime,
      required this.awayNameClub,
      required this.awayidClub,
      required this.awayScore,
      required this.awayLogoClub})
      : super(
            leagueName: leagueName,
            leagueLogo: leagueLogo,
            leagueId: leagueId,
            homeLogoClub: homeLogoClub,
            homeIdClub: homeIdClub,
            homeScore: homeScore,
            homeNameClub: homeLogoClub,
            eventTime: eventTime,
            awayNameClub: awayNameClub,
            awayidClub: awayidClub,
            awayScore: awayScore,
            awayLogoClub: awayLogoClub);

  factory FixtureModel.fromJson(Map json) {
    Map league = json['league'];
    Map teams = json['teams'];
    Map goals = json['goals'];

    return FixtureModel(
        leagueName: league['name'],
        leagueLogo: league['logo'],
        leagueId: league['id'],
        homeNameClub: teams['home']['name'],
        homeIdClub: teams['home']['id'],
        homeScore: goals['home'] == null ? 0 : goals['home'],
        homeLogoClub: teams['home']['logo'],
        eventTime: json['fixture']['date'],
        awayNameClub: teams['away']['name'],
        awayidClub: teams['away']['id'],
        awayScore: goals['away'] == null ? 0 : goals['away'],
        awayLogoClub: teams['away']['logo']);
  }
  
  @override
  List<Object?> get props => [
        leagueName,
        leagueLogo,
        leagueId,
        homeNameClub,
        homeIdClub,
        homeScore,
        homeLogoClub,
        eventTime,
        awayNameClub,
        awayidClub,
        awayScore,
        awayLogoClub
      ];
}
