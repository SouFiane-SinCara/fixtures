
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:fixtures_app/core/constants/strings/failure_message.dart';
import 'package:fixtures_app/core/failures/failures.dart';
import 'package:fixtures_app/features/fixtures/data/model/fixture_model.dart';
import 'package:fixtures_app/features/fixtures/domain/use_cases/get_leagues_day.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'leagues_state.dart';

class LeaguesCubit extends Cubit<LeaguesState> {
  GetLeaguesDayUsecase getLeaguesDay;
  LeaguesCubit({
    required this.getLeaguesDay,
  }) : super(LeaguesInitial());
  String _getFailureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return offlineMessage;
      case ServerFailure:
        return serverMessage;

      default:
        return generalMessage;
    }
  }

  Future<void> getleagues({required String date, required int leagueId}) async {
    emit(LeaguesGettingState());

    Either<Failure, List<FixtureModel>> fold =
        await getLeaguesDay.call(date: date, leagueId: leagueId);
    fold.fold((fail) {
      emit(LeaguesErrorState(error: _getFailureMessage(fail)));
    }, (leagues) {
      emit(LoadedLeaguesState(leagues: leagues));
    });
  }
}
