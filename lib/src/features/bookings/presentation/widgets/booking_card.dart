
import 'package:ayucare/src/core/extensions/date_time_extensions.dart';
import 'package:ayucare/src/features/bookings/domain/entity/patient.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookingcard extends StatelessWidget {
  final Patient patient;
  final int index;
  const Bookingcard({super.key, required this.patient, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xffF1F1F1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 23, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$index.",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patient.name,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "Couple Combo Package (Rejuven...",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff006837),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 14),

                      Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 16,
                                width: 16,
                                child: Image.asset("assets/icons/calendar.png"),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                patient.dateTime.toReadableDate(),
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 22),
                          Row(
                            children: [
                              SizedBox(
                                height: 16,
                                width: 16,
                                child: Image.asset("assets/icons/person.png"),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "Jithesh",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          Container(height: 1, color: Colors.grey[300]),
          InkWell(
            onTap: () {},
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 45,
                top: 10,
                bottom: 10,
                right: 20,
              ),
              child: Row(
                children: [
                  Text(
                    "View Booking details",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
