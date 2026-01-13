import 'package:dartz/dartz.dart';
import 'package:safarni/features/profile/domain/entity/user_entity.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repo/repo.dart';
import '../remote/remote_data_source.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource remote;

  ProfileRepoImpl({required this.remote});

  @override
  Future<Either<Failure, UserProfileEntity>> getProfile() async {
    try {
      final profile = await remote.getProfile();
      return Right(profile);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
