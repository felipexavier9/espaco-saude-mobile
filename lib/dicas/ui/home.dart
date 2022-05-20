import 'package:espaco_saude/dicas/ui/dicasview.dart';
import 'package:espaco_saude/dicas/ui/empty.dart';
import 'package:espaco_saude/dicas/ui/toolbar.dart';
import 'package:flutter/material.dart';

import '../dica.dart';
import '../service.dart';

class HomePage extends StatefulWidget {
  DicaService dicaService;

  HomePage(this.dicaService, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Dica> dicas = [];

  callDicas() async {
    dicas = await widget.dicaService.getDicas();
    return;
  }

  @override
  Widget build(BuildContext context) {
    callDicas();
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/espaco_saude.png'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notification_add_outlined),
              tooltip: 'Go to the next page',
              // ignore: void_checks
              onPressed: () {
                  if (dicas.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DicasView(widget.dicaService, dicas)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EmptyPage(
                                  widget.dicaService,
                                )));
                  }
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              // your image goes here which will take as much height as possible.
              child: Image.asset('assets/img-01.png', fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }
}
