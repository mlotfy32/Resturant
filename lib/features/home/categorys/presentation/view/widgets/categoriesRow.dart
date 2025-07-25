import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/widgets/1.2%20loading_shimmer.dart';
import 'package:resturant_app/features/home/categorys/presentation/cubits/categores/categores_cubit.dart';
import 'package:resturant_app/features/home/categorys/presentation/view/widgets/categoryDetails.dart';
import 'package:resturant_app/features/home/presentation/cubits/getcategoriemeals/getcategoriemeals_cubit.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 3),
        SizedBox(
          height: 103,
          child: BlocBuilder<CategoresCubit, CategoresState>(
            builder: (context, state) {
              if (state is CategoresSuccess) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 4,
                        ),
                        child: InkWell(
                          splashColor: Colors.black45,
                          onTap: () {
                            Get.to(
                              () => BlocProvider<GetcategoriemealsCubit>(
                                create: (context) => GetcategoriemealsCubit(),
                                child: Categorydetails(
                                  category: state.categories[index].strCategory,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6,
                                        blurStyle: BlurStyle.outer,
                                        spreadRadius:
                                            BorderSide.strokeAlignOutside,
                                        color: Colors.black12,
                                      ),
                                    ],
                                  ),
                                  child: Image.network(
                                    width: 70,
                                    height: 70,
                                    state.categories[index].strCategoryThumb,
                                  ),
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  state.categories[index].strCategory,
                                  style: Fontstyle.f16w600,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  itemCount: state.categories.length - 2,
                );
              } else if (state is CategoresFailure) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) =>
                          const Icon(Icons.error, color: Colors.red),
                  itemCount: 8,
                );
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder:
                    (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                      child: SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: LoadingShimmer(),
                              backgroundColor: Colors.transparent,
                            ),
                            LoadingShimmer(
                              width: 60,
                              height: 15,
                              borderRadius: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                itemCount: 8,
              );
            },
          ),
        ),
      ],
    );
  }
}
