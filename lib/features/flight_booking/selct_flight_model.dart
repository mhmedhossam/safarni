class FlightModel {
  final String depTime, arrTime, depCode, arrCode, duration, airline, price;
  final String? layover;

  FlightModel({
    required this.depTime,
    required this.arrTime,
    required this.depCode,
    required this.arrCode,
    required this.duration,
    required this.airline,
    required this.price,
    this.layover,
  });
}
