import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;
  final Function startAgain;

  Result(this.result, this.startAgain);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'All Done!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            'Total Score: $result',
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
          FlatButton(
            child: Text(
              'Start Again',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: startAgain,
          ),
        ],
      ),
    );
  }
}
