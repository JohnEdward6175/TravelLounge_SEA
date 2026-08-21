import 'package:flutter/material.dart';

class BasicCalculator extends StatefulWidget {
  const BasicCalculator({super.key});

  @override
  State<BasicCalculator> createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  String _display = '';
  String _operator = '';
  double? _firstOperand;

  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _display = '';
        _operator = '';
        _firstOperand = null;
      } else if (value == '+' || value == '-' || value == '×' || value == '÷') {
        if (_display.isNotEmpty) {
          _firstOperand = double.tryParse(_display);
          _operator = value;
          _display = '';
        }
      } else if (value == '=') {
        if (_display.isNotEmpty && _firstOperand != null) {
          double? secondOperand = double.tryParse(_display);
          double? result;
          if (secondOperand != null) {
            switch (_operator) {
              case '+':
                result = _firstOperand! + secondOperand;
                break;
              case '-':
                result = _firstOperand! - secondOperand;
                break;
              case '×':
                result = _firstOperand! * secondOperand;
                break;
              case '÷':
                result = secondOperand != 0 ? _firstOperand! / secondOperand : null;
                break;
            }
          }
          _display = result != null ? result.toString() : 'Error';
          _operator = '';
          _firstOperand = null;
        }
      } else {
        _display += value;
      }
    });
  }

  Widget _buildButton(String text, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _onPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey.shade200,
            padding: const EdgeInsets.all(20),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              color: color == null ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black26)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Display
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Text(
              _display,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          // Buttons
          Column(
            children: [
              Row(
                children: [
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('÷', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton('×', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('-', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('0'),
                  _buildButton('C', color: Colors.red),
                  _buildButton('=', color: Colors.green),
                  _buildButton('+', color: Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
