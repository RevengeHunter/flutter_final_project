import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/DFrameworksAndDrivers/UI/modules/home/principal_customer_page.dart';
import 'package:flutter_final_project/Dominio/models/user_model.dart';
import 'package:flutter_final_project/Dominio/services/user_service.dart';
import '../../../../../Dominio/global_data/sp_global.dart';
import '../../../shared/constants/color.dart';
import '../../../shared/space_between_widgets/space.dart';
import '../../../shared/usefull_widget/snack_bar_information.dart';
import '../../../shared/widgets/text_field_password_widget.dart';
import '../../../shared/widgets/text_field_widget.dart';

class RegisterPageUI extends StatefulWidget {
  @override
  State<RegisterPageUI> createState() => _RegisterPageUIState();
}

class _RegisterPageUIState extends State<RegisterPageUI> {
  // Editing Controller
  final TextEditingController _txtName = TextEditingController();

  final TextEditingController _txtEmail = TextEditingController();

  final TextEditingController _txtPassword = TextEditingController();

  final UserService _userService = UserService();

  final SPGlobal _sp = SPGlobal();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  registerCustomer() async {
    if (_formKey.currentState!.validate()) {
      try {
        isLoading = true;
        setState(() {});

        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _txtEmail.text,
          password: _txtPassword.text,
        );
        print(userCredential.user);

        if (userCredential.user != null) {
          UserModel userModel = UserModel(
            role: "owner",
            email: _txtEmail.text,
            fullname: _txtName.text,
            active: true,
          );
          _userService.addUser(userModel).then((value) {
            if (value.isNotEmpty) {
              _sp.fullName = userModel.fullname;
              _sp.email = userModel.email;
              _sp.isLogin = true;
              _sp.role = userModel.role;

              isLoading = false;
              setState(() {});

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  backgroundColor: Colors.green,
                  content: const Text(
                    "El registro se realizo con exito",
                  ),
                ),
              );

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrincipalCustomerPage()),
                  (route) => false);
            }
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          showSnackBar(context, "El correo electrónico ya está registrado",
              Colors.redAccent, Icons.dangerous);
        } else if (e.code == "weak-password") {
          showSnackBar(context, "La contraseña es débil, intenta con otra",
              Colors.redAccent, Icons.dangerous);
        }
        isLoading = false;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    "Bienvenido",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  divider6,
                  Text(
                    "Porfavor completa los cuadros con tu información.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),
                  TextFieldWidget(
                    labelText: "",
                    hintText: "Name",
                    textEditingController: _txtName,
                    prefixIcon: Icons.person,
                    validate: true,
                  ),
                  TextFieldWidget(
                    labelText: "",
                    hintText: "Email",
                    textEditingController: _txtEmail,
                    prefixIcon: Icons.email,
                    validate: true,
                  ),
                  divider20,
                  TextFieldPasswordWidget(
                    textEditingController: _txtPassword,
                  ),
                  divider12,
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        registerCustomer();
                      },
                      child: const Text(
                        "Registrar",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
