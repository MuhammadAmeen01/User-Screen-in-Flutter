import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Screen'),
          actions: [
            IconButton(
              icon: Icon(_isDarkModeEnabled ? Icons.wb_sunny : Icons.nightlight_round),
              onPressed: () {
                setState(() {
                  _isDarkModeEnabled = !_isDarkModeEnabled;
                });
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/user_image.jpg'),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Text(
                  'Muhammad Ameen',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'khanamen59@example.com',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildUpgradeToProButton(),
            SizedBox(height: 20),
            Expanded(
              child: Center(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: 6,
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    return _buildMenuButton(
                      icon: _getButtonIcon(index),
                      label: _getButtonLabel(index),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpgradeToProButton() {
    return InkWell(
      onTap: () {
        // Handle upgrade to pro button tap
      },
      child: Container(
        width: 220,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.orange,
        ),
        child: Center(
          child: Text(
            'Upgrade to Pro',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton({required IconData icon, required String label}) {
    if (label == 'Logout') {
      return InkWell(
        onTap: () {
          // Handle logout button tap
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          // Handle button tap
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(30),
            color: Colors.black12,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 30,
              ),
              SizedBox(width: 20),
              Text(
                label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 13,
              ),
            ],
          ),
        ),
      );
    }
  }

  String _getButtonLabel(int index) {
    switch (index) {
      case 0:
        return 'Privacy';
      case 1:
        return 'Purchase History';
      case 2:
        return 'Help & Support';
      case 3:
        return 'Settings';
      case 4:
        return 'Invite a Friend';
      case 5:
        return 'Logout';
      default:
        return '';
    }
  }

  IconData _getButtonIcon(int index) {
    switch (index) {
      case 0:
        return Icons.privacy_tip;
      case 1:
        return Icons.shopping_cart;
      case 2:
        return Icons.help;
      case 3:
        return Icons.settings;
      case 4:
        return Icons.person_add;
      case 5:
        return Icons.logout;
      default:
        return Icons.error;
    }
  }
}

void main() {
  runApp(UserScreen());
}
