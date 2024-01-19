import 'package:amazon_clone/common/widgets/stars.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../search/screens/search_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = "/product-detail";
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Product? product;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                            top: 10,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide:
                                BorderSide(color: Colors.black38, width: 1),
                          ),
                          hintText: "Search Amazon.in",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17)),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product!.id!,
                    style: TextStyle(fontSize: 16),
                  ),
                  Stars(rating: 4),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                product!.name,
                style: TextStyle(fontSize: 15),
                maxLines: 3,
              ),
            ),
            CarouselSlider(
              items: product!.images.map((i) {
                return Builder(
                    builder: (BuildContext context) => Image.network(
                          i,
                          fit: BoxFit.cover,
                          height: 200,
                        ));
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              color: Colors.black12,
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                    text: "Deal Price: ",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "\$${product!.price}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(widget.product.description, style: const TextStyle(fontSize: 15),),
            )
          ],
        ),
      ),
    );
  }
}
