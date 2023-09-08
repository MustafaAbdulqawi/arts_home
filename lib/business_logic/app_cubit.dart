import 'package:arts_home/core/constants.dart';
import 'package:arts_home/data/remote/requests/movies_request.dart';
import 'package:arts_home/data/remote/requests/stars_request.dart';
import 'package:arts_home/data/remote/responses/movies_response.dart';
import 'package:arts_home/data/remote/responses/stars_response.dart';
import 'package:arts_home/data/remote/responses/tv_shows_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/remote/requests/tv_shows_request.dart';
import '../presentation/screens/movies/movies_screen.dart';
import '../presentation/screens/stars/stars_screen.dart';
import '../presentation/screens/tv_shows/tv_shows_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  MoviesResponse moviesResponse = MoviesResponse();
  TvShowsResponse tvShowsResponse = TvShowsResponse();
  StarsResponse starsResponse = StarsResponse();
  int currentIndex = 0;
  void onChangeBottom(int index){
    currentIndex =index;
    emit(AppChangeBottomNavigationBarState());
  }
  List<Widget> screen = [
    const MoviesScreen(),
    const TvShowsScreen(),
    const StarsScreen(),
  ];
  List<String> appBarTitles = [
    'Movies',
    'TV Shows',
    'Stars',
  ];
  String imageUrl({required String imagePath}){
    return "$imagesBaseURL$imagePath";
  }
  void getMovies(){
    emit(AppMoviesLoadingState());
    MoviesRequest().moviesRequest(apiKey: "c51104751350c9379bc8b29a40f430a6",
    ).then((value) {
      moviesResponse = value;
      emit(AppMoviesSuccessState());
    }).catchError((error){
      emit(AppMoviesErrorState());
    });
  }

  void getTvShows(){
    emit(AppTvShowsLoadingState());
    TvShowsRequest().tvShowsRequest(apiKey: "c51104751350c9379bc8b29a40f430a6",
    ).then((value) {
      tvShowsResponse = value;
      emit(AppTvShowsSuccessState());
    }).catchError((error){
      emit(AppTvShowsErrorState());
    });
  }
  void getStars(){

    emit(AppStarsLoadingState());

    StarsRequest().starsRequest(apiKey: '234d4710ba5a52c971c9fa050f3b0738').then((value) {
      starsResponse = value;
      emit(AppStarsSuccessState());
    }).catchError((error){
      emit(AppStarsErrorState());
    });
  }
}
