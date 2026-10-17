import 'package:flutter/material.dart';

import '../../../core/firebase/firebase_bootstrap.dart';
import '../../../core/theme/app_theme.dart';
import '../../rooms/presentation/create_room_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<VmesteColors>()!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Вместе',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            tooltip: 'Профиль',
            onPressed: () {},
            icon: const Icon(Icons.person_outline_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          children: [
            _HeroCard(colors: colors),
            const SizedBox(height: 20),
            Text(
              'Что смотрим сегодня?',
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              'Создайте комнату, пригласите компанию и найдите фильм, который устроит всех.',
              style: Theme.of(context).textTheme.bodyLarge
                  ?.copyWith(color: Colors.black54, height: 1.4),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () => showCreateRoomSheet(context),
              icon: const Icon(Icons.add_rounded),
              label: const Text('Создать комнату'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.login_rounded),
              label: const Text('Войти по коду комнаты'),
            ),
            const SizedBox(height: 28),
            const _FeatureTile(
              icon: Icons.groups_2_outlined,
              title: 'Мнение каждого',
              description: 'Общий выбор без давления и долгих споров.',
            ),
            const SizedBox(height: 12),
            const _FeatureTile(
              icon: Icons.subscriptions_outlined,
              title: 'Учитываем подписки',
              description: 'Показываем доступные варианты для вашей компании.',
            ),
            const SizedBox(height: 12),
            const _FeatureTile(
              icon: Icons.tv_outlined,
              title: 'Сразу на большой экран',
              description: 'После выбора подготовим запуск на телевизоре.',
            ),
            if (!FirebaseBootstrap.isConfigured) ...[
              const SizedBox(height: 24),
              const _DemoNotice(),
            ],
          ],
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.colors});

  final VmesteColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.lavender,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Фильм, который устроит всех',
                  style: Theme.of(context).textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w800, height: 1.05),
                ),
                const SizedBox(height: 12),
                const Text('За пару минут. Без споров.'),
              ],
            ),
          ),
          Icon(Icons.local_movies_rounded, size: 56, color: colors.violet),
        ],
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(icon),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(description),
      ),
    );
  }
}

class _DemoNotice extends StatelessWidget {
  const _DemoNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        'Демонстрационный режим: Firebase еще не подключен.',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
