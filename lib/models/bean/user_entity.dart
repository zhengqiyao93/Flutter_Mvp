class UserEntity {
	var appId;
	var redisKey;
	var userId;
	var token;

	UserEntity({this.appId, this.redisKey, this.userId, this.token});

	UserEntity.fromJson(Map<String, dynamic> json) {
		appId = json['appId'];
		redisKey = json['redisKey'];
		userId = json['userId'];
		token = json['token'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['appId'] = this.appId;
		data['redisKey'] = this.redisKey;
		data['userId'] = this.userId;
		data['token'] = this.token;
		return data;
	}
}
