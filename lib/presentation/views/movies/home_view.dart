import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mymovielist/presentation/providers/providers.dart';
import 'package:mymovielist/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(trendingTodayMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    FlutterNativeSplash.remove();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    // final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final trendingTodayMovies = ref.watch(trendingTodayMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor: Color(0xFF191919),
              // systemNavigationBarDividerColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.dark),
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: CustomAppbar(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              // const CustomAppbar(),
              MoviesSlideshow(movies: slideShowMovies),
              MovieHorizontalListview(
                movies: trendingTodayMovies,
                title: 'Tendencias',
                subtitle: 'Hoy',
                loadNextPage: () {
                  ref.read(trendingTodayMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En cines',
                subtitle: 'Lunes 20',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              //* Ya no estará acá, ahora es parte del menú inferior
              // MovieHorizontalListview(
              //   movies: popularMovies,
              //   title: 'Populares',
              //   // subtitle: '',
              //   loadNextPage: () {
              //     ref.read(popularMoviesProvider.notifier).loadNextPage();
              //   },
              // ),
              MovieHorizontalListview(
                movies: topRatedMovies,
                title: 'Mejor calificadas',
                subtitle: 'Desde siempre',
                loadNextPage: () {
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: upcomingMovies,
                title: 'Proximamente',
                subtitle: 'En este mes',
                loadNextPage: () {
                  ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                },
              ),
              const SizedBox(height: 10),
            ],
          );
        }, childCount: 1)),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
