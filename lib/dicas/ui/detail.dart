// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:espaco_saude/dicas/ui/toolbar.dart';
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
        appBar: toolbar(),
        body: SingleChildScrollView(child: Html(data: widget.dica.message)));
  }
}