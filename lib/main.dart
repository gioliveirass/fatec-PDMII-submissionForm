import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu de navegação',
      home: FormPage(), 
    );
  }
}

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Formulário de cadastro'),
       ),
       body: Center(
        child: Forms()
       )
    );
  }
}

class ResultPage extends StatelessWidget {
  final String name;  
  final String address;
  final String number;
  final String complement;
  final String uf;
  final String cep;

  const ResultPage(
    {
      Key? key, 
      required this.name, 
      required this.address,
      required this.number,
      required this.complement,
      required this.uf,
      required this.cep,
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultado do cadastro"),),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [ 
            const Text(
              'Informações cadastradas',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),  
            const SizedBox(height: 100.0),
            Text("Nome: " + name, style:  const TextStyle(fontSize: 24.0, color: Colors.black)),
            Text("Endereço: " + address, style:  const TextStyle(fontSize: 24.0, color: Colors.black)),
            Text("Número: " + number, style:  const TextStyle(fontSize: 24.0, color: Colors.black)),
            Text("Complemento: " + complement, style:  const TextStyle(fontSize: 24.0, color: Colors.black)),
            Text("UF: " + uf, style:  const TextStyle(fontSize: 24.0, color: Colors.black)),
            Text("CEP: " + cep, style:  const TextStyle(fontSize: 24.0, color: Colors.black)),
            const SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push( context,
                    MaterialPageRoute(builder: (context) => FormPage()),
                );
              },
              child: const Text('Voltar'),
            ),
          ],
        )
      ),
    );
  }


}

class Forms extends StatefulWidget {
  @override
  FormState createState() => FormState();
}

class FormState extends State<Forms> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _complement = TextEditingController();
  final TextEditingController _uf = TextEditingController();
  final TextEditingController _cep = TextEditingController();

  Color textColor = Colors.black; 
  Color textColorWarning = Colors.grey;
  Color borderColor = Colors.grey;

  String _result = "";
  bool sent = false;

  void _send() {
    String name = _name.text;
    String address = _address.text;
    String number = _number.text;
    String complement = _complement.text;
    String uf = _uf.text;
    String cep = _cep.text;

    void changeTextColor(Color newColor) {
      setState(() {
        textColor = newColor;
      });
    }

    void changeBorderColor(Color newColor) {
      setState(() {
        borderColor = newColor;
      });
    }

    void changeSent(bool wasSent) {
      setState(() {
        sent = wasSent;
      });
    }

    setState(() {
      if (name == "") {
        changeTextColor(Colors.red);
        changeBorderColor(Colors.red);
        _result = "O campo NOME é obrigatório";
      } else if (address == "") {
        changeTextColor(Colors.red);
        changeBorderColor(Colors.red);
        _result = "O campo ENDEREÇO é obrigatório";
      } else if (number == "") {
        changeTextColor(Colors.red);
        changeBorderColor(Colors.red);
        _result = "O campo NÚMERO é obrigatório";
      } else if (complement == "") {
        changeTextColor(Colors.red);
        changeBorderColor(Colors.red);
        _result = "O campo COMPLEMENTO é obrigatório";
      } else if (uf == "") {
        changeTextColor(Colors.red);
        changeBorderColor(Colors.red);
        _result = "O campo UF é obrigatório";
      } else if (cep == "") {
        changeTextColor(Colors.red);
        changeBorderColor(Colors.red);
        _result = "O campo CEP é obrigatório";
      } else {
        changeSent(true);
        changeTextColor(Colors.blue);
        changeBorderColor(Colors.grey);
        _result = "Envio realizado com sucesso";

        Navigator.push( context,
          MaterialPageRoute(builder: (context) => ResultPage(
            name: name, 
            address: address,
            number: number,
            complement: complement,
            uf: uf,
            cep: cep
          )),
        );
      }
    });
  }

  void _cancel() {
    _name.text = "";
    String name = _name.text;

    _address.text = "";
    String address = _address.text;

    _number.text = "";
    String number = _number.text;

    _address.text = "";
    String complement = _complement.text;

    _uf.text = "";
    String uf = _uf.text;

    _cep.text = "";
    String cep = _cep.text;

    setState(() {
      _result = "Envio cancelado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
         alignment: Alignment.topCenter,
         child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16.0), 
            const Text(
              'Formulário de envio',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            const SizedBox(height: 16.0), 
            SizedBox(
              width: 300,
              child: TextField(
                controller: _name, 
                keyboardType: TextInputType.text, 
                decoration: InputDecoration(
                  hintText: 'Informe o nome',
                  prefixIcon: const Icon(Icons.account_circle_outlined), 
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor), 
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  )
                )
              )
            ),
            const SizedBox(height: 16.0), 
            SizedBox(
              width: 300,
              child: TextField(
                controller: _address, 
                keyboardType: TextInputType.text, 
                decoration: InputDecoration(
                  hintText: 'Informe o endereço',
                  prefixIcon: const Icon(Icons.account_circle_outlined), 
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor), 
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0), 
            SizedBox(
              width: 300,
              child: TextField(
                controller: _number, 
                keyboardType: TextInputType.text, 
                decoration: InputDecoration(
                  hintText: 'Informe o número',
                  prefixIcon: const Icon(Icons.account_circle_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor), 
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0), 
            SizedBox(
              width: 300,
              child: TextField(
                controller: _complement, 
                keyboardType: TextInputType.text, 
                decoration: InputDecoration(
                  hintText: 'Informe o complemento',
                  prefixIcon: const Icon(Icons.account_circle_outlined), 
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor), 
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0), 
            SizedBox(
              width: 300,
              child: TextField(
                controller: _uf, 
                keyboardType: TextInputType.text, 
                decoration: InputDecoration(
                  hintText: 'Informe o UF',
                  prefixIcon: const Icon(Icons.account_circle_outlined), 
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0), 
            SizedBox(
              width: 300,
              child: TextField(
                controller: _cep, 
                keyboardType: TextInputType.text, 
                decoration: InputDecoration(
                  hintText: 'Informe o CEP',
                  prefixIcon: const Icon(Icons.account_circle_outlined), 
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor), 
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
             !sent
             ? SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _send,
                    child: const Text('Enviar'),
                  ),
                  ElevatedButton(
                    onPressed: _cancel,
                    child: const Text('Cancelar'),
                  )
                ]
              ),
             ) 
             : const SizedBox.shrink(),
            const SizedBox(height: 16.0),
            Text(
              'Resposta: $_result',
              style: TextStyle(fontSize: 24.0, color: textColor),
            ),
          ]
         )
      )
    );
  }
}

