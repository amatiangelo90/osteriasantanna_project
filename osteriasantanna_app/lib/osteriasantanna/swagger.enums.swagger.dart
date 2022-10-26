import 'package:json_annotation/json_annotation.dart';

enum WineWineType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('BIANCO')
  bianco,
  @JsonValue('ROSSO')
  rosso,
  @JsonValue('ROSATO')
  rosato,
  @JsonValue('BOLLICINE')
  bollicine,
  @JsonValue('CHAMPAGNE')
  champagne
}

const $WineWineTypeMap = {
  WineWineType.bianco: 'BIANCO',
  WineWineType.rosso: 'ROSSO',
  WineWineType.rosato: 'ROSATO',
  WineWineType.bollicine: 'BOLLICINE',
  WineWineType.champagne: 'CHAMPAGNE'
};

enum ProductCategory {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('ANTIPASTI')
  antipasti,
  @JsonValue('PRIMI')
  primi,
  @JsonValue('SECONDI')
  secondi,
  @JsonValue('CONTORNI')
  contorni,
  @JsonValue('DOLCI')
  dolci,
  @JsonValue('BEVANDE')
  bevande
}

const $ProductCategoryMap = {
  ProductCategory.antipasti: 'ANTIPASTI',
  ProductCategory.primi: 'PRIMI',
  ProductCategory.secondi: 'SECONDI',
  ProductCategory.contorni: 'CONTORNI',
  ProductCategory.dolci: 'DOLCI',
  ProductCategory.bevande: 'BEVANDE'
};

enum SushiCategory {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('TARTARESASHIMICARPACCIO')
  tartaresashimicarpaccio,
  @JsonValue('HOSOMAKITEMAKI')
  hosomakitemaki,
  @JsonValue('ROLLS8PZ')
  rolls8pz,
  @JsonValue('SUSHIGIO2PZ')
  sushigio2pz,
  @JsonValue('SPECIALS')
  specials,
  @JsonValue('SUSHIDEFAULT')
  sushidefault,
  @JsonValue('NIGIRI1PZ')
  nigiri1pz,
  @JsonValue('SUSHISPECIALETONNO')
  sushispecialetonno,
  @JsonValue('SUSHISPECIALERICCIOLA')
  sushispecialericciola,
  @JsonValue('SUSHISPECIALE')
  sushispeciale
}

const $SushiCategoryMap = {
  SushiCategory.tartaresashimicarpaccio: 'TARTARESASHIMICARPACCIO',
  SushiCategory.hosomakitemaki: 'HOSOMAKITEMAKI',
  SushiCategory.rolls8pz: 'ROLLS8PZ',
  SushiCategory.sushigio2pz: 'SUSHIGIO2PZ',
  SushiCategory.specials: 'SPECIALS',
  SushiCategory.sushidefault: 'SUSHIDEFAULT',
  SushiCategory.nigiri1pz: 'NIGIRI1PZ',
  SushiCategory.sushispecialetonno: 'SUSHISPECIALETONNO',
  SushiCategory.sushispecialericciola: 'SUSHISPECIALERICCIOLA',
  SushiCategory.sushispeciale: 'SUSHISPECIALE'
};
