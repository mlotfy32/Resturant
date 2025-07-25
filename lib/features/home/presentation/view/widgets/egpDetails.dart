import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/features/auth/forgetPass/data/sendOTP.dart';
import 'package:resturant_app/features/home/card/presentation/cubit/addtocart/addtocart_cubit.dart';
import 'package:resturant_app/features/home/card/presentation/data/hiveCard.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/backText.dart';

class EgpDetails extends StatelessWidget {
  const EgpDetails({
    super.key,
    required this.mealName,
    required this.rate,
    required this.price,
    required this.time,
    required this.location,
    required this.shop,
    required this.trach,
    required this.cart,
  });
  final String mealName;
  final String rate;
  final String price;
  final String time;
  final String location;
  final bool shop;
  final bool trach;
  final CartModel cart;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            SizedBox(
              width: shop ? Get.size.width / 2.5 : Get.size.width / 4.8,
              child: Text(
                mealName,
                style: Fontstyle.f20w600w.copyWith(color: Colors.white),
                overflow: TextOverflow.clip,
                maxLines: 3,
              ),
            ),
            BackText(
              radious: 15,
              color: Colors.black26,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_purple500_outlined,
                    color: Colors.amber,
                  ),
                  Text(
                    rate,
                    style: Fontstyle.f15w400w.copyWith(color: Colors.white),
                  ),
                ],
              ),
              w: 65,
              h: 28,
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            BackText(
              radious: 15,
              color: Colors.black26,
              widget: Text(
                price,
                style: Fontstyle.f20w600w.copyWith(color: Colors.white),
              ),
              w: 100,
              h: 30,
            ),
            trach
                ? IconButton(
                  onPressed: () {
                    cart.delete();
                    BlocProvider.of<AddtocartCubit>(context).getCart();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trashCanArrowUp,
                    color: Colors.teal,
                  ),
                )
                : const SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 5),

        BackText(
          radious: 15,
          color: Colors.black26,
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.access_time_rounded,
                size: 26,
                color: Colors.white,
              ),
              Text(
                '$time | $location',
                style: Fontstyle.f15w400w.copyWith(color: Colors.white),
              ),
              shop
                  ? const CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.shopping_bag_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                  )
                  : SizedBox.shrink(),
            ],
          ),
          w: 200,
          h: 38,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
