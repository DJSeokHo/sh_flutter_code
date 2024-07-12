import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItemCountNotifier extends StateNotifier<int> {
  CartItemCountNotifier(int initialCount) : super(initialCount);

  void increment() => state++;
  void decrement() {
    if (state > 1) state--;
  }
}

final cartItemCountProvider =
    StateNotifierProvider.family<CartItemCountNotifier, int, int>((ref, cartId) {
  // 初始值为 1
  return CartItemCountNotifier(1);
});

class CartOrderModel {
  final int cartId;
  final String productThumbnailImage;
  final String brandTitle;
  final String productTitle;
  final int productBasicPrice;
  final int listPrice;
  final int productSaleRate;
  final bool overseas;
  final int count;

  CartOrderModel({
    required this.cartId,
    required this.productThumbnailImage,
    required this.brandTitle,
    required this.productTitle,
    required this.productBasicPrice,
    required this.listPrice,
    required this.productSaleRate,
    required this.overseas,
    required this.count,
  });
}

class CartOrderViewModel extends ConsumerWidget {
  final List<CartOrderModel> cartItems;

  CartOrderViewModel({required this.cartItems});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        final cartItemCount = ref.watch(cartItemCountProvider(item.cartId));
        return ListItemView(item: item, cartItemCount: cartItemCount);
      },
    );
  }
}

class ListItemView extends ConsumerWidget {
  final CartOrderModel item;
  final int cartItemCount;

  ListItemView({required this.item, required this.cartItemCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Image.network(item.productThumbnailImage),
      title: Text(item.brandTitle),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.productTitle),
          Text('Price: ${item.productBasicPrice}'),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  ref.read(cartItemCountProvider(item.cartId).notifier).decrement();
                },
              ),
              Text('$cartItemCount'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  ref.read(cartItemCountProvider(item.cartId).notifier).increment();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Cart')),
        body: CartOrderViewModel(
          cartItems: [
            CartOrderModel(
              cartId: 1,
              productThumbnailImage: 'https://via.placeholder.com/150',
              brandTitle: 'Brand A',
              productTitle: 'Product A',
              productBasicPrice: 100,
              listPrice: 80,
              productSaleRate: 20,
              overseas: false,
              count: 1,
            ),
            CartOrderModel(
              cartId: 2,
              productThumbnailImage: 'https://via.placeholder.com/150',
              brandTitle: 'Brand B',
              productTitle: 'Product B',
              productBasicPrice: 150,
              listPrice: 120,
              productSaleRate: 30,
              overseas: false,
              count: 1,
            ),
          ],
        ),
      ),
    );
  }
}
