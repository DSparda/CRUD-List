import 'package:flutter/material.dart';

final _rowHeight = 50.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 4);

class DataLine extends StatelessWidget {
  final String username;
  final String password;

  const DataLine({Key key, @required this.username, @required this.password})
      : assert(username != null),
        assert(password != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        decoration:
            BoxDecoration(borderRadius: _borderRadius, border: Border.all()),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(username, style: Theme.of(context).textTheme.headline5),
            Text(password, style: Theme.of(context).textTheme.headline5)
          ],
        ),
      ),
    );
  }
}
