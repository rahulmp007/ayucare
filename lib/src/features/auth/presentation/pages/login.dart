import 'package:ayucare/src/core/routes/app_routes.dart';
import 'package:ayucare/src/features/auth/controller/auth_controller.dart';
import 'package:ayucare/src/features/auth/presentation/widgets/button.dart';
import 'package:ayucare/src/features/auth/presentation/widgets/login_header.dart';
import 'package:ayucare/src/features/auth/presentation/widgets/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginHeader(),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 30,
                right: 20,
                bottom: 30,
              ),
              child: Row(
                children: [
                  Text(
                    "Login or register to book \nyour appointments",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0x40D9D9D9),
                      borderRadius: BorderRadius.circular(8.53),
                      border: Border.all(
                        color: const Color(0x1A000000),
                        width: 0.85,
                      ),
                    ),
                    child: TextField(
                      controller: ctr.usernameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        hintText: 'Enter your email',
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    children: [
                      Text(
                        "Password",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0x40D9D9D9),
                      borderRadius: BorderRadius.circular(8.53),
                      border: Border.all(
                        color: const Color(0x1A000000),
                        width: 0.85,
                      ),
                    ),
                    child: TextField(
                      controller: ctr.passwordController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        hintText: 'Enter password',
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(() {
                return ctr.authState.value.onState(
                  onInitial: () {
                    return Button(
                      title: "Login",
                      onTap: () async {
                        await ctr.login('test_user', '12345678');
                      },
                    );
                  },
                  success: (data) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Get.offAllNamed(AppRoutes.bookings);
                    });
                    return Button(title: "Login", onTap: () async {});
                  },
                  onFailed: (error) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Authentication failed. Try again.'),
                        ),
                      );
                    });

                    return Button(
                      title: "Login",
                      onTap: () async {
                        await ctr.login('test_user', '12345678');
                      },
                    );
                  },
                  onLoading: () {
                    return Button(
                      title: "Login",
                      onTap: () async {},
                      isLoading: true,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [PrivacyPolicy()],
        ),
      ),
    );
  }
}
