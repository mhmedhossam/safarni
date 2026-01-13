import 'package:dartz/dartz.dart';
import 'package:round_8_mobile_safarni_team3/features/profile/domain/entity/user_entity.dart';

import '../../../../core/error/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserProfileEntity>> getProfile();
}
