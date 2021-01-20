part of 'home_page.dart';

class AboutMe extends StatelessWidget with _TabMixin {
  final String name = 'About Me';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicHeight(
        child: Column(
          children: [
            ImageGallery(size: 200, images: [
              Assets.portrait1,
              Assets.portrait2,
            ]),
            Text(
              'Jiachen Ren',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'CS Major @ Georgia Tech • Senior • Full Stack Developer',
              style: Theme.of(context).textTheme.overline,
            ),
            SizedBox(
              height: 16,
            ),
            IntrinsicWidth(
              child: Row(
                children: [
                  Buttons.email,
                  Buttons.github,
                  Buttons.linkedIn,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}