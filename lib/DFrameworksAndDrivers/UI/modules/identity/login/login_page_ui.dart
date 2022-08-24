import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/modules/home/principal_customer_page.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/modules/identity/register/register_page_ui.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/constants/color.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/space_between_widgets/space.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/widgets/text_field_password_widget.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/shared/widgets/text_field_widget.dart';
import 'package:flutter_final_project/Dominio/global_data/sp_global.dart';
import 'package:flutter_final_project/Dominio/services/user_service.dart';

import '../../../shared/usefull_widget/snack_bar_information.dart';

class LoginPageUI extends StatefulWidget {

  @override
  State<LoginPageUI> createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {
  // Editing Controller
  final TextEditingController _txtEmail = TextEditingController();

  final TextEditingController _txtPassword = TextEditingController();

  // User Model
  final UserService _userService = UserService();

  // Form Validation
  final _formKey = GlobalKey<FormState>();

  // Storage
  final SPGlobal _sp = SPGlobal();

  void _login() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _txtEmail.text,
        password: _txtPassword.text,
      );

      if (userCredential != null) {
        _userService.getUser(_txtEmail.text).then((value) {
          if (value != null) {
            if (value.role == "owner" && value.active) {
              _sp.id = value.id ?? "";
              _sp.role = value.role;
              _sp.fullName = value.fullname;
              _sp.email = value.email;
              _sp.isLogin = true;

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrincipalCustomerPage(),
                  ),
                      (route) => false);
            }
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showSnackBar(context, "El correo electrónico es incorrecto",
            Colors.redAccent, Icons.dangerous);
      } else if (e.code == 'user-not-found') {
        showSnackBar(
            context, "El usuario no existe", Colors.redAccent, Icons.dangerous);
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, "La contraseña es incorrecta", Colors.redAccent,
            Icons.dangerous);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                padding: const EdgeInsets.all(16.0),
                height: 325.0,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        'assets/images/light_bulb_turn_on.png',
                        width: 150.0,
                        height: 150.0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/broadcast.png',
                        width: 150.0,
                        height: 150.0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/images/smartphone.png',
                        width: 150.0,
                        height: 150.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    TextFieldWidget(labelText: "",hintText: "Email", textEditingController: _txtEmail,prefixIcon: Icons.person),
                    divider12,
                    TextFieldPasswordWidget(textEditingController: _txtPassword),
                    divider12,
                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        child: const Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffF4531C),
                        ),
                      ),
                    ),
                    divider20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "No tiene una cuenta? ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegisterPageUI()));
                          },
                          child: const Text(
                            "registrate",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
