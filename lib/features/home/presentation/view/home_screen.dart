import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khusm/core/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CarouselSlider.builder(
                  itemCount: 3,
                  options: CarouselOptions(autoPlay: true),
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(78, 44, 172, 164),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                          child: SvgPicture.asset("assets/images/Khusm.svg")),
                    );
                  }),
              const SizedBox(height: 25),
              const Row(
                children: [
                  Text(
                    "Best Deals",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF202020),
                        fontFamily: 'Ubuntu'),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF2caca3),
                        fontFamily: 'Ubuntu'),
                  ),
                  Icon(Icons.keyboard_arrow_right, color: Color(0xFF2caca3))
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(78, 44, 172, 164),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Center(
                          child: SvgPicture.asset("assets/images/Khusm.svg")),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Text(
                    "Up to 50%",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF202020),
                        fontFamily: 'Ubuntu'),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF2caca3),
                        fontFamily: 'Ubuntu'),
                  ),
                  Icon(Icons.keyboard_arrow_right, color: Color(0xFF2caca3))
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.27,
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SvgPicture.asset(
                                  "assets/images/Khusm.svg",
                                  fit: BoxFit.fitWidth,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                ),
                              ),
                              const SizedBox(height: 40),
                              const Text(
                                "Khusm",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF202020),
                                    fontFamily: 'Ubuntu'),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "50% OFF on This Product",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF202020),
                                    fontFamily: 'Ubuntu'),
                              ),
                            ],
                          ),
                          Positioned(
                              top: 0,
                              right: 0,
                              left: MediaQuery.of(context).size.width * 0.15,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border,
                                      color: Color(0xFF2caca3)))),
                          Positioned(
                              top: 75,
                              right: 0,
                              left: MediaQuery.of(context).size.width * 0.15,
                              child: const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Color(0xFF2caca3),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ))),
                          index == 2
                              ? Positioned(
                                  top: 17,
                                  left: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(71, 76, 175, 79),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Text(
                                        "2X Points",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.023,
                                            color: const Color.fromARGB(
                                                160, 76, 175, 79),
                                            fontFamily: 'Ubuntu'),
                                      ),
                                    ),
                                  ))
                              : const SizedBox()
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2caca3),
        backgroundColor: Colors.white,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
