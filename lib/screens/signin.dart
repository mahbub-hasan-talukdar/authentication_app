import 'package:demo_ui/components/action_button.dart';
import 'package:demo_ui/components/action_text.dart';
import 'package:demo_ui/components/custom_textfields.dart';
import 'package:demo_ui/components/login_page_logo.dart';
import 'package:demo_ui/components/password_field_provider.dart';
import 'package:demo_ui/components/subtitle.dart';
import 'package:demo_ui/components/title.dart';
import 'package:demo_ui/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';


class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 145,
              ),
              const TitleText(text: 'Login to Authy'),
              const SizedBox(height: 37),
              const SubTitleText(
                text:
                    'Welcome back! Sign in using your social\n account or email to continue us',
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoginPageLogo(
                      logo: FaIcon(
                    FontAwesomeIcons.facebook,
                    size: 30,
                    color: Colors.blue,
                  )),
                  const SizedBox(width: 22),
                  LoginPageLogo(
                      logo: Image(
                    image: Assets.googleLogo.provider(),
                    height: 25,
                    width: 25,
                  )),
                  const SizedBox(width: 22),
                  const LoginPageLogo(
                      logo: FaIcon(
                    FontAwesomeIcons.apple,
                    size: 30,
                  )),
                  const SizedBox(width: 22),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 1,
                      width: 150,
                      color: const Color(0xFFCDD1D0),
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(color: Color(0xFF797C7B)),
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: const Color(0xFFCDD1D0),
                    ),
                  ],
                ),
              ),
              CustomTextField(
                text: 'Email',
                hintText: 'Enter email',
                controller: emailController,
              ),
              const SizedBox(height: 20),
              PasswordFieldProvider(
                  controller: passwordController,
                  text: 'Password',
                  hintText: 'Enter password'),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (newValue) {}, shape: null),
                  ActionText(text: 'Remember me'),
                  const Spacer(),
                  ActionText(
                    text: 'Forgot password',
                    direction: '/forgotPassword',
                  )
                ],
              ),
              const Spacer(),
              ActionButton(
                text: 'Login',
                direction: '',
                onpress: () async {
                  try {
                    Response response = await post(
                      Uri.parse('http://34.72.136.54:4067/api/v1/auth/login'),
                      body: {
                        'email': emailController.text,
                        'password': passwordController.text,
                        'OS': 'IOS',
                        'model': 'iPhone 15',
                        'FCMToken': 'Token1',
                      },
                    );
                    print(response.statusCode);
                    if (response.statusCode == 201 || response.statusCode==200) {
                      context.go('/profile');
                    } else {
                      // ignore: use_build_context_synchronously
                      
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
              const SizedBox(height: 10),
              ActionText(
                text: "Don't have any account? Sign up",
                direction: '/signup',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
// moshi.bs23@gmail.com
// password123
