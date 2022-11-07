// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';
import 'swagger.enums.swagger.dart' as enums;

part 'swagger.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class Wine {
  Wine({
    this.available,
    this.country,
    this.gradation,
    this.grapes,
    this.name,
    this.price,
    this.producer,
    this.region,
    this.wineId,
    this.wineType,
    this.year,
  });

  factory Wine.fromJson(Map<String, dynamic> json) => _$WineFromJson(json);

  @JsonKey(name: 'available')
  final bool? available;
  @JsonKey(name: 'country')
  final String? country;
  @JsonKey(name: 'gradation')
  final String? gradation;
  @JsonKey(name: 'grapes')
  final String? grapes;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'price')
  final double? price;
  @JsonKey(name: 'producer')
  final String? producer;
  @JsonKey(name: 'region')
  final String? region;
  @JsonKey(name: 'wineId')
  final num? wineId;
  @JsonKey(
    name: 'wineType',
    toJson: wineWineTypeToJson,
    fromJson: wineWineTypeFromJson,
  )
  final enums.WineWineType? wineType;
  @JsonKey(name: 'year')
  final String? year;
  static const fromJsonFactory = _$WineFromJson;
  static const toJsonFactory = _$WineToJson;
  Map<String, dynamic> toJson() => _$WineToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Wine &&
            (identical(other.available, available) ||
                const DeepCollectionEquality()
                    .equals(other.available, available)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.gradation, gradation) ||
                const DeepCollectionEquality()
                    .equals(other.gradation, gradation)) &&
            (identical(other.grapes, grapes) ||
                const DeepCollectionEquality().equals(other.grapes, grapes)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.producer, producer) ||
                const DeepCollectionEquality()
                    .equals(other.producer, producer)) &&
            (identical(other.region, region) ||
                const DeepCollectionEquality().equals(other.region, region)) &&
            (identical(other.wineId, wineId) ||
                const DeepCollectionEquality().equals(other.wineId, wineId)) &&
            (identical(other.wineType, wineType) ||
                const DeepCollectionEquality()
                    .equals(other.wineType, wineType)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(available) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(gradation) ^
      const DeepCollectionEquality().hash(grapes) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(producer) ^
      const DeepCollectionEquality().hash(region) ^
      const DeepCollectionEquality().hash(wineId) ^
      const DeepCollectionEquality().hash(wineType) ^
      const DeepCollectionEquality().hash(year) ^
      runtimeType.hashCode;
}

extension $WineExtension on Wine {
  Wine copyWith(
      {bool? available,
      String? country,
      String? gradation,
      String? grapes,
      String? name,
      double? price,
      String? producer,
      String? region,
      num? wineId,
      enums.WineWineType? wineType,
      String? year}) {
    return Wine(
        available: available ?? this.available,
        country: country ?? this.country,
        gradation: gradation ?? this.gradation,
        grapes: grapes ?? this.grapes,
        name: name ?? this.name,
        price: price ?? this.price,
        producer: producer ?? this.producer,
        region: region ?? this.region,
        wineId: wineId ?? this.wineId,
        wineType: wineType ?? this.wineType,
        year: year ?? this.year);
  }

  Wine copyWithWrapped(
      {Wrapped<bool?>? available,
      Wrapped<String?>? country,
      Wrapped<String?>? gradation,
      Wrapped<String?>? grapes,
      Wrapped<String?>? name,
      Wrapped<double?>? price,
      Wrapped<String?>? producer,
      Wrapped<String?>? region,
      Wrapped<num?>? wineId,
      Wrapped<enums.WineWineType?>? wineType,
      Wrapped<String?>? year}) {
    return Wine(
        available: (available != null ? available.value : this.available),
        country: (country != null ? country.value : this.country),
        gradation: (gradation != null ? gradation.value : this.gradation),
        grapes: (grapes != null ? grapes.value : this.grapes),
        name: (name != null ? name.value : this.name),
        price: (price != null ? price.value : this.price),
        producer: (producer != null ? producer.value : this.producer),
        region: (region != null ? region.value : this.region),
        wineId: (wineId != null ? wineId.value : this.wineId),
        wineType: (wineType != null ? wineType.value : this.wineType),
        year: (year != null ? year.value : this.year));
  }
}

@JsonSerializable(explicitToJson: true)
class Product {
  Product({
    this.available,
    this.category,
    this.ingredients,
    this.name,
    this.price,
    this.productId,
    this.subCategory,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @JsonKey(name: 'available')
  final bool? available;
  @JsonKey(
    name: 'category',
    toJson: productCategoryToJson,
    fromJson: productCategoryFromJson,
  )
  final enums.ProductCategory? category;
  @JsonKey(name: 'ingredients')
  final String? ingredients;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'price')
  final double? price;
  @JsonKey(name: 'productId')
  final num? productId;
  @JsonKey(name: 'subCategory')
  final String? subCategory;
  static const fromJsonFactory = _$ProductFromJson;
  static const toJsonFactory = _$ProductToJson;
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Product &&
            (identical(other.available, available) ||
                const DeepCollectionEquality()
                    .equals(other.available, available)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.ingredients, ingredients) ||
                const DeepCollectionEquality()
                    .equals(other.ingredients, ingredients)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.productId, productId) ||
                const DeepCollectionEquality()
                    .equals(other.productId, productId)) &&
            (identical(other.subCategory, subCategory) ||
                const DeepCollectionEquality()
                    .equals(other.subCategory, subCategory)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(available) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(ingredients) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(productId) ^
      const DeepCollectionEquality().hash(subCategory) ^
      runtimeType.hashCode;
}

