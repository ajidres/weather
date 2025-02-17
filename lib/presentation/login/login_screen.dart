import 'package:banka/presentation/home/home_screen.dart';
import 'package:banka/shared/contants.dart';
import 'package:banka/shared/designsystem/AppTheme.dart';
import 'package:banka/shared/designsystem/widget/text_from_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  final regexEmail = RegExp(emailPattern);
  final regexPassword = RegExp(passwordPattern);

  late final AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );

  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: const Offset(-1.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: animationController,
    curve: Curves.linear,
  ));

  @override
  void initState() {
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlideTransition(
                      position: offsetAnimation,
                      child: Image.asset(
                        'assets/logo.png',
                        width: MediaQuery.of(context).size.width * 0.6,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Te damos la bienvenida',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppTheme.instance.bnkPrimary),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFromWidget(
                        controller: usernameController,
                        textInputType: TextInputType.emailAddress,
                        maxLength: maxLengthUser,
                        hint: 'Correo electrónico',
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: AppTheme.instance.bnkPrimary,
                        ),
                        validationFunction: (String? value) {
                          if (value == null ||
                              value.isEmpty ||
                              !regexEmail.hasMatch(value)) {
                            return 'Debe ingresar un correo electrónico valido';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    TextFromWidget(
                      isHidden: isHiddenPassword,
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      maxLength: maxLengthPassword,
                      hint: 'Contraseña',
                      prefixIcon: Icon(Icons.lock_outline,
                          color: AppTheme.instance.bnkPrimary),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isHiddenPassword = !isHiddenPassword;
                          });
                        },
                        child: Icon(
                          isHiddenPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppTheme.instance.bnkPrimary,
                        ),
                      ),
                      validationFunction: (String? value) {
                        if (value == null ||
                            value.isEmpty ||
                            !regexPassword.hasMatch(value)) {
                          return 'Debe ingresar una contraseña valida';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                          }
                        },
                        child: Text('Continuar'))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
