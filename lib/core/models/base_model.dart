class BaseModel<T> {
  final T? data;
  final String? message;
  final bool? success;

  BaseModel({this.data, this.message, this.success});

  factory BaseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?)? fromJsonT,
  ) {
    return BaseModel(
      success: json["success"] as bool,
      message: json["message"] as String,
      data: json["data"] != null && fromJsonT != null
          ? fromJsonT(json["data"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {"data": data, "message": message, "success": success};
  }
}
