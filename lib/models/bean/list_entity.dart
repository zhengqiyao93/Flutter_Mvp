

import 'package:flutter_app/models/entity_factory.dart';

class ListEntity {
	int count;
	List list;


	ListEntity.fromJson(Map<String, dynamic> json) {
		count = json['count'];

		list = json['list'];
	}

	/// 获取results数组
	List<T> getList<T>() {
		var newList = new List<T>();
		if (list != null) {
			list.forEach((v) { //拼装List
				newList.add(EntityFactory.generateOBJ<T>(v));//使用EntityFactory解析对象
			});
		}
		return newList;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = this.count;
		if (this.list != null) {
      data['list'] =  this.list;
    }
		return data;
	}
}
