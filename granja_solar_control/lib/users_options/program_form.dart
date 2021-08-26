import 'package:flutter/material.dart';

class ProgramForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Formulario Programación';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Crea un Widget Form
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyCustomFormState extends State<MyCustomForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Ingrese la fecha';
              }
            },
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Ingrese líder grupo';
              }
            },
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Ingrese cantidad integrantes grupo';
              }
            },
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Ingrese cantidad de metros a instalar';
    }
            },
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Ingrese cantidad cable recibido';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // devolverá true si el formulario es válido, o falso si
                // el formulario no es válido.
                if (_formKey.currentState.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Enviando Programación')));
                }
              },
              child: Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }
}