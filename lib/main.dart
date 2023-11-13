import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiting_webpage/global/theme/theme.dart';
import 'features/centre_card/home_center.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: '',
//       theme: ThemeData(
//         useMaterial3: true,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.amber,
//           // toolbarTextStyle: TextStyle(
//           //   fontWeight: FontWeight.bold,
//           // ),
//         ),
//         primarySwatch: Colors.red,
//       ),
//       home: const HomePage(),
//       // home: const TestThree(),
//     );
//   }
// }
/* website gourav today 1 wweek
amazon stoore creation shalini todau 1 week
*/

/* 
ruby
seo for jvsolutions today 1 month */


//sourav sir khalid 


// shopfy.us/products/quick-shaver