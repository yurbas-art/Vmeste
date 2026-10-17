# Вместе

Flutter-приложение для быстрого совместного выбора фильма с учетом вкусов и подписок участников.

## MVP

- создание комнаты на 2-6 человек;
- приглашение по коду;
- общий подбор и голосование;
- учет доступных стриминговых сервисов;
- история просмотренных фильмов и оценок;
- подготовка к запуску выбранного фильма на Smart TV.

## Структура

```text
lib/
  app.dart
  main.dart
  core/
    firebase/
    theme/
  features/
    auth/
    home/
    movies/
    profile/
    rooms/
```

## Запуск

1. Установить Flutter SDK и выполнить `flutter pub get`.
2. Создать Firebase-проект.
3. Установить FlutterFire CLI и выполнить `flutterfire configure`.
4. Включить Authentication (Phone или Email/Password) и Cloud Firestore.
5. Запустить `flutter run`.

До выполнения `flutterfire configure` приложение запускается в демонстрационном режиме без обращения к Firebase.
