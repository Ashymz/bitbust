import 'package:bitbust/pages/onboarding/navbar_items/deals.dart';
import 'package:bitbust/pages/onboarding/navbar_items/favourite.dart';
import 'package:bitbust/pages/onboarding/navbar_items/home.dart';
import 'package:bitbust/pages/onboarding/navbar_items/profile.dart';
import 'package:bitbust/pages/onboarding/navbar_items/wallet.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  final int? tab;
  const Navbar({Key? key, this.tab}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late int currentTab = widget.tab ?? 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentTab);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentTab = index;
            });
          },
          children: [
            // HomeScreen(),
            // WalletScreen(),
            // DealsScreen(),
            // FavoritesScreen(),
            HomeScreen(),
            Wallet(),
            Deals(),
            Favourite(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          buildNavBarItem(Icons.home, 0, 'Home'),
          buildNavBarItem(Icons.wallet_travel, 1, 'Wallet'),
          buildNavBarItem(Icons.shopping_bag, 2, 'Deals'),
          buildNavBarItem(Icons.bookmark, 3, 'Favorites'),
          buildNavBarItem(Icons.person, 4, 'Profile'),
        ],
      ),
    );
  }

  GestureDetector buildNavBarItem(IconData icon, int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentTab = index;
          _pageController.jumpToPage(index);
        });
      },
      child: Container(
        padding: const EdgeInsets.only(top: 16),
        width: MediaQuery.of(context).size.width / 5,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.1)),
            bottom: BorderSide(
              width: 4,
              color: index == currentTab ? Colors.black : Colors.white,
            ),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: index == currentTab ? Colors.black : Colors.black,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: index == currentTab ? Colors.black : Colors.black,
                fontWeight:
                    index == currentTab ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
