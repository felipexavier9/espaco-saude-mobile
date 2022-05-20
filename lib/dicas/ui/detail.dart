import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../dica.dart';

class Detail extends StatefulWidget {
  final Dica dica;

  const Detail(this.dica, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dica.description),
      ),
      body: Center(
        child: Html(data: widget.dica.message),
      ),
    );
  }
}