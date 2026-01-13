import 'package:round_8_mobile_safarni_team3/core/models/base_model.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/data/model/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<BaseModel<HomeModel>> getHome();
}
