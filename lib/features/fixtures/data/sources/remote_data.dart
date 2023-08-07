import 'package:dio/dio.dart';

import 'package:fixtures_app/core/constants/api/api_url.dart';
import 'package:fixtures_app/core/constants/api/headers.dart';
import 'package:fixtures_app/core/failures/exeptions.dart';
import 'package:fixtures_app/features/fixtures/data/model/fixture_model.dart';

abstract class RemoteData {
  Future<List<FixtureModel>> getFixturesBydate(
      {required String date, required int leagueId});
}

class RemoteDataDio extends RemoteData {
  Dio dio;
  RemoteDataDio({
    required this.dio,
  });
  @override
  Future<List<FixtureModel>> getFixturesBydate(
      {required String date, required int leagueId}) async {
    final response = await dio.get("$apiUrl/fixtures?date=$date",
        options: Options(headers: header));
    if (response.statusCode == 200) {

      List jsondata = response.data['response'];

      List<FixtureModel> fixtures = jsondata.map((json) {
        return FixtureModel.fromJson(json);
      }).toList();
      return fixtures;
    } else {
      throw ServerException();
    }
  }
}
