// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fixtures_app/core/failures/exeptions.dart';
import 'package:fixtures_app/core/failures/failures.dart';
import 'package:fixtures_app/core/leagues_supported/leagues.dart';
import 'package:fixtures_app/core/network/network.dart';
import 'package:fixtures_app/features/fixtures/data/model/fixture_model.dart';
import 'package:fixtures_app/features/fixtures/data/sources/remote_data.dart';
import 'package:fixtures_app/features/fixtures/domain/repository/repository.dart';

class RepositoryImp extends Repository {
  NetworkCheaker networkCheacker;
  RemoteData remoteData;
  RepositoryImp({
    required this.networkCheacker,
    required this.remoteData,
  });

  @override
  Future<Either<Failure, List<FixtureModel>>> getfixturesbyday(
      {required String date, required int leagueid}) async {
    bool internet = await networkCheacker.check();

    try {
      if (internet) {
        try {
          List<FixtureModel> allmodels = await remoteData.getFixturesBydate(
              date: date, leagueId: leagueid);

          List<FixtureModel> models = [];

          if (allmodels.isEmpty) {
            throw ServerException();
          } else {
            for (var allmodels in allmodels) {
                if (leagueid == -1 &&
                    availableLeaguesId.contains(allmodels.leagueId)) {
                  models.add(allmodels);
                } else if (allmodels.leagueId == leagueid) {
                  models.add(allmodels);
                }
              }

            return Right(models);
          }
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {
        throw OfflineException();
      }
    } on OfflineException {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<FixtureModel>>> getLeaguesday(
      {required String date, required int leagueId}) async {
    bool internet = await networkCheacker.check();

    try {
      if (internet) {
        try {
          List<FixtureModel> allmodels = await remoteData.getFixturesBydate(
              date: date, leagueId: leagueId);
          List<FixtureModel> leagues = [];
          if (allmodels.isEmpty) {
            throw ServerException();
          } else {
            for (var allLeagues in allmodels) {
              if (!leagues.any((myleagues) =>
                      myleagues.leagueId == allLeagues.leagueId) &&
                  availableLeaguesId.contains(allLeagues.leagueId)) {
                leagues.add(allLeagues);
              }
            }

            return Right(leagues);
          }
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {
        throw OfflineException();
      }
    } on OfflineException {
      return Left(OfflineFailure());
    }
  }
}
