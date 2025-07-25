import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/widgets/1.2%20loading_shimmer.dart';
import 'package:resturant_app/features/home/categorys/presentation/view/widgets/getCategoryMealSucc.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/detailesView.dart';
import 'package:resturant_app/features/home/presentation/cubits/getcategoriemeals/getcategoriemeals_cubit.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/egpDetails.dart';

class Categorydetails extends StatefulWidget {
  const Categorydetails({super.key, required this.category});
  final String category;
  @override
  State<Categorydetails> createState() => _CategorydetailsState();
}

class _CategorydetailsState extends State<Categorydetails> {
  @override
  void initState() {
    BlocProvider.of<GetcategoriemealsCubit>(
      context,
    ).getMeals(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () => context.getNavigateBack(),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(width: 100.w),
                    Text(widget.category, style: Fontstyle.f20w600w),
                  ],
                ),
              ),

              SliverToBoxAdapter(
                child:
                    BlocBuilder<GetcategoriemealsCubit, GetcategoriemealsState>(
                      builder: (context, state) {
                        if (state is GetcategoriemealsSuccess) {
                          return SizedBox(
                            height: Get.size.height,
                            child: GetCatMealSucc(meals: state.meals),
                          );
                        } else if (state is GetcategoriemealsFailure) {
                          return Text(state.error, style: Fontstyle.f25w700w);
                        } else {
                          return SizedBox(
                            height: Get.size.height,
                            child: GridView.builder(
                              itemCount: 10,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 236.h,
                                    crossAxisSpacing: 2,
                                  ),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 4,
                                  ),
                                  child: LoadingShimmer(
                                    width: Get.size.width / 1.5,
                                    height: 200,
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
