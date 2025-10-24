import 'package:flutter/material.dart';

class NotifPage extends StatefulWidget {
  const NotifPage({super.key});

  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        color: const Color(0xFFEFF8FF),
        child: Column(
          children: [
            const SizedBox(height: 6),

            _sectionHeader('Today'),

            _notifRow(
              imgPath: 'assets/profile/prof1.jpg',
              title: 'Emmanuele mentioned you and other followers in a comment',
              time: '14d',
              overlayIcon: Icons.chat,
            ),
            _notifRow(
              imgPath: 'assets/profile/prof2.jpg', 
              title: 'MetalCore Fitness recently shared 2 posts',
              time: '15d',
              overlayIcon: Icons.menu_book,
            ),
            _notifRow(
              imgPath: 'assets/profile/prof3.jpg', 
              title: 'Contreras Commented on your post',
              time: '10d',
              overlayIcon: Icons.notifications,
            ),

            const SizedBox(height: 4),
            _sectionHeader('Earlier'),

            _notifRow(
              imgPath: 'assets/profile/prof4.jpg', 
              title: 'Rdz posted a video on your timeline',
              time: '15d',
              overlayIcon: Icons.chat,
            ),
            _notifRow(
              imgPath: 'assets/profile/prof5.jpg', 
              title: 'Hybrid Fitness Lab Iloilo recently shared 1 post',
              time: '16d',
              overlayIcon: Icons.menu_book,
            ),
            _notifRow(
              imgPath: 'assets/profile/prof1.jpg', 
              title: 'Jamir reacted to your story',
              time: '17d',
              overlayIcon: Icons.favorite,
            ),

            const SizedBox(height: 8),
            _seePreviousButton(),
          ],
        ),
      ),
    );
  }

  
  Widget _sectionHeader(String text) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }

  
  Widget _notifRow({
    required String imgPath,
    required String title,
    required String time,
    IconData? overlayIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(imgPath),
                backgroundColor: Colors.white70,
              ),
              if (overlayIcon != null)
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: _overlayColorForIcon(overlayIcon),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    child: Icon(overlayIcon, size: 10, color: Colors.white),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 10),

        
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey[700], fontSize: 11),
                ),
              ],
            ),
          ),

          
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFFEFF8FF),
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: const Text(
              '...',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _seePreviousButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: const Text(
            'See previous notifications',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

 
  Color _overlayColorForIcon(IconData icon) {
    if (icon == Icons.chat) return Colors.green;
    if (icon == Icons.menu_book) return Colors.blue;
    if (icon == Icons.notifications) return Colors.grey;
    if (icon == Icons.favorite) return Colors.red;
    return Colors.blueGrey;
  }
}
