import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/widgets/1.2%20loading_shimmer.dart';
import 'package:resturant_app/features/auth/forgetPass/data/sendOTP.dart';
import 'package:resturant_app/features/home/card/presentation/data/hiveCard.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/detailesView.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/widgets/detailesViewBody.dart';
import 'package:resturant_app/features/home/presentation/cubits/getcuntryfood/getcuntryfood_cubit.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/egpDetails.dart';

class Egyptionfood extends StatefulWidget {
  const Egyptionfood({super.key});

  @override
  State<Egyptionfood> createState() => _EgyptionfoodState();
}

class _EgyptionfoodState extends State<Egyptionfood> {
  @override
  void initState() {
    BlocProvider.of<GetcuntryfoodCubit>(context).getCuntryFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const SizedBox(height: 5),
        Text(' Egyption Food', style: Fontstyle.f20w600w),
        SizedBox(
          height: 230,
          width: double.infinity,
          child: BlocBuilder<GetcuntryfoodCubit, GetcuntryfoodState>(
            builder: (context, state) {
              if (state is GetcuntryfoodSuccess) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.food.length,
                  itemBuilder: (context, index) {
                    String rate =
                        ' ${Sendotp().generateRandomNumber(1)}.${Sendotp().generateRandomNumber(1)}';
                    String price =
                        '\$ ${Sendotp().generateRandomNumber(2)}.${Sendotp().generateRandomNumber(2)}';
                    String time = '${Sendotp().generateRandomNumber(2)} min';
                    String location =
                        '${Sendotp().generateRandomNumber(1)}.${Sendotp().generateRandomNumber(1)} KM';
                    return AnimatedContainer(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      duration: const Duration(seconds: 1),
                      width: Get.size.width / 1.5,
                      height: 200,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 4,
                      ),
                      child: InkWell(
                        onTap: () {
                          context.getNavigateTo(
                            child: Detailesview(
                              name: state.food[index].strMeal,
                              id: state.food[index].idMeal,
                              location: location,
                              price: price,
                              rate: rate,
                              time: time,
                              Url: state.food[index].strMealThumb,
                            ),
                          );
                        },
                        child: EgpDetails(
                          cart: CartModel(
                            imageUrl: 'imageUrl',
                            name: 'name',
                            rate: rate,
                            viewed: '',
                            id: '',
                            location: '',
                            price: price,
                            reciby: '',
                            time: time,
                          ),
                          trach: false,
                          shop: true,
                          location: location,
                          time: time,
                          price: price,
                          mealName: state.food[index].strMeal,
                          rate: rate,
                        ),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(state.food[index].strMealThumb),
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 0.9,
                            blurRadius: 4,
                            color: Colors.black26,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is GetcuntryfoodFailure) {
                return Text(
                  state.error,
                  style: Fontstyle.f20w600w.copyWith(color: Colors.red),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 4,
                      ),
                      child: LoadingShimmer(
                        width: Get.size.width / 1.5,
                        height: 200,
                        borderRadius: 15,
                      ),
                    ),
              );
            },
          ),
        ),
      ],
    );
  }
}
