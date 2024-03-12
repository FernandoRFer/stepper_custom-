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
          title: const Text('Step 11 title'),
          label: const SizedBox(
              height: 50, child: Center(child: Text('Step 1 title'))),
          content: Container(
            height: 600,
            color: Colors.amber,
          ),
        ),
        AppStep(
          title: const Text('Step 12 title'),
          label: const SizedBox(
              height: 50, child: Center(child: Text('Step 1 title'))),
          content: Container(
            height: 600,
            color: Colors.white,
          ),
        ),
        AppStep(
          title: const Text('Step 13 title'),
          label: const SizedBox(
              height: 50, child: Center(child: Text('Step 1 title'))),
          content: Container(
            height: 700,
            color: Colors.black,
          ),
        ),
        AppStep(
          label: const SizedBox(
              height: 50, child: Center(child: Text('Step 1 title'))),
          title: const Text('Step 2 title'),
          content: Container(
            height: 500,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
