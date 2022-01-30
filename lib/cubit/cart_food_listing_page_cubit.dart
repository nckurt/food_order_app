import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/entity/cart_foods.dart';
import 'package:food_order_app/repo/cartfoodsdao_repository.dart';

class CartFoodListingPageCubit extends Cubit<List<CartFoods>>{
  CartFoodListingPageCubit():super(<CartFoods>[]);

  var cartFoodRepo = CartFoodsDaoRepository();

  Future<void> getAllCartFoods(String userName) async {
    var foodList = await cartFoodRepo.getAllCartFoods(userName);
     emit(foodList);
  }

  Future<void> deleteCartFood(int cartFoodId, String userName) async{
    await cartFoodRepo.deleteCartFood(cartFoodId, userName);
    await getAllCartFoods(userName);
    await getTotalCartPrice();
  }

  Future<int> getTotalCartPrice () async{
    int totalAmount = 0;
    int unitPrice = 0;
    int totalQuantity = 0;
    List<CartFoods> cartFoodList = await cartFoodRepo.getAllCartFoods("nkurt");
    if(cartFoodList.length == 0){
      totalAmount = 0;
    }
    else{
    for(int i=0;i<cartFoodList.length;i++){
      unitPrice = int.parse(cartFoodList[i].food_price);
      totalQuantity = int.parse(cartFoodList[i].food_order_amount);

      totalAmount = totalAmount + totalQuantity*unitPrice;
    }
    }
    print("toplam ücret: ${totalAmount}");
    return totalAmount;

  }

}