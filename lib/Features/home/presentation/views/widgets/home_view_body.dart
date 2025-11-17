import 'package:clean_arche_bookly_app/Features/home/presentation/views/widgets/custom_best_seller_list_view_bloc_builder.dart';
import 'package:clean_arche_bookly_app/Features/home/presentation/views/widgets/custom_featured_books_bloc_builder.dart';
import 'package:clean_arche_bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: CustomAppBar()),
              CustomFeaturedBooksBlocConsumer(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomBestSellerListViewBlocBuilder(),
          ),
        ),
      ],
    );
  }
}
