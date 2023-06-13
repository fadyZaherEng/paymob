class Merchant {
  dynamic city;
  List<dynamic>? company_emails;
  dynamic company_name;
  dynamic country;
  dynamic created_at;
  dynamic id;
  List<dynamic>? phones;
  dynamic postal_code;
  dynamic state;
  dynamic street;

  Merchant(
      {this.city,
      this.company_emails,
      this.company_name,
      this.country,
      this.created_at,
      this.id,
      this.phones,
      this.postal_code,
      this.state,
      this.street});

  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      city: json['city'],
      company_emails: json['company_emails'] != null
          ? new List<String>.from(json['company_emails'])
          : null,
      company_name: json['company_name'],
      country: json['country'],
      created_at: json['created_at'],
      id: json['id'],
      phones:
          json['phones'] != null ? new List<String>.from(json['phones']) : null,
      postal_code: json['postal_code'],
      state: json['state'],
      street: json['street'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['company_name'] = this.company_name;
    data['country'] = this.country;
    data['created_at'] = this.created_at;
    data['id'] = this.id;
    data['postal_code'] = this.postal_code;
    data['state'] = this.state;
    data['street'] = this.street;
    if (this.company_emails != null) {
      data['company_emails'] = this.company_emails;
    }
    if (this.phones != null) {
      data['phones'] = this.phones;
    }
    return data;
  }
}
