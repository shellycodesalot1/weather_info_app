import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WeatherHomeScreen extends StatefulWidget {
  @override
  _WeatherHomeScreenState createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = "";
  String _temperature = "--";
  String _condition = "--";

  void _fetchWeatherData() {
    setState(() {
      _cityName = _cityController.text;
      _temperature = (Random().nextInt(16) + 15).toString(); // Random temperature between 15 and 30
      _condition = _getRandomCondition(); // Get random weather condition
    });
  }

  String _getRandomCondition() {
    List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
    return conditions[Random().nextInt(conditions.length)];
  }

  List<Color> _getGradientColors() {
    switch (_condition) {
      case 'Sunny':
        return [Colors.orange, Colors.yellow];
      case 'Cloudy':
        return [Colors.grey[600]!, Colors.grey[400]!];
      case 'Rainy':
        return [Colors.blueGrey[800]!, Colors.blueGrey[400]!];
      default:
        return [Colors.white, Colors.white];
    }
  }

  String _getWeatherEmoji() {
    switch (_condition) {
      case 'Sunny':
        return '☀️';
      case 'Cloudy':
        return '☁️';
      case 'Rainy':
        return '🌧️';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _getGradientColors(),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Weather Forecast',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      hintText: 'Enter City Name',
                      contentPadding: EdgeInsets.all(15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  ),
                  onPressed: _fetchWeatherData,
                  child: Text('Fetch Weather'),
                ),
                SizedBox(height: 30),
                Text(
                  'City: $_cityName',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Temperature: $_temperature°C',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Condition: $_condition ${_getWeatherEmoji()}',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
