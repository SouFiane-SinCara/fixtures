// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fixtures_app/core/failures/failures.dart';
import 'package:fixtures_app/features/fixtures/data/model/fixture_model.dart';
import 'package:fixtures_app/features/fixtures/domain/repository/repository.dart';

class GetLeaguesDayUsecase {
  Repository fixturesRepository;
  GetLeaguesDayUsecase(
     this.fixturesRepository,
  );
  Future<Either<Failure, List<FixtureModel>>> call(
      {required String date, required int leagueId}) {
    return fixturesRepository.getLeaguesday(date: date, leagueId: leagueId);
  }
}
