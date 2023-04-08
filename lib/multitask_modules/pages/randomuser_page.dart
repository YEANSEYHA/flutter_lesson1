import 'package:flutter/material.dart';
import 'package:lesson01/multitask_modules/logics/randomuser_module.dart';
import 'package:lesson01/multitask_modules/models/randomuser_module.dart';
import 'package:provider/provider.dart';

class RandomUserPage extends StatefulWidget {
  const RandomUserPage({Key? key}) : super(key: key);

  @override
  State<RandomUserPage> createState() => _RandomUserPageState();
}

class _RandomUserPageState extends State<RandomUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Random User Task"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: _buildData(),
    );
  }

  Widget _buildData() {
    String? error = context.watch<RandomUserLogic>().error;
    RandomUserModel? userModel = context.watch<RandomUserLogic>().userModel;

    if (error != null && userModel == null) {
      debugPrint("error: $error");
      return _buildError();
    }

    if (error != null && userModel != null) {
      return Stack(
        alignment: Alignment.center,
        children: [
          _buildInfo(userModel.info),
          Positioned(
            bottom: 20,
            child: _buildOffline(),
          ),
        ],
      );
    } else {
      return _buildInfo(userModel!.info);
    }
  }

  Widget _buildInfo(Info info) {
    return ListView(
      children: [
        Card(
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text("${info.seed}"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text("${info.results}"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.numbers),
            title: Text("${info.page}"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.title),
            title: Text("${info.version}"),
          ),
        ),
      ],
    );
  }

  Widget _buildOffline() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            "You're currently offline",
            style: TextStyle(color: Colors.white),
          ),
          TextButton(
            onPressed: () async {
              await context.read<RandomUserLogic>().read();
            },
            child: Row(
              children: [
                Icon(Icons.refresh),
                Text(
                  "RETRY",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.warning_outlined),
        Text("Something went wrong"),
        ElevatedButton(
          onPressed: () async {
            context.read<RandomUserLogic>().setLoading();
            await context.read<RandomUserLogic>().read();
          },
          child: Text("RETRY"),
        ),
      ],
    );
  }

// Widget _buildListView(List<PostModel>? items) {
//   if (items == null) {
//     return SizedBox();
//   }
//
//   return RefreshIndicator(
//     onRefresh: () async {
//       await context.read<PostLogic>().read();
//     },
//     child: ListView.builder(
//       physics: BouncingScrollPhysics(),
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return _buildItem(items[index]);
//       },
//     ),
//   );
// }
//
// Widget _buildItem(PostModel item) {
//   return Card(
//     child: ListTile(
//       leading: Text("${item.id}"),
//       title: Text("${item.title}"),
//       subtitle: Text("${item.body}"),
//       trailing: Text("${item.userId}"),
//     ),
//   );
// }
}
