import 'package:go_router/go_router.dart';
import 'package:todo_app/src/presentation/screens/todos_layout_screens/settings_screen/setting_screen.dart';
import 'package:todo_app/src/presentation/screens/todos_layout_screens/todos_layout_screen.dart';
import 'package:todo_app/src/presentation/screens/todos_layout_screens/todos_screen/all_todos_screen.dart';
import 'package:todo_app/src/presentation/screens/home_screen/home_screen.dart';

final router = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(path: '/', name: 'home', builder: (context, state) => HomeScreen()),
    // GoRoute(
    //   path: '/todos',
    //   name: 'todos',
    //   builder: (context, state) => AllTodosScreen(),
    // ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          TodosLayoutScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/todos',
              builder: (context, state) => AllTodosScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => SettingScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
