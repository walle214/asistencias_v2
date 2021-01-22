import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// * Custom
import 'package:asistencias_v2/storage/storage.dart';
import 'package:asistencias_v2/models/models.dart' show Plantel;
import 'package:asistencias_v2/providers/providers.dart'
    show FederacionProvider, GruposProvider;
import 'package:asistencias_v2/widgets/widgets.dart' show TemplatePage;
import 'package:asistencias_v2/widgets/buttons/buttons.dart'
    show LightBlueButton;

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
    // * readDatosGrupos manage localstorages and connections;
    if (providerDatosGrupos.data == null) GruposStorage.readData(context);
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
  _PlantelList({@required this.planteles});

  final List<Plantel> planteles;

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
            // _openCarreraPage(context, index, plantel.nombre);
            print('$context, $index, ${plantel.nombre}');
          },
          delay: delay,
        );
      },
    );
  }
}

// void _openCarreraPage(BuildContext context, int plantelIndex, String title) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => CarrerasPage(
//         indexPlantel: plantelIndex,
//         title: title,
//       ),
//     ),
//   );
// }
