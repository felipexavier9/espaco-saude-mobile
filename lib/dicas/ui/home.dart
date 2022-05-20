import 'dart:math';
import 'package:html/parser.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:espaco_saude/dicas/ui/empty.dart';
import 'package:espaco_saude/dicas/ui/toolbar.dart';
import '../dica.dart';
import '../service.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  List<Dica> dicas;
  DicaService dicaService;

  HomePage(this.dicaService, this.dicas, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: toolbar(),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.builder(
            itemCount: widget.dicas.length,
            itemBuilder: (context, index) {
              final dica = widget.dicas[index];
              return ListTile(
                title: Text(_firstLineMaxLen(dica.description, 34)),
                leading: const Icon(Icons.notification_important),
                subtitle: Text(_firstLineMaxLen(_stripHtml(dica.message), 42)),
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
      ),
    );
  }

  Future<void> _refresh() async {
    return widget.dicaService.getDicas().then((dicas) => {
      if(dicas.isNotEmpty) {
        setState(() {
          widget.dicas = dicas;
       })
      }
    });
  }
}

String _firstLineMaxLen(String text, int max ) {
  if(text.contains("\n")) {
    text = text.substring(0, text.indexOf("\n"));
  }
  final ellipsis = text.length > max;
  return text.substring(0, min(text.length, max)) + (ellipsis ? '. . .' : '');
}

String _stripHtml(String html) {
  final document = parse(html);
  return document.body?.text ?? "";
}