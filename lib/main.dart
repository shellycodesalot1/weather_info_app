import 'dart:math'; // For random number generation
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomeScreen(),
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

  // Function to simulate fetching weather data
  void _fetchWeatherData() {
    setState(() {
      _cityName = _cityController.text;
      _temperature = (Random().nextInt(16) + 15).toString(); // Random temperature between 15 and 30
      _condition = _getRandomCondition(); // Get random weather condition
    });
  }

  // Helper function to randomly select a weather condition
  String _getRandomCondition() {
    List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
    return conditions[Random().nextInt(conditions.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField for City Input
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter City Name',
              ),
            ),
            SizedBox(height: 20),
            // Fetch Weather Button
            ElevatedButton(
              onPressed: _fetchWeatherData, // Calls the function to simulate weather fetching
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 30),
            // Display simulated weather data
            Text(
              'City: $_cityName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Temperature: $_temperature°C',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Condition: $_condition',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
