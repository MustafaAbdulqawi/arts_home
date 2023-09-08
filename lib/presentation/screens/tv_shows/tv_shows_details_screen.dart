import 'package:arts_home/presentation/screens/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../../data/remote/responses/tv_shows_response.dart';
import '../../styles/colors.dart';
import '../widgets/default_network_image.dart';
import '../widgets/default_text.dart';

class TvShowsDetailsScreen extends StatelessWidget {
  final TvShowsResults tvShowsModel;
  const TvShowsDetailsScreen({super.key, required this.tvShowsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: tvShowsModel.name,
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
                          .imageUrl(imagePath: tvShowsModel.backdropPath),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: DefaultText(
                        text: tvShowsModel.overview,
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
