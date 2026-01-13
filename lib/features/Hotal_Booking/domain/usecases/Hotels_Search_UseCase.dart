import 'package:dartz/dartz.dart';
import 'package:safarni/core/error/failure.dart';
import 'package:safarni/features/Hotal_Booking/data/model/HotelsModels/recommendation_models.dart';
import 'package:safarni/features/Hotal_Booking/domain/repo/hotels_Search_Repos.dart';

class HotelsSearchUsecase {
  final HotelsSearchRepos hotelsSearchRepos;

  HotelsSearchUsecase(this.hotelsSearchRepos);

  Future<Either<Failure, List<HotelsModels>>> call({
    required String cityName,
    int? guests,
  }) async {
    return await hotelsSearchRepos.FetchSearchHotels(
      cityName: cityName,
      guests: guests,
    );
  }
}
