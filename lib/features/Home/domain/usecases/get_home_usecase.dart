import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Home/domain/entities/home_entitiy.dart';
import 'package:safarni/features/Home/domain/home_repo/home_repo.dart';

class GetHomeUseCase {
  HomeRepo homeRepo;

  GetHomeUseCase({required this.homeRepo});
  Future<Either<Failure, HomeEntity>> call() async {
    var res = await homeRepo.getHome();
    return res;
  }
}
