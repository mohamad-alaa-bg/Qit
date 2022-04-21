import 'package:flutter/material.dart';

import '../../../../core/shared_components/sized_box.dart';


class CartButton extends StatelessWidget {
  final GestureTapCallback? onTap;
   const CartButton({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 116),
        child: Column(
          children: [
            const VerticalSizedBox(height: 148),
            Container(
              width: 39,
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(51, 55, 66, 1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Image.asset(
                  'assets/images/fi-rr-shopping-cart-add.png'),
            ),
          ],
        ),
      ),
    );
  }
}
