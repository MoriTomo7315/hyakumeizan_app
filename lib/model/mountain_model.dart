// This class is for importing List from JSON model
class HyakumeizanList {
  final List<Mountain> hyakumeizans;
  
  HyakumeizanList({this.hyakumeizans});

  factory HyakumeizanList.fromJson(List parsedJson) {

    List<Mountain> hyakumeizans = new List<Mountain>();
    hyakumeizans = parsedJson.map((i)=>Mountain.fromJson(i)).toList();
    return new HyakumeizanList (
      hyakumeizans: hyakumeizans,
    );
  }
}


class Mountain {
  int id;
  String name;
  String yomi;
  String nameEn;
  String elevation;
  double latitude;
  double lontitude;
  String detail;
  String area;


  Mountain({this.id,
            this.name, 
            this.yomi,
            this.nameEn, 
            this.elevation, 
            this.latitude,
            this.lontitude,
            this.detail,
            this.area
  });

  factory Mountain.fromJson(Map<String, dynamic> json){
    return Mountain(
      id: json['id'],
      name: json['name'],
      yomi: json['yomi'],
      nameEn: json['name_en'],
      elevation: json['elevation'],
      latitude: json['lat'],
      lontitude: json['lon'],
      detail: json['detail'],
      area: json['area'],
    );
  }
  
  // Convert a Mountain into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'yomi': yomi,
    'nameEn': nameEn,
    'elevation': elevation,
    'latitude': latitude,
    'lontitude': lontitude,
    'detail': detail,
    'area': area,
  };

  // Convert a Mountain into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'yomi': yomi,
      'nameEn': nameEn,
      'elevation': elevation,
      'latitude': latitude,
      'lontitude': lontitude,
      'detail': detail,
      'area': area,
    };
  }

  Mountain.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    yomi = map['yomi'];
    nameEn = map['nameEn'];
    elevation = map['elevation'];
    latitude = map['latitude'];
    lontitude = map['lontitude'];
    detail = map['detail'];
    area = map['area'];
  }
}