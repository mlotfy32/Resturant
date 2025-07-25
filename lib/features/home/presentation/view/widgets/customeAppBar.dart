import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/app/appImages.dart';
import 'package:resturant_app/features/home/presentation/cubits/getlocation/getlocation_cubit.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/customCircleIcon.dart';

class Customeappbar extends StatefulWidget {
  const Customeappbar({super.key});

  @override
  State<Customeappbar> createState() => _CustomeappbarState();
}

class _CustomeappbarState extends State<Customeappbar> {
  @override
  void initState() {
    BlocProvider.of<GetlocationCubit>(context).accessLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('YourLocation', style: Fontstyle.f15w400gray),
              SizedBox(
                width: Get.size.width / 1.6,
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.black),
                    BlocBuilder<GetlocationCubit, GetlocationState>(
                      builder: (context, state) {
                        final cubit = BlocProvider.of<GetlocationCubit>(
                          context,
                        ).location;
                        return Text(
                          cubit,
                          overflow: TextOverflow.ellipsis,
                          style: Fontstyle.f15w400w,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Customcircleicon(),
        ],
      ),
    );
  }
}
