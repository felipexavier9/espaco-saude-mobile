import 'package:espaco_saude/dicas/ui/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter_html/flutter_html.dart';

import '../dica.dart';
import '../service.dart';
import 'detail.dart';

class DicasView extends StatefulWidget {
  List<Dica> dicas;
  DicaService dicaService;

  DicasView(this.dicaService, this.dicas, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DicasViewState();
}

class _DicasViewState extends State<DicasView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/espaco_saude.png'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: widget.dicas.length,
          itemBuilder: (context, index) {
            final dica = widget.dicas[index];
            return ListTile(
              title: Text(dica.description),
              subtitle: Html(data: dica.message),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: Detail(dica),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
