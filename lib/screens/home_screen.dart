import 'package:flutter/material.dart';

import '../widgets/app_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Skin Condition Classification and Screening System'),
    ),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            label: 'Open Login',
            onPressed: () => Navigator.pushNamed(context, '/login'),
          ),
          const SizedBox(height: 12),
          AppButton(
            label: 'Open Symptom Report',
            onPressed: () => Navigator.pushNamed(context, '/report'),
          ),
        ],
      ),
    ),
  );
}
