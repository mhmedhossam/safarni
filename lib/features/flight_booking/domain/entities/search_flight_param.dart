import 'package:intl/intl.dart';

class SearchFlightParam {
  final String origin;
  final String destination;
  final String date;


  SearchFlightParam({
    required this.origin,
    required this.destination,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    'origin': origin,
    'destination': destination,
    'date': date,
  };
}