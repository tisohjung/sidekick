import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sidekick/components/atoms/empty_data_set.dart';
import 'package:sidekick/providers/navigation_provider.dart';

class EmptyVersions extends StatelessWidget {
  const EmptyVersions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyDataSet(
      icon: const FlutterLogo(),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter SDK not installed.',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              '''You do not currently have any Flutter SDK versions installed. Versions or channels that have been installed will be displayed here.''',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                (states) => const EdgeInsets.fromLTRB(30, 15, 30, 15),
              )),
              onPressed: () {
                context
                    .read(navigationProvider)
                    .goTo(NavigationRoutes.exploreScreen);
              },
              icon: const Icon(Icons.explore),
              label: const Text('Explore Flutter Releases'),
            )
          ],
        ),
      ),
    );
  }
}
