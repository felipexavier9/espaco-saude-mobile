import 'package:espaco_saude/dicas/service.dart';
import 'package:espaco_saude/dicas/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyPage extends StatelessWidget {

  final DicaService dicaService;

  const EmptyPage(this.dicaService, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/espaco_saude.png'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: RefreshIndicator(
        onRefresh: () => _refresh(context),
        child:  Stack(
          children: <Widget>[ListView(), Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Nenhuma dica encontrada!',
                    style: TextStyle(fontSize: 26, color: Colors.red, fontWeight: FontWeight.w400)),
                Lottie.asset('assets/empty_search.json'),
                const Text('Arraste a tela para baixo para atualizar.', style: TextStyle(fontSize: 18, color: Colors.indigo)),
                IconButton(
                  icon: const Icon(Icons.arrow_circle_down, color: Colors.indigo),
                  onPressed: () => _refresh(context),)
              ]
          ),],
        ),
      )
    );
  }

  Future<void> _refresh(BuildContext context) async {
    final dicas = await dicaService.getDicas();
    if (dicas.isNotEmpty) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(dicaService, dicas)));
    }
    return;
  }
}