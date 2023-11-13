import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class GoogleSwitch extends StatefulWidget {
  final Function(bool) onToggle; // Change this line
  final bool status;
  final String activeText;
  final String inactiveText;

  GoogleSwitch({
    super.key,
    required this.onToggle,
    required this.status,
    this.activeText = "",
    this.inactiveText = "",
  });

  @override
  State<GoogleSwitch> createState() => _GoogleSwitchState();
}

class _GoogleSwitchState extends State<GoogleSwitch> {
  void _handleToggle(bool newValue) {
    widget.onToggle(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      toggleColor: Colors.green.shade100,
      inactiveColor: Colors.black54,
      inactiveToggleColor: Colors.grey.shade400,
      activeColor: Colors.green.shade800,
      activeText: widget.activeText,
      inactiveText: widget.inactiveText,
      height: 30,
      width: 64,
      valueFontSize: 14,
      toggleSize: 24,
      value: widget.status,
      borderRadius: 30.0,
      padding: 3.5,
      showOnOff: true,
      onToggle: _handleToggle,
    );
  }
}