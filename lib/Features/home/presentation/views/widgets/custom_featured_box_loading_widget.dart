import 'package:clean_arche_bookly_app/Features/home/presentation/views/widgets/custom_faetured_books_loading_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomFeaturedBooksLoadingWidget extends StatelessWidget {
  const CustomFeaturedBooksLoadingWidget({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * height,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Skeletonizer(
                  enabled: true, child: FeaturedBooksLoadingItem()),
            );
          }),
    );
  }
}
