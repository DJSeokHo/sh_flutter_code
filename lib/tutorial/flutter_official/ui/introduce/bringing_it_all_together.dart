

import 'package:flutter/material.dart';

class Product {

  Product({required this.name}); // 在注入时需要写别名 name
  // Product(this.name}); // 在注入时不需要写别名 name

  final String name;
}

class _ShoppingListItemView extends StatelessWidget {

  final Product product;

  final bool inCart;

  final Function(Product product, bool inCart) onItemClick;

  const _ShoppingListItemView({required this.product, required this.inCart, required this.onItemClick});

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: () {
        onItemClick(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]), // 用于那种名字第一个字母的头像
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) {
      return null;
    }

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }
}

class _ShoppingList extends StatefulWidget {

  final List<Product> products; // 可以在下方的state里用widget.products来访问

  const _ShoppingList({required this.products});

  @override
  State<StatefulWidget> createState() {
    return _ShoppingListState();
  }
}

class _ShoppingListState extends State<_ShoppingList> {

  final _shoppingCart = <Product>{};

  void _onCartChange(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      }
      else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Shopping List"),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: widget.products.map((product) {
            return _ShoppingListItemView(
                product: product,
                inCart: _shoppingCart.contains(product),
                onItemClick: _onCartChange
            );
          }).toList(),
        ),
      ),
    );
  }
}

void main() {

  runApp(
      _ShoppingList(products: [
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ])
  );
}