import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qit/src/features/home/data/models/product_model.dart';

import '../../../../core/shared_components/sized_box.dart';
import 'cart_button.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  const ProductCard({Key? key,required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 250,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(69, 77, 90, 1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 168,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(244, 245, 248, 0.09),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      topLeft: Radius.circular(18)),
                ),

              ),
              //const VerticalSizedBox(height: 17.8),
              const Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 160,
                      padding: const EdgeInsetsDirectional.only(start: 8),
                      child:  Text(
                        productModel.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: 'Palatino',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    const VerticalSizedBox(height: 2),
                    Container(
                      padding:
                      const EdgeInsetsDirectional.only(start: 9.9),
                      width: double.infinity,
                      child:  Text(
                        '\$ ${productModel.price}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: 'Palatino',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
              width: double.infinity,
              height: 180,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 6, start: 8.9, end: 8.9),
                    child: SizedBox(
                      height: 21,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          //evaluation
                          Container(
                            width: 39,
                            decoration: BoxDecoration(
                              color:
                              const Color.fromRGBO(51, 55, 66, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                 Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 5.4),
                                  child: Text(
                                    productModel.rating.rate.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.only(
                                      end: 4),
                                  child: Image.asset(
                                      'assets/images/iconfinder_-_Star-Favorite-Featured-Famous-Super_3844428.png'),
                                )
                              ],
                            ),
                          ),
                          //favorite
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                                Icons.favorite_border_outlined),
                            padding: EdgeInsets.zero,
                            alignment: AlignmentDirectional.centerEnd,
                          )
                        ],
                      ),
                    ),
                  ),
                  const VerticalSizedBox(height: 6),
                  Expanded(
                      child: CachedNetworkImage(imageUrl: productModel.image,))
                ],
              )),
          //cart button layer
          const CartButton(),
        ],
      ),
    );
  }
}
