import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/src/core/constants/user_info.dart';
import 'package:todo_app/src/presentation/common/elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("From : ${DevInfo.name}",style: TextStyle(
              fontSize: 18
            ),),
            ThemeButton(
              text: "View Todos",
              onPressed: () {
                context.push('/todos');
              },
            ),
          ],
        ),
      ),
    );
  }
}
