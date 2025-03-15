import 'package:ev_charging_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'booking_screen.dart'; // Import your BookingScreen
import 'charging_history_screen.dart'; // Import your ChargingHistoryScreen
import 'navigation_screen.dart'; // Import your NavigationScreen
import 'profile_screen.dart'; // Import your ProfileScreen
import 'registration_screen.dart'; // Import your RegistrationScreen
import 'stations_screen.dart'; // Import your StationsScreen
import 'charging_details_screen.dart'; // Import the ChargingDetailsScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
      // Home - do nothing, already on HomeScreen
        break;
      case 1:
      // Navigate to Booking Screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookingScreen()),
        );
        break;
      case 2:
      // Navigate to Charging History Screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChargingHistoryScreen()),
        );
        break;
      case 3:
      // Navigate to Profile Screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
      case 4:
      // Navigate to Stations Screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StationsScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EV Charging Station'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
              // Navigate to settings (you can create a SettingsScreen if needed)
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildVehicleStatusCard(),
              SizedBox(height: 20),
              _buildNearbyStationsSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Stations',
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleStatusCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vehicle Status',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Battery Level: 75%', style: TextStyle(fontSize: 16)),
                    Text('Location: Parked', style: TextStyle(fontSize: 16)),
                    Text('Estimated Range: 250 km', style: TextStyle(fontSize: 16)),
                    Text('Charging Status: Not Charging', style: TextStyle(fontSize: 16)),
                  ],
                ),
                CircularProgressIndicator(
                  value: 0.75,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Logic to refresh vehicle status
              },
              child: Text('Refresh Status'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNearbyStationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nearby Charging Stations',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        _buildStationCard('Green Charging Station', '2.3 km away', '3 ports available', 'Open', Colors.green),
        _buildStationCard('City Center Charging', '4.7 km away', '1 port available', 'Busy', Colors.orange),
        _buildStationCard('Downtown EV Station', '1.5 km away', '5 ports available', 'Open', Colors.green),
        _buildStationCard('Airport Charging Hub', '10 km away', '2 ports available', 'Closed', Colors.red),
      ],
    );
  }

  Widget _buildStationCard(String name, String distance, String availability, String status, Color statusColor) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.ev_station, color: Colors.blue),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$distance - $availability'),
        trailing: Text(status, style: TextStyle(color: statusColor)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChargingDetailsScreen(
                stationName: name,
                distance: distance,
                availability: availability,
                batteryLevel: '75%', // Example battery level
              ),
            ),
          );
        },
      ),
    );
  }
}