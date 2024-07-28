import 'package:apsiyon/core/enum/comment_navigation_type.dart';
import 'package:apsiyon/core/init/extension/context_extensions.dart';
import 'package:apsiyon/core/model/ad_model.dart';
import 'package:apsiyon/view/house_ad/house_ad_view.dart';
import 'package:apsiyon/widget/comment_card.dart';
import 'package:apsiyon/widget/sub_confirmation_button.dart';
import 'package:flutter/material.dart';

class AdDetail extends StatefulWidget {
  const AdDetail({super.key, required this.adModel});
  final AdModel adModel;

  @override
  State<AdDetail> createState() => _AdDetailState();
}

class _AdDetailState extends State<AdDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Başvuru",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.adModel.imageUrl,
                        width: context.width * 0.5,
                        height: context.height * 0.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.adModel.siteName,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.adModel.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.adModel.price.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "İlan No: ${widget.adModel.adNo}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Ad Soyad Mehmet Tağıl",
                        style: TextStyle(fontSize: 18)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Tel No: 05358599078",
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const CommentCard(
                  commentNavigationType: CommentNavigationType.application,
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ConfirmButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdView()));
                    },
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
