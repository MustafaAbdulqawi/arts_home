import 'package:arts_home/business_logic/app_cubit.dart';
import 'package:arts_home/presentation/screens/widgets/default_network_image.dart';
import 'package:arts_home/presentation/screens/widgets/default_text.dart';
import 'package:arts_home/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:arts_home/core/screens.dart' as screens;
import '../../data/remote/responses/tv_shows_response.dart';

class TvShowsListItem extends StatelessWidget {
  final TvShowsResults tvShowsModel;
  const TvShowsListItem({super.key, required this.tvShowsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, screens.tvShowsDetailsScreen,
            arguments: tvShowsModel);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: DefaultText(
                text: tvShowsModel.name,
                textSize: 18.sp,
                weight: FontWeight.bold,
                textColor: lightRed,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 2.h, bottom: 1.h),
                child: DefaultNetworkImage(
                  imageURL: AppCubit.get(context)
                      .imageUrl(imagePath: tvShowsModel.posterPath),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: DefaultText(
                    text: tvShowsModel.overview,
                    textSize: 12.sp,
                    weight: FontWeight.bold,
                    textColor: Colors.white,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
