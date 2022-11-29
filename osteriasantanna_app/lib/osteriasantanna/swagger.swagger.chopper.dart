//Generated code

part of 'swagger.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Swagger extends Swagger {
  _$Swagger([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Swagger;

  @override
  Future<Response<dynamic>> _apiV1ProductDeleteDelete({
    int? productId,
    String? name,
    String? ingredients,
    String? category,
    String? subCategory,
    num? price,
    bool? available,
  }) {
    final String $url = '/api/v1/product/delete';
    final Map<String, dynamic> $params = <String, dynamic>{
      'productId': productId,
      'name': name,
      'ingredients': ingredients,
      'category': category,
      'subCategory': subCategory,
      'price': price,
      'available': available,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Product>>> _apiV1ProductFindallGet() {
    final String $url = '/api/v1/product/findall';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Product>, Product>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1ProductSavePost({
    int? productId,
    String? name,
    String? ingredients,
    String? category,
    String? subCategory,
    num? price,
    bool? available,
  }) {
    final String $url = '/api/v1/product/save';
    final Map<String, dynamic> $params = <String, dynamic>{
      'productId': productId,
      'name': name,
      'ingredients': ingredients,
      'category': category,
      'subCategory': subCategory,
      'price': price,
      'available': available,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Product>> _apiV1ProductUpdatePut({
    int? productId,
    String? name,
    String? ingredients,
    String? category,
    String? subCategory,
    num? price,
    bool? available,
  }) {
    final String $url = '/api/v1/product/update';
    final Map<String, dynamic> $params = <String, dynamic>{
      'productId': productId,
      'name': name,
      'ingredients': ingredients,
      'category': category,
      'subCategory': subCategory,
      'price': price,
      'available': available,
    };
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Product, Product>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1SushiDeleteDelete({
    int? sushiId,
    String? name,
    String? ingredients,
    String? category,
    String? subCategory,
    num? price,
    bool? available,
    bool? takeAwayProduct,
    num? takeAwayPrice,
  }) {
    final String $url = '/api/v1/sushi/delete';
    final Map<String, dynamic> $params = <String, dynamic>{
      'sushiId': sushiId,
      'name': name,
      'ingredients': ingredients,
      'category': category,
      'subCategory': subCategory,
      'price': price,
      'available': available,
      'takeAwayProduct': takeAwayProduct,
      'takeAwayPrice': takeAwayPrice,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Sushi>>> _apiV1SushiFindallGet() {
    final String $url = '/api/v1/sushi/findall';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Sushi>, Sushi>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1SushiSavePost({
    int? sushiId,
    String? name,
    String? ingredients,
    String? category,
    String? subCategory,
    num? price,
    bool? available,
    bool? takeAwayProduct,
    num? takeAwayPrice,
  }) {
    final String $url = '/api/v1/sushi/save';
    final Map<String, dynamic> $params = <String, dynamic>{
      'sushiId': sushiId,
      'name': name,
      'ingredients': ingredients,
      'category': category,
      'subCategory': subCategory,
      'price': price,
      'available': available,
      'takeAwayProduct': takeAwayProduct,
      'takeAwayPrice': takeAwayPrice,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1SushiUpdatePut({
    int? sushiId,
    String? name,
    String? ingredients,
    String? category,
    String? subCategory,
    num? price,
    bool? available,
    bool? takeAwayProduct,
    num? takeAwayPrice,
  }) {
    final String $url = '/api/v1/sushi/update';
    final Map<String, dynamic> $params = <String, dynamic>{
      'sushiId': sushiId,
      'name': name,
      'ingredients': ingredients,
      'category': category,
      'subCategory': subCategory,
      'price': price,
      'available': available,
      'takeAwayProduct': takeAwayProduct,
      'takeAwayPrice': takeAwayPrice,
    };
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1WinePut({
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
    final String $url = '/api/v1/wine';
    final Map<String, dynamic> $params = <String, dynamic>{
      'wineId': wineId,
      'name': name,
      'price': price,
      'grapes': grapes,
      'gradation': gradation,
      'country': country,
      'region': region,
      'year': year,
      'producer': producer,
      'wineType': wineType,
      'available': available,
    };
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1WineDeleteDelete({
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
    final String $url = '/api/v1/wine/delete';
    final Map<String, dynamic> $params = <String, dynamic>{
      'wineId': wineId,
      'name': name,
      'price': price,
      'grapes': grapes,
      'gradation': gradation,
      'country': country,
      'region': region,
      'year': year,
      'producer': producer,
      'wineType': wineType,
      'available': available,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1WineExportPost({String? wineExports}) {
    final String $url = '/api/v1/wine/export';
    final Map<String, dynamic> $params = <String, dynamic>{
      'wineExports': wineExports
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Wine>>> _apiV1WineFindallGet() {
    final String $url = '/api/v1/wine/findall';
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Wine>, Wine>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1WineSavePost({
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
    final String $url = '/api/v1/wine/save';
    final Map<String, dynamic> $params = <String, dynamic>{
      'wineId': wineId,
      'name': name,
      'price': price,
      'grapes': grapes,
      'gradation': gradation,
      'country': country,
      'region': region,
      'year': year,
      'producer': producer,
      'wineType': wineType,
      'available': available,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
