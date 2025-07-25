import 'package:hive/hive.dart';
part 'hiveCard.g.dart';

@HiveType(typeId: 1)
class CartModel extends HiveObject {
  @HiveField(0)
  String imageUrl;
  @HiveField(1)
  String name;
  @HiveField(2)
  String rate;
  @HiveField(3)
  String viewed;
  @HiveField(4)
  String id;
  @HiveField(5)
  String location;
  @HiveField(6)
  String price;
  @HiveField(7)
  String reciby;
  @HiveField(8)
  String time;
  CartModel({
    required this.imageUrl,
    required this.name,
    required this.rate,
    required this.viewed,
    required this.id,
    required this.location,
    required this.price,
    required this.reciby,
    required this.time,
  });
}
