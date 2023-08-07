import 'package:dio/dio.dart';
import 'package:fixtures_app/core/network/network.dart';
import 'package:fixtures_app/features/fixtures/data/repository/repository_imp.dart';
import 'package:fixtures_app/features/fixtures/data/sources/remote_data.dart';
import 'package:fixtures_app/features/fixtures/domain/repository/repository.dart';
import 'package:fixtures_app/features/fixtures/domain/use_cases/get_fixtures_day.dart';
import 'package:fixtures_app/features/fixtures/domain/use_cases/get_leagues_day.dart';
import 'package:fixtures_app/features/fixtures/presentation/bloc/fixtures_bloc.dart';
import 'package:fixtures_app/features/fixtures/presentation/cubit/leagues_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt sl = GetIt.instance;
void init() {
  //!state management
  //*bloc(fixtures)
  sl.registerLazySingleton(
      () => FixturesBloc(getFixtures: sl()));
  //*cubit(leagues
  sl.registerLazySingleton(
      () => LeaguesCubit(getLeaguesDay: sl()));
  //!use cases
  //*get leagues
  sl.registerLazySingleton(() => GetLeaguesDayUsecase(sl()));
  //*get fixtures
  sl.registerLazySingleton(() => GetFixturesByDayUseCase(sl()));
  //!repository
  sl.registerLazySingleton<Repository>(() =>
      RepositoryImp(networkCheacker: sl(), remoteData: sl()));
  //!data
  //*remote data
  sl.registerLazySingleton<RemoteData>(() => RemoteDataDio(dio: sl()));
  //!core
  //*network
  sl.registerFactory<NetworkCheaker>(() =>
      NetworkCheckerInternetConnectionChecker(
          internetConnectionChecker: sl()));
  //!external
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
