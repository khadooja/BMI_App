import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double height = 120;
  int weight = 40;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Body Mass Indexx'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1Expanded(context, 'male'),
                    const SizedBox(width: 10),
                    m1Expanded(context, 'female'),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Height',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toStringAsFixed(1),
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'cm',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Slider(
                              value: height,
                              onChanged: (value) {
                                setState(() {
                                  height = value;
                                });
                              },
                              min: 80,
                              max: 220,
                              activeColor: Colors.teal,
                              inactiveColor: Colors.grey),
                        ],
                      ),
                    ))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(),
                child: Row(
                  children: [
                    m2Expanded(context, 'weight'),
                    const SizedBox(width: 10),
                    m2Expanded(context, 'age'),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 15,
              child: TextButton(
                  onPressed: () {
                    double result = weight / ((height / 100) * (height / 100));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(
                                  age: age,
                                  bmi: result,
                                  isMale: isMale,
                                )));
                  },
                  child: const Text(
                    'Calculate',
                    style: TextStyle(fontSize: 25),
                  )),
            )
          ],
        )));
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'male' ? true : false;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isMale && type == 'male'
                ? const Color.fromARGB(255, 128, 186, 177)
                : Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(type == 'Male' ? Icons.male : Icons.female,
                size: 100, color: Colors.white),
            const SizedBox(
              height: 16,
            ),
            Text(
              type == 'Male' ? 'Male' : 'Female',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            type == 'age' ? 'Age' : 'Weight',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            type == 'age' ? '$age' : '$weight',
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: type == 'age' ? 'age++' : 'weight++',
                onPressed: () {
                  setState(() {
                    type == 'age' ? age++ : weight++;
                  });
                },
                mini: true,
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                heroTag: type == 'age' ? 'age--' : 'weight--',
                onPressed: () {
                  setState(() {
                    type == 'age' ? age-- : weight--;
                  });
                },
                mini: true,
                child: const Icon(Icons.remove),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
