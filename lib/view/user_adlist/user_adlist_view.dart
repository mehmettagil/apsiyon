import 'package:apsiyon/app_bloc/advert_bloc/advert_bloc.dart';
import 'package:apsiyon/core/init/extension/context_extensions.dart';
import 'package:apsiyon/view/filter/filter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAdListView extends StatefulWidget {
  const UserAdListView({super.key});

  @override
  State<UserAdListView> createState() => _UserAdListViewState();
}

class _UserAdListViewState extends State<UserAdListView> {
  @override
  void initState() {
    context.read<AdVertBloc>().add(const AdvertInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const FilterView()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('İlanlarım',
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
              BlocBuilder<AdVertBloc, AdVertState>(
                builder: (context, state) {
                  if (state.advertListOrCrash == null) {
                    return const Center(
                        child: Text("İlanınız bulunmamaktadır."));
                  } else if (state.advertListOrCrash!.isEmpty) {
                    return const Center(
                        child: Text("İlanınız bulunmamaktadır."));
                  } else {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            for (var index = 0;
                                index < state.advertListOrCrash!.length;
                                index++) ...{
                              Card(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: context.width * 0.45,
                                      height: context.height * 0.15,
                                      child: Image.network(
                                        "https://www.alemdarbinayonetimi.com.tr/wp-content/uploads/2022/04/site-yonetimi-1200x565-1.jpg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Site Adı: ${state.advertListOrCrash![index].siteAdi}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "M2: ${state.advertListOrCrash![index].m2}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "Oda Sayısı: ${state.advertListOrCrash![index].odaSayisi}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "Fiyat: ${state.advertListOrCrash![index].fiyat.toStringAsFixed(0)}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            }
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
