class  CartFoods{
  String cart_food_id;
  String food_name;
  String food_image_name;
  String food_price;
  String food_order_amount;
  String user_name;

  CartFoods({required this.cart_food_id, required this.food_name, required this.food_image_name,
required this.food_price, required this.food_order_amount, required this.user_name});

  factory CartFoods.fromJson(Map<String, dynamic> json){
    return CartFoods(cart_food_id: json["sepet_yemek_id"] as String,
        food_name: json["yemek_adi"] as String,
        food_image_name: json["yemek_resim_adi"] as String,
        food_price: json["yemek_fiyat"] as String,
        food_order_amount: json["yemek_siparis_adet"] as String,
        user_name: json["kullanici_adi"] as String);

  }
  
}