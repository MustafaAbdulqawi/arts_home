import 'package:arts_home/data/remote/responses/movies_response.dart';
import 'package:arts_home/presentation/screens/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../styles/colors.dart';
import '../widgets/default_network_image.dart';
import '../widgets/default_text.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MoviesResults movieModel;
  const MovieDetailsScreen({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: movieModel.title,
      ),
      body: SingleChildScrollView(
        child:  Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [black, darkRed, black],
            ),
          ),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(top: 2.h, bottom: 1.h),
                    child: DefaultNetworkImage(
                      imageURL: AppCubit.get(context)
                          .imageUrl(imagePath: movieModel.backdropPath),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: DefaultText(
                        text: movieModel.overview,
                        textSize: 15.sp,
                        weight: FontWeight.bold,
                        textColor: Colors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
