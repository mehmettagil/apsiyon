import 'package:apsiyon/core/enum/comment_navigation_type.dart';
import 'package:apsiyon/widget/comment_card.dart';
import 'package:apsiyon/widget/rate_app.dart';
import 'package:apsiyon/widget/sub_confirmation_button.dart';
import 'package:flutter/material.dart';

class ReferenceView extends StatelessWidget {
  const ReferenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Referans Ol",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.person_2, size: 100),
                const SizedBox(
                  height: 25,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Pınar Nur Öztürk",
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Yönetici: Şehnaz Bacakoğlu",
                        style: TextStyle(fontSize: 22)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Esenevler Sitesi", style: TextStyle(fontSize: 22)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Tel No: 053545549078",
                        style: TextStyle(fontSize: 22)),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const CommentCard(
                  commentNavigationType: CommentNavigationType.reference,
                ),
                const SizedBox(
                  height: 40,
                ),
                const RatingExample(),
                Center(
                  child: ConfirmButton(
                    animate: false,
                    paddingHorizantal: 70,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
