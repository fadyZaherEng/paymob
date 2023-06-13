// ignore_for_file: non_constant_identifier_names

import 'package:paymob_visa_ref_code/models/order/Merchant.dart';
import 'package:paymob_visa_ref_code/models/order/ShippingData.dart';

class OrderResponse {
  dynamic amount_cents;
  dynamic collector;
  dynamic created_at;
  dynamic currency;
  dynamic delivery_needed;
  dynamic id;
  dynamic is_payment_locked;
  Merchant? merchant;
  dynamic merchant_order_id;
  dynamic paid_amount_cents;
  ShippingData? shipping_data;
  dynamic wallet_notification;

  OrderResponse(
      {this.amount_cents,
      this.collector,
      this.created_at,
      this.currency,
      this.delivery_needed,
      this.id,
      this.is_payment_locked,
      this.merchant,
      this.merchant_order_id,
      this.paid_amount_cents,
      this.shipping_data,
      this.wallet_notification});

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      amount_cents: json['amount_cents'],
      collector: json['collector'],
      created_at: json['created_at'],
      currency: json['currency'],
      delivery_needed: json['delivery_needed'],
      id: json['id'],
      is_payment_locked: json['is_payment_locked'],
      merchant:
          json['merchant'] != null ? Merchant.fromJson(json['merchant']) : null,
      merchant_order_id: json['merchant_order_id'],
      paid_amount_cents: json['paid_amount_cents'],
      shipping_data: json['shipping_data'] != null
          ? ShippingData.fromJson(json['shipping_data'])
          : null,
      wallet_notification: json['wallet_notification'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount_cents'] = amount_cents;
    data['collector'] = collector;
    data['created_at'] = created_at;
    data['currency'] = currency;
    data['delivery_needed'] = delivery_needed;
    data['id'] = id;
    data['is_payment_locked'] = is_payment_locked;
    data['merchant_order_id'] = merchant_order_id;
    data['paid_amount_cents'] = paid_amount_cents;
    data['wallet_notification'] = wallet_notification;
    if (merchant != null) {
      data['merchant'] = merchant!.toJson();
    }
    if (shipping_data != null) {
      data['shipping_data'] = shipping_data!.toJson();
    }
    return data;
  }
}
