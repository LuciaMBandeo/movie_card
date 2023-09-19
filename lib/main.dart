import 'package:flutter/material.dart';
import 'package:movie_card/widgets/like_button.dart';
import 'package:movie_card/widgets/row_genres.dart';
import 'package:movie_card/widgets/row_stars.dart';

import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    Constants.heightPercentageSizedBoxStack,
                child: Stack(
                  children: [
                    Image.network(Constants.imageBackdrop),
                    Positioned(
                      left: Constants.positionRankingContainer,
                      top: Constants.positionRankingContainer,
                      child: Container(
                        padding: const EdgeInsets.all(
                          Constants.paddingRankingContainer,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          border: Border.all(
                            color: Colors.deepOrangeAccent,
                            width: Constants.borderContainer,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          Constants.ranking,
                          style: TextStyle(
                            fontSize: Constants.fontSize,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: Constants.imagePositionTopSizedBox,
                      child: Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width *
                                Constants.percentageSizedBox,
                            child: Image.network(Constants.imagePoster),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: Constants.paddingTopMainInfo),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  Constants.percentageSizedBox,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Constants.titleMovieCard,
                                    style: TextStyle(
                                      fontSize: Constants.fontSize,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                        Constants.paddingAllTextReleaseDate),
                                    child: Text(
                                      Constants.releaseDate,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                        Constants.paddingAllIconsRow),
                                    child: StarsRow(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(Constants.paddingAllGenresRow),
                child: GenresRow(
                  genresList: [],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(Constants.paddingAllExtraInfo),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: Constants.paddingOverview),
                      child: Text(
                        Constants.textOverview,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: Constants.paddingBottomOverview),
                      child: Text(
                        Constants.textOriginalTitle,
                        style: TextStyle(
                          fontSize: Constants.fontSizeOverview,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: Constants.paddingBottomOriginalTitle),
                      child: Text(
                        Constants.textOriginalTitle,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          Constants.textLikeMovie,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        LikeButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
