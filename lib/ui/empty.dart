import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyPage extends StatelessWidget {

  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/espaco_saude.png'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Nenhuma dica encontrada!',
              style: TextStyle(fontSize: 26, color: Colors.red, fontWeight: FontWeight.w400)),
          Lottie.asset('assets/empty_search.json'),
          const Text('Arraste a tela para baixo para atualizar.', style: TextStyle(fontSize: 18, color: Colors.indigo)),
          IconButton(
            icon: const Icon(Icons.arrow_circle_down, color: Colors.indigo),
            onPressed: () {  },)
        ]
      ),
    );
  }
}