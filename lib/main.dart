import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// classe que inicia o aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // define Material Design
    return MaterialApp(
      title: 'Sample Input', home: Forms(), // inicia página principal
    );
  }
}

// Classe que instância classe responsável por gerenciar estados
class Forms extends StatefulWidget {
  @override
  FormsState createState() => FormsState();
}

// classe que contém os widgets
class FormsState extends State<Forms> {
  // é necessário um controller para interagir com
  // wigdget de entrada de dados
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _endereco = TextEditingController();
  final TextEditingController _numero = TextEditingController();
  final TextEditingController _complemento = TextEditingController();
  final TextEditingController _uf = TextEditingController();
  final TextEditingController _cep = TextEditingController();

  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;

  String _result = "";
  String _value1 = '';
  String _value2 = '';
  String _value3 = '';
  String _value4 = '';
  String _value5 = '';
  String _value6 = '';

  bool envio = false;

  // simula envia de informação
  void _enviar() {
    String nome = _nome.text;
    String endereco = _endereco.text;
    String numero = _numero.text;
    String complemento = _complemento.text;
    String uf = _uf.text;
    String cep = _cep.text;

    // altera state textColor
    void changeTextColor(Color newColor) {
      setState(() {
        textColor = newColor;
      });
    }

    // altera cor da borda
    void changeBorderColor(Color newColor) {
      setState(() {
        borderColor = newColor;
      });
    }

    void changeEnvio(bool e) {
      setState(() {
        envio = e;
      });
    }

    // define resposta
    setState(() {
      // não informou nome
      if (nome == "" ||
          endereco == "" ||
          numero == "" ||
          complemento == "" ||
          uf == "" ||
          cep == "") {
        // altera cor do texto
        changeTextColor(Colors.red);
        // altera mensagem
        _result = "Campo nome obrigatório";
        // alterar cor da borda
        changeBorderColor(Colors.red);
      } else {
        // ok, alterar dados para
        changeEnvio(true);
        changeTextColor(Colors.blue);
        changeBorderColor(Colors.grey);
        _value1 = nome;
        _value2 = endereco;
        _value3 = numero;
        _value4 = complemento;
        _value5 = uf;
        _value6 = cep;
      }
    });
  }

  // cancelar
  void _cancelar() {
    _nome.text = "";
    String nome = _nome.text;

    _endereco.text = "";
    String endereco = _endereco.text;

    _numero.text = "";
    String numero = _numero.text;

    _complemento.text = "";
    String complemento = _complemento.text;

    _uf.text = "";
    String uf = _uf.text;

    _cep.text = "";
    String cep = _cep.text;

    // define resposta
    setState(() {
      _value1 = nome;
      _value2 = endereco;
      _value3 = numero;
      _value4 = complemento;
      _value5 = uf;
      _value6 = cep;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        // corpo do aplicativo
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15.0), // um retângulo para separar widgets
            const Text(
              // label (texto)
              'Sample Input',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            const SizedBox(
                height: 10.0), // um retângulo contendo widget de entrada
            SizedBox(
              // label para nome
              width: 300,
              child: TextField(
                controller: _nome, // associa controle ao widget
                keyboardType: TextInputType.text, // tipo de entrada
                decoration: InputDecoration(
                  // customização
                  hintText: 'Entre com nome', //hint
                  prefixIcon: const Icon(Icons.account_circle_outlined), //icon
                  enabledBorder: OutlineInputBorder(
                    //borda ao redor da entrada
                    borderSide: BorderSide(color: borderColor), //cor da borda
                  ), //quando receber o foco, altera cor da borda
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              // label para endereco
              width: 300,
              child: TextField(
                controller: _endereco, // associa controle ao widget
                keyboardType: TextInputType.text, // tipo de entrada
                decoration: InputDecoration(
                  // customização
                  hintText: 'Entre com endereco', //hint
                  prefixIcon: const Icon(Icons.account_circle_outlined), //icon
                  enabledBorder: OutlineInputBorder(
                    //borda ao redor da entrada
                    borderSide: BorderSide(color: borderColor), //cor da borda
                  ), //quando receber o foco, altera cor da borda
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              // label para numero
              width: 300,
              child: TextField(
                controller: _numero, // associa controle ao widget
                keyboardType: TextInputType.text, // tipo de entrada
                decoration: InputDecoration(
                  // customização
                  hintText: 'Entre com numero', //hint
                  prefixIcon: const Icon(Icons.account_circle_outlined), //icon
                  enabledBorder: OutlineInputBorder(
                    //borda ao redor da entrada
                    borderSide: BorderSide(color: borderColor), //cor da borda
                  ), //quando receber o foco, altera cor da borda
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              // label para complemento
              width: 300,
              child: TextField(
                controller: _complemento, // associa controle ao widget
                keyboardType: TextInputType.text, // tipo de entrada
                decoration: InputDecoration(
                  // customização
                  hintText: 'Entre com complemento', //hint
                  prefixIcon: const Icon(Icons.account_circle_outlined), //icon
                  enabledBorder: OutlineInputBorder(
                    //borda ao redor da entrada
                    borderSide: BorderSide(color: borderColor), //cor da borda
                  ), //quando receber o foco, altera cor da borda
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              // label para uf
              width: 300,
              child: TextField(
                controller: _uf, // associa controle ao widget
                keyboardType: TextInputType.text, // tipo de entrada
                decoration: InputDecoration(
                  // customização
                  hintText: 'Entre com sigla do estado', //hint
                  prefixIcon: const Icon(Icons.account_circle_outlined), //icon
                  enabledBorder: OutlineInputBorder(
                    //borda ao redor da entrada
                    borderSide: BorderSide(color: borderColor), //cor da borda
                  ), //quando receber o foco, altera cor da borda
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              // label para cep
              width: 300,
              child: TextField(
                controller: _cep, // associa controle ao widget
                keyboardType: TextInputType.text, // tipo de entrada
                decoration: InputDecoration(
                  // customização
                  hintText: 'Entre com CEP', //hint
                  prefixIcon: const Icon(Icons.account_circle_outlined), //icon
                  enabledBorder: OutlineInputBorder(
                    //borda ao redor da entrada
                    borderSide: BorderSide(color: borderColor), //cor da borda
                  ), //quando receber o foco, altera cor da borda
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            // if ternário que controla exibição da resposta.
            // senão foi enviado, então apresenta botões
            // enviar e cancelar
            !envio
                ? SizedBox(
                    // botões
                    width: 300,
                    // Row determina que os widgets serão acrescentados
                    // lado a lado
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _enviar, // executa _enviar
                          child: const Text('Enviar'),
                        ),
                        ElevatedButton(
                          onPressed: _cancelar, // executa _cancelar
                          child: const Text('Cancelar'),
                        ),
                      ],
                    ))
                : const SizedBox.shrink(), // espaço vazio
            const SizedBox(height: 16.0),
            Text(
              'Resposta: $_value1 $_value2 $_value3 $_value4 $_value5 $_value6',
              style: TextStyle(fontSize: 24.0, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
