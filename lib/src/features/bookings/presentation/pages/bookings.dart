import 'package:ayucare/src/features/auth/presentation/widgets/button.dart';
import 'package:ayucare/src/features/bookings/presentation/pages/book_a_slot.dart';
import 'package:ayucare/src/features/bookings/presentation/widgets/booking_card.dart';
import 'package:ayucare/src/features/bookings/presentation/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30), // for bottom button
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.only(top: 64, bottom: 20),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Color(0x33000000)),
                  ),
                ),
                child: Column(
                  children: [
                    // Top Bar Icons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 28,
                            width: 28,
                            child: Image.asset("assets/icons/back.png"),
                          ),
                          SizedBox(
                            height: 28,
                            width: 28,
                            child: Image.asset("assets/icons/noti.png"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  prefixIcon: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(
                                      "assets/icons/search.png",
                                      scale: 3,
                                    ),
                                  ),
                                  hintText: "Search for treatments",
                                  hintStyle: GoogleFonts.poppins(
                                    color: const Color(0x4D000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Color(0x4D000000),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0x4D000000),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Searchbutton(onTap: () {}),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Sort Dropdown
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sort by :",
                            style: GoogleFonts.poppins(
                              color: const Color(0xff404040),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: 169,
                            height: 39,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(33),
                              border: Border.all(
                                color: const Color(0x4D000000),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                    "assets/icons/down.png",
                                    scale: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Bookingcard(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Button(
          title: 'Register Now',
          onTap: () {
            Get.to(() => const BookSlot());
          },
        ),
      ),
    );
  }
}
