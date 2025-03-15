import 'package:ev_charging_app/screens/about_screen.dart';
import 'package:ev_charging_app/screens/change_password_screen.dart';
import 'package:ev_charging_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle('Account Settings'),
            _buildListTile(
              context,
              title: 'Profile',
              icon: Icons.person,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
                // Navigate to Profile Settings
              },
            ),
            _buildListTile(
              context,
              title: 'Change Password',
              icon: Icons.lock,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                );
                // Navigate to Change Password Screen
              },
            ),
            const Divider(),

            _buildSectionTitle('App Settings'),
            _buildSwitchTile(
              context,
              title: 'Notifications',
              icon: Icons.notifications,
              value: true, // Replace with actual value from state management
              onChanged: (value) {
                // Handle notification toggle
              },
            ),
            _buildSwitchTile(
              context,
              title: 'Dark Mode',
              icon: Icons.dark_mode,
              value: false, // Replace with actual value from state management
              onChanged: (value) {
                // Handle dark mode toggle
              },
            ),
            const Divider(),

            _buildSectionTitle('About'),
            _buildListTile(
              context,
              title: 'Help & Support',
              icon: Icons.help,
              onTap: () {

                // Navigate to Help & Support Screen
              },
            ),
            _buildListTile(
              context,
              title: 'About App',
              icon: Icons.info,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
                // Navigate to About App Screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(BuildContext context, {required String title, required IconData icon, required bool value, required ValueChanged<bool> onChanged}) {
    return SwitchListTile(
      title: Text(title),
      secondary: Icon(icon),
      value: value,
      onChanged: onChanged,
    );
  }
}