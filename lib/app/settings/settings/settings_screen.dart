import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFF0F2027),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildProfileSection(),
          SizedBox(height: 30),
          _buildSettingsOption(
            context,
            icon: Icons.account_circle,
            title: 'Account',
            subtitle: 'Manage your account settings',
            onTap: () {
              // Navigate to Account Settings screen
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Manage your notifications preferences',
            onTap: () {
              // Navigate to Notifications Settings screen
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.lock,
            title: 'Privacy',
            subtitle: 'Manage your privacy settings',
            onTap: () {
              // Navigate to Privacy Settings screen
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.payment,
            title: 'Payment Methods',
            subtitle: 'Manage your payment methods',
            onTap: () {
              // Navigate to Payment Methods screen
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.language,
            title: 'Language',
            subtitle: 'Select your preferred language',
            onTap: () {
              // Navigate to Language Settings screen
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.help,
            title: 'Help & Support',
            subtitle: 'Get help or contact support',
            onTap: () {
              // Navigate to Help & Support screen
            },
          ),
          _buildSettingsOption(
            context,
            icon: Icons.logout,
            title: 'Logout',
            subtitle: 'Sign out of your account',
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF203A43)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF203A43)),
        onTap: onTap,
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Perform logout action here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You have been logged out'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SettingsScreen(),
  ));
}
