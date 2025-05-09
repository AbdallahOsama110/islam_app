class ZekrModel{
  int? id;
	String? count;
	String? zekr;
	String? reference;
	String? category;

	ZekrModel({
		this.id, 
		this.count, 
		this.zekr, 
		this.reference, 
		this.category, 
	});

  ZekrModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    count = json['count'];
    zekr = json['zekr'];
    reference = json['reference'];
    category = json['category'];
  }

	Map<String, dynamic> toJson() => {
				'Id': id,
				'count': count,
				'zekr': zekr,
				'reference': reference,
				'category': category,
			};
}