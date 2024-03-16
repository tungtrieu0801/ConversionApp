import 'package:convert_input/utils/support.dart';
import 'package:convert_input/widgets/button_panel.dart';
import 'package:convert_input/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../convert/bloc.dart';
import '../convert/event.dart';
import '../convert/state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  late String _selectedButtonName = "Hex";

  @override
  Widget build(BuildContext context) {
    final TextBloc textBloc = BlocProvider.of<TextBloc>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "Convert App",
          style: AppWidget.bigText(),
        ),
        leading: const Icon(Icons.star),
        backgroundColor: backgroundColor,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.person),
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: _textController,
              onChanged: (text) {
                textBloc.add(TextChanged(newText: text));
              },
              style: const TextStyle(fontSize: 30),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 20, left: 20),
                border: InputBorder.none,
                hintText: "Nhập văn bản",
                hintStyle: AppWidget.normal(),
              ),
            ),
            BlocBuilder<TextBloc, TextState>(
              builder: (context, state) {
                if (state is TextUpdated) {
                  String resultText = '';
                  switch (_selectedButtonName) {
                    case "Hex":
                      resultText = state.hexText;
                      break;
                    case "Base64":
                      resultText = state.base64Text;
                      break;
                    case "Binary":
                      resultText = state.binaryText;
                      break;
                    default:
                      resultText = '';
                  }
                  return Column(
                    children: [
                      Text(
                        'Kết quả: $resultText',
                        style: AppWidget.normal(),
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
            ButtonPanel(
              onButtonSelected: (value) {
                setState(() {
                  _selectedButtonName = value;
                });
              },
              textController: _textController,
            ),
          ],
        ),
      ),
    );
  }
}





