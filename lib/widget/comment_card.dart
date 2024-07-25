import 'package:apsiyon/core/enum/comment_navigation_type.dart';
import 'package:apsiyon/core/init/extension/context_extensions.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({
    super.key,
    required this.commentNavigationType,
  });
  final CommentNavigationType commentNavigationType;

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.25,
      decoration: BoxDecoration(
        color: const Color(0xffe7e7e7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffd9d9d9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 6),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.notifications_none),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      _controller.text = "";
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          // TextField with maxLines and maxLength
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controller,
                maxLines: null, // Allows the TextField to expand vertically
                maxLength: 200, // Limits input to 200 characters
                decoration: InputDecoration(
                  hintText: widget.commentNavigationType ==
                          CommentNavigationType.application
                      ? 'Ev sahibini iletmek istediğiniz notu yazın'
                      : "Referans yorumunuzu girin",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
