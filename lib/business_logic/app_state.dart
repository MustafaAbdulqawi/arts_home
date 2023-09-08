part of 'app_cubit.dart';

abstract class AppState {}

class AppInitial extends AppState {}
class AppChangeBottomNavigationBarState extends AppState {}
//movies state
class AppMoviesSuccessState extends AppState {}
class AppMoviesLoadingState extends AppState {}
class AppMoviesErrorState extends AppState {}
//tvShows state
class AppTvShowsSuccessState extends AppState {}
class AppTvShowsLoadingState extends AppState {}
class AppTvShowsErrorState extends AppState {}
//stars states
class AppStarsSuccessState extends AppState {}
class AppStarsLoadingState extends AppState {}
class AppStarsErrorState extends AppState {}

