import 'dart:convert';
import 'dart:io';
import 'package:food_order_app/entity/cart_foods.dart';
import 'package:food_order_app/entity/cart_foods_response.dart';
import 'package:http/http.dart' as http;

class CartFoodsDaoRepository{
  
  List<CartFoods> parseCartFoodsResponse(String response){
      return CartFoodsResponse.fromJson(json.decode(response)).cartFoodList;
  }

  Future<List<CartFoods>> getAllCartFoods(String userName) async{
  try{
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    var data =  {"kullanici_adi":userName};
    var response = await http.post(url, body: data);
    print("Sepetteki yemekleri getir: ${response.body}, ${response.statusCode}");

    return parseCartFoodsResponse(response.body);
  }
  catch(e){
    return <CartFoods> [];
  }
  }

  Future<void> saveCartFood(String food_name, String food_image_name, int food_price, int food_order_amount, String user_name) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    var data = {"yemek_adi":food_name, "yemek_resim_adi":food_image_name, "yemek_fiyat":food_price.toString(), "yemek_siparis_adet":food_order_amount.toString(), "kullanici_adi":user_name};
    var response = await http.post(url, body: data);
    print("Yemek kayıt: ${response.body}, ${response.statusCode}");

  }

  Future<void> deleteCartFood(int cartFoodId, String userName) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    var data = {"sepet_yemek_id": cartFoodId.toString(), "kullanici_adi": userName};
    var response = await http.post(url,headers:{'ContentType': 'application/json'}, body:data);
    print("Yemek sepetten silindi: ${response.body}, ${response.statusCode}");
  }

  Future<int> getTotalCartAmount() async{
    var cartFoodList = await this.getAllCartFoods("nkurt");
    int totalAmount = 0;
    if(cartFoodList.length == 0){
      totalAmount = 0;
    }
    else{
    for(var food in cartFoodList){
      totalAmount+=int.parse(food.food_price);
    }
    }
    return totalAmount;
  }


}