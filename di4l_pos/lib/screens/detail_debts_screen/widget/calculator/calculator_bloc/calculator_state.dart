part of 'calculator_bloc.dart';

// ignore: must_be_immutable
class CalculatorState extends Equatable {
  // const CalculatorState();
  static const operations = const ['÷', 'x', '-', '+', '=', 'OK', '⌫'];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? _operation;
  String _value = '0';
  bool _wipeValue = false;
  String? _lastCommand;

  void applyCommand(String command) {
    if (_isReplacingOperation(command)) {
      _operation = command;
      return;
    }

    if (command == 'C') {
      _allClear();
    } else if (command == '⌫') {
      _backSpace();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
    _lastCommand = command;
  }

  bool _isReplacingOperation(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  void _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=' && newOperation == 'OK';
    if (_bufferIndex == 0) {
      if (!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;
        _wipeValue = true;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;
      _operation = isEqualSign ? null : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;
    }
    _wipeValue = !isEqualSign;
  }

  void _addDigit(String digit) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;
    if (isDot && _value.contains('.') && !wipeValue) {
      return;
    }
    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  void _allClear() {
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
    _wipeValue = false;
  }

  void _backSpace() {
    if (_value.isNotEmpty) {
      _value = _value.substring(0, _value.length - 1);
      // _value = currentValue;
      _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
    } else {
      _value = '0';
      _buffer.setAll(0, [0.0, 0.0]);
      _bufferIndex = 0;
      _operation = null;
      _wipeValue = false;
    }
    // _value = currentValue;
    // _wipeValue = false;
    // _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  double _calculate() {
    switch (_operation) {
      case '÷':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  String get value {
    return _value;
  }

  @override
  List<Object> get props => [_value];
}

// ignore: must_be_immutable
class CalculatorInitial extends CalculatorState {}
