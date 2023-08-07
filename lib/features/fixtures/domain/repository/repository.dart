import 'package:dartz/dartz.dart';
import 'package:fixtures_app/core/failures/failures.dart';
import 'package:fixtures_app/features/fixtures/data/model/fixture_model.dart';

abstract class Repository {
  Future<Either<Failure, List<FixtureModel>>> getfixturesbyday(
      {required String date, required int leagueid});
  Future<Either<Failure, List<FixtureModel>>> getLeaguesday(
      {required String date, required int leagueId});
}
