import 'dart:developer';

import 'package:app_stepper/app_stepper.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

/// Flutter code sample for [Stepper].

void main() => runApp(const StepperExampleApp());

class StepperExampleApp extends StatelessWidget {
  const StepperExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stepper Sample'),
        ),
        body: const Center(
          child: StepperExample(),
        ),
      ),
    );
  }
}

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  final _index = signal(0);

  @override
  Widget build(BuildContext context) {
    return AppStepper(
      type: AppStepperType.horizontal,
      onStepTapped: (i) => _index.value = i,
      currentStep: _index.watch(context),
      onStepCancel: () {
        _index.value--;
      },
      onStepContinue: () {
        _index.value++;
      },
      onStepFinish: () {
        log("finsh");
      },
      steps: <AppStep>[
        AppStep(
          title: const Text('1 title'),
          label: const SizedBox(
              height: 50,
              child: Center(
                  child: Text(
                '1 title',
                style: TextStyle(fontSize: 18),
              ))),
          content: Card(
            child: Container(
              height: 600,
              color: const Color.fromARGB(255, 212, 212, 212),
            ),
          ),
        ),
        AppStep(
          title: const Text('2 title'),
          label: const SizedBox(
              height: 50,
              child: Center(
                  child: Text(
                '2 title',
                style: TextStyle(fontSize: 18),
              ))),
          content: Card(
            child: Container(
              height: 650,
              color: const Color.fromARGB(255, 4, 84, 90),
            ),
          ),
        ),
        AppStep(
          title: const Text('3 title'),
          label: const SizedBox(
              height: 50,
              child: Center(
                  child: Text(
                '3 title',
                style: TextStyle(fontSize: 18),
              ))),
          content: Card(
            child: Container(
              height: 700,
              color: Colors.black,
            ),
          ),
        ),
        AppStep(
          label: const SizedBox(
              height: 50,
              child: Center(
                  child: Text(
                '4 title',
                style: TextStyle(fontSize: 18),
              ))),
          title: const Text(
            '4 title',
          ),
          content: Card(
            child: Container(
              height: 500,
              color: const Color.fromARGB(255, 82, 67, 66),
            ),
          ),
        ),
      ],
    );
  }
}
