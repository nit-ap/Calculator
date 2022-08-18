import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'components/buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var userInput = '';
  var answer = '';
  var temp = '';
  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild');
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          const Align( alignment: Alignment.topLeft,
                              child: Text('Expression', style: TextStyle(fontSize: 15, color: kWhite))
                          ),
                          Align(alignment: Alignment.topLeft,
                              child: Text(temp.toString(), style: const TextStyle(fontSize: 18, color: kWhite)))
                        ],),
                      const SizedBox(height: 50),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(userInput.toString(), style: const TextStyle(fontSize: 20, color: kWhite)),),
                      const SizedBox(height: 20),
                      Text(answer.toString(), style: const TextStyle(fontSize: 19, color: kWhite)),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    // const SizedBox(height: 10),
                    Row(
                      children: [
                        Button(tile: 'AC', onPress: (){
                          // debugPrint('tap');
                          userInput = '';
                          answer = '';
                          temp = '';
                          setState(() {});
                        }, w: FontWeight.normal, size: 25),
                        Button(tile: '±', onPress: () {
                          double num = double.parse(userInput);
                          num = num * (-1);
                          userInput = num.toString();
                          setState(() {});
                        }
                        ),
                        Button(tile: '%', onPress: () {
                          userInput += '%';
                          setState(() {});
                        }, size: 28),
                        Button(tile: '/', onPress: () {
                          userInput += '/';
                          setState(() {});
                        }, size: 25),
                      ],
                    ),
                    Row(
                    children: [
                      Button(tile: '7', color: kWhite, onPress: () {
                        userInput += '7';
                        setState(() {});
                      }),
                      Button(tile: '8', color: kWhite, onPress: () {
                        userInput += '8';
                        setState(() {});
                      }),
                      Button(tile: '9', color: kWhite, onPress: () {
                        userInput += '9';
                        setState(() {});
                      },),
                      Button(tile: 'x', onPress: () {
                        userInput += 'x';
                        setState(() {});
                      }),
                    ],
                    ),
                    Row(
                      children: [
                        Button(tile: '4', color: kWhite, onPress: () {
                          userInput += '4';
                          setState(() {});
                        }),
                        Button(tile: '5', color: kWhite, onPress: () {
                          userInput += '5';
                          setState(() {});
                        }),
                        Button(tile: '6', color: kWhite, onPress: () {
                          userInput += '6';
                          setState(() {});
                        },),
                        Button(tile: '-', onPress: () {
                          userInput += '-';
                          setState(() {});
                        }),
                      ],
                    ),
                    Row(
                      children: [
                        Button(tile: '1', color: kWhite, onPress: () {
                          userInput += '1';
                          setState(() {});
                        }),
                        Button(tile: '2', color: kWhite, onPress: () {
                          userInput += '2';
                          setState(() {});
                        }),
                        Button(tile: '3', color: kWhite, onPress: () {
                          userInput += '3';
                          setState(() {});
                        },),
                        Button(tile: '+', onPress: () {
                          userInput += '+';
                          setState(() {});
                        }),
                      ],
                    ),
                    Row(
                      children: [
                        Button(tile: '0', color: kWhite, onPress: () {
                          userInput += '0';
                          setState(() {});
                        }),
                        Button(tile: '.', color: kWhite, onPress: () {
                          userInput += '.';
                          setState(() {});
                        }, size: 35),
                        Button(tile: 'DEL', color: kWhite, onPress: () {
                          userInput = userInput.substring(0, userInput.length - 1);
                          setState(() {});
                        }, w: FontWeight.normal, size: 25),
                        Button(tile: '=', onPress: () {
                          equalPress();
                          temp = userInput;
                          userInput = answer;
                          answer = userInput;
                          setState(() {});
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  void equalPress() {

    String finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double calculate = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = calculate.toString();
  }
}
