import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/domain/entities/home_entitiy.dart';

abstract class HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepo({required this.homeRemoteDataSource});

  Future<Either<Failure, HomeEntity>> getHome();
}
