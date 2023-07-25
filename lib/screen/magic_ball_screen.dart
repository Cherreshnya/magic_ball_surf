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
      backgroundColor: Colors.indigo.shade900,
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Container(
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.indigo.shade700),
                ),
                onPressed: () {
                  FutureBuilder<dynamic>(
                    future: answer,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(child: Text("${answer}"));
                      } else if (snapshot.hasError) {
                        return const Text('Error');
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  );
                },
                child: null),
          ),
        ),
      ),
    );
  }

// Scaffold _openAnswer() {
//   return Scaffold(
//       body:
//
//   );
// }
}
