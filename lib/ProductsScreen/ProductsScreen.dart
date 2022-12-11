import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/Cubit.dart';
import 'package:shop_app/cubit/States.dart';
import 'package:shop_app/models/HomeModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) => {},
      builder: (context, state) => ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel != null,
          builder: (context) => productItem(ShopCubit.get(context).homeModel),
          fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }

  Widget productItem(HomeModel model) => SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CarouselSlider(
              items: model.data!.banners
                  .map((e) => Image(
                        image: NetworkImage('${e.image}'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                viewportFraction: 1.0,
                reverse: false,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              )),
          const SizedBox(height: 20),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.5,
            children: List.generate(model.data!.products.length,
                (index) => builderproduct(model.data!.products[index])),
          )
        ],
      ));

  Widget builderproduct(ProductModel model) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage('${model.image}'),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              if(model.discount !=0)
              Container(
                color: Colors.redAccent,
                child: Text('Discount',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
          Text(
            model.name!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Row(
            children: [
              Text(
                '${model.price!}',
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(
                width: 10,
              ),
              if (model.discount != 0)
                Text(
                  '${model.oldPrice!}',
                  style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
            ],
          )
        ]),
      );
}
