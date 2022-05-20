import 'package:espaco_saude/dicas/service.dart';
import 'package:espaco_saude/dicas/ui/dicasview.dart';
import 'package:espaco_saude/dicas/ui/empty.dart';
import 'package:espaco_saude/dicas/ui/home.dart';
import 'package:flutter/material.dart';

import '../dica.dart';

const service = DicaService();
List<Dica> dicas;

AppBar toolbar(BuildContext context) {
  () async {
    dicas = await service.getDicas();
  };

  return AppBar(
    title: Image.asset('assets/espaco_saude.png'),
    centerTitle: true,
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.navigate_next),
        tooltip: 'Go to the next page',
        // ignore: void_checks
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EmptyPage(service)));
        },
      ),
    ],
  );
}
