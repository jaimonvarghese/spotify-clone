import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/presentation/pages/auth/signup.dart';
import 'package:spotify/presentation/widgets/basic_app_bar.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../widgets/basic_app_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _signInText(),
              const SizedBox(height: 40),
              const _textField(text: "Enter Email"),
              const SizedBox(height: 20),
              const _textField(text: "Password"),
              const SizedBox(height: 20),
              BasicAppButton(onpressed: () {}, title: "Sign In"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _signUpText(),
    );
  }
}

class _signUpText extends StatelessWidget {

  const _signUpText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Not A Member?",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Signup(),
                ),
              );
            },
            child: const Text("Register Now"))
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

class _signInText extends StatelessWidget {
  const _signInText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Sign In",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }
}
