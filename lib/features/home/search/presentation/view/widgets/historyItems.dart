import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/features/home/search/data/local/hiveSearch.dart';
import 'package:resturant_app/features/home/search/presentation/cubits/gethistory/gethistory_cubit.dart';
import 'package:resturant_app/features/home/search/presentation/view/widgets/searchItems.dart';

class HistoryItems extends StatefulWidget {
  const HistoryItems({super.key});
  @override
  State<HistoryItems> createState() => _HistoryItemsState();
}

class _HistoryItemsState extends State<HistoryItems> {
  @override
  void initState() {
    BlocProvider.of<GethistoryCubit>(context).getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GethistoryCubit, GethistoryState>(
      builder: (context, state) {
        if (state is GethistoryEmpty) {
          return Padding(
            padding: EdgeInsetsGeometry.only(top: Get.size.height / 3),
            child: Center(
              child: Text('No History Found', style: Fontstyle.f20w600w),
            ),
          );
        } else if (state is GethistorySuccess) {
          return SizedBox(
            height: Get.size.height - 187,
            child: ListView.builder(
              itemCount: state.history.length,
              itemBuilder: (context, index) {
                return SearchItems(
                  recent: true,
                  id: state.history[index].id,
                  location: state.history[index].location,
                  price: state.history[index].price,
                  reciby: state.history[index].reciby,
                  time: state.history[index].time,
                  model: state.history[index],
                  isLoading: false,
                  imageUrl: state.history[index].imageUrl,
                  rate: state.history[index].rate,
                  name: state.history[index].name,
                  viewed: state.history[index].viewed,
                );
              },
            ),
          );
        }
        return SearchItems(
          recent: false,
          model: SearchModel(
            imageUrl: '',
            name: '',
            rate: '',
            viewed: '',
            id: '',
            location: '',
            price: '',
            reciby: '',
            time: '',
          ),
          isLoading: true,
          imageUrl: '',
          name: '',
          id: '',
          location: '',
          price: '',
          reciby: '',
          time: '',
          rate: '',
          viewed: '',
        );
      },
    );
  }
}
