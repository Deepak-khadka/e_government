class Weather {

  final DateTime data;
  final String name;
  final double temp;
  final String main;
  final String icon;

  Weather({ this.data , this.name , this.temp, this.main , this.icon });

  factory Weather.fromJson(Map<String, dynamic> json ){
     return Weather(
       data: new DateTime.fromMicrosecondsSinceEpoch(json['dt'] * 1000,
        isUtc: false),
       name: json['name'],
       temp: json['main']['temp'].toDouble(),
       main: json['weather'][0]['main'],
       icon: json['weather'][0]['icon']
     );
  }
}