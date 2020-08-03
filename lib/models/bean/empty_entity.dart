class EmptyEntity {
	var autoId;

	EmptyEntity({this.autoId});

	EmptyEntity.fromJson(Map<String, dynamic> json) {
		autoId = json['autoId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['autoId'] = this.autoId;
		return data;
	}
}
