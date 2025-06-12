class NotificationModel {
  final String firstName;
  final String lastName;
  final String email;
  final int transactionId;
  final int transactionPrice;

  NotificationModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.transactionId,
      required this.transactionPrice});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        email: json['email'] as String,
        transactionId: json['transactionId'] as int,
        transactionPrice: json['transactionPrice'] as int
    );
  }
}
