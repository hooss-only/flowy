class WeatherModel {
	final String main, description;
	final double temp, feels_like;
	final int humidity;

	WeatherModel.fromJson(Map<String, dynamic> json)
			: main = json['weather'][0]['main'],
				description = json['weather'][0]['description'],
				temp = json['main']['temp'],
				feels_like = json['main']['feels_like'],
				humidity = json['main']['humidity'];
}
