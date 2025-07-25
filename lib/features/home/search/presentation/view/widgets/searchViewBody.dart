import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/widgets/1.2%20loading_shimmer.dart';
import 'package:resturant_app/core/widgets/3.3%20custom_text_field.dart';
import 'package:resturant_app/features/auth/forgetPass/data/sendOTP.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/customCircleIcon.dart';
import 'package:resturant_app/features/home/search/data/local/hiveSearch.dart';
import 'package:resturant_app/features/home/search/presentation/cubits/gethistory/gethistory_cubit.dart';
import 'package:resturant_app/features/home/search/presentation/cubits/search/search_cubit.dart';
import 'package:resturant_app/features/home/search/presentation/view/widgets/historyItems.dart';
import 'package:resturant_app/features/home/search/presentation/view/widgets/searchItems.dart';
import 'package:resturant_app/features/home/search/presentation/view/widgets/speachToAudio.dart';

class Searchviewbody extends StatefulWidget {
  const Searchviewbody({super.key});

  @override
  State<Searchviewbody> createState() => _SearchviewbodyState();
}

class _SearchviewbodyState extends State<Searchviewbody> {
  @override
  TextEditingController _controller = TextEditingController();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: key,
                  child: CustomTextField(
                    onFieldSubmitted: (p) {
                      BlocProvider.of<SearchCubit>(
                        context,
                      ).searchByName(meal: p.toString());
                    },
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    controller: _controller,
                    color: Colors.grey,
                    hintText: 'Search stores,dishes,products | ',
                    suffixIcon: const Speachtoaudio(),
                  ),
                ),
                const SizedBox(height: 8),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchFailure) {
                      return const SizedBox.shrink();
                    } else if (state is SearchLoading) {
                      return const SizedBox.shrink();
                    } else if (state is SearchSuccess) {
                      return const SizedBox.shrink();
                    } else {
                      return Row(
                        children: [
                          Text('Recently Viewed', style: Fontstyle.f20w600w),
                          const Spacer(),
                          Text(
                            'see more',
                            style: Fontstyle.f15w400w.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return SearchItems(
                        recent: false,
                        id: '',
                        location: '',
                        price: '',
                        reciby: '',
                        time: '',
                        model: SearchModel(
                          id: '',
                          location: '',
                          price: '',
                          reciby: '',
                          time: '',
                          imageUrl: '',
                          name: '',
                          rate: '',
                          viewed: '',
                        ),
                        isLoading: true,
                        imageUrl: '',
                        name: '',
                        rate: '',
                        viewed: '',
                      );
                    } else if (state is SearchSuccess) {
                      return SizedBox(
                        height: Get.size.height - 160,
                        child: ListView.builder(
                          itemCount: state.meals.length,
                          itemBuilder: (context, index) {
                            String rate1 =
                                Sendotp().generateRandomNumber(1).toString();
                            String rate2 =
                                Sendotp().generateRandomNumber(1).toString();
                            String rate = '$rate1.$rate2';
                            String viewed =
                                Sendotp().generateRandomNumber(2).toString();
                            String time =
                                Sendotp().generateRandomNumber(2).toString();
                            String location1 =
                                Sendotp().generateRandomNumber(2).toString();
                            String location2 =
                                Sendotp().generateRandomNumber(2).toString();
                            String location = '$location1.$location2';
                            String price =
                                '\$ ${Sendotp().generateRandomNumber(2)}.${Sendotp().generateRandomNumber(2)}';
                            if (index == 0) {
                              BlocProvider.of<GethistoryCubit>(
                                context,
                              ).addToHistory(
                                search: SearchModel(
                                  id: state.meals[index].idMeal,
                                  location: location,
                                  price: price,
                                  reciby: state.meals[index].strInstructions,
                                  time: time,
                                  imageUrl: state.meals[index].strMealThumb,
                                  name: state.meals[index].strMeal,
                                  rate: rate,
                                  viewed: viewed,
                                ),
                              );
                            }
                            return SearchItems(
                              recent: false,
                              id: state.meals[index].idMeal,
                              location: location,
                              price: price,
                              reciby: state.meals[index].strInstructions,
                              time: time,
                              model: SearchModel(
                                id: '',
                                location: '',
                                price: '',
                                reciby: '',
                                time: '',
                                imageUrl: '',
                                name: '',
                                rate: '',
                                viewed: '',
                              ),
                              isLoading: F,
                              imageUrl: state.meals[index].strMealThumb,
                              name: state.meals[index].strMeal,
                              rate: rate,
                              viewed: viewed,
                            );
                          },
                        ),
                      );
                    } else if (state is SearchFailure) {
                      return Padding(
                        padding: EdgeInsets.only(top: Get.size.height / 3),
                        child: Center(
                          child: Text(
                            'No Meals Found',
                            style: Fontstyle.f20w600w,
                          ),
                        ),
                      );
                    }
                    //GetHive Data
                    return BlocProvider<GethistoryCubit>(
                      create: (context) => GethistoryCubit(),
                      child: const HistoryItems(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
