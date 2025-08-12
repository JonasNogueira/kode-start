import 'package:flutter/material.dart';

import 'package:rick_morty/models/episode_model.dart';
import 'package:rick_morty/widgets/app_bar_widget.dart';
import 'package:rick_morty/widgets/search_bar_widget.dart';
import 'package:rick_morty/widgets/drawer_widget.dart';
import 'package:rick_morty/widgets/episode_list_widget.dart';
import 'package:rick_morty/repositories/episodes_repository.dart';
import 'package:rick_morty/theme/app_colors.dart';

class EpisodesHomePage extends StatefulWidget {
  static const routeId = '/episodes';
  const EpisodesHomePage({super.key});

  @override
  State<EpisodesHomePage> createState() => _EpisodesHomePageState();
}

class _EpisodesHomePageState extends State<EpisodesHomePage> {
  Future<List<DetailedEpisode>>? episodes;
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

  void _fetchEpisodes([String name = '']) {
    setState(() {
      episodes = EpisodeRepository.getAllEpisodes(
        name: name.isNotEmpty ? name.toLowerCase() : null,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchEpisodes();
    _searchController.addListener(() => setState(() {}));

    _scrollController.addListener(() {
      if (_scrollController.offset > 300 && !_showScrollToTopButton) {
        setState(() => _showScrollToTopButton = true);
      } else if (_scrollController.offset <= 300 && _showScrollToTopButton) {
        setState(() => _showScrollToTopButton = false);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
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
            child: FutureBuilder<List<DetailedEpisode>>(
              future: episodes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return EpisodeListWidget(
                    episodes: snapshot.data!,
                    scrollController: _scrollController,
                  );
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
      floatingActionButton: _showScrollToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: AppColors.primaryColorLight.withAlpha(180),
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
