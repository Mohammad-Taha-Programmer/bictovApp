import 'package:bictov/declarations/constants/strings.dart';
import 'package:bictov/presentation_layer/screens/registration_and_authentication/user/register_user_screen.dart';
import 'package:bictov/providers/register_and_auth_screens_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'declarations/functions/functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) => RegisterAndAuthScreensProvider()),
    ],
    child: Bictov(),
  ));
}

class Bictov extends StatefulWidget {
  const Bictov({super.key});
  @override
  State<Bictov> createState() => _BictovState();
}

class _BictovState extends State<Bictov> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: BictovStringConstants.fontFamily,
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, elevation: 0)),
      home: RegisterUserScreen(),
      onGenerateRoute: (RouteSettings settings) => navigate(settings),
    );
  }
}
