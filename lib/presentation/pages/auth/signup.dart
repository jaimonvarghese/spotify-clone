import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/pages/auth/sign_in.dart';
import 'package:spotify/presentation/widgets/basic_app_bar.dart';
import 'package:spotify/presentation/widgets/basic_app_button.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _registerText(),
            const SizedBox(height: 40),
            const _textField(text: "Full Name"),
            const SizedBox(height: 20),
            const _textField(text: "Enter Email"),
            const SizedBox(height: 20),
            const _textField(text: "Password"),
            const SizedBox(height: 20),
            BasicAppButton(onpressed: () {}, title: "Create Account"),
          ],
        ),
      ),
      bottomNavigationBar: const _siginText(),
    );
  }
}

class _siginText extends StatelessWidget {
  const _siginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Do You have an account?",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const SignIn(),
                ),
              );
            },
            child:const Text("Sign In"))
      ],
    );
  }
}

class _textField extends StatelessWidget {
  final String text;
  const _textField({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: text,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}

class _registerText extends StatelessWidget {
  const _registerText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Register",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }
}
