import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../service/api.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
 late Future<dynamic> answer;

  @override
  void initState() {
    super.initState();
    answer = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img.png"),
              ),
            ),
            height: 400,
            width: 400,
          ),
          onTap: () {
            FutureBuilder<dynamic>(
              future: answer,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "${answer}",
                  );
                } else if (snapshot.hasError) {
                  return const Text('Error');
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
        Text(
          "Нажмите на шар",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
