import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static String name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels + 500 >=
            scrollController.position.maxScrollExtent) {
          loadNextPage();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    isMounted = false;
  }

  void addFiveImage() {
    final int lastId = imageIds.last;
    imageIds.addAll([1, 2, 3, 4, 5].map(
      (e) => e + lastId,
    ));
    setState(() {});
  }

  Future<void> onRefresh() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    final int lastId = imageIds.last;
    imageIds.clear();
    imageIds.add(lastId + 1);
    addFiveImage();

    setState(() {});
  }

  Future loadNextPage() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));
    setState(() {});
    addFiveImage();
    isLoading = false;

    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  List<int> imageIds = [1, 2, 3, 4];

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imageIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imageIds[index]}/500/300'));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : FadeIn(child: const Icon(Icons.arrow_back)),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
