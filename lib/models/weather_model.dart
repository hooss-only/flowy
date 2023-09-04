class WeatherModel {
	final String main, description;
	final double temp, feels_like;
	final int humidity;

	WeatherModel.fromJson(Map<String, dynamic> json)
			: main = json['weather']['main'],
				description = json['weather']['description'],
				temp = json['main']['temp'],
				feels_like = json['main']['feels_like'],
				humidity = json['main']['humidity'];
}
