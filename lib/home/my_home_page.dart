import 'package:fetchingapi_riverpod/data/data_provider.dart';
import 'package:fetchingapi_riverpod/screen/detail_sscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: _data.when(
          data: (_data){
            List<UserModel> userList = _data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                    Expanded(child: ListView.builder(
                      itemCount: userList.length,
                        itemBuilder: (_, index){
                        return InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  e: userList[index],)),
                          ),
                          child: Card(
                            color: Colors.pinkAccent,
                            elevation: 4,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              title: Text(userList[index].firstname, style: TextStyle(
                                color: Colors.grey
                              ),),
                              subtitle: Text(userList[index].lastname, style: TextStyle(
                            color: Colors.grey,
                            ),),
                            trailing: CircleAvatar(
                            backgroundImage:  NetworkImage(userList[index].avatar),
                            ), ),
                          ),
                        );
                        }
                    ))
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => Center(child: CircularProgressIndicator(),)),
    );
  }
}
