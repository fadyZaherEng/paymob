// ignore_for_file: non_constant_identifier_names, prefer_collection_literals

class PaymentKeyClaims {
    int? amount_cents;
    String? currency;
    int? integration_id;
    int? order;
    int? user_id;

    PaymentKeyClaims({this.amount_cents, this.currency, this.integration_id, this.order, this.user_id});

    factory PaymentKeyClaims.fromJson(Map<String, dynamic> json) {
        return PaymentKeyClaims(
            amount_cents: json['amount_cents'], 
            currency: json['currency'], 
            integration_id: json['integration_id'], 
            order: json['order'], 
            user_id: json['user_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data =  Map<String, dynamic>();
        data['amount_cents'] = amount_cents;
        data['currency'] = currency;
        data['integration_id'] = integration_id;
        data['order'] = order;
        data['user_id'] = user_id;
        return data;
    }
}