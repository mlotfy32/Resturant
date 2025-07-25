import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/features/home/card/presentation/cubit/addtocart/addtocart_cubit.dart';
import 'package:resturant_app/features/home/card/presentation/view/widgets/cartViewBody.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddtocartCubit>(
      create: (context) => AddtocartCubit(),
      child: const CartViewBody(),
    );
  }
}
