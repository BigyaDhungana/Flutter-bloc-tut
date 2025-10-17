import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/src/bloc/theme/theme_bloc.dart';
import 'package:todo_app/src/bloc/todo/todo_bloc.dart';
import 'package:todo_app/src/core/constants/app_themes.dart';
import 'package:todo_app/src/core/network/network_base.dart';
import 'package:todo_app/src/data/repositories/todo_repository.dart';
import 'package:todo_app/src/presentation/router/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TodoRepository(NetworkInit()),
      child: Builder(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => TodoBloc(context.read<TodoRepository>()),
            ),
            BlocProvider(create: (_) => ThemeBloc()),
          ],

          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) => MaterialApp.router(
              routerConfig: router,
              darkTheme: AppThemes.darkTheme(state.fontFamily),
              theme: AppThemes.lightTheme(state.fontFamily),
              themeMode: state.themeMode,
            ),
          ),
        ),
      ),
    );
  }
}
