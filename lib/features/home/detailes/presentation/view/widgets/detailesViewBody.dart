import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/widgets/1.2%20loading_shimmer.dart';
import 'package:resturant_app/features/home/card/presentation/cubit/addtocart/addtocart_cubit.dart';
import 'package:resturant_app/features/home/detailes/presentation/cubits/getmealid/getmealid_cubit.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/widgets/bottomSheetContent.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/widgets/customDetailsImage.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/widgets/detailsAppBar.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/widgets/orderDetailes.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/widgets/videoPlayer.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/backText.dart';

class Detailesviewbody extends StatelessWidget {
  const Detailesviewbody({
    super.key,
    required this.id,
    required this.rate,
    required this.price,
    required this.time,
    required this.location,
    required this.name,
    required this.Url,
  });
  final String id;
  final String rate;
  final String price;
  final String time;
  final String location;
  final String name;
  final String Url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: BlocProvider<AddtocartCubit>(
                  create: (context) => AddtocartCubit(),
                  child: DetailsAppBar(
                    id: id,
                    rate: rate,
                    price: price,
                    time: time,
                    location: location,
                    name: name,
                    Url: Url,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Customdetailsimage(url: Url, name: name),
              ),
              SliverToBoxAdapter(
                child: BlocProvider<GetmealidCubit>(
                  create: (context) => GetmealidCubit(),
                  child: OrderDetailes(
                    id: id,
                    rate: rate,
                    price: price,
                    time: time,
                    location: location,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
