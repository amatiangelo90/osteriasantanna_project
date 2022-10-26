import 'swagger.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;
import 'swagger.enums.swagger.dart' as enums;
export 'swagger.enums.swagger.dart';
export 'swagger.models.swagger.dart';

part 'swagger.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Swagger extends ChopperService {
  static Swagger create({
    ChopperClient? client,
    Authenticator? authenticator,
    String? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$Swagger(client);
    }

    final newClient = ChopperClient(
        services: [_$Swagger()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? 'https://212.227.203.79:8443/santannaservice');
    return _$Swagger(newClient);
  }

  ///delete
  ///@param productId
  ///@param name
  ///@param ingredients
  ///@param category
  ///@param subCategory
  ///@param price
  ///@param available
  Future<chopper.Response> apiV1ProductDeleteDelete({
    int? productId,
    String? name,
    String? ingredients,
    String? category,
    String? subCategory,
    num? price,
    bool? available,
  }) {
    return _apiV1ProductDeleteDelete(
        productId: productId,
        name: name,
        ingredients: ingredients,
        category: category,
        subCategory: subCategory,
        price: price,
        available: available);
  }

  ///delete
  ///@param productId
  ///@param name
  ///@param ingredients
  ///@param category
  ///@param subCategory
  ///@param price
  ///@param available
  @Delete(path: '/api/v1/product/delete')
  Future<chopper.Response> _apiV1ProductDeleteDelete({
    @Query('productId') int? productId,
    @Query('name') String? name,
    @Query('ingredients') String? ingredients,
    @Query('category') String? category,
    @Query('subCategory') String? subCategory,
    @Query('price') num? price,
    @Query('available') bool? available,
  });

  ///retrieveAll
  Future<chopper.Response<List<Product>>> apiV1ProductFindallGet() {
    generatedMapping.putIfAbsent(Product, () => Product.fromJsonFactory);

    return _apiV1ProductFindallGet();
  }

  ///retrieveAll
  @Get(path: '/api/v1/product/findall')
  Future<chopper.Response<List<Product>>> _apiV1ProductFindallGet();

  ///save
  ///@param productId
  ///@param name
  ///@param ingredients
  ///@param category
  ///@param subCategory
  ///@param price
  ///@param available
  Future<chopper.Response> apiV1ProductSavePost({
    int? productId,
    String? name,
    String? ingredients,
    String? category,
    String? subCategory,
    num? price,
    bool? available,
  }) {
    return _apiV1ProductSavePost(
        productId: productId,
        name: name,
        ingredients: ingredients,
        category: category,
        subCategory: subCategory,
        price: price,
        available: available);
  }

  ///save
  ///@param productId
  ///@param name
  ///@param ingredients
  ///@param category
  ///@param subCategory
  ///@param price
  ///@param available
  @Post(
    path: '/api/v1/product/save',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1ProductSavePost({
    @Query('productId') int? productId,
    @Query('name') String? name,
    @Query('ingredients') String? ingredients,
    @Query('category') String? category,
    @Query('subCategory') String? subCategory,
    @Query('price') num? price,
    @Query('available') bool? available,
  });

  ///update
  ///@param productId
  ///@param name
  ///@param ingredients
  ///@param category
  ///@param subCategory
  ///@param price
  ///@param available
  Future<chopper.Response> apiV1ProductUpdatePut({
    int? productId,
    String? name,
    String? ingredients,
    String? category,
    String? subCategory,
    num? price,
    bool? available,
  }) {
    return _apiV1ProductUpdatePut(
        productId: productId,
        name: name,
        ingredients: ingredients,
        category: category,
        subCategory: subCategory,
        price: price,
        available: available);
  }

  ///update
  ///@param productId
  ///@param name
  ///@param ingredients
  ///@param category
  ///@param subCategory
  ///@param price
  ///@param available
  @Put(
    path: '/api/v1/product/update',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1ProductUpdatePut({
    @Query('productId') int? productId,
    @Query('name') String? name,
    @Query('ingredients') String? ingredients,
    @Query('category') String? category,
    @Query('subCategory') String? subCategory,
    @Query('price') num? price,
    @Query('available') bool? available,
  });

  ///delete
  ///@param sushiId
  ///@param name
  ///@param ingredients
  ///@param category
  ///@param subCategory
  ///@param price
  ///@param available
  Future<chopper.Response> apiV1SushiDeleteDelete({
    int? sushiId,
    String? name,
    String? ingredients,
    String? category,
    String? subCategory,
    num? price,
    bool? available,
  }) {
    return _apiV1SushiDeleteDelete(
        sushiId: sushiId,
        name: name,
        ingredients: ingredients,
        category: category,
        subCategory: subCategory,
        price: price,
        available: available);
  }

  ///delete
  ///@param sushiId
  ///@param name
  ///@param ingredients
  ///@param category
  ///@param subCategory
  ///@param price
  ///@param available
  @Delete(path: '/api/v1/sushi/delete')
  Future<chopper.Response> _apiV1SushiDeleteDelete({
    @Query('sushiId') int? sushiId,
    @Query('name') String? name,
    @Query('ingredients') String? ingredients,
    @Query('category') String? category,
    @Query('subCategory') String? subCategory,
    @Query('price') num? price,
    @Query('available') bool? available,
  });

  ///retrieveAll
  Future<chopper.Response<List<Sushi>>> apiV1SushiFindallGet() {
    generatedMapping.putIfAbsent(Sushi, () => Sushi.fromJsonFactory);

    return _apiV1SushiFindallGet();
  }

  ///retrieveAll
  @Get(path: '/api/v1/sushi/findall')
  Future<chopper.Response<List<Sushi>>> _apiV1SushiFindallGet();

  ///save
  ///@param sushiId
  ///@param name
  ///@param ingredients
  ///@param category
  ///@param subCategory
  ///@param price
  ///@param available
  Future<chopper.Response> apiV1SushiSavePost({
    int? sushiId,
    String? name,
    String? ingredients,
    String? category,
    String? subCategory,
    num? price,
    bool? available,
  }) {
    return _apiV1SushiSavePost(
        sushiId: sushiId,
        name: name,
        ingredients: ingredients,
        category: category,
        subCategory: subCategory,
        price: price,
        available: available);
  }

  ///save
  ///@param sushiId
  ///@param name
  ///@param ingredients
  ///@param category
  ///@param subCategory
  ///@param price
  ///@param available
  @Post(
    path: '/api/v1/sushi/save',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1SushiSavePost({
    @Query('sushiId') int? sushiId,
    @Query('name') String? name,
    @Query('ingredients') String? ingredients,
    @Query('category') String? category,
    @Query('subCategory') String? subCategory,
    @Query('price') num? price,
    @Query('available') bool? available,
  });

  ///update
  ///@param sushiId
  ///@param name
  ///@param ingredients
  ///@param category
  ///@param subCategory
  ///@param price
  ///@param available
  Future<chopper.Response> apiV1SushiUpdatePut({
    int? sushiId,
    String? name,
    String? ingredients,
    String? category,
    String? subCategory,
    num? price,
    bool? available,
  }) {
    return _apiV1SushiUpdatePut(
        sushiId: sushiId,
        name: name,
        ingredients: ingredients,
        category: category,
        subCategory: subCategory,
        price: price,
        available: available);
  }

  ///update
  ///@param sushiId
  ///@param name
  ///@param ingredients
  ///@param category
  ///@param subCategory
  ///@param price
  ///@param available
  @Put(
    path: '/api/v1/sushi/update',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1SushiUpdatePut({
    @Query('sushiId') int? sushiId,
    @Query('name') String? name,
    @Query('ingredients') String? ingredients,
    @Query('category') String? category,
    @Query('subCategory') String? subCategory,
    @Query('price') num? price,
    @Query('available') bool? available,
  });

  ///update
  ///@param wineId
  ///@param name
  ///@param price
  ///@param grapes
  ///@param gradation
  ///@param country
  ///@param region
  ///@param year
  ///@param producer
  ///@param wineType
  ///@param available
  Future<chopper.Response> apiV1WinePut({
    int? wineId,
    String? name,
    num? price,
    String? grapes,
    String? gradation,
    String? country,
    String? region,
    String? year,
    String? producer,
    String? wineType,
    bool? available,
  }) {
    return _apiV1WinePut(
        wineId: wineId,
        name: name,
        price: price,
        grapes: grapes,
        gradation: gradation,
        country: country,
        region: region,
        year: year,
        producer: producer,
        wineType: wineType,
        available: available);
  }

  ///update
  ///@param wineId
  ///@param name
  ///@param price
  ///@param grapes
  ///@param gradation
  ///@param country
  ///@param region
  ///@param year
  ///@param producer
  ///@param wineType
  ///@param available
  @Put(
    path: '/api/v1/wine',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1WinePut({
    @Query('wineId') int? wineId,
    @Query('name') String? name,
    @Query('price') num? price,
    @Query('grapes') String? grapes,
    @Query('gradation') String? gradation,
    @Query('country') String? country,
    @Query('region') String? region,
    @Query('year') String? year,
    @Query('producer') String? producer,
    @Query('wineType') String? wineType,
    @Query('available') bool? available,
  });

  ///delete
  ///@param wineId
  ///@param name
  ///@param price
  ///@param grapes
  ///@param gradation
  ///@param country
  ///@param region
  ///@param year
  ///@param producer
  ///@param wineType
  ///@param available
  Future<chopper.Response> apiV1WineDeleteDelete({
    int? wineId,
    String? name,
    num? price,
    String? grapes,
    String? gradation,
    String? country,
    String? region,
    String? year,
    String? producer,
    String? wineType,
    bool? available,
  }) {
    return _apiV1WineDeleteDelete(
        wineId: wineId,
        name: name,
        price: price,
        grapes: grapes,
        gradation: gradation,
        country: country,
        region: region,
        year: year,
        producer: producer,
        wineType: wineType,
        available: available);
  }

  ///delete
  ///@param wineId
  ///@param name
  ///@param price
  ///@param grapes
  ///@param gradation
  ///@param country
  ///@param region
  ///@param year
  ///@param producer
  ///@param wineType
  ///@param available
  @Delete(path: '/api/v1/wine/delete')
  Future<chopper.Response> _apiV1WineDeleteDelete({
    @Query('wineId') int? wineId,
    @Query('name') String? name,
    @Query('price') num? price,
    @Query('grapes') String? grapes,
    @Query('gradation') String? gradation,
    @Query('country') String? country,
    @Query('region') String? region,
    @Query('year') String? year,
    @Query('producer') String? producer,
    @Query('wineType') String? wineType,
    @Query('available') bool? available,
  });

  ///export
  ///@param wineExports wineExports
  Future<chopper.Response> apiV1WineExportPost({String? wineExports}) {
    return _apiV1WineExportPost(wineExports: wineExports);
  }

  ///export
  ///@param wineExports wineExports
  @Post(
    path: '/api/v1/wine/export',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1WineExportPost(
      {@Query('wineExports') String? wineExports});

  ///retrieveAll
  Future<chopper.Response<List<Wine>>> apiV1WineFindallGet() {
    generatedMapping.putIfAbsent(Wine, () => Wine.fromJsonFactory);

    return _apiV1WineFindallGet();
  }

  ///retrieveAll
  @Get(path: '/api/v1/wine/findall')
  Future<chopper.Response<List<Wine>>> _apiV1WineFindallGet();

  ///save
  ///@param wineId
  ///@param name
  ///@param price
  ///@param grapes
  ///@param gradation
  ///@param country
  ///@param region
  ///@param year
  ///@param producer
  ///@param wineType
  ///@param available
  Future<chopper.Response> apiV1WineSavePost({
    int? wineId,
    String? name,
    num? price,
    String? grapes,
    String? gradation,
    String? country,
    String? region,
    String? year,
    String? producer,
    String? wineType,
    bool? available,
  }) {
    return _apiV1WineSavePost(
        wineId: wineId,
        name: name,
        price: price,
        grapes: grapes,
        gradation: gradation,
        country: country,
        region: region,
        year: year,
        producer: producer,
        wineType: wineType,
        available: available);
  }

  ///save
  ///@param wineId
  ///@param name
  ///@param price
  ///@param grapes
  ///@param gradation
  ///@param country
  ///@param region
  ///@param year
  ///@param producer
  ///@param wineType
  ///@param available
  @Post(
    path: '/api/v1/wine/save',
    optionalBody: true,
  )
  Future<chopper.Response> _apiV1WineSavePost({
    @Query('wineId') int? wineId,
    @Query('name') String? name,
    @Query('price') num? price,
    @Query('grapes') String? grapes,
    @Query('gradation') String? gradation,
    @Query('country') String? country,
    @Query('region') String? region,
    @Query('year') String? year,
    @Query('producer') String? producer,
    @Query('wineType') String? wineType,
    @Query('available') bool? available,
  });
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
