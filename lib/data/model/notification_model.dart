class NotificationModel {
  String? notificationId;//
  String? notificationUserId;//
  String? notificationTitle;
  String? notificationBody;
  String? notificationDateTime;


  NotificationModel({
        this.notificationId,
        this.notificationUserId,
        this.notificationTitle,
        this.notificationBody,
        this.notificationDateTime,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'].toString();
    notificationUserId = json['notification_user_id'].toString();
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationDateTime = json['notification_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_user_id'] = this.notificationUserId;
    data['notification_title'] = this.notificationTitle;
    data['notification_body'] = this.notificationBody;
    data['notification_datetime'] = this.notificationDateTime;
    return data;
  }
}