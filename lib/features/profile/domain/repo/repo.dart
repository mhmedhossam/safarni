import 'package:dartz/dartz.dart';
import 'package:safarni/features/profile/domain/entity/user_entity.dart';

import '../../../../core/error/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserProfileEntity>> getProfile();
}
