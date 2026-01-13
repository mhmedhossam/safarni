import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/core/models/base_model.dart';
import 'package:safarni/features/Home/domain/entities/home_entitiy.dart';
import 'package:safarni/features/Home/domain/home_repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl({required super.homeRemoteDataSource});

  @override
  Future<Either<Failure, HomeEntity>> getHome() async {
    try {
      BaseModel baseModel = await homeRemoteDataSource.getHome();

      return Right(baseModel.data as HomeEntity);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
