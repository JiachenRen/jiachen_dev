part of 'home_page.dart';

class Projects extends StatelessWidget with _TabMixin {
  final String name = 'Projects';

  static const route = '/projects';

  static final _projects = [
    _Project(
      name: 'Hive: Origins',
      url: '/#/projects/hive5',
      icon: ClipRRect(
        child: Image.asset(Assets.hive5Icon),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    ),
    _Project(
      name: 'MangaX',
      url: null,
      icon: ClipRRect(
        child: Image.asset(Assets.mangaxIcon),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    ),
    _Project(
      name: 'Kelvin',
      url: 'https://github.com/JiachenRen/Kelvin',
      icon: Image.asset(Assets.kelvinIcon),
    ),
    _Project(
      name: 'Gomoku Zero',
      url: 'https://github.com/JiachenRen/GomokuZero',
      icon: Image.asset(Assets.gomokuZeroIcon),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicHeight(
        child: Wrap(
          spacing: 32,
          runSpacing: 32,
          children: _projects,
        ),
      ),
    );
  }
}

class _Project extends StatelessWidget {
  final String name;
  final String url;
  final Widget icon;

  const _Project({
    Key key,
    @required this.name,
    @required this.url,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (url != null) {
          launch(url);
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Project Not Publicly Available'),
              );
            },
          );
        }
      },
      child: IntrinsicHeight(
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: icon,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
