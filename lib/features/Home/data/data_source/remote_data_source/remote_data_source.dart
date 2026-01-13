import 'package:safarni/core/models/base_model.dart';
import 'package:safarni/features/Home/data/model/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<BaseModel<HomeModel>> getHome();
}
