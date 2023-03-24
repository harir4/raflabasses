import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

class Screenone extends StatefulWidget {
  const Screenone({super.key});

  @override
  State<Screenone> createState() => _ScreenoneState();
}

class _ScreenoneState extends State<Screenone> {
  List<dynamic> data = [];

  Future get() async {
    final response =
        await http.get(Uri.parse('https://api.publicapis.org/entries'));
    final responseData = json.decode(response.body);
    setState(() {
      data = responseData['entries'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.blue.shade200)),
            onPressed: get,
            child: Text('Fetch Data'),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(data[index]['API']),
                    subtitle: Text(data[index]['Description']),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