extension $ProductExtension on Product {
  Product copyWith(
      {bool? available,
      enums.ProductCategory? category,
      String? ingredients,
      String? name,
      double? price,
      num? productId,
      String? subCategory}) {
    return Product(
        available: available ?? this.available,
        category: category ?? this.category,
        ingredients: ingredients ?? this.ingredients,
        name: name ?? this.name,
        price: price ?? this.price,
        productId: productId ?? this.productId,
        subCategory: subCategory ?? this.subCategory);
  }

  Product copyWithWrapped(
      {Wrapped<bool?>? available,
      Wrapped<enums.ProductCategory?>? category,
      Wrapped<String?>? ingredients,
      Wrapped<String?>? name,
      Wrapped<double?>? price,
      Wrapped<num?>? productId,
      Wrapped<String?>? subCategory}) {
    return Product(
        available: (available != null ? available.value : this.available),
        category: (category != null ? category.value : this.category),
        ingredients:
            (ingredients != null ? ingredients.value : this.ingredients),
        name: (name != null ? name.value : this.name),
        price: (price != null ? price.value : this.price),
        productId: (productId != null ? productId.value : this.productId),
        subCategory:
            (subCategory != null ? subCategory.value : this.subCategory));
  }
}

@JsonSerializable(explicitToJson: true)
class Sushi {
  Sushi({
    this.available,
    this.category,
    this.ingredients,
    this.name,
    this.price,
    this.subCategory,
    this.sushiId,
    this.takeAwayPrice,
    this.takeAwayProduct,
  });

  factory Sushi.fromJson(Map<String, dynamic> json) => _$SushiFromJson(json);

  @JsonKey(name: 'available')
  final bool? available;
  @JsonKey(
    name: 'category',
    toJson: sushiCategoryToJson,
    fromJson: sushiCategoryFromJson,
  )
  final enums.SushiCategory? category;
  @JsonKey(name: 'ingredients')
  final String? ingredients;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'price')
  final double? price;
  @JsonKey(name: 'subCategory')
  final String? subCategory;
  @JsonKey(name: 'sushiId')
  final num? sushiId;
  @JsonKey(name: 'takeAwayPrice')
  final double? takeAwayPrice;
  @JsonKey(name: 'takeAwayProduct')
  final bool? takeAwayProduct;
  static const fromJsonFactory = _$SushiFromJson;
  static const toJsonFactory = _$SushiToJson;
  Map<String, dynamic> toJson() => _$SushiToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Sushi &&
            (identical(other.available, available) ||
                const DeepCollectionEquality()
                    .equals(other.available, available)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.ingredients, ingredients) ||
                const DeepCollectionEquality()
                    .equals(other.ingredients, ingredients)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.subCategory, subCategory) ||
                const DeepCollectionEquality()
                    .equals(other.subCategory, subCategory)) &&
            (identical(other.sushiId, sushiId) ||
                const DeepCollectionEquality()
                    .equals(other.sushiId, sushiId)) &&
            (identical(other.takeAwayPrice, takeAwayPrice) ||
                const DeepCollectionEquality()
                    .equals(other.takeAwayPrice, takeAwayPrice)) &&
            (identical(other.takeAwayProduct, takeAwayProduct) ||
                const DeepCollectionEquality()
                    .equals(other.takeAwayProduct, takeAwayProduct)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(available) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(ingredients) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(subCategory) ^
      const DeepCollectionEquality().hash(sushiId) ^
      const DeepCollectionEquality().hash(takeAwayPrice) ^
      const DeepCollectionEquality().hash(takeAwayProduct) ^
      runtimeType.hashCode;
}

extension $SushiExtension on Sushi {
  Sushi copyWith(
      {bool? available,
      enums.SushiCategory? category,
      String? ingredients,
      String? name,
      double? price,
      String? subCategory,
      num? sushiId,
      double? takeAwayPrice,
      bool? takeAwayProduct}) {
    return Sushi(
        available: available ?? this.available,
        category: category ?? this.category,
        ingredients: ingredients ?? this.ingredients,
        name: name ?? this.name,
        price: price ?? this.price,
        subCategory: subCategory ?? this.subCategory,
        sushiId: sushiId ?? this.sushiId,
        takeAwayPrice: takeAwayPrice ?? this.takeAwayPrice,
        takeAwayProduct: takeAwayProduct ?? this.takeAwayProduct);
  }

