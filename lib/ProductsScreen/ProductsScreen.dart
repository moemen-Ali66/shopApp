import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/Cubit.dart';
import 'package:shop_app/cubit/States.dart';
import 'package:shop_app/models/CategoriesModel.dart';
import 'package:shop_app/models/HomeModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mycubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) => {},
      builder: (context, state) => ConditionalBuilder(
          condition: mycubit.homeModel != null,
          builder: (context) => productItem(mycubit.homeModel),
          fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }

  Widget productItem(HomeModel model) => SingleChildScrollView(
      physics:  BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              // items: model!.data!.banners
              //     .map((e) => Image(
              //           image: NetworkImage('${e.image}'),
              //           width: double.infinity,
              //           fit: BoxFit.cover,
              //         ))
              //     .toList(),
            items: [

                   Image(
                image: AssetImage('images/onBoard_1.jpg'),
                width: double.infinity,
                fit: BoxFit.cover,
              )
            ],
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
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => categoryItem(),
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: 10),
          ),
          Text(
            'New Products',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.5,
            children: List.generate(20,
                (index) => builderproduct()),
          )
        ],
      ));

  Widget builderproduct() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: AssetImage('images/onBoard_1.jpg'),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              // if (model.discount != 0)
                Container(
                  color: Colors.redAccent,
                  child: Text(
                    'Discount',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
          Text(
            'Phone',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(height: 1.5),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                '5000',
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(
                width: 10,
              ),
              // if (model.discount != 0)
                Text(
                  '4400',
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

  Widget categoryItem() => Container(
        width: 100,
        height: 100,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image(
                image: AssetImage('images/onBoard_1.jpg'),),
            Container(
              color: Colors.black12.withOpacity(0.5),
              width: 100,
              child: Text('phone'),
            ),

          ],
        ),
      );
}
