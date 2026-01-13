import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/features/Home/domain/entities/home_entitiy.dart';
import 'package:safarni/features/Home/domain/entities/recommendation_entity.dart';
import 'package:safarni/features/Home/domain/usecases/get_home_usecase.dart';
import 'package:safarni/features/Home/presentation/cubit/home_cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  var searchController = TextEditingController();
  List<RecommendationEntity> searchResultList = [];
  late HomeEntity homeEntity;
  GetHomeUseCase getHomeUseCase;
  HomeCubit({required this.getHomeUseCase}) : super(HomeInitialState());

  Future<void> getHome() async {
    emit(HomeLoadingState());
    var res = await getHomeUseCase.call();
    res.fold(
      (l) {
        emit(HomeFailureState(message: l.message));
      },
      (R) {
        homeEntity = R;
        //for search because there is no api for search
        searchResultList = homeEntity.recommendations.where((e) {
          return e.location!.toLowerCase().contains(searchController.text);
        }).toList();
        emit(HomeSuccessState());
      },
    );
  }

  void clearSearch() {
    emit(HomeInitialState());
  }
}
