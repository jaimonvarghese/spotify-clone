import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/presentation/pages/auth/signup.dart';
import 'package:spotify/presentation/widgets/basic_app_bar.dart';

import '../../../core/configs/assets/app_vectors.dart';
import '../../../service_locator.dart';
import '../../widgets/basic_app_button.dart';
import '../rootPage/root_page.dart';

class SignIn extends StatelessWidget {
   SignIn({super.key});
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
              const _signInText(),
              const SizedBox(height: 40),
               _textField(text: "Enter Email",controller: _email,),
              const SizedBox(height: 20),
               _textField(text: "Password",controller: _password,),
              const SizedBox(height: 20),
              BasicAppButton(onpressed: ()async {
                var result = await sl<SigninUseCase>().call(
                      params: SigninUserReq(
                        
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
              }, title: "Sign In"),
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
                  builder: (BuildContext context) =>  Signup(),
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
  final TextEditingController controller;
  const _textField({
    super.key,
    required this.text, required this.controller,
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
