import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const _ink = Color(0xFF20243A);
  static const _lavender = Color(0xFFEDE8FF);
  static const _violet = Color(0xFF6C4CE8);
  static const _mint = Color(0xFFDDF5EE);

  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: _violet,
      brightness: Brightness.light,
      surface: const Color(0xFFF9F8FC),
    );

    return ThemeData(
      colorScheme: scheme,
      scaffoldBackgroundColor: const Color(0xFFF9F8FC),
      fontFamily: 'sans-serif',
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: _ink,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _lavender.withValues(alpha: 0.45),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: _ink,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      extensions: const [
        VmesteColors(lavender: _lavender, violet: _violet, mint: _mint),
      ],
    );
  }
}

@immutable
class VmesteColors extends ThemeExtension<VmesteColors> {
  const VmesteColors({
    required this.lavender,
    required this.violet,
    required this.mint,
  });

  final Color lavender;
  final Color violet;
  final Color mint;

  @override
  VmesteColors copyWith({Color? lavender, Color? violet, Color? mint}) {
    return VmesteColors(
      lavender: lavender ?? this.lavender,
      violet: violet ?? this.violet,
      mint: mint ?? this.mint,
    );
  }

  @override
  VmesteColors lerp(ThemeExtension<VmesteColors>? other, double t) {
    if (other is! VmesteColors) return this;
    return VmesteColors(
      lavender: Color.lerp(lavender, other.lavender, t)!,
      violet: Color.lerp(violet, other.violet, t)!,
      mint: Color.lerp(mint, other.mint, t)!,
    );
  }
}
