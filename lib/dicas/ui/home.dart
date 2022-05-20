import 'dart:async';

import 'package:espaco_saude/dicas/ui/dicasview.dart';
import 'package:espaco_saude/dicas/ui/empty.dart';
import 'package:flutter/material.dart';

import '../dica.dart';
import '../service.dart';

class HomePage extends StatefulWidget {
  final DicaService dicaService;

  const HomePage(this.dicaService, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Dica> dicas = [];

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), _getDicas);
  }

  FutureOr<void> _getDicas() async {
    widget.dicaService.getDicas().then((dicas) async => {
      if (dicas.isNotEmpty) {
        setState(() {
          this.dicas = dicas;
        })
      } else {
        await Future.delayed(const Duration(seconds: 5), _getDicas)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/espaco_saude.png'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notification_add_outlined),
              tooltip: 'Ir para página de dicas',
              onPressed: () =>_navigateToDicas(context)
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Image.asset('assets/img-01.png', fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDicas(BuildContext context) {
    final nextPage = dicas.isEmpty ? EmptyPage(widget.dicaService) : DicasView(widget.dicaService, dicas);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }
}
