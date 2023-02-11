import 'package:calculator_task/calculator_button.dart';
import 'package:calculator_task/calculator_provider.dart';
import 'package:calculator_task/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white54,
          body: Container(
            color: Colors.white54,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  //flex: 1,
                  // flex: (MediaQuery.of(context).size.height * (1 / 3)).toInt(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        //  color: Colors.red,
                        alignment: Alignment.bottomRight,
                        child: Text(provider.input,
                            style: const TextStyle(fontSize: 50),
                            overflow: TextOverflow.ellipsis),
                      ),
                      Container(
                        //  color: Colors.green,
                        alignment: Alignment.bottomRight,
                        child: Text(provider.output.toString(),
                            style: const TextStyle(fontSize: 40),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.deepPurple),
                Expanded(
                  flex: 3,
                  // flex: (MediaQuery.of(context).size.height * (2 / 3)).toInt(),
                  child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 4 / 3,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: double.infinity,
                        alignment: Alignment.bottomCenter,
                        child: CalculatorButton(
                          color: isOperator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.white54,
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                          buttonText: buttons[index],
                          function: () {
                            if (isOperator(buttons[index])) {
                              provider.secondNumberFlag = true;
                              provider.operator = buttons[index];
                              provider.operation();
                            } else {
                              if (provider.flag) {
                                provider.secondNumber = buttons[index];
                              } else {
                                provider.firstNumber = buttons[index];
                              }
                              provider.input = buttons[index];
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

bool isOperator(String text) {
  if (text == '%' ||
      text == '/' ||
      text == '*' ||
      text == '-' ||
      text == '+' ||
      text == '=' ||
      text == 'C' ||
      text == 'DEL') {
    return true;
  } else {
    return false;
  }
}
