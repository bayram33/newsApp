import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import '../view_model/news_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListNewsVievModel listnews = ListNewsVievModel();
  String newUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS68KnNvacM2_p-GwxYHbGU-u-v6irThbt6CA&usqp=CAU";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: listnews.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: listnews.articles?.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    await launchUrl(
                      Uri.parse(
                          "${listnews.articles![index].articlesModel?.url}"),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          color: Colors.amber,
                          child: Image.network(newUrl, fit: BoxFit.fill),
                        ),
                        Text(
                          "${listnews.articles![index].articlesModel?.title}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                "${listnews.articles![index].articlesModel?.author}"),
                            const Text("Habere Gitmek İçin Tıkla"),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
