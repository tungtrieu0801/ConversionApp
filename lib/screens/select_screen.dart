import 'package:convert_input/utils/constant.dart';
import 'package:convert_input/utils/support.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  final Function(String) onButtonSelected;
  const SelectScreen({required Key key, required this.onButtonSelected}) : super(key: key);

  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  String _selectedOption = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                Icon(Icons.search),
              ],
            ),
          )
        ],
      ),
      body: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Chuyển đổi sang",
              style: AppWidget.bigText(),
            ),
            const SizedBox(height: 50),
            _buildOptionButton("Hex"),
            const SizedBox(height: 10),
            _buildOptionButton("Base64"),
            const SizedBox(height: 10),
            _buildOptionButton("Binary"),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(String option) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: _selectedOption == option ? Colors.blue : Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () {
          widget.onButtonSelected(option);
          setState(() {
            _selectedOption = option;
          });
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pop(context, option);
          });
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            _selectedOption == option ? Colors.white : Colors.black,
          ),
        ),
        child: Row(
          children: [
            if (_selectedOption == option) const Icon(Icons.check),
            SizedBox(width: _selectedOption == option ? 10 : 0),
            Text(option),
          ],
        ),
      ),
    );
  }
}
