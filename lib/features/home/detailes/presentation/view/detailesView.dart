import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:resturant_app/features/home/detailes/presentation/view/widgets/detailesViewBody.dart';

class Detailesview extends StatelessWidget {
  const Detailesview({
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
    return Detailesviewbody(
      id: id,
      location: location,
      price: price,
      rate: rate,
      time: time,
      name: name,
      Url: Url,
    );
  }
}
