import 'package:flutter/material.dart';

class ChargingHistoryScreen extends StatefulWidget {
  @override
  _ChargingHistoryScreenState createState() => _ChargingHistoryScreenState();
}

class _ChargingHistoryScreenState extends State<ChargingHistoryScreen> {
  final List<Map<String, String>> _chargingHistory = [
    {
      'station': 'Downtown Charging Hub',
      'date': '2023-08-15',
      'duration': '2 hours',
      'energy': '45 kWh'
    },
    {
      'station': 'Suburb EV Station',
      'date': '2023-08-10',
      'duration': '1.5 hours',
      'energy': '30 kWh'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charging History'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: _chargingHistory.isEmpty
          ? const Center(
        child: Text(
          'No charging history available.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _chargingHistory.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final history = _chargingHistory[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(Icons.bolt, color: Colors.blue, size: 30),
              title: Text(
                history['station']!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('📅 Date: ${history['date']}'),
                  Text('⏳ Duration: ${history['duration']}'),
                  Text('⚡ Energy Used: ${history['energy']}'),
                ],
              ),
              trailing: const Icon(Icons.history, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}