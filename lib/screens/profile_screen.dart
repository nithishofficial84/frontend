import 'package:flutter/material.dart';
import './login_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User  Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Implement edit profile functionality
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: const NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV3qb8wn1yQpxeYXYwm6Xgl4p74cdx2WrT4PxsDcVgL1bcOtucF3krKKU8jJj7sm99muroRR7rdsynELQEwLCbCg',
              ),
              onBackgroundImageError: (_, __) => const Icon(Icons.person, size: 60),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nithish Karthik T',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'nithishkarthik@student.tce.edu',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            _buildSection('Profile Information', [
              _buildProfileRow(Icons.phone, 'Phone', '7010259919'),
              _buildProfileRow(Icons.location_city, 'City', 'Madurai, Tamil Nadu'),
              _buildProfileRow(Icons.card_membership, 'Membership', 'Premium User'),
            ]),
            const SizedBox(height: 20),
            _buildSection('Electric Vehicle Details', [
              _buildProfileRow(Icons.car_rental, 'Model', 'Tesla Model 3'),
              _buildProfileRow(Icons.battery_charging_full, 'Battery Capacity', '75 kWh'),
              _buildProfileRow(Icons.speed, 'Range', '350 miles'),
            ]),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to EditProfileScreen using MaterialPageRoute
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Logout', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}