import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final SnackBar snackBar = SnackBar(
        action: SnackBarAction(
          label: 'OK!',
          onPressed: () {},
        ),
        content: const Text('Hola mundo'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Ok')),
          FilledButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancelar'))
        ],
        title: const Text('Estas seguro??'),
        content: const Text(
            'Incididunt ad cillum tempor veniam laborum dolor nulla et ut exercitation ad. Culpa consequat irure eiusmod exercitation labore anim deserunt esse mollit elit est occaecat sit ea. Irure cupidatat minim elit est. Eiusmod culpa fugiat cillum sunt fugiat elit ad.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Fugiat do aliquip officia sint aute enim ea reprehenderit nulla ipsum.')
                  ]);
                },
                child: const Text('Licencias Usadas')),
            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                },
                child: const Text('Mostrar dialogo'))
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Snackbars and Dialogs'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showSnackBar(context);
        },
        label: const Text('Mostrar SnackBar'),
        icon: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
