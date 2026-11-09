import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/widgets/empty_state.dart';
import 'package:macro_cal_public/miscellaneous/appbars.dart';
import 'package:macro_cal_public/core/assets/app_assets.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

class HistoricalPage extends StatefulWidget {
  const HistoricalPage({super.key});

  @override
  State<HistoricalPage> createState() => _HistoricalPageState();
}

class _HistoricalPageState extends State<HistoricalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MajorPageAppBar(
        title: context.l10n.historicalPageTitle,
      ),
      endDrawer: const SettingsDrawer(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: EmptyState(
                image: AppImages.historical,
                title: 'Page not available yet',
                subtitle: 'Coming Soon!',
                subtitleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            right: 24,
            bottom: 16,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.restaurant_rounded),
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                fixedSize: const Size(50, 50),
              ),
            ),
          ),
          Positioned(
              bottom: 20,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Generate New'))),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
