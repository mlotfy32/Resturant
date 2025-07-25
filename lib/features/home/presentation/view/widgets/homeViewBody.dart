import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/core/utiles/app/appImages.dart';
import 'package:resturant_app/features/chatAi/presentation/cubit/changetext/changetext_cubit.dart';
import 'package:resturant_app/features/chatAi/presentation/view/chatAiView.dart';
import 'package:resturant_app/features/home/card/presentation/view/cardView.dart';
import 'package:resturant_app/features/home/categorys/presentation/view/categoryView.dart';
import 'package:resturant_app/features/home/presentation/cubits/changepage/changepage_cubit.dart';
import 'package:resturant_app/features/home/presentation/cubits/changetap/changetap_cubit.dart';
import 'package:resturant_app/features/home/presentation/cubits/getlocation/getlocation_cubit.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/bottomNavBar.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/customeAppBar.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/egyptionFood.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/freeDelivary.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/homeTap.dart';
import 'package:resturant_app/features/home/search/presentation/view/searchTap.dart';
import 'package:resturant_app/features/shop/presentation/view/shopTap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChangetapCubit, ChangetapState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<ChangetapCubit>(context).initialTap;
          return IndexedStack(
            index: cubit,
            children: [
              const HomeTap(),
              const ShopTap(),
              const Searchtap(),
              BlocProvider<ChangetextCubit>(
                create: (context) => ChangetextCubit(),
                child: const ChatAi(),
              ),
              const CardView(),
            ],
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
