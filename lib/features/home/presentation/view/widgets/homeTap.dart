import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/features/home/categorys/presentation/view/categoryView.dart';
import 'package:resturant_app/features/home/presentation/cubits/changepage/changepage_cubit.dart';
import 'package:resturant_app/features/home/presentation/cubits/getcuntryfood/getcuntryfood_cubit.dart';
import 'package:resturant_app/features/home/presentation/cubits/getlocation/getlocation_cubit.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/customeAppBar.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/egyptionFood.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/freeDelivary.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocProvider<GetlocationCubit>(
              create: (context) => GetlocationCubit(),
              child: const Customeappbar(),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocProvider<ChangepageCubit>(
              create: (context) => ChangepageCubit(),
              child: Freedelivary(),
            ),
          ),
          const SliverToBoxAdapter(child: Categoryview()),
          SliverToBoxAdapter(
            child: BlocProvider<GetcuntryfoodCubit>(
              create: (context) => GetcuntryfoodCubit(),
              child: const Egyptionfood(),
            ),
          ),
        ],
      ),
    );
  }
}
