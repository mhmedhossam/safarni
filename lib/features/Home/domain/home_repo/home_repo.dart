import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Home/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:safarni/features/Home/domain/entities/home_entitiy.dart';

abstract class HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepo({required this.homeRemoteDataSource});

  Future<Either<Failure, HomeEntity>> getHome();
}
