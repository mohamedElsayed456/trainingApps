class ShopLoginModel{
   bool? status;
  String? message;
  userData? data;

  ShopLoginModel.fromJson(Map<String,dynamic>json)
  {
     status=json['status'];
     message=json['message'];
     data=json['data'] != null? userData.fromJson(json['data']):null;
  }
}

class userData{
  int? id;
  String? email;
  String? name;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  // userData(
  //   this.id,
  //   this.email,
  //   this.name,
  //   this.phone,
  //   this.image,
  //   this.points,
  //   this.credit,
  //   this.token,
  // );

  //named constructor
  userData.fromJson(Map<String,dynamic>json)
  {
     id=json['id'];
     email=json['email'];
     name=json['name'];
     phone=json['phone'];
     image=json['image'];
     points=json['points'];
     credit=json['credit'];
     token=json['token'];
  }
}