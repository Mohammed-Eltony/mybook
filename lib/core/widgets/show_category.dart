import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mybook/core/widgets/customItemOrder.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/home/presentation/manager/category_model/category_model.dart';

class ShowCategory extends StatefulWidget {
  ShowCategory({required this.category, super.key});
  CategoryModel category;

  @override
  State<ShowCategory> createState() => _ShowCategoryState();
}

class _ShowCategoryState extends State<ShowCategory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AuthCubit.get(context).getShowCategories(id: widget.category.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name.toString()),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cubit.showCategories.length,
        itemBuilder: (context, index) {
          return CustomItemOrder(productModel: cubit.showCategories[index]);
        },
      ),
    );
  }
}
