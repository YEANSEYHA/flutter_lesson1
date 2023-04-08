import 'package:flutter/material.dart';
import 'package:lesson01/multitask_modules/logics/post_logic.dart';
import 'package:lesson01/multitask_modules/models/post_model.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Multi Task"),
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
    String? error = context.watch<PostLogic>().error;
    List<PostModel>? postList = context.watch<PostLogic>().postList;

    if (error != null && postList == null) {
      debugPrint("error: $error");
      return _buildError();
    }

    if (error != null && postList != null) {
      return Stack(
        alignment: Alignment.center,
        children: [
          _buildListView(postList),
          Positioned(
            bottom: 20,
            child: _buildOffline(),
          ),
        ],
      );
    } else {
      return _buildListView(postList);
    }
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
              await context.read<PostLogic>().read();
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
            context.read<PostLogic>().setLoading();
            await context.read<PostLogic>().read();
          },
          child: Text("RETRY"),
        ),
      ],
    );
  }

  Widget _buildListView(List<PostModel>? items) {
    if (items == null) {
      return SizedBox();
    }

    return RefreshIndicator(
      onRefresh: () async {
        await context.read<PostLogic>().read();
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

  Widget _buildItem(PostModel item) {
    return Card(
      child: ListTile(
        leading: Text("${item.id}"),
        title: Text("${item.title}"),
        subtitle: Text("${item.body}"),
        trailing: Text("${item.userId}"),
      ),
    );
  }
}
