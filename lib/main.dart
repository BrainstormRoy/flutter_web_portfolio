import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiting_webpage/global/theme/theme.dart';
import 'features/centre_card/home_center.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDI32AWTeRdyBTlseF8Vu9N4gVrk7ep2TU",
      appId: "1:430248180322:web:7ad72ca2ec0ffa6ac56f3b",
      messagingSenderId: "430248180322",
      projectId: "tap2x-f7ab7",
      storageBucket: "tap2x-f7ab7.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme,
      getPages: [
        GetPage(
          name: '/:user',
          // page: () => const VisitingCard(),
          page: () => const HomeCenterUi(),
          // page: () => const SingleForm(),
        ),
      ],
      initialRoute: '/JohnDoe',
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Get.parameters['user'];

    return Scaffold(
        appBar: AppBar(
          title: Text('User Details for $user'),
        ),
        body: Text('$user') // Your user details display widgets here
        );
  }
}
