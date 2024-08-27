import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybook/core/widgets/customItemOrder.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';
import 'package:mybook/features/home/presentation/manager/category_model/category_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShowCategory extends StatefulWidget {
  ShowCategory({required this.category, super.key});
  CategoryModel category;

  @override
  State<ShowCategory> createState() => _ShowCategoryState();
}

class _ShowCategoryState extends State<ShowCategory> {
  @override
  void initState() {
    super.initState();
    AuthCubit.get(context).getShowCategories(id: widget.category.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name.toString()),
        centerTitle: true,
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);

          if (state is ShowCategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ShowCategorySuccess) {
            return ListView.builder(
              itemCount: cubit.showCategories.length,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: cubit.showCategories.isEmpty,
                  child: CustomItemOrder(
                      productModel: cubit.showCategories.elementAt(index)),
                );
              },
            );
          } else if (state is ShowCategoryError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return ListView.builder(
              itemCount: cubit.showCategories.length,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: cubit.showCategories.isEmpty,
                  child: CustomItemOrder(
                      productModel: cubit.showCategories.elementAt(index)),
                );
              },
            );
          }
        },
      ),
    );
  }
}