  Sushi copyWithWrapped(
      {Wrapped<bool?>? available,
      Wrapped<enums.SushiCategory?>? category,
      Wrapped<String?>? ingredients,
      Wrapped<String?>? name,
      Wrapped<double?>? price,
      Wrapped<String?>? subCategory,
      Wrapped<num?>? sushiId,
      Wrapped<double?>? takeAwayPrice,
      Wrapped<bool?>? takeAwayProduct}) {
    return Sushi(
        available: (available != null ? available.value : this.available),
        category: (category != null ? category.value : this.category),
        ingredients:
            (ingredients != null ? ingredients.value : this.ingredients),
        name: (name != null ? name.value : this.name),
        price: (price != null ? price.value : this.price),
        subCategory:
            (subCategory != null ? subCategory.value : this.subCategory),
        sushiId: (sushiId != null ? sushiId.value : this.sushiId),
        takeAwayPrice:
            (takeAwayPrice != null ? takeAwayPrice.value : this.takeAwayPrice),
        takeAwayProduct: (takeAwayProduct != null
            ? takeAwayProduct.value
            : this.takeAwayProduct));
  }
}

String? wineWineTypeToJson(enums.WineWineType? wineWineType) {
  return enums.$WineWineTypeMap[wineWineType];
}

enums.WineWineType wineWineTypeFromJson(
  Object? wineWineType, [
  enums.WineWineType? defaultValue,
]) {
  if (wineWineType is String) {
    return enums.$WineWineTypeMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == wineWineType.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.WineWineType.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$WineWineTypeMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.WineWineType.swaggerGeneratedUnknown;
}

List<String> wineWineTypeListToJson(List<enums.WineWineType>? wineWineType) {
  if (wineWineType == null) {
    return [];
  }

  return wineWineType.map((e) => enums.$WineWineTypeMap[e]!).toList();
}

List<enums.WineWineType> wineWineTypeListFromJson(
  List? wineWineType, [
  List<enums.WineWineType>? defaultValue,
]) {
  if (wineWineType == null) {
    return defaultValue ?? [];
  }

  return wineWineType.map((e) => wineWineTypeFromJson(e.toString())).toList();
}

List<enums.WineWineType>? wineWineTypeNullableListFromJson(
  List? wineWineType, [
  List<enums.WineWineType>? defaultValue,
]) {
  if (wineWineType == null) {
    return defaultValue;
  }

  return wineWineType.map((e) => wineWineTypeFromJson(e.toString())).toList();
}

String? productCategoryToJson(enums.ProductCategory? productCategory) {
  return enums.$ProductCategoryMap[productCategory];
}

enums.ProductCategory productCategoryFromJson(
  Object? productCategory, [
  enums.ProductCategory? defaultValue,
]) {
  if (productCategory is String) {
    return enums.$ProductCategoryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == productCategory.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProductCategory.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$ProductCategoryMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.ProductCategory.swaggerGeneratedUnknown;
}

List<String> productCategoryListToJson(
    List<enums.ProductCategory>? productCategory) {
  if (productCategory == null) {
    return [];
  }

  return productCategory.map((e) => enums.$ProductCategoryMap[e]!).toList();
}

List<enums.ProductCategory> productCategoryListFromJson(
  List? productCategory, [
  List<enums.ProductCategory>? defaultValue,
]) {
  if (productCategory == null) {
    return defaultValue ?? [];
  }

  return productCategory
      .map((e) => productCategoryFromJson(e.toString()))
      .toList();
}

List<enums.ProductCategory>? productCategoryNullableListFromJson(
  List? productCategory, [
  List<enums.ProductCategory>? defaultValue,
]) {
  if (productCategory == null) {
    return defaultValue;
  }

  return productCategory
      .map((e) => productCategoryFromJson(e.toString()))
      .toList();
}

String? sushiCategoryToJson(enums.SushiCategory? sushiCategory) {
  return enums.$SushiCategoryMap[sushiCategory];
}

enums.SushiCategory sushiCategoryFromJson(
  Object? sushiCategory, [
  enums.SushiCategory? defaultValue,
]) {
  if (sushiCategory is String) {
    return enums.$SushiCategoryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == sushiCategory.toLowerCase(),
            orElse: () =>
                const MapEntry(enums.SushiCategory.swaggerGeneratedUnknown, ''))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$SushiCategoryMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.SushiCategory.swaggerGeneratedUnknown;
}

List<String> sushiCategoryListToJson(List<enums.SushiCategory>? sushiCategory) {
  if (sushiCategory == null) {
    return [];
  }

  return sushiCategory.map((e) => enums.$SushiCategoryMap[e]!).toList();
}

List<enums.SushiCategory> sushiCategoryListFromJson(
  List? sushiCategory, [
  List<enums.SushiCategory>? defaultValue,
]) {
  if (sushiCategory == null) {
    return defaultValue ?? [];
  }

  return sushiCategory.map((e) => sushiCategoryFromJson(e.toString())).toList();
}

List<enums.SushiCategory>? sushiCategoryNullableListFromJson(
  List? sushiCategory, [
  List<enums.SushiCategory>? defaultValue,
]) {
  if (sushiCategory == null) {
    return defaultValue;
  }

  return sushiCategory.map((e) => sushiCategoryFromJson(e.toString())).toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
