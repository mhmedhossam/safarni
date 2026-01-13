String formatTime(String? dateTime) {
  if (dateTime == null || dateTime.isEmpty) return "--:--";
  try {
    return dateTime.substring(11, 16);
  } catch (e) {
    return dateTime;
  }
}