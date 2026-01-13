class MainEndpoint {
  static const baseUrl =
      "https://round8-backend-safarni-one.huma-volve.com/api";
  //https://round8-backend-safarni-one.huma-volve.com/api
  static const String register = "/auth/register";
  static const String login = "/auth/login";
  static const String verfiy = "/auth/verify";
  static const String forgotPassword = "/auth/forgot-password";
  static const String user = "/user";

  //hotels
  static const String hotelsRecommendations = "/hotels/recommendations";
  static const String hotelsRooms = "/hotels/";

  ///hotels/search?city=Cairo&guests=4
  static const String hotelsNearby = "/hotels/nearby";
  static const String hotelsSearch = "/hotels/search?";
  //home ---

  static const String home = "/home";
  static const String searchFlight = "/flights";
  static String getSeats(String flightId) => "flights/$flightId/seats";
}
