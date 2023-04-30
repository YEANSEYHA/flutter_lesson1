import 'package:flutter/material.dart';
import 'package:lesson01/localhost_module/logics/product_logic.dart';
import 'package:lesson01/localhost_module/models/product_model.dart';
import 'package:provider/provider.dart';

import '../utils/nav_util.dart';
import '../widgets/nointernet_widget.dart';
import '../widgets/offline_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
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
    String? error = context.watch<ProductLogic>().error;
    ProductModel? userModel = context.watch<ProductLogic>().productModel;

    if (error != null && userModel == null) {
      debugPrint("error: $error");
      return NoInternetWidget(
        onRetry: () async {
          context.read<ProductLogic>().setLoading();
          await context.read<ProductLogic>().read();
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
                await context.read<ProductLogic>().read();
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
        await context.read<ProductLogic>().read();
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
        onTap: () {},
        leading: Image.network("${item.image}"),
        title: Text("${item.title}"),
        subtitle: Text("\$${item.price}"),
        trailing: Text("${item.qty} items \nin stock"),
      ),
    );
  }
}
