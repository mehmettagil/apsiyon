import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:apsiyon/core/init/extension/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

class HouseAdView extends StatelessWidget {
  const HouseAdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İlanlar'),
      ),
      body: BlocBuilder<HouseAdBloc, HouseAdState>(
        buildWhen: (previous, current) {
          return previous.adList != current.adList;
        },
        builder: (context, state) {
          // Eğer liste null veya boşsa, yüklenme göstergesi gösterilir
          if (state.adListOrCrash == null || state.adListOrCrash!.isEmpty()) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Eğer liste doluysa, ilanlar listelenir
          return SingleChildScrollView(
            child: Column(
              children: [
                for (var index = 0; index < state.adListOrCrash!.size; index++) ...{
                  Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.width * 0.45,
                          height: context.height * 0.15,
                          child: Image.network(
                            state.adListOrCrash![index].imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: context.width * 0.9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "İlan No: ${state.adListOrCrash![index].adNo}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      LikeButton(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 5.0),
                                        size: 24,
                                        isLiked: false,
                                        bubblesSize: 0,
                                        likeCountPadding:
                                            const EdgeInsets.only(left: 6),
                                        onTap: (bool isLiked) async {
                                          return !isLiked;
                                        },
                                        likeBuilder: (bool isLiked) {
                                          return Icon(
                                            isLiked
                                                ? Icons.favorite
                                                : Icons
                                                    .favorite_border_outlined,
                                            color: isLiked
                                                ? Colors.red
                                                : Colors.black,
                                            size: 24,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    state.adListOrCrash![index].siteName,
                                    style: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    state.adListOrCrash![index].description,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Text(
                                        state.adListOrCrash![index].price,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                }
              ],
            ),
          );
        },
      ),
    );
  }
}
