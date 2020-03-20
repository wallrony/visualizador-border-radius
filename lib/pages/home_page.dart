import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:visualizador_de_border_radius/blocs/radius_bloc.dart';
import 'package:visualizador_de_border_radius/widgets/app_button.dart';
import 'package:visualizador_de_border_radius/widgets/app_input.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _radiusController = TextEditingController();
  final _radiusBloc = RadiusBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visualizador de Border Radius"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: <Widget>[
            AppInput(_radiusController, _onChangeRadius),
            SizedBox(height: 10),
            AppButton(_getCssToCripboard),
            SizedBox(height: 10),
            Flexible(
              child: StreamBuilder<double>(
                stream: _radiusBloc.radiusStream,
                builder: (context, snapshot) {
                  return Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(snapshot.data ?? 0),
                    ),
                  );
                }
              )
            )
          ],
        ),
      )
    );
  }

  _onChangeRadius(String value) {
    String validValue = "";

    for(var i = 0 ; i < value.length; i++) {
      if(value[i] != ',') {
        validValue += value[i];
      }
    }

    _radiusBloc.setRadiusStream = double.parse(validValue);
    _radiusController.text = validValue;
  }
  
  _getCssToCripboard() {
    Clipboard.setData(ClipboardData(text: "border-radius: ${_radiusController.text}px;"));
    Toast.show("CSS do border-radius copiado com sucesso!", context, duration: 3);
  }
}
