import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp7/bmiresult.dart';

class Bmicalculate extends StatefulWidget {
  const Bmicalculate({super.key});

  @override
  State<Bmicalculate> createState() => _Bmicalculate();
}

class _Bmicalculate extends State<Bmicalculate> {
  double height = 120.0;
  int weight = 50;
  int age = 15;
  bool ismale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ismale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: ismale ? Colors.grey[400] : Colors.cyan),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 90.0,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ismale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: ismale ? Colors.cyan : Colors.grey[400]),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 90.0,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style:
                        TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${height.round()}',
                        style: const TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    max: 220.0,
                    min: 100.0,
                    thumbColor: Colors.cyan,
                    activeColor: Colors.cyan,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$weight',
                            style: const TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: Colors.cyan,
                                heroTag: 'weight--',
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                mini: true,
                                child: const Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                backgroundColor: Colors.cyan,
                                heroTag: 'weight++',
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$age',
                            style: const TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: Colors.cyan,
                                heroTag: 'age--',
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                mini: true,
                                child: const Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                backgroundColor: Colors.cyan,
                                heroTag: 'age++',
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                mini: true,
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
            width: double.infinity,
            child: MaterialButton(
              color: Colors.cyan,
              onPressed: () {
                double result = weight / pow(height / 100, 2);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bmiresult(
                      age: age,
                      result: result.round(),
                      ismale: ismale,
                    ),
                  ),
                );
              },
              child: const Text(
                'CALCULATE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
