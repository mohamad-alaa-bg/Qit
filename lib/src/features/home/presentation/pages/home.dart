import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qit/src/core/shared_components/sized_box.dart';
import 'package:qit/src/features/home/data/models/product_model.dart';
import 'package:qit/src/features/home/presentation/widgets/categories_list.dart';
import 'package:qit/src/features/home/presentation/widgets/product_card.dart';
import 'package:qit/src/injection.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc = sl();
  List<String>? categories;
  List<ProductModel>? products;

  @override
  void initState() {
    homeBloc = BlocProvider.of(context);
    homeBloc.add(GetCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is CategoriesSuccessState) {
          categories = state.categories;
        }
        if (state is ProductsSuccessState) {
          products = state.products;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              color: const Color.fromRGBO(51, 55, 66, 1),
              child: categories == null
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/menu.png'),
                                  const Spacer(),
                                  Image.asset('assets/images/bell (2).png'),
                                ],
                              ),
                              const VerticalSizedBox(height: 38),
                              CategoriesList(
                                categories: categories,
                              ),
                              const VerticalSizedBox(height: 21),
                            ],
                          ),
                        ),
                        Expanded(
                          child: products == null ||
                                  homeBloc.allProducts[categories![
                                          homeBloc.selectedCategories]] ==
                                      null
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : LayoutBuilder(
                                  builder: (context, constraints) {
                                    final double emptySpace =
                                        constraints.maxWidth - 338;
                                    final double axisSpacing = emptySpace / 3;
                                    return RefreshIndicator(
                                      onRefresh: () async{
                                        homeBloc.allProducts.remove(categories![
                                        homeBloc.selectedCategories]);
                                        homeBloc.add(GetProductsEvent(
                                            categoryName: categories![
                                            homeBloc.selectedCategories]));
                                        return;
                                      },

                                      child: GridView.count(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                (emptySpace - axisSpacing) / 2),
                                        crossAxisCount: 2,
                                        mainAxisSpacing: axisSpacing,
                                        crossAxisSpacing: axisSpacing,
                                        childAspectRatio: 169 / 260,
                                        children: List.generate(
                                          products!.length,
                                          (index) => ProductCard(
                                            productModel: products![index],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
