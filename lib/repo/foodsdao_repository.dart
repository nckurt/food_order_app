import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:food_order_app/entity/foods.dart';
import 'package:food_order_app/entity/foods_response.dart';

class FoodsDaoRepository{
  List<Foods> parseFoodsResponse(String response){
    return FoodsResponse.fromJson(json.decode(response)).foodsList;
  }

  Future<List<Foods>> getAllFoods() async{
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    var response = await http.get(url);
    print("Yemekleri getir: ${response.body}, ${response.statusCode}");
    return parseFoodsResponse(response.body);
  }


}