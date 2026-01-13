import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/core/error/failure.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/domain/entities/home_entitiy.dart';
import 'package:round_8_mobile_safarni_team3/features/Home/domain/home_repo/home_repo.dart';

class GetHomeUseCase {
  HomeRepo homeRepo;

  GetHomeUseCase({required this.homeRepo});
  Future<Either<Failure, HomeEntity>> call() async {
    var res = await homeRepo.getHome();
    return res;
  }
}
