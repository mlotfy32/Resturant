import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/widgets/1.2%20loading_shimmer.dart';
import 'package:resturant_app/features/auth/forgetPass/data/sendOTP.dart';
import 'package:resturant_app/features/home/card/presentation/data/hiveCard.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/detailesView.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/egpDetails.dart';
import 'package:resturant_app/features/shop/presentation/cubits/getfood/getfood_cubit.dart';

class Foodlist extends StatefulWidget {
  const Foodlist({super.key});

  @override
  State<Foodlist> createState() => _FoodlistState();
}

class _FoodlistState extends State<Foodlist> {
  @override
  void initState() {
    BlocProvider.of<GetfoodCubit>(context).getFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: BlocBuilder<GetfoodCubit, GetfoodState>(
        builder: (context, state) {
          if (state is GetfoodSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.food.length,
              itemBuilder: (context, index) {
                String rate =
                    ' ${Sendotp().generateRandomNumber(1)}.${Sendotp().generateRandomNumber(1)}';
                String price =
                    ' ${Sendotp().generateRandomNumber(2)}.${Sendotp().generateRandomNumber(2)}';
                String time = '${Sendotp().generateRandomNumber(2)} min';
                String location =
                    '${Sendotp().generateRandomNumber(1)}.${Sendotp().generateRandomNumber(1)} KM';
                return AnimatedContainer(
                  padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                  duration: const Duration(seconds: 1),
                  width: Get.size.width / 1.5,
                  height: 200,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 4,
                  ),
                  child: InkWell(
                    onTap: () {
                      context.getNavigateTo(
                        child: Detailesview(
                          name: state.food[index].strMeal,
                          id: state.food[index].idMeal,
                          location: location,
                          price: price,
                          rate: rate,
                          time: time,
                          Url: state.food[index].strMealThumb,
                        ),
                      );
                    },
                    child: EgpDetails(
                      cart: CartModel(
                        imageUrl: 'imageUrl',
                        name: 'name',
                        rate: rate,
                        viewed: '',
                        id: '',
                        location: '',
                        price: price,
                        reciby: '',
                        time: time,
                      ),
                      trach: false,
                      shop: true,
                      location: location,
                      time: time,
                      price: price,
                      mealName: state.food[index].strMeal,
                      rate: rate,
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(state.food[index].strMealThumb),
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 0.9,
                        blurRadius: 4,
                        color: Colors.black26,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is GetfoodFailure) {
            return Center(
              child: Text(
                state.error,
                style: Fontstyle.f20w600w.copyWith(color: Colors.red),
              ),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 4,
                    ),
                    child: LoadingShimmer(
                      width: Get.size.width / 1.5,
                      height: 200,
                      borderRadius: 15,
                    ),
                  ),
            );
          }
        },
      ),
    );
  }
}
