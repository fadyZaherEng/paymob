class AuthResponse {
    String token;

    AuthResponse({required this.token});

    factory AuthResponse.fromJson(Map<String, dynamic> json) {
        return AuthResponse(
            token: json['token'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['token'] = this.token;
        return data;
    }
}