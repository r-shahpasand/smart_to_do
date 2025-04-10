import 'package:flutter/material.dart';

class DatePickerButton extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String buttonText;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  const DatePickerButton({
    Key? key,
    required this.onDateSelected,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.buttonText = 'Select Date',
    this.buttonStyle,
    this.textStyle,
  }) : super(key: key);

  @override
  _DatePickerButtonState createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? widget.initialDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(2000),
      lastDate: widget.lastDate ?? DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: widget.buttonStyle,
      onPressed: () => _selectDate(context),
      child: Text(
        _selectedDate != null
            ? '${widget.buttonText}: ${_selectedDate!.toLocal()}'.split(' ')[0]
            : widget.buttonText,
        style: widget.textStyle,
      ),
    );
  }
}