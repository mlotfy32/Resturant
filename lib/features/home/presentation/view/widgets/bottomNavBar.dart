import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resturant_app/core/utiles/app/appImages.dart';
import 'package:resturant_app/features/home/presentation/cubits/changetap/changetap_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                Appimages.bottomNavBar.asMap().entries.map((e) {
                  return BlocBuilder<ChangetapCubit, ChangetapState>(
                    builder: (context, state) {
                      final cubit =
                          BlocProvider.of<ChangetapCubit>(context).initialTap;
                      return CircleAvatar(
                        backgroundColor:
                            e.key == cubit ? Colors.black : Colors.white,
                        child: IconButton(
                          onPressed: () {
                            BlocProvider.of<ChangetapCubit>(
                              context,
                            ).changeTap(tap: e.key);
                          },
                          icon: SvgPicture.asset(
                            width: e.key == cubit ? 40 : 25,
                            height: e.key == cubit ? 40 : 25,
                            Appimages.bottomNavBar[e.key],
                            color: e.key == cubit ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
          ).animate().fade().scale(),
    );
  }
}
