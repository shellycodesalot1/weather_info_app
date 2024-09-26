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
              onPressed: () {
                setState(() {
                  _cityName = _cityController.text;
                });
                // Here you can simulate or fetch weather data
              },
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 30),
            // Placeholder for displaying weather data
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
