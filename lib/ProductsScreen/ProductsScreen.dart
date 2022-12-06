import 'dart:html';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/cubit/Cubit.dart';
import 'package:shop_app/models/HomeModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ConditionalBuilder(
          condition:  ShopCubit.get(context).homeModel !=null ,
          builder: (context)=>productItem(ShopCubit.get(context).homeModel!),
          fallback: (context)=>Center(child: CircularProgressIndicator(),)),
    );

  }
}

Widget productItem(HomeModel model)=>Column(
  children: [
    CarouselSlider(
        items:model.data?.banners.map((e)=>  Image(
          image: NetworkImage('${e.image}'),
          width: double.infinity,
          fit: BoxFit.cover,
        )).toList() ,
        options: CarouselOptions(
          height: 250.0,
          initialPage: 0,
          viewportFraction: 1.0,
          reverse: false,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        )),
    SizedBox(height: 20),
    Expanded(
        child: GridView.count(
          crossAxisCount:2,
          children:List.generate(
              model.data!.products.length,
                  (index) => builderproduct(model.data!.products[index])),
    ))
  ],
);

Widget builderproduct(ProductModel model)=>Column(
  children: [
    Image(image: NetworkImage(model.image!),
    width: double.infinity,
    fit: BoxFit.cover,),

  ],
);