import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  final String barber;
  const AppointmentPage({Key? key, required this.barber}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _pickDate() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 60)),
    );
    if (date != null) {
      setState(() => _selectedDate = date);
    }
  }

  void _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() => _selectedTime = time);
    }
  }

  void _pay() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Pagamento'),
        content: const Text('Funcionalidade de pagamento não implementada.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _confirm() {
    final date = _selectedDate != null
        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
        : '';
    final time = _selectedTime?.format(context) ?? '';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Agendado com ${widget.barber} em $date às $time')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final dateText = _selectedDate != null
        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
        : 'Selecionar data';
    final timeText = _selectedTime != null
        ? _selectedTime!.format(context)
        : 'Selecionar horário';
    return Scaffold(
      appBar: AppBar(title: Text('Agendar - ${widget.barber}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(onPressed: _pickDate, child: Text(dateText)),
            ElevatedButton(onPressed: _pickTime, child: Text(timeText)),
            ElevatedButton(onPressed: _pay, child: const Text('Pagar agora')),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _confirm, child: const Text('Confirmar')),
          ],
        ),
      ),
    );
  }
}
