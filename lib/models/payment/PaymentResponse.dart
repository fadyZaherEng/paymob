// ignore_for_file: prefer_collection_literals

class PaymentResponse {
    String? token;

    PaymentResponse({this.token});

    factory PaymentResponse.fromJson(Map<String, dynamic> json) {
        return PaymentResponse(
            token: json['token'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data =  Map<String, dynamic>();
        data['token'] = token;
        return data;
    }
}