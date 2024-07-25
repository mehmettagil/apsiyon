import 'dart:developer';

import 'package:apsiyon/app_bloc/ad_list_bloc/ad_list_bloc.dart';
import 'package:apsiyon/core/init/extension/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdList extends StatelessWidget {
  const AdList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Başvurular',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<AdListBloc, AdListState>(
              builder: (context, state) {
                if (state.adListListOrCrash == null) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.adListListOrCrash!.size,
                      itemBuilder: (context, index) {
                        return Container(
                          width: context.width,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  state.adListListOrCrash![index].peopleImage,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${state.adListListOrCrash![index].name} ${state.adListListOrCrash![index].surname}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Başvuru No: ${state.adListListOrCrash![index].adNo}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "Başvuru Tarihi: ${state.adListListOrCrash![index].adDate}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              state.adListListOrCrash![index].isReference
                                  ? Center(
                                      child: Icon(
                                        Icons.star,
                                        size: 30,
                                        color: Colors.blueAccent,
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
