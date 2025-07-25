import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/app/appImages.dart';
import 'package:resturant_app/features/home/presentation/cubits/changepage/changepage_cubit.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/freeText.dart';

// ignore: must_be_immutable
class Freedelivary extends StatefulWidget {
  Freedelivary({super.key});

  @override
  State<Freedelivary> createState() => _FreedelivaryState();
}

class _FreedelivaryState extends State<Freedelivary> {
  @override
  PageController _controller = PageController(
    initialPage: 1,
    viewportFraction: 0.9,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        SizedBox(
          height: 220,
          width: double.infinity,
          child: BlocBuilder<ChangepageCubit, ChangepageState>(
            builder: (context, state) {
              final cubit =
                  BlocProvider.of<ChangepageCubit>(context).initialPage;
              return PageView.builder(
                onPageChanged: (value) {
                  BlocProvider.of<ChangepageCubit>(
                    context,
                  ).changePage(newPage: value);
                },
                controller: _controller,
                itemBuilder:
                    (context, index) => AnimatedContainer(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      duration: const Duration(seconds: 1),
                      width: double.infinity,
                      height: 220,
                      margin: EdgeInsets.symmetric(
                        horizontal: index == cubit ? 3 : 5,
                        vertical: index == cubit ? 4 : 6,
                      ),
                      child:
                          index == 1
                              ? const FreeText()
                              : const SizedBox.shrink(),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(Appimages.offers[index]),
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow:
                            index == cubit
                                ? const [
                                  BoxShadow(
                                    spreadRadius: 0.9,
                                    blurRadius: 6,
                                    color: Colors.black54,
                                    blurStyle: BlurStyle.outer,
                                  ),
                                ]
                                : [],
                      ),
                    ),
                itemCount: Appimages.offers.length,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.only(left: Get.size.width / 2 - 30),
          child: SizedBox(
            height: 6,
            child: BlocBuilder<ChangepageCubit, ChangepageState>(
              builder: (context, state) {
                final cubit =
                    BlocProvider.of<ChangepageCubit>(context).initialPage;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: index == cubit ? 20 : 10,
                        decoration: BoxDecoration(
                          color: index == cubit ? Colors.orange : Colors.grey,
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(15),
                            right: Radius.circular(15),
                          ),
                        ),
                      ),
                  itemCount: 3,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
