import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/features/home/categorys/presentation/cubits/categores/categores_cubit.dart';
import 'package:resturant_app/features/home/categorys/presentation/view/widgets/categorieViewBody.dart';

class Categoryview extends StatelessWidget {
  const Categoryview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoresCubit>(
      create: (context) => CategoresCubit(),
      child: const Categorieviewbody(),
    );
  }
}
