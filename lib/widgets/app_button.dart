import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  Function _onClick;

  AppButton(this._onClick);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.content_copy),
            SizedBox(width: 10),
            Text(
              "Copiar código CSS",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        )
      ),
      color: Colors.white,
      onPressed: _onClick,
    );
  }
}
