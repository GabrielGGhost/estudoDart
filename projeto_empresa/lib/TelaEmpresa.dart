import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  const TelaEmpresa({Key? key}) : super(key: key);

  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Empresa"),
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(16),
          ), Row(
            children: [
              Image.asset("images/detalhe_empresa.png"),
              Text("Sobre a Empresa")
            ],
          ),
          Padding(
              padding: EdgeInsets.all(16),
            child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc laoreet justo sit amet eros fringilla tempus. Proin interdum tristique sollicitudin. Sed tincidunt id nunc et fermentum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In vel quam posuere, tristique velit et, rutrum lacus. Suspendisse vitae eros efficitur, pretium lorem a, faucibus turpis. Morbi efficitur at magna consequat vulputate. Integer placerat erat at mauris vestibulum, dignissim aliquam nisi auctor. Fusce ex risus, iaculis eu faucibus ac, sollicitudin dignissim dui.  Sed ultricies et elit quis sollicitudin. Cras mollis ullamcorper dolor, sed iaculis tellus ultricies sit amet. Duis sodales elit sed lobortis mollis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent sit amet metus id sapien gravida ullamcorper in ut nulla. Nam quis congue est, at ultricies felis. Vivamus id ligula elit. Pellentesque scelerisque finibus risus. Nunc in est vestibulum ex tristique condimentum. Vestibulum vel mauris quis nisl consequat laoreet. Curabitur placerat fringilla justo, quis varius quam aliquam eget. Aenean lacus diam, eleifend eget nisi sit amet, fermentum facilisis diam. Ut et lacinia nibh, quis scelerisque enim. Nam vel felis ligula."),
          )
          ],
      ),
    );
  }
}
