import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login_page.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  checkAuth() {
    Future.delayed(Duration(seconds: 8), () {
      Get.off(() => LoginPage());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Text(
              "Welcome to Teacher Apps",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(
              flex: 1,
            ),
            Image.network(
              'https://scontent.fbir1-1.fna.fbcdn.net/v/t39.30808-6/369675378_692788969533893_7733008436235345018_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=9c7eae&_nc_ohc=XbDyGnBQ1HwAX8x5lK-&_nc_ht=scontent.fbir1-1.fna&oh=00_AfDDuPq2xhPw7rGwxbYWrS9KQdyuiYJ7BZ8i9hnH4wZqxA&oe=65EBD7F2',
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
            // Spacer(
            //   flex: 3,
            // ),
            // Lottie.asset(
            //   'images/dog.json',
            //   height: 100,
            //   width: 100,
            // ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
