import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../home/presentation/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isRussian = true;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<VmesteColors>()!;
    final text = _isRussian ? _WelcomeText.russian : _WelcomeText.chinese;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Вместе.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  SegmentedButton<bool>(
                    segments: const [
                      ButtonSegment(value: true, label: Text('RU')),
                      ButtonSegment(value: false, label: Text('中文')),
                    ],
                    selected: {_isRussian},
                    onSelectionChanged: (selection) {
                      setState(() => _isRussian = selection.first);
                    },
                    showSelectedIcon: false,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colors.lavender,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Icon(
                        Icons.local_movies_rounded,
                        size: 96,
                        color: colors.violet,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      text.title,
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                height: 1.05,
                              ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      text.subtitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black54,
                            height: 1.4,
                          ),
                    ),
                  ],
                ),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const HomeScreen(),
                    ),
                  );
                },
                child: Text(text.continueLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeText {
  const _WelcomeText({
    required this.title,
    required this.subtitle,
    required this.continueLabel,
  });

  final String title;
  final String subtitle;
  final String continueLabel;

  static const russian = _WelcomeText(
    title: 'Выберем фильм вместе',
    subtitle:
        'Приложение поможет компании быстро выбрать фильм, который понравится всем.',
    continueLabel: 'Продолжить',
  );

  static const chinese = _WelcomeText(
    title: '一起选择电影',
    subtitle: '帮助大家快速找到所有人都喜欢的电影。',
    continueLabel: '继续',
  );
}
