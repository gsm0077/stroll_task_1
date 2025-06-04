import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stroll/routes/routes_list.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
        TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password")),
        ElevatedButton(
          onPressed: () {
            context.push(RoutesList.defaultBottom);
          },
          child: Text("Login"),
        ),
      ],
    );
  }
}
