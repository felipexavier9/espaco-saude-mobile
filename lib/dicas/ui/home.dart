import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../dica.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  final List<Dica> dicas = [];

  HomePage(List<Dica> dicas, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              subtitle: Text(dica.message.substring(0, 50)),
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
