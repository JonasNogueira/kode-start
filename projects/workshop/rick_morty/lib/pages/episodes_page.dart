import 'package:flutter/material.dart';
import 'package:rick_morty/models/paginated_episodes_model.dart';
import 'package:rick_morty/repositories/episodes_repository.dart';
import 'package:rick_morty/theme/app_colors.dart';
import 'package:rick_morty/widgets/app_bar_widget.dart';
import 'package:rick_morty/widgets/drawer_widget.dart';
import 'package:rick_morty/widgets/episode_list_widget.dart';
import 'package:rick_morty/widgets/search_bar_widget.dart';

class EpisodesHomePage extends StatefulWidget {
  static const routeId = '/episodes';
  const EpisodesHomePage({super.key});

  @override
  State<EpisodesHomePage> createState() => _EpisodesHomePageState();
}

class _EpisodesHomePageState extends State<EpisodesHomePage> {
  Future<PaginatedEpisodes>? episodes;
  final TextEditingController _searchController = TextEditingController();

  void _fetchEpisodes([String name = '']) {
    setState(() {
      episodes = EpisodeRepository.getEpisodes(name: name);
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchEpisodes();
    _searchController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      backgroundColor: AppColors.backgroundColor,
      drawer: const CustomDrawerWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBarWidget(
              controller: _searchController,
              onChanged: (value) => _fetchEpisodes(value),
            ),
          ),
          Expanded(
            child: FutureBuilder<PaginatedEpisodes>(
              future: episodes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return EpisodeListWidget(episodes: snapshot.data!.results);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "No episodes found.",
                      style: TextStyle(color: AppColors.white),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
