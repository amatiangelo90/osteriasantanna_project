// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wine _$WineFromJson(Map<String, dynamic> json) => Wine(
      available: json['available'] as bool?,
      country: json['country'] as String?,
      gradation: json['gradation'] as String?,
      grapes: json['grapes'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      producer: json['producer'] as String?,
      region: json['region'] as String?,
      wineId: json['wineId'] as num?,
      wineType: wineWineTypeFromJson(json['wineType']),
      year: json['year'] as String?,
    );

Map<String, dynamic> _$WineToJson(Wine instance) => <String, dynamic>{
      'available': instance.available,
      'country': instance.country,
      'gradation': instance.gradation,
      'grapes': instance.grapes,
      'name': instance.name,
      'price': instance.price,
      'producer': instance.producer,
      'region': instance.region,
      'wineId': instance.wineId,
      'wineType': wineWineTypeToJson(instance.wineType),
      'year': instance.year,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      available: json['available'] as bool?,
      category: productCategoryFromJson(json['category']),
      ingredients: json['ingredients'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      productId: json['productId'] as num?,
      subCategory: json['subCategory'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'available': instance.available,
      'category': productCategoryToJson(instance.category),
      'ingredients': instance.ingredients,
      'name': instance.name,
      'price': instance.price,
      'productId': instance.productId,
      'subCategory': instance.subCategory,
    };

Sushi _$SushiFromJson(Map<String, dynamic> json) => Sushi(
      available: json['available'] as bool?,
      category: sushiCategoryFromJson(json['category']),
      ingredients: json['ingredients'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      subCategory: json['subCategory'] as String?,
      sushiId: json['sushiId'] as num?,
      takeAwayPrice: (json['takeAwayPrice'] as num?)?.toDouble(),
      takeAwayProduct: json['takeAwayProduct'] as bool?,
    );

Map<String, dynamic> _$SushiToJson(Sushi instance) => <String, dynamic>{
      'available': instance.available,
      'category': sushiCategoryToJson(instance.category),
      'ingredients': instance.ingredients,
      'name': instance.name,
      'price': instance.price,
      'subCategory': instance.subCategory,
      'sushiId': instance.sushiId,
      'takeAwayPrice': instance.takeAwayPrice,
      'takeAwayProduct': instance.takeAwayProduct,
    };
