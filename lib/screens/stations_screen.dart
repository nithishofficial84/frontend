import 'package:flutter/material.dart';

class StationsScreen extends StatefulWidget {
  @override
  _StationsScreenState createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  final List<Map<String, dynamic>> _chargingStations = [
    {
      'name': 'Zeon Charging Station',
      'address': 'JC Residency',
      'distance': '2.3 km',
      'availability': 'Available',
      'ports': 4,
      'rating': 4.5,
      'type': ['Type 2', 'CCS'],
    },
    {
      'name': 'Tucker Charging Station',
      'address': 'Melur Main Road',
      'distance': '4.7 km',
      'availability': 'Busy',
      'ports': 2,
      'rating': 4.2,
      'type': ['Type 1', 'CHAdeMO'],
    },
    {
      'name': 'Charging Zone Station',
      'address': 'Alagar Kovil',
      'distance': '6.5 km',
      'availability': 'Limited',
      'ports': 3,
      'rating': 4.7,
      'type': ['Type 2', 'CCS', 'Tesla'],
    },
    {
      'name': 'Highway Fast Charge',
      'address': 'Royal Court',
      'distance': '12.1 km',
      'availability': 'Available',
      'ports': 6,
      'rating': 4.8,
      'type': ['CCS', 'CHAdeMO', 'Tesla'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Charging Stations')),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _chargingStations.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final station = _chargingStations[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                station['name'],
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(station['address']),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text(station['distance']),
                      const SizedBox(width: 10),
                      const Icon(Icons.electric_car, size: 16, color: Colors.green),
                      const SizedBox(width: 4),
                      Text('${station['ports']} Ports'),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 6,
                    children: (station['type'] as List<String>).map((type) {
                      return Chip(
                        label: Text(type, style: const TextStyle(fontSize: 10)),
                        backgroundColor: Colors.blue[100],
                      );
                    }).toList(),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    station['availability'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _getAvailabilityColor(station['availability']),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(station['rating'].toString()),
                    ],
                  ),
                ],
              ),
              onTap: () => Navigator.pushNamed(context, '/charging_details'),
            ),
          );
        },
      ),
    );
  }

  Color _getAvailabilityColor(String availability) {
    switch (availability) {
      case 'Available':
        return Colors.green;
      case 'Limited':
        return Colors.orange;
      case 'Busy':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
