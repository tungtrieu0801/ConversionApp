import 'package:flutter/material.dart';

import '../screens/select_screen.dart';

class ButtonPanel extends StatefulWidget {
  final Function(String) onButtonSelected;
  final TextEditingController textController;

  const ButtonPanel({
    required this.onButtonSelected,
    required this.textController,
    Key? key,
  }) : super(key: key);

  @override
  _ButtonPanelState createState() => _ButtonPanelState();
}

class _ButtonPanelState extends State<ButtonPanel> {
  bool _toggleState = false;
  String _selectedButtonName = "Hex";

  void _toggleButtons() {
    setState(() {
      _toggleState = !_toggleState;
      if (_toggleState) {
        _selectedButtonName = "Hex";
        widget.onButtonSelected(_selectedButtonName);
        widget.onButtonSelected('');
        widget.textController.clear();
      }
    });
  }

  void _updateSelectedButton(String buttonName) {
    setState(() {
      _selectedButtonName = buttonName;
    });
    widget.onButtonSelected(buttonName);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _toggleState
            ? TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectScreen(
                        onButtonSelected: _updateSelectedButton,
                        key: const ValueKey('unique_key'),
                      ),
                    ),
                  );
                },
                child: Text(_selectedButtonName),
              )
            : TextButton(
                onPressed: () {},
                child: const Text('String'),
              ),
        TextButton(
          onPressed: _toggleButtons,
          child: Image.asset(
            'lib/assets/images/swap.png',
            width: 30,
            height: 30,
          ),
        ),
        _toggleState
            ? TextButton(
                onPressed: () {},
                child: const Text('String'),
              )
            : TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectScreen(
                        onButtonSelected: _updateSelectedButton,
                        key: const ValueKey('unique_key'),
                      ),
                    ),
                  );
                },
                child: Text(_selectedButtonName),
              ),
      ],
    );
  }
}
