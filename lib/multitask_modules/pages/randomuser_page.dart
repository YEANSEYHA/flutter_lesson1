import 'package:flutter/material.dart';
import 'package:lesson01/multitask_modules/logics/randomuser_logic.dart';
import 'package:lesson01/multitask_modules/models/randomuser_model.dart';
import 'package:lesson01/multitask_modules/widgets/offline_widget.dart';
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
          _buildListView(userModel.results),
          Positioned(
            bottom: 20,
            child: OfflineWidget(
              onRetry: () async {
                await context.read<RandomUserLogic>().read();
              },
            ),
          ),
        ],
      );
    } else {
      return _buildListView(userModel!.results);
    }
  }

  // Widget _buildInfo(Info info) {
  //   return ListView(
  //     children: [
  //       Card(
  //         child: ListTile(
  //           leading: Icon(Icons.info),
  //           title: Text("${info.seed}"),
  //         ),
  //       ),
  //       Card(
  //         child: ListTile(
  //           leading: Icon(Icons.account_balance_wallet),
  //           title: Text("${info.results}"),
  //         ),
  //       ),
  //       Card(
  //         child: ListTile(
  //           leading: Icon(Icons.numbers),
  //           title: Text("${info.page}"),
  //         ),
  //       ),
  //       Card(
  //         child: ListTile(
  //           leading: Icon(Icons.title),
  //           title: Text("${info.version}"),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildOffline() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.black87,
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //     child: Column(
  //       children: [
  //         Text(
  //           "You're currently offline",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         TextButton(
  //           onPressed: () async {
  //             await context.read<RandomUserLogic>().read();
  //           },
  //           child: Row(
  //             children: [
  //               Icon(Icons.refresh),
  //               Text(
  //                 "RETRY",
  //                 style: TextStyle(fontSize: 18),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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

  Widget _buildListView(List<Result>? items) {
    if (items == null) {
      return SizedBox();
    }

    return RefreshIndicator(
      onRefresh: () async {
        await context.read<RandomUserLogic>().read();
      },
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildItem(items[index]);
        },
      ),
    );
  }

  Widget _buildItem(Result item) {
    return Card(
      child: ListTile(
        leading: Image.network("${item.picture.large}"),
        title: Text("${item.name.title}, ${item.name.first} ${item.name.last}"),
        subtitle: Text("${item.location.city}, ${item.location.country}"),
        trailing: Text("${item.nat}"),
      ),
    );
  }
}
