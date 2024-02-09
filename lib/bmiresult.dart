import 'package:flutter/material.dart';

class Bmiresult extends StatelessWidget {
  final bool ismale;
  final int result;
  final int age;

  const Bmiresult({
    super.key,
    required this.ismale,
    required this.result,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('the result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${ismale ? 'male' : 'female'}',
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Result : $result',
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Age : $age',
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
