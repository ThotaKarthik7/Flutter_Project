import 'dart:convert';
import 'dart:io';
import 'dart:async'; // ✅ Required for TimeoutException

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("HTTP Exception Handling")),
        body: const Center(child: DataFetcher()),
      ),
    );
  }
}

class DataFetcher extends StatefulWidget {
  const DataFetcher({super.key});
  @override
  State<DataFetcher> createState() => _DataFetcherState();
}

class _DataFetcherState extends State<DataFetcher> {
  String message = "Press the button to fetch data.";

  Future<void> fetchData() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");

    try {
      final response = await http.get(url).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          message = "Title: ${data['title']}";
        });
      } else if (response.statusCode == 404) {
        setState(() {
          message = "Error 404: Resource not found.";
        });
      } else {
        setState(() {
          message = "Unexpected error: ${response.statusCode}";
        });
      }
    } on SocketException {
      setState(() {
        message = "No Internet connection.";
      });
    } on HttpException {
      setState(() {
        message = "HTTP error occurred.";
      });
    } on FormatException {
      setState(() {
        message = "Bad response format.";
      });
    } on TimeoutException {
      setState(() {
        message = "Request timed out.";
      });
    } catch (e) {
      setState(() {
        message = "Unexpected error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message, textAlign: TextAlign.center),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: fetchData,
          child: const Text("Fetch Data"),
        ),
      ],
    );
  }
}

