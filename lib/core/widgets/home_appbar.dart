import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar homeAppBar(context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'Ash Sheikh Zayed',
                style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF2caca3),
                    fontFamily: 'Ubuntu'),
              ),
              Icon(Icons.keyboard_arrow_down, color: Color(0xFF2caca3))
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Text(
                'Delivery in ',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF202020),
                    fontFamily: 'Ubuntu'),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(71, 76, 175, 79),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    "60 Minutes",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        color: const Color.fromARGB(160, 76, 175, 79),
                        fontFamily: 'Ubuntu'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Icon(
          Icons.message,
          color: Color(0xFF2caca3),
        ),
      ),
      SizedBox(width: 10),
      Icon(
        FontAwesomeIcons.gift,
        size: 22,
        color: Color(0xFF2caca3),
      ),
      SizedBox(width: 10),
    ],
  );
}
