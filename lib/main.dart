import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter form',
      theme: ThemeData(
        primarySwatch:Colors.teal
      ),
      home: const MyHomePage(title: 'Flutter Formulaire'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController subNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulaire Flutter"), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
           children: [
            TextFormField(
                decoration: const InputDecoration(
                labelText: "Nom",
              ),
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entrer du texte';
                }
                return null;
              },
            ),
            TextFormField(
                decoration: const InputDecoration(
                labelText: "Prénom"
              ),
              controller: subNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entrer du texte';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
              labelText: "E-mail"
              ),
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entrer du texte';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
              labelText: "Password"
              ),
              obscureText: true,
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entrer du texte';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Confirm password"
              ),
              obscureText: true,
              controller: passwordConfirmController,
              validator: (value) {
                if (value != passwordController.text) {
                  return 'Mauvais mot de passe';
                }
                
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => ResultPage(
                              name: nameController.text,
                              subName: subNameController.text,
                              email: emailController.text,
                            ))));
                  }
                },
                child: const Text('Confirmer'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key? key,
      required this.name,
      required this.email,
      required this.subName})
      : super(key: key);
  final String name;
  final String subName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Résulats")),
        body: Center(
          child: Column          
          (children: [
      Text(name),
      Text(subName),
      Text(email),
    ]),
        ));
  }
}