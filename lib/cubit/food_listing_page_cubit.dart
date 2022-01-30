import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/entity/foods.dart';
import 'package:food_order_app/repo/foodsdao_repository.dart';
class FoodListingPageCubit extends Cubit<List<Foods>>{

  FoodListingPageCubit():super(<Foods>[]);

  var foodRepo = FoodsDaoRepository();

  Future<void> getAllFoods() async{
    var foodList = await foodRepo.getAllFoods();
    emit(foodList);
  }



}