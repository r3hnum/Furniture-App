import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/detailPageComponents.dart';
import '../constants.dart';
import '../models/dummy_model.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            leading: IconButton(
              padding: const EdgeInsets.only(left: defaultPadding),
              icon: SvgPicture.asset("assets/icons/back.svg"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: false,
            title: Text(
              'Back'.toUpperCase(),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            actions: <Widget>[
              IconButton(
                icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
                onPressed: () {},
              ),
            ],
          ),
          body: DetailPageBody(product: product,key: UniqueKey(),),
        )
    );
  }
}


class DetailPageBody extends StatelessWidget {
  final Product product;

  const DetailPageBody({required Key key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              decoration: const BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: '${product.id}',
                      child: ProductPoster(
                        key: UniqueKey(),
                        size: size,
                        image: product.image,
                      ),
                    ),
                  ),
                  ListOfColors(key: UniqueKey(),),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: Text(
                      product.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: secondaryColor,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                    child: Text(
                      product.description,
                      style: const TextStyle(color: textLightColor),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),
            const SizedBox(height: 70,),
            ChatAndAddToCart(),
          ],
        ),
      ),
    );
  }
}



class ListOfColors extends StatelessWidget {
  const ListOfColors({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ColorDot(
            key: UniqueKey(),
            fillColor: const Color(0xFF80989A),
            isSelected: true,
          ),
          ColorDot(
            key: UniqueKey(),
            fillColor: const Color(0xFFFF5200),
          ),
          ColorDot(
            key: UniqueKey(),
            fillColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
