import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/features/home/card/presentation/cubit/addtocart/addtocart_cubit.dart';
import 'package:resturant_app/features/home/card/presentation/data/hiveCard.dart';
import 'package:resturant_app/features/home/card/presentation/view/cardView.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    super.key,
    required this.id,
    required this.rate,
    required this.price,
    required this.time,
    required this.location,
    required this.name,
    required this.Url,
  });
  final String id;
  final String rate;
  final String price;
  final String time;
  final String location;
  final String name;
  final String Url;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddtocartCubit, AddtocartState>(
      listener: (context, state) {
        if (state is AddtocartSuccess) {
          Helper.FlutterToast(
            title: 'Added To Cart Succeffully',
            success: true,
          );
        } else if (state is AddtocartLoading) {
          Helper.FlutterToast(title: 'Adding To Cart.... ', success: true);
        } else if (state is AddtocartFailure) {
          Helper.FlutterToast(title: state.error, success: false);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffFFECF2F9),
              radius: 23,
              child: IconButton(
                onPressed: () {
                  context.getNavigateBack();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: const Color(0xffFFECF2F9),
              radius: 23,
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<AddtocartCubit>(context).addToCart(
                    cart: CartModel(
                      imageUrl: Url,
                      name: name,
                      rate: rate,
                      viewed: '',
                      id: id,
                      location: location,
                      price: price,
                      reciby: '',
                      time: time,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
