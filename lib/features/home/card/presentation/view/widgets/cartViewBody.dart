import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/widgets/1.2%20loading_shimmer.dart';
import 'package:resturant_app/features/home/card/presentation/cubit/addtocart/addtocart_cubit.dart';
import 'package:resturant_app/features/home/card/presentation/view/widgets/cartItem.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  void initState() {
    BlocProvider.of<AddtocartCubit>(context).getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Cart', style: Fontstyle.f20w600w)],
                ),
              ),

              SliverToBoxAdapter(
                child: BlocBuilder<AddtocartCubit, AddtocartState>(
                  builder: (context, state) {
                    if (state is AddtocartSuccess) {
                      return SizedBox(
                        height: Get.size.height,
                        child: CartItem(data: state.data),
                      );
                    } else if (state is AddtocartFailure) {
                      return Text(state.error, style: Fontstyle.f25w700w);
                    } else if (state is AddtocartEmpty) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: Get.size.height / 2.5),
                          child: Text(
                            'No Data To Disblay',
                            style: Fontstyle.f20w600w,
                          ),
                        ),
                      );
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
