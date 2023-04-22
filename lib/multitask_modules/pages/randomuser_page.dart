import 'package:flutter/material.dart';
import 'package:lesson01/multitask_modules/logics/randomuser_logic.dart';
import 'package:lesson01/multitask_modules/models/randomuser_model.dart';
import 'package:lesson01/multitask_modules/pages/randomuser_detail_page.dart';
import 'package:lesson01/multitask_modules/utils/nav_util.dart';
import 'package:lesson01/multitask_modules/widgets/nointernet_widget.dart';
import 'package:lesson01/multitask_modules/widgets/offline_widget.dart';
import 'package:provider/provider.dart';
import '../logics/post_logic.dart';

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
        title: Text("Random User"),
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
      return NoInternetWidget(
        onRetry: () async {
          context.read<RandomUserLogic>().setLoading();
          await context.read<RandomUserLogic>().read();
          await context.read<PostLogic>().read();
        },
      );
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
        onTap: () {
          NavUtil.go(
            context: context,
            to: RandomUserDetailPage(item),
          );
        },
        leading: Image.network("${item.picture.large}"),
        title: Text("${item.name.title}, ${item.name.first} ${item.name.last}"),
        subtitle: Text("${item.location.city}, ${item.location.country}"),
        trailing: Text("${item.nat}"),
      ),
    );
  }
}
