class SearchFlightModel {
  List<SearchFlightModelData>? data;
  Links? links;
  Meta? meta;

  SearchFlightModel({this.data, this.links, this.meta});

  SearchFlightModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SearchFlightModelData>[];
      json['data'].forEach((v) {
        data!.add(SearchFlightModelData.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class SearchFlightModelData {
  String? id;
  String? flightNumber;
  Airline? airline;
  Aircraft? aircraft;
  Origin? origin;
  Origin? destination;
  Schedule? schedule;
  int? stops;
  List<LayoverDetails>? layoverDetails;
  String? baggageRules;
  bool? isRefundable;
  String? fareConditions;
  Pricing? pricing;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  SearchFlightModelData({
    this.id,
    this.flightNumber,
    this.airline,
    this.aircraft,
    this.origin,
    this.destination,
    this.schedule,
    this.stops,
    this.layoverDetails,
    this.baggageRules,
    this.isRefundable,
    this.fareConditions,
    this.pricing,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  SearchFlightModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flightNumber = json['flight_number'];
    airline = json['airline'] != null ? Airline.fromJson(json['airline']) : null;
    aircraft =
    json['aircraft'] != null ? Aircraft.fromJson(json['aircraft']) : null;
    origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    destination =
    json['destination'] != null ? Origin.fromJson(json['destination']) : null;
    schedule =
    json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null;
    stops = json['stops'];
    if (json['layover_details'] != null) {
      layoverDetails = <LayoverDetails>[];
      json['layover_details'].forEach((v) {
        layoverDetails!.add(LayoverDetails.fromJson(v));
      });
    }
    baggageRules = json['baggage_rules'];
    isRefundable = json['is_refundable'];
    fareConditions = json['fare_conditions'];
    pricing =
    json['pricing'] != null ? Pricing.fromJson(json['pricing']) : null;
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['flight_number'] = flightNumber;
    if (airline != null) data['airline'] = airline!.toJson();
    if (aircraft != null) data['aircraft'] = aircraft!.toJson();
    if (origin != null) data['origin'] = origin!.toJson();
    if (destination != null) data['destination'] = destination!.toJson();
    if (schedule != null) data['schedule'] = schedule!.toJson();
    data['stops'] = stops;
    if (layoverDetails != null) {
      data['layover_details'] =
          layoverDetails!.map((v) => v.toJson()).toList();
    }
    data['baggage_rules'] = baggageRules;
    data['is_refundable'] = isRefundable;
    data['fare_conditions'] = fareConditions;
    if (pricing != null) data['pricing'] = pricing!.toJson();
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Airline {
  int? id;
  String? code;
  String? name;
  String? logoUrl;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Airline.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    logoUrl = json['logo_url'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'logo_url': logoUrl,
    'is_active': isActive,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class Aircraft {
  int? id;
  String? type;
  int? totalSeats;

  Aircraft.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    totalSeats = json['total_seats'];
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'type': type, 'total_seats': totalSeats};
}

class Origin {
  int? id;
  String? code;
  String? name;
  String? city;
  Location? location;
  String? timezone;
  String? createdAt;
  String? updatedAt;

  Origin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    city = json['city'];
    location =
    json['location'] != null ? Location.fromJson(json['location']) : null;
    timezone = json['timezone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'city': city,
    'location': location?.toJson(),
    'timezone': timezone,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class Location {
  double? latitude;
  double? longitude;

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() =>
      {'latitude': latitude, 'longitude': longitude};
}

class Schedule {
  String? departureTime;
  String? arrivalTime;
  int? durationMinutes;
  String? durationFormatted;

  Schedule.fromJson(Map<String, dynamic> json) {
    departureTime = json['departure_time'];
    arrivalTime = json['arrival_time'];
    durationMinutes = json['duration_minutes'];
    durationFormatted = json['duration_formatted'];
  }

  Map<String, dynamic> toJson() => {
    'departure_time': departureTime,
    'arrival_time': arrivalTime,
    'duration_minutes': durationMinutes,
    'duration_formatted': durationFormatted,
  };
}

class LayoverDetails {
  String? airport;
  int? durationMinutes;

  LayoverDetails.fromJson(Map<String, dynamic> json) {
    airport = json['airport'];
    durationMinutes = json['duration_minutes'];
  }

  Map<String, dynamic> toJson() =>
      {'airport': airport, 'duration_minutes': durationMinutes};
}

class Pricing {
  int? basePricePiasters;
  int? taxPercentage;
  int? taxAmountPiasters;
  int? totalPricePiasters;
  Formatted? formatted;

  Pricing.fromJson(Map<String, dynamic> json) {
    basePricePiasters = json['base_price_piasters'];
    taxPercentage = json['tax_percentage'];
    taxAmountPiasters = json['tax_amount_piasters'];
    totalPricePiasters = json['total_price_piasters'];
    formatted =
    json['formatted'] != null ? Formatted.fromJson(json['formatted']) : null;
  }

  Map<String, dynamic> toJson() => {
    'base_price_piasters': basePricePiasters,
    'tax_percentage': taxPercentage,
    'tax_amount_piasters': taxAmountPiasters,
    'total_price_piasters': totalPricePiasters,
    'formatted': formatted?.toJson(),
  };
}

class Formatted {
  String? basePrice;
  String? taxAmount;
  String? totalPrice;

  Formatted.fromJson(Map<String, dynamic> json) {
    basePrice = json['base_price'];
    taxAmount = json['tax_amount'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() =>
      {'base_price': basePrice, 'tax_amount': taxAmount, 'total_price': totalPrice};
}

/// API pagination links (first / last / prev / next)
class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() =>
      {'first': first, 'last': last, 'prev': prev, 'next': next};
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<PaginationLink>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <PaginationLink>[];
      json['links'].forEach((v) {
        links!.add(PaginationLink.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() => {
    'current_page': currentPage,
    'from': from,
    'last_page': lastPage,
    'links': links?.map((v) => v.toJson()).toList(),
    'path': path,
    'per_page': perPage,
    'to': to,
    'total': total,
  };
}

/// Pagination link inside Meta
class PaginationLink {
  String? url;
  String? label;
  int? page;
  bool? active;

  PaginationLink.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    page = json['page'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() =>
      {'url': url, 'label': label, 'page': page, 'active': active};
}
