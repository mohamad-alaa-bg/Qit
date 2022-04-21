import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qit/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:qit/src/injection.dart';

import '../../../../core/shared_components/sized_box.dart';

class CategoriesList extends StatelessWidget {
  final List<String>? categories;

  const CategoriesList({Key? key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = sl();
    homeBloc = BlocProvider.of(context);
    return SizedBox(
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  TextButton(
                    onPressed: () {
                      homeBloc.add(SelectCategoryEvent(index: index));
                      homeBloc.add(
                          GetProductsEvent(categoryName: categories![index]));
                    },
                    child: Text(
                      categories![index],
                      style: TextStyle(
                          color: Colors.white.withOpacity(
                            homeBloc.selectedCategories == index ? 1 : 0.34,
                          ),
                          fontSize: 14,
                          fontFamily: 'Palatino'),
                    ),
                  ),
                  homeBloc.selectedCategories == index
                      ? Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 8, start: 2),
                          child: Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
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
    );
  }
}
