import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../service/api.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap: () {
            setState(() {
              getData();
            });
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img.png"),
              ),
            ),
            height: 400,
            width: 400,
            child: FutureBuilder<String>(
              future: getData(), // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        ' ${snapshot.data}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ];
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('${snapshot.error}'),
                    ),
                  ];
                } else {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  ),
                );
              },
            ),
          ),
        ),
        Text(
          "Нажмите на шар",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  late Future<String> answer;

  @override
  void initState() {
    super.initState();
    answer = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: FutureBuilder<String>(
        future: answer, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  ' ${snapshot.data}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),

      //Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //   InkWell(
      //     child: Container(
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage("assets/img.png"),
      //         ),
      //       ),
      //       height: 400,
      //       width: 400,
      //     ),
      //     onTap: () {
      //       Answer();
      //     },
      //   ),
      //   Text(
      //     "Нажмите на шар",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 20,
      //     ),
      //     textAlign: TextAlign.center,
      //   ),
      //
      // ]),
    );
  }

  Container Answer() {
    return Container(
      child: FutureBuilder<String>(
        future: answer, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(' ${snapshot.data}'),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
