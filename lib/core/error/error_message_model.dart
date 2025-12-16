import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String? statusMessage;
  final int? statusCode;
  final bool? success;

  const ErrorMessageModel({this.statusMessage, this.statusCode, this.success});
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusMessage: json['status_code'],
      statusCode: json["status_message"],
      success: json['success'],
    );
  }
  @override
  List<Object?> get props => [statusMessage, statusCode, success];
}
