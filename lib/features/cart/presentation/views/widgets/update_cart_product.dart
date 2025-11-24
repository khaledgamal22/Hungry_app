import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/app_colors.dart';

class UpdateCartProduct extends StatefulWidget {
  const UpdateCartProduct({super.key, required this.productQuantity});
  final int productQuantity;

  @override
  State<UpdateCartProduct> createState() => _UpdateCartProductState();
}

class _UpdateCartProductState extends State<UpdateCartProduct> {
  int productQuantity = 0;
  @override
  void initState() {
    productQuantity = widget.productQuantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (productQuantity > 1) productQuantity--;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: CircleBorder(),
              ),
              child: Icon(Icons.remove, color: AppColors.white),
            ),
            Gap(5),
            Text('$productQuantity'),
            Gap(5),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  productQuantity++;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: CircleBorder(),
              ),
              child: Icon(Icons.add, color: AppColors.white),
            ),
          ],
        ),
        Gap(30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Remove',
            style: TextStyle(color: AppColors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
