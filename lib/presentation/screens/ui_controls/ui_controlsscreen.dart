import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static String name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

enum Transportations { car, boat, plane, submarine, teleport }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportations selectedTrasnportation = Transportations.teleport;
  bool wantsBreakFast = false;
  bool wantsDinner = false;

  bool wantsLunch = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('GOd Mode'),
          subtitle: const Text('Welcome'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Expansion Tile'),
          subtitle: Text('$selectedTrasnportation'),
          children: [
            RadioListTile(
              title: const Text('Teleportation'),
              value: Transportations.teleport,
              groupValue: selectedTrasnportation,
              onChanged: (value) {
                setState(() {
                  selectedTrasnportation = Transportations.teleport;
                });
              },
            ),
            RadioListTile(
              title: const Text('Car'),
              value: Transportations.car,
              groupValue: selectedTrasnportation,
              onChanged: (value) {
                setState(() {
                  selectedTrasnportation = Transportations.car;
                });
              },
            ),
            RadioListTile(
              title: const Text('Boat'),
              value: Transportations.boat,
              groupValue: selectedTrasnportation,
              onChanged: (value) {
                setState(() {
                  selectedTrasnportation = Transportations.boat;
                });
              },
            ),
            RadioListTile(
              title: const Text('Plane'),
              value: Transportations.plane,
              groupValue: selectedTrasnportation,
              onChanged: (value) {
                setState(() {
                  selectedTrasnportation = Transportations.plane;
                });
              },
            ),
            RadioListTile(
              title: const Text('Submarine'),
              value: Transportations.submarine,
              groupValue: selectedTrasnportation,
              onChanged: (value) {
                setState(() {
                  selectedTrasnportation = Transportations.submarine;
                });
              },
            )
          ],
        ),
        CheckboxListTile(
          title: const Text('BreackFast'),
          value: wantsBreakFast,
          onChanged: (value) {
            setState(() {
              wantsBreakFast = !wantsBreakFast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Lunch'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Dinner'),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        )
      ],
    );
  }
}
