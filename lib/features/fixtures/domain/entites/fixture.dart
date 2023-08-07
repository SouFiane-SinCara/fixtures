import 'package:equatable/equatable.dart';

class Fixture extends Equatable {
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
  const Fixture({
    required this.leagueName,
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
    required this.awayLogoClub,
  });
  
  @override
  List<Object?> get props => [leagueName,leagueLogo,leagueId,homeNameClub,homeIdClub,homeScore,homeLogoClub,eventTime ,awayNameClub,awayidClub, awayScore ,awayLogoClub ];

}
