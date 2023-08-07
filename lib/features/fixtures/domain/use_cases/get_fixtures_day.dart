// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fixtures_app/core/failures/failures.dart';
import 'package:fixtures_app/features/fixtures/data/model/fixture_model.dart';
import 'package:fixtures_app/features/fixtures/domain/repository/repository.dart';

class GetFixturesByDayUseCase {
  Repository repository;
  GetFixturesByDayUseCase(
    this.repository,
  );
  Future<Either<Failure, List<FixtureModel>>> call(String date, int leagueId) {
    return repository.getfixturesbyday(date: date, leagueid: leagueId);
  }
}
