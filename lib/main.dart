import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/cubit/cart_food_listing_page_cubit.dart';
import 'package:food_order_app/cubit/food_detail_page_cubit.dart';
import 'package:food_order_app/cubit/food_listing_page_cubit.dart';
import 'package:food_order_app/views/homepage.dart';
import 'package:food_order_app/entity/custom_colors.dart';
import 'package:food_order_app/views/navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartFoodListingPageCubit()),
        BlocProvider(create: (context) => FoodDetailPageCubit()),
        BlocProvider(create: (context) => FoodListingPageCubit())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //primarySwatch: Colors.blue,
          primaryColor: appBarColor,
        ),
        home: NavigationPage(indexInfo: 0,),
      ),
    );
  }
}
