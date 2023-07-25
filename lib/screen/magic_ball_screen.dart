import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../service/api.dart';


class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body:Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Container(
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.indigo.shade700),),
                onPressed: () {loadData();
                },
                child: null
            ),
          ),
        ),
      ),
    );

  }
}


