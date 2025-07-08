import 'package:flutter/material.dart';
import 'appointment_page.dart';

class BarberListPage extends StatelessWidget {
  const BarberListPage({Key? key}) : super(key: key);

  final barbers = const ['Carlos', 'Maria', 'João', 'Lucia'];

  void _openAppointments(BuildContext context, String barber) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AppointmentPage(barber: barber)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Barbeiros')),
      body: ListView.builder(
        itemCount: barbers.length,
        itemBuilder: (context, index) {
          final barber = barbers[index];
          return ListTile(
            title: Text(barber),
            onTap: () => _openAppointments(context, barber),
          );
        },
      ),
    );
  }
}
