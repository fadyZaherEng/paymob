// ignore_for_file: non_constant_identifier_names, prefer_collection_literals

class Data {
    String? agg_terminal;
    String? amount;
    int? bill_reference;
    String? biller;
    int? due_amount;
    int? gateway_integration_pk;
    String? klass;
    String? message;
    String? ref;
    String? rrn;
    String? txn_response_code;

    Data({this.agg_terminal, this.amount, this.bill_reference, this.biller, this.due_amount, this.gateway_integration_pk, this.klass, this.message, this.ref, this.rrn, this.txn_response_code});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            agg_terminal: json['agg_terminal'], 
            amount: json['amount'], 
            bill_reference: json['bill_reference'], 
            biller: json['biller'], 
            due_amount: json['due_amount'], 
            gateway_integration_pk: json['gateway_integration_pk'],
            klass: json['klass'], 
            message: json['message'], 
            ref: json['ref'], 
            rrn: json['rrn'], 
            txn_response_code: json['txn_response_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data =  Map<String, dynamic>();
        data['agg_terminal'] = agg_terminal;
        data['amount'] = amount;
        data['bill_reference'] = bill_reference;
        data['biller'] = biller;
        data['due_amount'] = due_amount;
        data['gateway_integration_pk'] = gateway_integration_pk;
        data['klass'] = klass;
        data['message'] = message;
        data['ref'] = ref;
        data['rrn'] = rrn;
        data['txn_response_code'] = txn_response_code;
        return data;
    }
}