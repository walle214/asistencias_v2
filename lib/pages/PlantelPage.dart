import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// * Custom
import 'package:asistencias_v2/storage/storage.dart';
import 'package:asistencias_v2/models/models.dart' show Plantel;
import 'package:asistencias_v2/providers/providers.dart' show GruposProvider;
import 'package:asistencias_v2/widgets/widgets.dart' show TemplatePage;
import 'package:asistencias_v2/widgets/buttons/buttons.dart'
    show LightBlueButton;
import 'package:asistencias_v2/services/ConnectivityService.dart';
import 'package:asistencias_v2/pages/pages.dart' show CarrerasPage;

class PlantelPage extends StatelessWidget {
  const PlantelPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      child: body(context),
    );
  }

  Widget body(BuildContext context) {
    final providerDatosGrupos = Provider.of<GruposProvider>(context);
    final connectionStatus =
        Provider.of<ConnectivityStatus>(context, listen: false);
    // * readDatosGrupos manage localstorages and connections;
    if (providerDatosGrupos.data == null)
      GruposStorage.readData(context, connectionStatus);
    final planteles = providerDatosGrupos.data?.plantel;

    if (planteles?.length == 0 || planteles == null)
      return Text('No hay grupos para mostrar');
    else if (planteles.length >= 1) {
      return _PlantelList(planteles: planteles);
    }
    return Container();
  }
}

class _PlantelList extends StatelessWidget {
  final List<Plantel> planteles;

  const _PlantelList({@required this.planteles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: planteles.length,
      itemBuilder: (context, index) {
        final delay = index;
        final plantel = planteles[index];
        return LightBlueButton(
          plantel.nombre,
          (context) {
            _openCarreraPage(context, plantel, plantel.nombre);
            // print('$context, $index, ${plantel.nombre}');
          },
          delay: delay,
        );
      },
    );
  }
}

void _openCarreraPage(BuildContext context, Plantel plantel, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CarrerasPage(
        plantel: plantel,
        title: title,
      ),
    ),
  );
}
