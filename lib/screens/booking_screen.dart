import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  final List<Map<String, dynamic>> _chargingStations = [
    {
      'name': 'Zeon Charging Station',
      'location': 'JC Residency, Madurai',
      'slots': 3,
    },
    {
      'name': 'Relux EV Charging',
      'location': 'Mattuthavani Bus Stand, Madurai',
      'slots': 5,
    },
    {
      'name': 'Tata Power Charging Station',
      'location': 'Goripalayam, Madurai',
      'slots': 2,
    },
    {
      'name': 'ChargeZone Fast Charging',
      'location': 'Anna Nagar, Madurai',
      'slots': 4,
    },
    {
      'name': 'Statiq EV Charging',
      'location': 'Madurai Railway Junction',
      'slots': 6,
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Charging Station')),
      body: FadeTransition(
        opacity: _animation,
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: _chargingStations.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final station = _chargingStations[index];
            return OpenContainer(
              closedElevation: 4,
              closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              clipBehavior: Clip.antiAlias,
              transitionType: ContainerTransitionType.fadeThrough,
              closedBuilder: (context, action) => Card(
                child: ListTile(
                  title: Text(
                    station['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(station['location']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.ev_station, color: Colors.blue),
                      Text(' ${station['slots']} Slots'),
                    ],
                  ),
                  onTap: action,
                ),
              ),
              openBuilder: (context, action) =>
                  StationDetailsPage(station: station),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class StationDetailsPage extends StatelessWidget {
  final Map<String, dynamic> station;

  const StationDetailsPage({Key? key, required this.station}) : super(key: key);

  void _confirmBooking(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Booking'),
          content: Text('Do you want to book a charging slot at ${station['name']}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Booking confirmed at ${station['name']}'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(station['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Location: ${station['location']}',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _confirmBooking(context),
              icon: const Icon(Icons.check_circle),
              label: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
