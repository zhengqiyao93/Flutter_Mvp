

import 'package:flutter_app/common/base/base_entity.dart';

class CarEntity extends BaseEntity {
	var auctionStartTime;
	var transferFlag;
	var address;
	var beginRegisterDate;
	var carAutoNo;
	var reportColligationRanks;
	var mainPhoto;
	var startingPrice;
	var vehicleAttributionCity;
	var auctionId;
	var reportServicingRanks;
	var isFollow; // 2未关注 1已关注
	var environment;
	var autoInfoName;
	var isEntrust;
	var id;
	var auctionEndTime;
	var mileage;
	var status;

	CarEntity({this.auctionStartTime, this.transferFlag, this.address, this.beginRegisterDate, this.carAutoNo, this.reportColligationRanks, this.mainPhoto, this.startingPrice, this.vehicleAttributionCity, this.auctionId, this.reportServicingRanks, this.isFollow, this.environment, this.autoInfoName, this.isEntrust, this.id, this.auctionEndTime, this.mileage, this.status});

	CarEntity.fromJson(Map<String, dynamic> json) {
		auctionStartTime = json['auctionStartTime'];
		transferFlag = json['transferFlag'];
		address = json['address'];
		beginRegisterDate = json['beginRegisterDate'];
		carAutoNo = json['carAutoNo'];
		reportColligationRanks = json['reportColligationRanks'];
		mainPhoto = json['mainPhoto'];
		startingPrice = json['startingPrice'];
		vehicleAttributionCity = json['vehicleAttributionCity'];
		auctionId = json['auctionId'];
		reportServicingRanks = json['reportServicingRanks'];
		isFollow = json['isFollow'];
		environment = json['environment'];
		autoInfoName = json['autoInfoName'];
		isEntrust = json['isEntrust'];
		id = json['id'];
		auctionEndTime = json['auctionEndTime'];
		mileage = json['mileage'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['auctionStartTime'] = this.auctionStartTime;
		data['transferFlag'] = this.transferFlag;
		data['address'] = this.address;
		data['beginRegisterDate'] = this.beginRegisterDate;
		data['carAutoNo'] = this.carAutoNo;
		data['reportColligationRanks'] = this.reportColligationRanks;
		data['mainPhoto'] = this.mainPhoto;
		data['startingPrice'] = this.startingPrice;
		data['vehicleAttributionCity'] = this.vehicleAttributionCity;
		data['auctionId'] = this.auctionId;
		data['reportServicingRanks'] = this.reportServicingRanks;
		data['isFollow'] = this.isFollow;
		data['environment'] = this.environment;
		data['autoInfoName'] = this.autoInfoName;
		data['isEntrust'] = this.isEntrust;
		data['id'] = this.id;
		data['auctionEndTime'] = this.auctionEndTime;
		data['mileage'] = this.mileage;
		data['status'] = this.status;
		return data;
	}
}
