class OrderModel {
  String? orderId;
  String? orderUserId;
  String? orderAddress;
  String? orderType;
  String? orderPaymentMethod;
  String? orderStatus;
  String? orderPrice;
  String? orderTotalPrice;
  String? orderDeliveryPrice;
  String? orderCoupon;
  String? orderRating;
  String? orderRatingFeedback;
  String? orderDatetime;
  String? addressId;
  String? addressUserId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrderModel(
      {this.orderId,
        this.orderUserId,
        this.orderAddress,
        this.orderType,
        this.orderPaymentMethod,
        this.orderStatus,
        this.orderPrice,
        this.orderTotalPrice,
        this.orderDeliveryPrice,
        this.orderCoupon,
        this.orderRating,
        this.orderRatingFeedback,
        this.orderDatetime,
        this.addressId,
        this.addressUserId,
        this.addressName,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.addressLong});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'].toString();
    orderUserId = json['order_user_id'].toString();
    orderAddress = json['order_address'].toString();
    orderType = json['order_type'].toString();
    orderPaymentMethod = json['order_payment_method'].toString();
    orderStatus = json['order_status'].toString();
    orderPrice = json['order_price'].toString();
    orderTotalPrice = json['order_total_price'].toString();
    orderDeliveryPrice = json['order_delivery_price'].toString();
    orderCoupon = json['order_coupon'].toString();
    orderRating = json['order_rating'].toString();
    orderRatingFeedback = json['order_rating_feedback'].toString();
    orderDatetime = json['order_datetime'].toString();
    addressId = json['address_id'].toString();
    addressUserId = json['address_user_id'].toString();
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'].toString();
    addressLong = json['address_long'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_user_id'] = this.orderUserId;
    data['order_address'] = this.orderAddress;
    data['order_type'] = this.orderType;
    data['order_payment_method'] = this.orderPaymentMethod;
    data['order_status'] = this.orderStatus;
    data['order_price'] = this.orderPrice;
    data['order_total_price'] = this.orderTotalPrice;
    data['order_delivery_price'] = this.orderDeliveryPrice;
    data['order_coupon'] = this.orderCoupon;
    data['order_rating'] = this.orderRating;
    data['order_rating_feedback'] = this.orderRatingFeedback;
    data['order_datetime'] = this.orderDatetime;
    data['address_id'] = this.addressId;
    data['address_user_id'] = this.addressUserId;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}

/*
class OrderModel {
  String? orderId;
  String? orderUserId;
  String? orderAddress;
  String? orderType;
  String? orderPaymentMethod;
  String? orderStatus;
  String? orderPrice;
  String? orderTotalPrice;
  String? orderDeliveryPrice;
  String? orderCoupon;
  String? orderDatetime;

  OrderModel(
      {this.orderId,
        this.orderUserId,
        this.orderAddress,
        this.orderType,
        this.orderPaymentMethod,
        this.orderStatus,
        this.orderPrice,
        this.orderTotalPrice,
        this.orderDeliveryPrice,
        this.orderCoupon,
        this.orderDatetime});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'].toString();
    orderUserId = json['order_user_id'].toString();
    orderAddress = json['order_address'].toString();
    orderType = json['order_type'].toString();
    orderPaymentMethod = json['order_payment_method'].toString();
    orderStatus = json['order_status'].toString();
    orderPrice = json['order_price'].toString();
    orderTotalPrice = json['order_total_price'].toString();
    orderDeliveryPrice = json['order_delivery_price'].toString();
    orderCoupon = json['order_coupon'].toString();
    orderDatetime = json['order_datetime'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_user_id'] = this.orderUserId;
    data['order_address'] = this.orderAddress;
    data['order_type'] = this.orderType;
    data['order_payment_method'] = this.orderPaymentMethod;
    data['order_status'] = this.orderStatus;
    data['order_price'] = this.orderPrice;
    data['order_total_price'] = this.orderTotalPrice;
    data['order_delivery_price'] = this.orderDeliveryPrice;
    data['order_coupon'] = this.orderCoupon;
    data['order_datetime'] = this.orderDatetime;
    return data;
  }
}

 */