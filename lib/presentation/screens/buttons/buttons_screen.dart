import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons scrreen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated Button')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated Button Disabled')),
            ElevatedButton.icon(
                icon: const Icon(Icons.send_and_archive),
                onPressed: () {},
                label: const Text('Elevated Button Icon')),
            FilledButton(onPressed: () {}, child: const Text('FilledButton')),
            FilledButton.icon(
                icon: const Icon(Icons.near_me),
                onPressed: () {},
                label: const Text('FilledButton Icon')),
            OutlinedButton(
                onPressed: () {}, child: const Text('Outlined Button')),
            OutlinedButton.icon(
                icon: const Icon(Icons.terminal),
                onPressed: () {},
                label: const Text('Outlined Button')),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.gamepad),
                label: const Text('Text Button')),
            IconButton(onPressed: () {}, icon: const Icon(Icons.deblur)),
            IconButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(colors.primary),
                    iconColor: const WidgetStatePropertyAll(Colors.white)),
                onPressed: () {},
                icon: const Icon(Icons.deblur)),
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        textStyle: const TextStyle(color: Colors.white),
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Custom Button')),
        ),
      ),
    );
  }
}
