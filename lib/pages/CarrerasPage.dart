import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// * Custom
import 'package:asistencias_v2/models/models.dart' show Carrera, Plantel;
import 'package:asistencias_v2/providers/providers.dart' show GruposProvider;
import 'package:asistencias_v2/widgets/widgets.dart' show TemplatePage;
import 'package:asistencias_v2/pages/pages.dart' show GruposPage;
import 'package:asistencias_v2/widgets/buttons/buttons.dart'
    show LightBlueButton;

class CarrerasPage extends StatelessWidget {
  final String title;
  final Plantel plantel;
  const CarrerasPage({Key key, this.title, @required this.plantel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gruposProvider = Provider.of<GruposProvider>(context);
    final carreras = plantel.carreras;

    if (gruposProvider.isEmpty || carreras?.length == 0 || carreras == null)
      return Center(child: Text('No hay carreras para mostrar'));
    if (carreras?.length == 1)
      return GruposPage(
        carrera: carreras[0],
        title: carreras[0].nombre ?? plantel.nombre,
      );

    return TemplatePage(
      child: _ListCarreras(
        carreras: carreras,
      ),
      title: title,
    );
  }
}

class _ListCarreras extends StatelessWidget {
  final List<Carrera> carreras;
  _ListCarreras({
    @required this.carreras,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carreras.length,
      itemBuilder: (context, index) {
        final carrera = carreras[index];
        return LightBlueButton(
          carrera.nombre ?? 'Sin nombre',
          (context) => _openGruposPage(context, carrera),
          delay: index,
        );
      },
    );
  }

  void _openGruposPage(BuildContext context, Carrera carrera) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GruposPage(
            carrera: carrera,
            title: carrera.nombre,
          ),
        ),
      );
}
