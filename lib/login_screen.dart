import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/data_line.dart';

final _backgroundColor = Colors.white;
final _padding = EdgeInsets.all(8.0);

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<DataLine> _datalines = [];
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  bool _nameValidate = false;
  bool _passValidate = false;

  @override
  void dispose() {
    _nameController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final input = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: _padding,
            child: TextField(
              controller: _nameController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100 / 8)),
                  labelStyle: Theme.of(context).textTheme.headline5,
                  labelText: 'Username',
                  errorText: _nameValidate ? 'Value can\'t be empty ' : null),
            )),
        Padding(
            padding: _padding,
            child: TextField(
              controller: _passController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100 / 8)),
                  labelStyle: Theme.of(context).textTheme.headline5,
                  labelText: 'Password',
                  errorText: _passValidate ? 'Value can\'t be empty ' : null),
            )),
      ],
    );

    final button = Padding(
      padding: _padding,
      child: FlatButton(
        color: Color(0xFFFF98B1),
        onPressed: _addPressed,
        child: Text(
          'ADD',
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100 / 8)),
      ),
    );

    final output = Expanded(child: _buildDataLineWidgets());

    return Scaffold(
      body: Container(
        color: _backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [input, button, output],
        ),
      ),
    );
  }

  void _addPressed() {
    setState(() {
      _nameValidate = _nameController.text.isEmpty;
      _passValidate = _dada5 dapassController.text.isEmpty;
      if (_nameValidate == false && _passValidate == false) {
        _datalines.add(DataLine(
          username: _nameController.text,
          password: _passController.text,
        ));
      }
    });
  }

  Widget _buildDataLineWidgets() {
    if (_datalines.length == 0) return Text('List is empty');
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) => _datalines[index],
        itemCount: _datalines.length);
  }
}
