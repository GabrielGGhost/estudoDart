import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  const TelaServico({Key? key}) : super(key: key);

  @override
  _TelaServicoState createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Serviços"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
          ), Row(
            children: [
              Image.asset("images/detalhe_servico.png"),
              Text("Nossos servicos")
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text("Cras mollis ullamcorper dolor, sed iaculis tellus ultricies sit amet. Duis sodales elit sed lobortis mollis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent sit amet metus id sapien gravida ullamcorper in ut nulla. Nam quis congue est, at ultricies felis. Vivamus id ligula elit. Pellentesque scelerisque finibus risus. Nunc in est vestibulum ex tristique condimentum. Vestibulum vel mauris quis nisl consequat laoreet. Curabitur placerat fringilla justo, quis varius quam aliquam eget. Aenean lacus diam, eleifend eget nisi sit amet, fermentum facilisis diam. Ut et lacinia nibh, quis scelerisque enim. Nam vel felis ligula."),
          )
        ],
      ),
    );
  }
}
