import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part "theme_event.dart";
part "theme_state.dart";

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc()
    : super(
        ThemeUpdateState(
          themeMode: _getInitialTheme(),
          buttonColor: Colors.teal,
          fontFamily: "Times",
        ),
      ) {
    on<ThemeChangeEvent>((event, emit) {
      final currentTheme = state.themeMode;

      if (currentTheme == ThemeMode.dark) {
        emit(
          ThemeUpdateState(
            themeMode: ThemeMode.light,
            buttonColor: state.buttonColor,
            fontFamily: state.fontFamily,
          ),
        );
      } else {
        emit(
          ThemeUpdateState(
            themeMode: ThemeMode.dark,
            buttonColor: state.buttonColor,
            fontFamily: state.fontFamily,
          ),
        );
      }
    });

    on<FontChangeEvent>((event, emit) {
      final newFont = state.fontFamily == 'RobotoBlack'
          ? 'IndieFlower'
          : 'RobotoBlack';
      emit(
        ThemeUpdateState(
          themeMode: state.themeMode,
          fontFamily: newFont,
          buttonColor: state.buttonColor,
        ),
      );
    });

    on<ColorChangeEvent>((event, emit) {
      emit(
        ThemeUpdateState(
          themeMode: state.themeMode,
          fontFamily: state.fontFamily,
          buttonColor: state.buttonColor == Colors.teal
              ? Colors.green
              : Colors.teal,
        ),
      );
    });
  }

  static ThemeMode _getInitialTheme() {
    final platformBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (platformBrightness == Brightness.dark) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {
      'themeMode': state.themeMode == ThemeMode.dark ? "dark" : "light",
      'fontFamily': state.fontFamily,
      'buttonColor': state.buttonColor.toARGB32(),
    };
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    try {
      return ThemeUpdateState(
        themeMode: json['themeMode'] == "dark"
            ? ThemeMode.dark
            : ThemeMode.light,
        fontFamily: json['fontFamily'] as String,
        buttonColor: Color(json['buttonColor'] as int),
      );
    } catch (_) {
      return null;
    }
  }
}
