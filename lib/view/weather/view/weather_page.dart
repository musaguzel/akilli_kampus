import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Map<String, dynamic>? weatherData;

  Future<void> fetchWeatherData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=39.48002&lon=29.89940&appid=01a04021fdedb87363853077209729f2'));

    if (response.statusCode == 200) {
      setState(() {
        weatherData = json.decode(response.body);
      });
    } else {
      throw Exception('Hava durumu verileri yüklenirken hata oluştu');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: weatherData == null
            ? const CircularProgressIndicator()
            : WeatherInfo(weatherData: weatherData!),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherInfo({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String weatherMain = weatherData['weather'][0]['main'];

    IconData weatherIcon = _getWeatherIcon(weatherMain);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          weatherIcon,
          size: 50,
          color: Colors.blue,
        ),
        const SizedBox(height: 10),
        Text(
          'Şehir: ${weatherData['name']}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          'Hava Durumu: ${_translateWeatherDescription(weatherData['weather'][0]['main'])}',
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 10),
        Text(
          'Sıcaklık: ${((weatherData['main']['temp'] - 273.15).toInt()).toString()} °C',
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }

  IconData _getWeatherIcon(String weatherMain) {
    switch (weatherMain) {
      case 'Thunderstorm':
        return Icons.storm;
      case 'Drizzle':
        return Icons.shower;
      case 'Rain':
        return Icons.grain;
      case 'Snow':
        return Icons.ac_unit;
      case 'Mist':
      case 'Smoke':
      case 'Haze':
      case 'Dust':
      case 'Fog':
      case 'Sand':
      case 'Ash':
        return Icons.cloud;
      case 'Squall':
        return Icons.storm;
      case 'Tornado':
        return Icons.warning;
      case 'Clear':
        return Icons.wb_sunny;
      case 'Clouds':
        return Icons.cloud;
      default:
        return Icons.cloud; // Varsayılan olarak bulut ikonu
    }
  }

  String _translateWeatherDescription(String englishDescription) {
    switch (englishDescription) {
      case 'Thunderstorm':
        return 'Fırtına';
      case 'Drizzle':
        return 'Çisenti';
      case 'Rain':
        return 'Yağmurlu';
      case 'Snow':
        return 'Karlı';
      case 'Mist':
        return 'Sisli';
      case 'Smoke':
        return 'Dumanlı';
      case 'Haze':
        return 'Hafif Sis';
      case 'Dust':
        return 'Tozlu';
      case 'Fog':
        return 'Yoğun Sis';
      case 'Sand':
        return 'Kum Fırtınası';
      case 'Ash':
        return 'Kül Fırtınası';
      case 'Squall':
        return 'Fırtına';
      case 'Tornado':
        return 'Tornado';
      case 'Clear':
        return 'Açık';
      case 'Clouds':
        return 'Bulutlu';
      default:
        return englishDescription;
    }
  }
}