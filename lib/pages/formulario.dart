import 'package:flutter/material.dart';

class FormularioPage extends StatefulWidget {
  @override
  _FormularioPage createState() => _FormularioPage();
}

class _FormularioPage extends State<FormularioPage> {
  @override
  Widget build(BuildContext context) {
    final headerHeight = MediaQuery.of(context).size.height * 0.32;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            height: headerHeight,
            left: 0,
            right: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFE04148),
                    Color(0xFFD85774),
                    Color(0x3D0E75),
                  ],
                ),
              ),
            ),
          ),
          img(),
          Textosecundario(textosecundario: 'Lacey Fernandez'),
          Positioned(
            left: 10,
            right: 10,
            top: headerHeight / 1.2,
            bottom: 10,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextoPrincipal(textoPrincipal: 'USER PROFILE'),
                      SizedBox(height: 10),
                      Header(title: 'User Name'),
                      SizedBox(height: 5),
                      CajaName(),
                      Header(title: 'Email Id'),
                      SizedBox(height: 5),
                      CajaEmail(),
                      SizedBox(height: 18),
                      Header(title: 'Mobile Number'),
                      SizedBox(height: 5),
                      CajaTelefono(),
                      SizedBox(height: 18),
                      Header(title: 'Date of Bitth'),
                      SizedBox(height: 5),
                      CajaFecha(),
                      SizedBox(height: 18),
                      Header(title: 'Sex'),
                      SizedBox(height: 18),
                      switchFemale(),
                      switchMale(),
                      SizedBox(height: 18),
                      Boton1(texto1: 'SAVE'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Boton1 extends StatelessWidget {
  final String texto1;

  const Boton1({this.texto1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.pink[900], borderRadius: BorderRadius.circular(20)),
      child: Text(
        this.texto1,
        style: TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

Widget switchFemale() {
  return SwitchListTile(
    value: true,
    title: Text(
      'Female',
      style: TextStyle(
        fontSize: 14,
      ),
    ),
    onChanged: (val) {},
  );
}

Widget switchMale() {
  return SwitchListTile(
    value: true,
    title: Text(
      'Male',
      style: TextStyle(
        fontSize: 14,
      ),
    ),
    onChanged: (val) {},
  );
}

class CajaFecha extends StatefulWidget {
  @override
  _CajaFechaState createState() => _CajaFechaState();
}

class _CajaFechaState extends State<CajaFecha> {
  String cf = '';
  TextEditingController textControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      decoration: InputDecoration(
          prefixIcon:
              Icon(Icons.calendar_today_outlined, color: Colors.pink[900]),
          labelText: 'DD / MM / YYYY',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2022),
      initialDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {});
      cf = date.toString();
      textControler.text = cf;
    }
  }
}

class CajaTelefono extends StatefulWidget {
  @override
  _CajaTelefonoState createState() => _CajaTelefonoState();
}

class _CajaTelefonoState extends State<CajaTelefono> {
  String password = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone_android_outlined, color: Colors.pink[900]),
        labelText: "Enter your 10 digit mobile number",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onChanged: (valor) {
        password = valor;
        setState(() {});
      },
    );
  }
}

class CajaEmail extends StatefulWidget {
  @override
  _CajaEmailState createState() => _CajaEmailState();
}

class _CajaEmailState extends State<CajaEmail> {
  String email = "";
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_rounded, color: Colors.pink[900]),
        labelText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onChanged: (valor) {
        email = valor;
        setState(() {/*nombre = valor;*/});
      },
    );
  }
}

class Header extends StatelessWidget {
  final String title;

  const Header({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.pink[900],
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}

class CajaName extends StatefulWidget {
  @override
  _CajaNameState createState() => _CajaNameState();
}

class _CajaNameState extends State<CajaName> {
  String nombre = "";

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle, color: Colors.pink[900]),
        labelText: "Enter User Name",
        helperText: nombre,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onChanged: (valor) {
        nombre = valor;
        setState(() {/*nombre = valor;*/});
      },
    );
  }
}

class TextoPrincipal extends StatelessWidget {
  final String textoPrincipal;

  const TextoPrincipal({this.textoPrincipal});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.textoPrincipal,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

Widget img() {
  return Padding(
    padding: const EdgeInsets.all(50.0),
    child: Container(
        child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 3,
              color: Color(0xFFE04148),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                  image: NetworkImage('assets/images/avatar.png'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    )),
  );
}

class Textosecundario extends StatelessWidget {
  final String textosecundario;

  const Textosecundario({this.textosecundario});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.textosecundario,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
