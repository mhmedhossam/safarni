import 'package:round_8_mobile_safarni_team3/features/Home/domain/entities/price_entity.dart';

class PriceModel extends PriceEntity {
  PriceModel({super.amount, super.currency, super.formatted});

  factory PriceModel.fromJson(json) {
    return PriceModel(
      amount: json["amount"],
      currency: json["currency"],
      formatted: json["formatted"],
    );
  }
}
