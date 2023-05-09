import 'package:flutter/material.dart';
import 'package:flutter_app/components/customTextField.dart';
import 'package:flutter_app/screens/profile.dart';
import 'package:string_validator/string_validator.dart' as validator;

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var user = UserModel();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  CustomTextField(
                    label: 'Nome',
                    icon: Icons.person,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(nome: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'E-mail',
                    icon: Icons.mail,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }

                      if (!validator.isEmail(text)) {
                        return 'Formato inválido para e-mail';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(email: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Endereço',
                    icon: Icons.place,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(endereco: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Número',
                    icon: Icons.numbers,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(numero: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Complemento',
                    icon: Icons.location_city,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(complemento: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'UF',
                    icon: Icons.map,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(uf: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'CEP',
                    icon: Icons.numbers,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(cep: text),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:(context) => Profile(nome: user.nome, email: user.email, endereco: user.endereco, numero: user.numero, complemento: user.complemento, uf: user.uf, cep: user.cep)));
                        }
                      },
                      child: const Text('Cadastrar'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        formKey.currentState!.reset();
                      },
                      child: const Text('Cancelar'),
                    ),
                  ),
                ])),
          ),
        ));
  }
}

@immutable
class UserModel {
  final String nome;
  final String email;
  final String endereco;
  final String numero;
  final String complemento;
  final String uf;
  final String cep;

  UserModel({
    this.nome = '',
    this.email = '',
    this.endereco = '',
    this.numero = '',
    this.complemento = '',
    this.uf = '',
    this.cep = '',
  });

  UserModel copyWith({
    String? nome,
    String? email,
    String? endereco,
    String? numero,
    String? complemento,
    String? uf,
    String? cep,
  }) {
    return UserModel(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      endereco: endereco ?? this.endereco,
      numero: numero ?? this.numero,
      complemento: complemento ?? this.complemento,
      uf: uf ?? this.uf,
      cep: cep ?? this.cep,
    );
  }
}
