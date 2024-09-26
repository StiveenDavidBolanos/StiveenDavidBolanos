import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la mcomida',
      url: 'assets/images/1.png',
      caption: 'Ex exercitation sint incididunt occaecat qui.'),
  SlideInfo(
      title: 'Delivery',
      url: 'assets/images/2.png',
      caption: 'Ex exercitation sint incididunt occaecat qui.'),
  SlideInfo(
      title: 'Enjoy',
      url: 'assets/images/3.png',
      caption: 'Ex exercitation sint incididunt occaecat qui.')
];

class SlideInfo {
  final String title;
  final String url;
  final String caption;

  SlideInfo({required this.title, required this.url, required this.caption});
}

class TutorialScreen extends StatefulWidget {
  static String name = 'tutorial_screen';
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  bool lastPage = false;
  final pageViewController = PageController();
  @override
  void initState() {
    //
    super.initState();
    pageViewController.addListener(
      () {
        final page = pageViewController.page ?? 0;
        if (!lastPage && (page > slides.length - 1.5)) {
          setState(() {
            lastPage = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) =>
                    _Slide(slideData.title, slideData.caption, slideData.url))
                .toList()),
        Positioned(
            right: 20,
            top: 40,
            child: TextButton(
                onPressed: () => context.pop(), child: const Text('Salir'))),
        lastPage == false
            ? const SizedBox()
            : Positioned(
                bottom: 20,
                right: 20,
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(seconds: 1),
                  child: FilledButton(
                      onPressed: context.pop, child: const Text('Terminar')),
                ))
      ]),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String url;
  const _Slide(this.title, this.caption, this.url);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(url),
              Text(
                title,
                style: textStyle,
              ),
              Text(
                caption,
                style: captionStyle,
              )
            ],
          ),
        ));
  }
}
