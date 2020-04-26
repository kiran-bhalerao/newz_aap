import 'package:flutter/material.dart';
import 'package:newz_aap/screens/Details.dart';
import 'package:newz_aap/widgets/news_card.dart';
import 'package:newz_aap/widgets/tab_item.dart';

class HomeScreen extends StatefulWidget {
  static const routerName = '/heme';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeTab = 0;

  onTabChange(int index) {
    setState(() {
      activeTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 70, 22, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Daily News',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Monday, 20 Jul 2020',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 220 - 60,
                  child: Center(
                      child: Text(
                    'That\'s all folks 🤪',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
                ),
                NewsCard(
                  tag: 'Netflix',
                  name:
                      'US teen suicide rate rose 13% in months after Netflix\'s 13 Reasons Why',
                  img: 'assets/thirteen.jpg',
                  onClick: () =>
                      Navigator.of(context).pushNamed(DetailScreen.routerName),
                ),
                NewsCard(
                  tag: 'Netflix',
                  name: 'Narcos: Who is Chepe in Narcos? Was he a real person?',
                  img: 'assets/narcos.jpg',
                  onClick: () =>
                      Navigator.of(context).pushNamed(DetailScreen.routerName),
                ),
                NewsCard(
                  tag: 'Netflix',
                  name:
                      'Mumbai Police gets Professor to ask people to stay home.',
                  img: 'assets/money_heist.jpg',
                  onClick: () =>
                      Navigator.of(context).pushNamed(DetailScreen.routerName),
                ),
                NewsCard(
                  tag: 'Netflix',
                  name:
                      'Stranger Things season 4 has been confirmed by Netflix.',
                  img: 'assets/stranger.jpg',
                  onClick: () =>
                      Navigator.of(context).pushNamed(DetailScreen.routerName),
                ),
              ],
            ),
            Container(
              height: 80,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TabItem(
                    name: 'Home',
                    icon: Icons.home,
                    activeTab: activeTab,
                    index: 0,
                    onTabChange: onTabChange,
                  ),
                  TabItem(
                    name: 'Search',
                    icon: Icons.search,
                    activeTab: activeTab,
                    index: 1,
                    onTabChange: onTabChange,
                  ),
                  TabItem(
                    name: 'Bookmark',
                    icon: Icons.bookmark,
                    activeTab: activeTab,
                    index: 2,
                    onTabChange: onTabChange,
                  ),
                  TabItem(
                    name: 'Profile',
                    icon: Icons.person,
                    activeTab: activeTab,
                    index: 3,
                    onTabChange: onTabChange,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
