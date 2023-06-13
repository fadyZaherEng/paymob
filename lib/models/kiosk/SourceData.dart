class SourceData {
    String? pan;
    String? sub_type;
    String? type;

    SourceData({this.pan, this.sub_type, this.type});

    factory SourceData.fromJson(Map<String, dynamic> json) {
        return SourceData(
            pan: json['pan'], 
            sub_type: json['sub_type'], 
            type: json['type'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data =  Map<String, dynamic>();
        data['pan'] = pan;
        data['sub_type'] = sub_type;
        data['type'] = type;
        return data;
    }
}