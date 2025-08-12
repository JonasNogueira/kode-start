import 'package:flutter/material.dart';
import 'package:rick_morty/theme/app_colors.dart';
import 'package:rick_morty/util/util.dart';
import 'package:rick_morty/widgets/app_bar_widget.dart';
import 'package:rick_morty/widgets/drawer_widget.dart';
import 'package:rick_morty/widgets/statistics_card_widget.dart';

class StatisticsPage extends StatefulWidget {
  static const routeId = '/statistics';
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  late Future<Map<String, Map<String, int>>> statistics;

  @override
  void initState() {
    super.initState();
    statistics = StatisticsFunctions().fetchStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      drawer: const CustomDrawerWidget(),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<Map<String, Map<String, int>>>(
          future: statistics,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error. Please try again later.",
                  style: TextStyle(color: AppColors.white),
                ),
              );
            }

            final data = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Character Statistics",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 24),

                  StatisticsCard(title: 'Status', items: data['status']!),
                  const SizedBox(height: 16),
                  StatisticsCard(title: 'Gender', items: data['gender']!),
                  const SizedBox(height: 16),
                  StatisticsCard(title: 'Species', items: data['species']!),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
