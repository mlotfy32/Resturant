import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/features/auth/forgetPass/data/sendOTP.dart';
import 'package:resturant_app/features/home/card/presentation/data/hiveCard.dart';
import 'package:resturant_app/features/home/data/getCuntryFoodModel.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/detailesView.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/egpDetails.dart';

class GetCatMealSucc extends StatelessWidget {
  const GetCatMealSucc({super.key, required this.meals});
  final List<CuntryFood> meals;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: meals.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 236.h,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        String rate =
            ' ${Sendotp().generateRandomNumber(1)}.${Sendotp().generateRandomNumber(1)}';
        String price =
            '\$ ${Sendotp().generateRandomNumber(2)}.${Sendotp().generateRandomNumber(2)}';
        String time = '${Sendotp().generateRandomNumber(2)} min';
        String location =
            '${Sendotp().generateRandomNumber(1)}.${Sendotp().generateRandomNumber(1)} KM';
        return AnimatedContainer(
          padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
          duration: const Duration(seconds: 1),
          width: Get.size.width / 1.5,
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          child: InkWell(
            onTap: () {
              context.getNavigateTo(
                child: Detailesview(
                  name: meals[index].strMeal,
                  id: meals[index].idMeal,
                  location: location,
                  price: price,
                  rate: rate,
                  time: time,
                  Url: meals[index].strMealThumb,
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
              shop: false,
              location: location,
              time: time,
              price: price,
              mealName: meals[index].strMeal,
              rate: rate,
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(meals[index].strMealThumb),
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
  }
}
