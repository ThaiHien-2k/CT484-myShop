import 'package:flutter/foundation.dart';

import '../../models/cart_item.dart';
import '../../models/order_item.dart';

class OrdersManager with ChangeNotifier {
  final List<OrderItem> _orders = [
    OrderItem(
      id: 'o1',
      amount: 29.98,
      products: [
        CartItem(
          id: 'c1',
          title: 'Red Shirt',
          quantity: 2,
          price: 29.99,
        )
      ],
      dateTime: DateTime.now(),
    )
  ];

  int get orderCount {
    return _orders.length;
  }

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProduct, double total) async {
    _orders.insert(
        0,
        OrderItem(
            id: 'c${DateTime.now().toIso8601String()}',
            amount: total,
            products: cartProduct,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
