import 'package:safarni/core/error/error_handler.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/core/models/base_model.dart';
import 'package:safarni/core/services/api/network/dio_provider.dart';
import 'package:safarni/core/services/api/network/main_endpoint.dart';
import 'package:safarni/features/Home/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:safarni/features/Home/data/model/home_model.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<BaseModel<HomeModel>> getHome() async {
    try {
      var response = await DioProvider.get(MainEndpoint.home);

      if (response.data is Map<String, dynamic>) {
        return BaseModel.fromJson(response.data as Map<String, dynamic>, (
          json,
        ) {
          if (json is List && json.isEmpty) {
            throw ServerFailure("error please try again later ");
          }
          return HomeModel.fromJson(json);
        });
      } else {
        throw ServerFailure("error in server now try again later");
      }
    } catch (e) {
      //print(e.toString());

      throw ErrorHandler.handle(e);
    }
  }
}
