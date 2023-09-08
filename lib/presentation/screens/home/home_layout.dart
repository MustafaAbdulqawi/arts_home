import 'package:arts_home/business_logic/app_cubit.dart';
import 'package:arts_home/presentation/screens/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';
import '../widgets/default_text.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late AppCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = AppCubit.get(context)
      ..getMovies()
      ..getTvShows()
      ..getStars();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar:DefaultAppBar(
            title: cubit.appBarTitles[cubit.currentIndex],
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [black, darkRed, black],
                  ),
                ),
              ),
              BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  if (state is AppMoviesLoadingState ||
                      state is AppTvShowsLoadingState ||
                      state is AppStarsLoadingState
                  ) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else if (state is AppMoviesSuccessState ||
                      state is AppChangeBottomNavigationBarState ||
                      state is AppTvShowsSuccessState||
                      state is AppStarsSuccessState
                  ) {
                    return cubit.screen[cubit.currentIndex];
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 75.sp,
                          ),
                          const DefaultText(text: "error"),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          bottomNavigationBar: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                onTap: (index) => cubit.onChangeBottom(index),
                currentIndex: cubit.currentIndex,
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.movie_creation_outlined,
                    ),
                    label: cubit.appBarTitles[0],
                    backgroundColor: darkRed,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.tv,
                    ),
                    label: cubit.appBarTitles[1],
                    backgroundColor: Colors.red,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.star,
                    ),
                    label: cubit.appBarTitles[2],
                    backgroundColor: lightRed,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
