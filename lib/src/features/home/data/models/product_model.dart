import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@Freezed()
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required final int id,
    required final String title,
    required final double price,
    required final String description,
    required final String category,
    required final String image,
    required final RatingModel rating,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@Freezed()
class RatingModel with _$RatingModel {
  const factory RatingModel({
    required final double rate,
    required int count,
  }) = _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
}
