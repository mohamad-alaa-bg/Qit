import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qit/src/core/shared_components/sizedBox.dart';
import 'package:qit/src/features/home/data/models/product_model.dart';
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
              padding: const EdgeInsets.all(18),
              child: categories == null
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/menu.png'),
                            const Spacer(),
                            Image.asset('assets/images/bell (2).png'),
                          ],
                        ),
                        const VerticalSizedBox(height: 38),
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Stack(
                                    alignment: AlignmentDirectional.topStart,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          homeBloc.add(SelectCategoryEvent(
                                              index: index));
                                          homeBloc.add(GetProductsEvent(
                                              categoryName:
                                                  categories![index]));
                                        },
                                        child: Text(
                                          categories![index],
                                          style: TextStyle(
                                              color: Colors.white.withOpacity(
                                                homeBloc.selectedCategories ==
                                                        index
                                                    ? 1
                                                    : 0.34,
                                              ),
                                              fontSize: 14,
                                              fontFamily: 'Palatino'),
                                        ),
                                      ),
                                      homeBloc.selectedCategories == index
                                          ? Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .only(top: 8, start: 2),
                                              child: Container(
                                                width: 4,
                                                height: 4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                              separatorBuilder: (context, index) =>
                                  const HorizontalSizedBox(width: 20),
                              itemCount: categories!.length),
                        ),
                        const VerticalSizedBox(height: 21),
                        Expanded(
                          child: products == null ||
                                  state is ProductsIsLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : LayoutBuilder(
                                  builder: (context, constraints) {
                                    print(constraints.maxWidth);
                                    final double emptySpace =
                                        constraints.maxWidth - 328;
                                    return GridView.count(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: emptySpace * 0.3 < 5
                                            ? 0
                                            : emptySpace * 0.2,
                                      ),
                                      crossAxisCount: 2,
                                      mainAxisSpacing: emptySpace * 0.3 < 5
                                          ? 10
                                          : emptySpace * 0.3,
                                      crossAxisSpacing: emptySpace * 0.3 < 5
                                          ? 10
                                          : emptySpace * 0.3,
                                      childAspectRatio: 164 / 250,
                                      children: List.generate(
                                        products!.length,
                                        (index) => ProductCard(
                                          productModel: products![index],
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
