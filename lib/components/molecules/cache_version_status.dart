import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sidekick/components/molecules/cache_version_status_master.dart';
import 'package:sidekick/components/molecules/setup_button.dart';
import 'package:sidekick/dto/channel.dto.dart';
import 'package:sidekick/dto/master.dto.dart';
import 'package:sidekick/dto/release.dto.dart';
import 'package:sidekick/providers/fvm_queue.provider.dart';

class CacheVersionStatus extends StatelessWidget {
  final ReleaseDto version;

  const CacheVersionStatus(this.version, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (version == null) {
      return const SizedBox(height: 0);
    }

    // Will use for channel upgrade comparison
    var currentRelease = version.release?.version;
    var latestRelease = version.release?.version;

    // If pending setup
    if (version.needSetup) {
      return SetupButton(version: version);
    }

    // If it's channel set current release;
    if (version.isChannel) {
      final channel = version as ChannelDto;
      currentRelease = channel.sdkVersion;
    }

    // If channel version installed is not the same as current, or if its master
    if (currentRelease == latestRelease) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            MdiIcons.checkCircle,
            size: 20,
          ),
          SizedBox(width: version.isChannel ? 10 : 0),
          version.isChannel
              ? Text('$currentRelease')
              : const SizedBox(height: 0),
        ],
      );
    }

    // If version is master
    if (version is MasterDto) {
      return CacheVersionStatusMaster(version);
    }

    // Default fallback
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(currentRelease),
        const SizedBox(width: 10),
        const Icon(MdiIcons.arrowRight, size: 15),
        const SizedBox(width: 10),
        OutlinedButton.icon(
          icon: const Icon(MdiIcons.triangle, size: 15),
          label: Text(version.release?.version),
          onPressed: () {
            context.read(fvmQueueProvider).upgrade(version);
          },
        ),
      ],
    );
  }
}
