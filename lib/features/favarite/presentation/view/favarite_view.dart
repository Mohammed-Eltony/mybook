import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mybook/core/widgets/customItemOrder.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';
import 'package:mybook/features/favarite/presentation/manager/favarite_model/favarite_model.dart';
import 'package:mybook/features/favarite/presentation/widget/custom_favarite_item.dart';
import 'package:mybook/features/home/presentation/manager/product/product_model.dart';

class FavariteView extends StatefulWidget {
  const FavariteView({super.key});

  @override
  State<FavariteView> createState() => _FavariteViewState();
}

class _FavariteViewState extends State<FavariteView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthCubit.get(context).showFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        List<FavariteModel> products = cubit.favoriteProduct.toList();
        if (state is EditProfileSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {}); // Refresh the profile view
          });
        }
        return Scaffold(
            appBar: AppBar(
              title: const Text('Favarite'),
              centerTitle: true,
            ),
            body: cubit.favoriteProduct.isNotEmpty
                ? ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return customFavariteItem(productModel: products[index]);
                    },
                  )
                : Center(
                    child: Lottie.asset('assets/not_found.json'),
                  ));
      },
    );
  }
}
