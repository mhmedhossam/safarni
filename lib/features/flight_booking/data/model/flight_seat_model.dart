class FlightSeatModel {
  bool? success;
  String? message;
  Data? data;

  FlightSeatModel({this.success, this.message, this.data});

  FlightSeatModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? flightId;
  SeatsByClass? seatsByClass;

  Data({this.flightId, this.seatsByClass});

  Data.fromJson(Map<String, dynamic> json) {
    flightId = json['flight_id'];
    seatsByClass = json['seats_by_class'] != null
        ? SeatsByClass.fromJson(json['seats_by_class'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flight_id'] = flightId;
    if (seatsByClass != null) {
      data['seats_by_class'] = seatsByClass!.toJson();
    }
    return data;
  }
}

class SeatsByClass {
  List<Business>? business;
  List<Economy>? economy;

  SeatsByClass({this.business, this.economy});

  SeatsByClass.fromJson(Map<String, dynamic> json) {
    if (json['business'] != null) {
      business = <Business>[];
      json['business'].forEach((v) {
        business!.add(Business.fromJson(v));
      });
    }
    if (json['economy'] != null) {
      economy = <Economy>[];
      json['economy'].forEach((v) {
        economy!.add(Economy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (business != null) {
      data['business'] = business!.map((v) => v.toJson()).toList();
    }
    if (economy != null) {
      data['economy'] = economy!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Business {
  String? id;
  int? row;
  String? column;
  String? designation;
  bool? isAvailable;
  bool? isLocked;
  int? priceModifierEgp;

  Business(
      {this.id,
        this.row,
        this.column,
        this.designation,
        this.isAvailable,
        this.isLocked,
        this.priceModifierEgp});

  Business.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    row = json['row'];
    column = json['column'];
    designation = json['designation'];
    isAvailable = json['is_available'];
    isLocked = json['is_locked'];
    priceModifierEgp = json['price_modifier_egp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['row'] = row;
    data['column'] = column;
    data['designation'] = designation;
    data['is_available'] = isAvailable;
    data['is_locked'] = isLocked;
    data['price_modifier_egp'] = priceModifierEgp;
    return data;
  }
}
class Economy {
  String? id;
  int? row;
  String? column;
  String? designation;
  bool? isAvailable;
  bool? isLocked;
  int? priceModifierEgp;

  Economy(
      {this.id,
        this.row,
        this.column,
        this.designation,
        this.isAvailable,
        this.isLocked,
        this.priceModifierEgp});

  Economy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    row = json['row'];
    column = json['column'];
    designation = json['designation'];
    isAvailable = json['is_available'];
    isLocked = json['is_locked'];
    priceModifierEgp = json['price_modifier_egp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['row'] = row;
    data['column'] = column;
    data['designation'] = designation;
    data['is_available'] = isAvailable;
    data['is_locked'] = isLocked;
    data['price_modifier_egp'] = priceModifierEgp;
    return data;
  }
}