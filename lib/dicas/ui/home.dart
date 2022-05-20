import 'package:espaco_saude/dicas/ui/dicasview.dart';
import 'package:espaco_saude/dicas/ui/empty.dart';
import 'package:espaco_saude/dicas/ui/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter_html/flutter_html.dart';

import '../dica.dart';
import '../service.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  List<Dica> dicas;
  DicaService dicaService;

  HomePage(this.dicaService, this.dicas, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
  Future<void> initState() async {
    dicas = await dicaService.getDicas();
    return;
  }
}

class _HomePageState extends State<HomePage> {
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
                {
                  if (dicas != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DicasView(service, dicas)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EmptyPage(
                                  service,
                                )));
                  }
                }
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              // your image goes here which will take as much height as possible.
              child: Image.asset('assets/img-01.png', fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}
