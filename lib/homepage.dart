import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;
  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(235),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        // leading: const Icon(Icons.home),
        title: const Text('paizatto'),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.orange,
                  size: 18,
                ),
                label: const Text(
                  'Pincode or Location',
                  style: TextStyle(color: Colors.grey),
                )),
          ),
          IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            _userInfo(),
            _carousel(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Discover Nearby',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _gridMenu(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: navItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        elevation: 50,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        fixedColor: Colors.red.shade800,
        unselectedItemColor: Colors.red.shade800,
      ),
    );
  }

  final List<BottomNavigationBarItem> navItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.store),
      label: 'Vendors',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people_alt),
      label: 'Refer',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.currency_rupee),
      label: 'EarnBack',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Alerts',
    ),
  ];

  Widget _header() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Ashutosh Kumar',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red.shade800,
            ),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
                color: Colors.white,
              ),
              label: const Text(
                'Refer a Friend',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _userInfo() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.red.shade600,
                    Colors.red.shade900,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  userItem('Total Eligible\nEarn back',
                      Icons.currency_rupee_rounded),
                  const SizedBox(width: 10),
                  userItem('Month', Icons.calendar_today_rounded),
                  const SizedBox(width: 10),
                  userItem('Actual\nEarn Back', Icons.sensor_occupied_sharp),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.green.shade600,
                    Colors.green.shade900,
                  ],
                ),
              ),
              child: userItem('Connections', Icons.share_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget userItem(String label, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _carousel() {
    List items = [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.jpg',
      'assets/images/5.jpg',
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.jpg',
    ];
    final List<Widget> slides = items.map((item) {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(item),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
      );
    }).toList();
    return Column(
      children: [
        CarouselSlider(
          items: slides,
          carouselController: controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1,
              aspectRatio: 2.0,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => controller.animateToPage(entry.key),
              child: Container(
                width: 32,
                height: 2.5,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: current == entry.key ? Colors.orange : Colors.black),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _gridMenu() {
    List<GridItem> gridItems = [
      GridItem(
          title: 'Automobiles',
          icon: Icons.ac_unit,
          image: 'assets/images/1.jpg',
          route: '/automobiles'),
      GridItem(
          title: 'Bikes',
          icon: Icons.directions_bike,
          image: 'assets/images/2.jpg',
          route: '/bikes'),
      GridItem(
          title: 'Cars',
          icon: Icons.directions_car,
          image: 'assets/images/3.jpg',
          route: '/cars'),
      GridItem(
          title: 'Cars',
          icon: Icons.directions_car,
          image: 'assets/images/4.jpg',
          route: '/cars'),
      GridItem(
          title: 'Cars',
          icon: Icons.directions_car,
          image: 'assets/images/5.jpg',
          route: '/cars'),
      GridItem(
          title: 'Cars',
          icon: Icons.directions_car,
          image: 'assets/images/1.jpg',
          route: '/cars'),
      GridItem(
          title: 'Cars',
          icon: Icons.directions_car,
          image: 'assets/images/2.jpg',
          route: '/cars'),
      GridItem(
          title: 'Cars',
          icon: Icons.directions_car,
          image: 'assets/images/3.jpg',
          route: '/cars'),
      GridItem(
          title: 'Cars',
          icon: Icons.directions_car,
          image: 'assets/images/5.jpg',
          route: '/cars'),
      GridItem(
          title: 'Cars',
          icon: Icons.directions_car,
          image: 'assets/images/1.jpg',
          route: '/cars'),
      GridItem(
          title: 'Cars',
          icon: Icons.directions_car,
          image: 'assets/images/2.jpg',
          route: '/cars'),
      GridItem(
          title: 'Cars',
          icon: Icons.directions_car,
          image: 'assets/images/3.jpg',
          route: '/cars'),
    ];

    return Container(
      margin: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: gridItems.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(gridItems[index].image),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 2,
                  left: 2,
                  child: Text(
                    gridItems[index].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                Positioned(
                  left: 2,
                  bottom: 2,
                  child: Icon(
                    gridItems[index].icon,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class GridItem {
  final String title;
  final IconData icon;
  final String image;
  final String route;

  GridItem(
      {required this.title,
      required this.icon,
      required this.image,
      required this.route});
}
