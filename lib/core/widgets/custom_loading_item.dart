import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLoadingItem extends StatelessWidget {
  const CustomLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          // Placeholder for book image
          Skeleton.leaf(
            child: Container(
              width: 90,
              height: 125,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Placeholder for book title
                Skeleton.leaf(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * .5,
                    height: 20,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: 8),

                // Placeholder for book author
                Skeleton.leaf(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * .3,
                    height: 16,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: 8),

                // Placeholder for price and rating
                Row(
                  children: [
                    Skeleton.leaf(
                      child: Container(
                        width: 50,
                        height: 18,
                        color: Colors.grey[300],
                      ),
                    ),
                    const Spacer(),
                    Skeleton.leaf(
                      child: Container(
                        width: 80,
                        height: 16,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
