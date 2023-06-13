// ignore_for_file: non_constant_identifier_names, prefer_collection_literals

import 'package:paymob_visa_ref_code/models/kiosk/Data.dart';
import 'package:paymob_visa_ref_code/models/kiosk/PaymentKeyClaims.dart';
import 'package:paymob_visa_ref_code/models/kiosk/SourceData.dart';

class KioskResponse {
  Data? data;
  int? amount_cents;
  String? api_source;
  int? captured_amount;
  String? created_at;
  String? currency;
  String? error_occured;
  String? has_parent_transaction;
  int? id;
  int? integration_id;
  String? is_3d_secure;
  String? is_auth;
  String? is_capture;
  String? is_captured;
  String? is_hidden;
  String? is_live;
  String? is_refund;
  String? is_refunded;
  String? is_standalone_payment;
  String? is_void;
  String? is_voided;
  String? merchant_staff_tag;
  int? order;
  String? other_endpoint_reference;
  int? owner;
  PaymentKeyClaims? payment_key_claims;
  String? pending;
  int? profile_id;
  int? refunded_amount_cents;
  SourceData? source_data;
  String? success;

  KioskResponse(
      {this.data,
      this.amount_cents,
      this.api_source,
      this.captured_amount,
      this.created_at,
      this.currency,
      this.error_occured,
      this.has_parent_transaction,
      this.id,
      this.integration_id,
      this.is_3d_secure,
      this.is_auth,
      this.is_capture,
      this.is_captured,
      this.is_hidden,
      this.is_live,
      this.is_refund,
      this.is_refunded,
      this.is_standalone_payment,
      this.is_void,
      this.is_voided,
      this.merchant_staff_tag,
      this.order,
      this.other_endpoint_reference,
      this.owner,
      this.payment_key_claims,
      this.pending,
      this.profile_id,
      this.refunded_amount_cents,
      this.source_data,
      this.success});

  factory KioskResponse.fromJson(Map<String, dynamic> json) {
    return KioskResponse(
      data: json['`data`'] != null ? Data.fromJson(json['`data`']) : null,
      amount_cents: json['amount_cents'],
      api_source: json['api_source'],
      captured_amount: json['captured_amount'],
      created_at: json['created_at'],
      currency: json['currency'],
      error_occured: json['error_occured'],
      has_parent_transaction: json['has_parent_transaction'],
      id: json['id'],
      integration_id: json['integration_id'],
      is_3d_secure: json['is_3d_secure'],
      is_auth: json['is_auth'],
      is_capture: json['is_capture'],
      is_captured: json['is_captured'],
      is_hidden: json['is_hidden'],
      is_live: json['is_live'],
      is_refund: json['is_refund'],
      is_refunded: json['is_refunded'],
      is_standalone_payment: json['is_standalone_payment'],
      is_void: json['is_void'],
      is_voided: json['is_voided'],
      merchant_staff_tag: json['merchant_staff_tag'],
      order: json['order'],
      other_endpoint_reference: json['other_endpoint_reference'],
      owner: json['owner'],
      payment_key_claims: json['payment_key_claims'] != null
          ? PaymentKeyClaims.fromJson(json['payment_key_claims'])
          : null,
      pending: json['pending'],
      profile_id: json['profile_id'],
      refunded_amount_cents: json['refunded_amount_cents'],
      source_data: json['source_data'] != null
          ? SourceData.fromJson(json['source_data'])
          : null,
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount_cents'] = amount_cents;
    data['api_source'] = api_source;
    data['captured_amount'] = captured_amount;
    data['created_at'] = created_at;
    data['currency'] = currency;
    data['error_occured'] = error_occured;
    data['has_parent_transaction'] = has_parent_transaction;
    data['id'] = id;
    data['integration_id'] = integration_id;
    data['is_3d_secure'] = is_3d_secure;
    data['is_auth'] = is_auth;
    data['is_capture'] = is_capture;
    data['is_captured'] = is_captured;
    data['is_hidden'] = is_hidden;
    data['is_live'] = is_live;
    data['is_refund'] = is_refund;
    data['is_refunded'] = is_refunded;
    data['is_standalone_payment'] = is_standalone_payment;
    data['is_void'] = is_void;
    data['is_voided'] = is_voided;
    data['merchant_staff_tag'] = merchant_staff_tag;
    data['order'] = order;
    data['other_endpoint_reference'] = other_endpoint_reference;
    data['owner'] = owner;
    data['pending'] = pending;
    data['profile_id'] = profile_id;
    data['refunded_amount_cents'] = refunded_amount_cents;
    data['success'] = success;
    if (data != null) {
      data['`data`'] = this.data!.toJson();
    }
    if (payment_key_claims != null) {
      data['payment_key_claims'] = payment_key_claims!.toJson();
    }
    if (source_data != null) {
      data['source_data'] = source_data!.toJson();
    }
    return data;
  }
}
