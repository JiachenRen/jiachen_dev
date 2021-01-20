part of 'home_page.dart';

class Music extends StatelessWidget with _TabMixin {
  final String name = 'JC Music';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicHeight(
        child: ThemedFlatButton(
          icon: Ionicons.logo_youtube,
          label: 'YouTube',
          onPressed: () {
            launch(
                'https://youtube.com/playlist?list=PLsJH6IlrtqIudSDABr568aVC4-IvoSY9k');
          },
        ),
      ),
    );
    // return Center(
    //   child: Image.network(
    //       'https://i.ytimg.com/vi/6aTe0-WT6Tk/hqdefault.jpg?sqp=-oaymwEjCNACELwBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLCGUE5Fh31Wab1hqysDjuabJ3KnpQ'),
    // );
  }
}
