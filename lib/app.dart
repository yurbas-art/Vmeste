import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/presentation/welcome_screen.dart';

class VmesteApp extends StatelessWidget {
  const VmesteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Вместе',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const WelcomeScreen(),
    );
  }
}
