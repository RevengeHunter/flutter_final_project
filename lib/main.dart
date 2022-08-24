import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DFrameworksAndDrivers/UI/modules/home/principal_customer_page.dart';
import 'DFrameworksAndDrivers/UI/modules/identity/login/login_page_ui.dart';
import 'Dominio/global_data/sp_global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SPGlobal _prefs = SPGlobal();
  await _prefs.initShared();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SPGlobal _prefs = SPGlobal();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LUMNOS',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      home: _prefs.isLogin ? PrincipalCustomerPage() : LoginPageUI(),
    );
  }
}