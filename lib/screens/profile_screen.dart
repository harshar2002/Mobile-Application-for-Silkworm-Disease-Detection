import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/roses.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 100,
            left: 180,
            child: Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'comicneuebold',
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 30,
            child: Container(
              width: 247,
              height: 78,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/profile.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bitt Scott Manget',
                        style: TextStyle(
                          fontFamily: 'comicneuebold',
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'bitt@gmail.com',
                        style: TextStyle(
                          fontFamily: 'comicneuebold',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 23,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle Edit user account
                    debugPrint('Edit user account tapped');
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: const Offset(1, 1),
                          blurRadius: 5,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 10),
                        Text(
                          'Edit user account',
                          style: TextStyle(
                            fontFamily: 'comicneuebold',
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle Help and Support
                    debugPrint('Help and Support tapped');
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: const Offset(1, 1),
                          blurRadius: 5,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.help),
                        SizedBox(width: 10),
                        Text(
                          'Help and Support',
                          style: TextStyle(
                            fontFamily: 'comicneuebold',
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle Signout
                    debugPrint('Signout tapped');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: const Offset(1, 1),
                          blurRadius: 5,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(width: 10),
                        Text(
                          'Signout',
                          style: TextStyle(
                            fontFamily: 'comicneuebold',
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
