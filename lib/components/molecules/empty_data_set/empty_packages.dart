import 'package:sidekick/components/atoms/empty_data_set.dart';
import 'package:sidekick/providers/navigation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EmptyPackages extends StatelessWidget {
  const EmptyPackages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyDataSet(
      icon: const Icon(MdiIcons.package),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Packages Found',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '''Configure the location of your Flutter Projects. Package information will be displayed here.''',
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                (states) => const EdgeInsets.fromLTRB(30, 15, 30, 15),
              )),
              onPressed: () {
                context
                    .read(navigationProvider)
                    .goTo(NavigationRoutes.settingsScreen);
              },
              icon: const Icon(Icons.settings, size: 20),
              label: const Text('Change Settings'),
            )
          ],
        ),
      ),
    );
  }
}