import 'package:dartz/dartz.dart';
import 'package:safarni/features/profile/domain/entity/user_entity.dart';

import '../../../../core/error/failure.dart';
import '../repo/repo.dart';

class GetProfileUseCase {
  final ProfileRepo repo;

  GetProfileUseCase({required this.repo});

  Future<Either<Failure, UserProfileEntity>> call() async {
    return await repo.getProfile();
  }
}
