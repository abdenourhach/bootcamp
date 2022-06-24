import 'dart:math';

import 'package:flutter/material.dart';

class RandomizePage extends StatefulWidget {
  final int min, max;

  const RandomizePage({Key? key, required this.min, required this.max})
      : super(key: key);

  @override
  State<RandomizePage> createState() => _RandomizePageState();
}

class _RandomizePageState extends State<RandomizePage> {


  final randomGenerator = Random();

  @override
  Widget build(BuildContext context) {
    
    var generatedNumber = <int?>(null);


    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer'),
      ),
      body: Center(
        child: Text(
          generatedNumber?.toString() ?? 'Generate number',
          style: TextStyle(fontSize: 42),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: Text('Generate'),
          onPressed: () {

            setState(() {
              generatedNumber= widget.min + randomGenerator.nextInt(widget.max + 1 -widget.min);
            });
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
