import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/azkar_model/azkar_category_model.dart';
import '../../../data/models/azkar_model/azkar_model.dart';
part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarStates> {
  AzkarCubit() : super(AzkarInitial());

  static AzkarCubit get(context) => BlocProvider.of(context);

  List<AzkarCategoryModel> categoryList = [];
  List<AzkarCategoryModel> filteredCategoryList = [];

  Future<void> getAzkarCategory(BuildContext context) async {
    emit(GetAzkarCategoryLoading());
    await DefaultAssetBundle.of(context)
        .loadString("assets/azkar/azkar_category.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((category) {
        AzkarCategoryModel categoryModel =
            AzkarCategoryModel.fromJson(category);
        categoryList.add(categoryModel);
      });
      filteredCategoryList = categoryList;
      emit(GetAzkarCategorySuccess());
    }).catchError((error) {
      emit(GetAzkarCategoryError());
    });
  }

  List<ZekrModel> azkarList = [];

  Future<void> getAzkar(BuildContext context, {required String key}) async {
    emit(GetAzkarLoading());
    azkarList = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/azkar/azkar.json")
        .then((data) {
      var response = json.decode(data)[key];
      response.forEach((zekr) {
        ZekrModel zekrModel = ZekrModel.fromJson(zekr);
        azkarList.add(zekrModel);
      });
      emit(GetAzkarSuccess());
    }).catchError((error) {
      emit(GetAzkarError());
    });
  }

  String searchValue = '';
  var searchController = TextEditingController();

  void searchSurah() {
    filteredCategoryList = categoryList
        .where((category) =>
            category.name!.toLowerCase().contains(searchValue.toLowerCase()))
        .toList();
    emit(AzkarSearchState());
  }

  void searchClear(BuildContext context) {
    searchController.clear();
    searchValue = '';
    searchSurah();
    FocusScope.of(context).unfocus();
  }
}
