import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/components/productType.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/productDetail.dart';

import '../components/productCard.dart';
import '../components/productSearchBar.dart';
import '../models/dummy_model.dart';

class ProductDashboard extends StatelessWidget {
  const ProductDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            elevation: 0,
            centerTitle: false,
            title: const Text('Dashboard',),
            actions: <Widget>[
              IconButton(
                icon: SvgPicture.asset("assets/icons/notification.svg"),
                onPressed: () {},
              ),
            ],
          ),
          body: const DashboardBody(),
        )
    );
  }
}



class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          ProductSearchBox(key: UniqueKey(), onChanged: (value) {}),
          ProductType(),
          const SizedBox(height: defaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  decoration: const BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: products.length,
                          itemBuilder: (context, index) => ProductCard(
                            key: ObjectKey(index),
                            itemIndex: index,
                            product: products[index],
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                    product: products[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

