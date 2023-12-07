import 'package:bharat_mandi_test/Bloc/list_view_bloc.dart';
import 'package:bharat_mandi_test/DataModel/posts_data_model.dart';
import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    listViewBloc.fetchPostsData();
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: listViewBloc.postsData,
          builder:
              (BuildContext context, AsyncSnapshot<PostsDataModel> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(hintText: 'Search by title'),
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      listViewBloc.searchAndFilterByTitle(value);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data?.posts?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ID : ${snapshot.data!.posts![index].id}'),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    'User ID : ${snapshot.data!.posts![index].userId}'),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Title : '),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Text(
                                        snapshot.data!.posts![index].title
                                            .toString(),
                                        maxLines: 50,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Body : '),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Text(
                                        snapshot.data!.posts![index].body
                                            .toString(),
                                        maxLines: 50,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Tags : '),
                                    SizedBox(
                                      width: 200,
                                      height: 25,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot
                                              .data!.posts![index].tags!.length,
                                          itemBuilder: (context, tagIndex) {
                                            return Text(
                                              snapshot.data!.posts![index]
                                                  .tags![tagIndex].name
                                                  .toLowerCase()
                                                  .toString(),
                                              maxLines: 50,
                                            );
                                          },
                                          separatorBuilder:
                                              (context, tagIndex) {
                                            return const Text(
                                              ', ',
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Reactions : '),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        snapshot.data!.posts![index].reactions
                                            .toString(),
                                        maxLines: 50,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
