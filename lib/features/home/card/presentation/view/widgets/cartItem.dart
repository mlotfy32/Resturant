import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/features/home/card/presentation/data/hiveCard.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/detailesView.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/egpDetails.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.data});
  final List<CartModel> data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 236.h,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        String price = '\$ ${data[index].price}';
        String time = '${data[index].time} min';
        String location = '${data[index].location} KM';
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
                  name: data[index].name,
                  id: data[index].id,
                  location: data[index].location,
                  price: data[index].price,
                  rate: data[index].rate,
                  time: data[index].time,
                  Url: data[index].imageUrl,
                ),
              );
            },
            child: EgpDetails(
              cart: data[index],
              trach: true,
              shop: false,
              location: data[index].location,
              time: data[index].time,
              price: data[index].price,
              mealName: data[index].name,
              rate: data[index].rate,
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(data[index].imageUrl),
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
