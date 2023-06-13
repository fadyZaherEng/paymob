class ShippingData {
    dynamic apartment;
    dynamic building;
    dynamic city;
    dynamic country;
    dynamic email;
    dynamic extra_description;
    dynamic first_name;
    dynamic floor;
    dynamic id;
    dynamic last_name;
    dynamic order;
    dynamic order_id;
    dynamic phone_number;
    dynamic postal_code;
    dynamic shipping_method;
    dynamic state;
    dynamic street;

    ShippingData({this.apartment, this.building, this.city, this.country, this.email, this.extra_description, this.first_name, this.floor, this.id, this.last_name, this.order, this.order_id, this.phone_number, this.postal_code, this.shipping_method, this.state, this.street});

    factory ShippingData.fromJson(Map<String, dynamic> json) {
        return ShippingData(
            apartment: json['apartment'], 
            building: json['building'], 
            city: json['city'], 
            country: json['country'], 
            email: json['email'], 
            extra_description: json['extra_description'], 
            first_name: json['first_name'], 
            floor: json['floor'], 
            id: json['id'], 
            last_name: json['last_name'], 
            order: json['order'], 
            order_id: json['order_id'], 
            phone_number: json['phone_number'], 
            postal_code: json['postal_code'], 
            shipping_method: json['shipping_method'], 
            state: json['state'], 
            street: json['street'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['apartment'] = this.apartment;
        data['building'] = this.building;
        data['city'] = this.city;
        data['country'] = this.country;
        data['email'] = this.email;
        data['extra_description'] = this.extra_description;
        data['first_name'] = this.first_name;
        data['floor'] = this.floor;
        data['id'] = this.id;
        data['last_name'] = this.last_name;
        data['order'] = this.order;
        data['order_id'] = this.order_id;
        data['phone_number'] = this.phone_number;
        data['postal_code'] = this.postal_code;
        data['shipping_method'] = this.shipping_method;
        data['state'] = this.state;
        data['street'] = this.street;
        return data;
    }
}