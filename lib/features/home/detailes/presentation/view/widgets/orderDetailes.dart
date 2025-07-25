import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/widgets/1.2%20loading_shimmer.dart';
import 'package:resturant_app/features/home/detailes/presentation/cubits/getmealid/getmealid_cubit.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/widgets/bottomSheetContent.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/widgets/videoPlayer.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/backText.dart';

class OrderDetailes extends StatefulWidget {
  const OrderDetailes({
    super.key,
    required this.rate,
    required this.price,
    required this.time,
    required this.location,
    required this.id,
  });
  final String rate;
  final String price;
  final String time;
  final String location;
  final String id;
  @override
  State<OrderDetailes> createState() => _OrderDetailesState();
}

class _OrderDetailesState extends State<OrderDetailes> {
  @override
  void initState() {
    BlocProvider.of<GetmealidCubit>(context).getMealId(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Center(
          child: BackText(
            radious: 27,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 28),
                Text('${widget.rate}  |  ', style: Fontstyle.f15w400gray),
                const Icon(
                  Icons.access_time_rounded,
                  color: Colors.grey,
                  size: 28,
                ),
                Text('${widget.time}  |  ', style: Fontstyle.f15w400gray),
                const Icon(Icons.map_outlined, color: Colors.grey, size: 28),
                Text('${widget.location}', style: Fontstyle.f15w400gray),
              ],
            ),
            w: 300,
            h: 50,
            color: const Color(0xffFFEBF0FA),
          ),
        ),
        const SizedBox(height: 20),

        BlocBuilder<GetmealidCubit, GetmealidState>(
          builder: (context, state) {
            if (state is GetmealidSuccess) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recipe', style: Fontstyle.f20w600w),
                      TextButton(
                        onPressed: () {
                          Get.bottomSheet(
                            isScrollControlled: true,
                            BottomSheetContent(
                              text: state.meal.strInstructions,
                            ),
                          );
                        },
                        child: const Text('see more'),
                      ),
                    ],
                  ),
                  Text(
                    state.meal.strInstructions,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 10),

                  Text('Watch In YouTube', style: Fontstyle.f20w600w),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      log('${state.meal.strYoutube}');
                      Get.to(
                        () => Videoplayer(
                          title: state.meal.strMeal,
                          videoUrl: state.meal.strYoutube,
                        ),
                      );

                      // context.getNavigateTo(
                      //   child: Videoplayer(
                      //     title: state.meal.strMeal,
                      //     videoUrl: state.meal.strYoutube,
                      //   ),
                      // );
                    },
                    child: Container(
                      child: const Icon(
                        FontAwesomeIcons.youtube,
                        size: 30,
                        color: Colors.red,
                      ),
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 0.9,
                            blurRadius: 6,
                            color: Colors.black26,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is GetmealidFailure) {
              return Text(
                state.error,
                style: Fontstyle.f25w700w.copyWith(color: Colors.red),
              );
            } else {
              return const LoadingShimmer(width: 120, height: 20);
            }
          },
        ),
      ],
    );
  }
}
