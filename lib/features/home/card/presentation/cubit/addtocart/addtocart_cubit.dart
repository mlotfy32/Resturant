import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:resturant_app/core/utiles/Constans.dart';
import 'package:resturant_app/features/home/card/presentation/data/hiveCard.dart';

part 'addtocart_state.dart';

class AddtocartCubit extends Cubit<AddtocartState> {
  AddtocartCubit() : super(AddtocartInitial());

  getCart() async {
    emit(AddtocartLoading());
    Box<CartModel> cartModel = await Hive.box(Constans.hiveCart);
    try {
      List<CartModel> cart = await cartModel.values.toList();
      if (cart.isEmpty) {
        emit(AddtocartEmpty());
      } else {
        emit(AddtocartSuccess(data: cart.reversed.toList()));
      }
    } catch (e) {
      emit(AddtocartFailure(error: e.toString()));
    }
  }

  addToCart({required CartModel cart}) async {
    Box<CartModel> cartModel = await Hive.box(Constans.hiveCart);
    cartModel.add(cart);
    emit(AddtocartSuccess(data: const []));
    log('added');
  }
}
