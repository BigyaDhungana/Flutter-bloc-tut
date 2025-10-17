import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/bloc/theme/theme_bloc.dart';
import 'package:todo_app/src/presentation/common/elevated_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                IconButton.outlined(
                  onPressed: () {
                    themeBloc.add(ThemeChangeEvent());
                  },
                  icon: (state.themeMode == ThemeMode.dark)
                      ? Icon(Icons.light_mode)
                      : Icon(Icons.dark_mode),
                ),

                IconButton.outlined(
                  onPressed: () {
                    themeBloc.add(FontChangeEvent());
                  },
                  icon: Icon(Icons.abc),
                ),
                IconButton.outlined(
                  onPressed: () {
                    themeBloc.add(ColorChangeEvent());
                  },
                  icon: Icon(Icons.color_lens),
                ),
              ],
            ),
            SizedBox(height: 20),
            ThemeButton(
              text:
                  "This button reflects changes and does nothing when pressed",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
