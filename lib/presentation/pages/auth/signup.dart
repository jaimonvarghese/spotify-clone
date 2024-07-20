import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/pages/auth/sign_in.dart';
import 'package:spotify/presentation/pages/rootPage/root_page.dart';
import 'package:spotify/presentation/widgets/basic_app_bar.dart';
import 'package:spotify/presentation/widgets/basic_app_button.dart';
import 'package:spotify/service_locator.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
              const _registerText(),
              const SizedBox(height: 40),
              _textField(
                text: "Full Name",
                controller: _fullname,
              ),
              const SizedBox(height: 20),
              _textField(
                text: "Enter Email",
                controller: _email,
              ),
              const SizedBox(height: 20),
              _textField(
                text: "Password",
                controller: _password,
              ),
              const SizedBox(height: 20),
              BasicAppButton(
                  onpressed: () async {
                    var result = await sl<SignupUseCase>().call(
                      params: CreateUserReq(
                        fullName: _fullname.text.toString(),
                        email: _email.text.toString(),
                        password: _password.text.toString(),
                      ),
                    );
                    result.fold((l) {
                      var snacbar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snacbar);
                    }, (r) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const RootPage(),
                          ),
                          (route) => false);
                    });
                  },
                  title: "Create Account"),
            ],
          ),
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
                  builder: (BuildContext context) =>  SignIn(),
                ),
              );
            },
            child: const Text("Sign In"))
      ],
    );
  }
}

class _textField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const _textField({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
