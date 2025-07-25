import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/features/home/categorys/data/categoryModel.dart';
import 'package:resturant_app/features/home/categorys/presentation/cubits/categores/categores_cubit.dart';
import 'package:resturant_app/features/home/categorys/presentation/view/widgets/categoriesRow.dart';

class Categorieviewbody extends StatefulWidget {
  const Categorieviewbody({super.key});

  @override
  State<Categorieviewbody> createState() => _CategorieviewbodyState();
}

class _CategorieviewbodyState extends State<Categorieviewbody> {
  @override
  void initState() {
    BlocProvider.of<CategoresCubit>(context).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(' Select By Category', style: Fontstyle.f20w600w),
        const CategoriesRow(),
      ],
    );
  }
}
