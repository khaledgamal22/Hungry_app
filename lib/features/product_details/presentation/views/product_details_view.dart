import 'package:flutter/material.dart';
import 'package:hungry/features/product_details/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: ProductDetailsViewBody()));
  }
}
