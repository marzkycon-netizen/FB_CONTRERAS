import 'package:facebook/page/friends.dart';
import 'package:facebook/page/marketplace.dart';
import 'package:facebook/page/newsfeed.dart';
import 'package:facebook/page/notif.dart';
import 'package:facebook/page/profile.dart';
import 'package:facebook/page/reels.dart';
import 'package:flutter/material.dart';

class MaincustomPage extends StatefulWidget {
  const MaincustomPage({super.key});

  @override
  State<MaincustomPage> createState() => _MaincustomPageState();
}

class _MaincustomPageState extends State<MaincustomPage> {
  int currentPage =0;

  List pages = [
    const Newsfeed(),
    const ReelsPage(),
    const FriendsPage(),
    const MarketplacePage(),
    const NotifPage(),
    const ProfilePage(),
  ];

  void onTap(int index){
    setState(() {
      currentPage = index;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        onTap:  onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.ondemand_video), label: "Reels"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Friends"),
          BottomNavigationBarItem(icon: Icon(Icons.local_convenience_store), label: "Marketplace"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: AssetImage("assets/profile/prof4.jpg"),), label: "profile"),
        ],

      ),
    );
  }
}