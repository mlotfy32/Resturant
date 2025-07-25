import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/features/home/search/presentation/cubits/gethistory/gethistory_cubit.dart';
import 'package:resturant_app/features/home/search/presentation/cubits/search/search_cubit.dart';
import 'package:resturant_app/features/home/search/presentation/view/widgets/searchViewBody.dart';

class Searchtap extends StatelessWidget {
  const Searchtap({super.key});

  @override
  Widget build(BuildContext context) {
    //GethistoryCubit
    //
    return MultiBlocProvider(
      providers: [
        BlocProvider<GethistoryCubit>(create: (context) => GethistoryCubit()),
        BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
      ],
      child: const Searchviewbody(),
    );
  }
}
