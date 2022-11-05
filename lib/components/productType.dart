import 'package:flutter/material.dart';

import '../constants.dart';

class ProductType extends StatefulWidget {
  @override
  _ProductTypeState createState() => _ProductTypeState();
}

class _ProductTypeState extends State<ProductType> {
  // by default first item will be selected
  int selectedIndex = 0;
  List categories = ['All', 'Sofa', 'Park bench', 'Armchair'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: defaultPadding,
              // At end item it add extra 20 right  padding
              right: index == categories.length - 1 ? defaultPadding : 0,
            ),
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? Colors.white.withOpacity(0.4)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              categories[index],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}