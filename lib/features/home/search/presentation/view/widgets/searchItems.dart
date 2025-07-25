import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/widgets/1.2%20loading_shimmer.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/detailesView.dart';
import 'package:resturant_app/features/home/search/data/local/hiveSearch.dart';
import 'package:resturant_app/features/home/search/presentation/cubits/gethistory/gethistory_cubit.dart';

class SearchItems extends StatelessWidget {
  const SearchItems({
    super.key,
    required this.isLoading,
    required this.imageUrl,
    required this.rate,
    required this.name,
    required this.viewed,
    required this.model,
    required this.reciby,
    required this.location,
    required this.time,
    required this.price,
    required this.id,
    required this.recent,
  });
  final String imageUrl;
  final String rate;
  final String name;
  final String viewed;
  final String reciby;
  final String location;
  final String time;
  final String price;
  final String id;
  final bool isLoading;
  final bool recent;

  final SearchModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => context.getNavigateTo(
            child: Detailesview(
              id: id,
              rate: rate,
              price: price,
              time: time,
              location: location,
              name: name,
              Url: imageUrl,
            ),
          ),
      child: Row(
        children: [
          isLoading
              ? const LoadingShimmer(width: 60, height: 60, borderRadius: 10)
              : Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFFE6E8EC),
                ),
                width: 60,
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(imageUrl)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                ),
              ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isLoading
                  ? const LoadingShimmer(
                    width: 60,
                    height: 10,
                    borderRadius: 10,
                  )
                  : SizedBox(
                    width: Get.size.width - 118,
                    child: Text(
                      ' $name',
                      style: Fontstyle.f16w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              isLoading
                  ? const LoadingShimmer(
                    width: 180,
                    height: 10,
                    borderRadius: 10,
                  )
                  : Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      Text(rate, style: Fontstyle.f15w400gray),
                      Text(' ($viewed+ viewed)', style: Fontstyle.f15w400gray),
                    ],
                  ),
            ],
          ),

          isLoading || recent == false
              ? const SizedBox.shrink()
              : IconButton(
                onPressed: () {
                  model.delete();
                  BlocProvider.of<GethistoryCubit>(context).getHistory();
                },
                icon: const Icon(Icons.close),
              ),
        ],
      ),
    );
  }
}
