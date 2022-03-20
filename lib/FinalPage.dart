import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FinalPage extends StatefulWidget {
  int trueCount;

  FinalPage({required this.trueCount});

  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Final Page"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Correct : ${widget.trueCount}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Wrong : ${10 - widget.trueCount}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            CircularPercentIndicator(
              radius: 100.0,
              percent: widget.trueCount * 100 / 1000,
              progressColor: Colors.deepPurple,
              lineWidth: 15.0,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                "%${(widget.trueCount * 100 / 10).ceil()}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              animation: true,
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Try Again"),
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
