import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/repo/cartfoodsdao_repository.dart';
import 'package:food_order_app/repo/foodsdao_repository.dart';

class FoodDetailPageCubit extends Cubit<void>{
  FoodDetailPageCubit():super(0);

  var foodRepo = FoodsDaoRepository();
  var cartFoodRepo = CartFoodsDaoRepository();

  Future<void> saveCartFood(String food_name, String food_image_name, int food_price, int food_order_amount, String user_name) async{
    await cartFoodRepo.saveCartFood(food_name, food_image_name, food_price, food_order_amount, user_name);
  }

  // Future<int> getTotalAmount() async{
  //  int amount = await cartFoodRepo.getTotalCartAmount();
  //  return amount;
  // }

}