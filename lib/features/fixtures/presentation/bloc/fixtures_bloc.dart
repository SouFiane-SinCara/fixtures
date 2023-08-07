
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fixtures_app/core/constants/strings/failure_message.dart';
import 'package:fixtures_app/core/failures/failures.dart';
import 'package:fixtures_app/features/fixtures/data/model/fixture_model.dart';
import 'package:fixtures_app/features/fixtures/domain/use_cases/get_fixtures_day.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fixtures_event.dart';
part 'fixtures_state.dart';

class FixturesBloc extends Bloc<FixturesEvent, FixturesState> {
  GetFixturesByDayUseCase getFixtures;
  FixturesBloc({
    required this.getFixtures
  }) : super(FixturesInitial()) {
    String getFailureMessage(Failure failure) {
      switch (failure.runtimeType) {
        case OfflineFailure:
          return offlineMessage;
        case ServerFailure:
          return serverMessage;

        default:
          return generalMessage;
      }
    }

    on<FixturesEvent>((event, emit) async {
      if (event is GetFixturesByDayEvent) {
        emit(GettingFixtures());
        Either<Failure, List<FixtureModel>> fold =
            await getFixtures.call(event.day, event.leagueId);
        fold.fold((fail) {
          emit(ErrorFixtures(error: getFailureMessage(fail)));
        }, (fixturesModels) {
          emit(LoadedFixtures(fixtures: fixturesModels));
        });
      }
    });
  }
}
