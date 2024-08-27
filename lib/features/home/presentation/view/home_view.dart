import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mybook/core/functions/navigator.dart';
import 'package:mybook/core/responsive/responsive_layout.dart';
import 'package:mybook/core/utils/colors.dart';
import 'package:mybook/core/utils/text_style.dart';
import 'package:mybook/features/auth/presentation/manager/auth_cubit.dart';
import 'package:mybook/features/auth/presentation/manager/auth_state.dart';
import 'package:mybook/features/cart/presentation/view/cart_view.dart';
import 'package:mybook/features/home/presentation/manager/category_model/category_model.dart';
import 'package:mybook/features/home/presentation/manager/product/product_model.dart';
import 'package:mybook/features/home/presentation/widget/CustomBestSelling.dart';
import 'package:mybook/features/home/presentation/widget/CustomBtnSlider.dart';
import 'package:mybook/features/home/presentation/widget/CustomCategorys.dart';
import 'package:mybook/features/home/presentation/widget/CustomDrawer.dart';
import 'package:mybook/features/home/presentation/widget/CustomHaederSlider.dart';
import 'package:mybook/features/profile/presentation/manager/user_model.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<AuthCubit>(context).getHomeHeadersSlider();
    BlocProvider.of<AuthCubit>(context).getBestSellery();
    BlocProvider.of<AuthCubit>(context).getCategories();
    BlocProvider.of<AuthCubit>(context).getShowCategories(id: '2');
    BlocProvider.of<AuthCubit>(context).getProfile();
    BlocProvider.of<AuthCubit>(context).showFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        List sliders = AuthCubit.get(context).sliders;
        List<ProductModel> productsModel =
            AuthCubit.get(context).products.toList();
        List<CategoryModel> categoryModel = AuthCubit.get(context).categories;
        UserModel? user = AuthCubit.get(context).userModel;
        return Scaffold(
          drawer: const CustomDrawer(),
          floatingActionButton: SizedBox(
            width: ResponsiveLayout.getWidth(45, context),
            height: ResponsiveLayout.getHeight(45, context),
            child: FloatingActionButton(
              onPressed: () {
                navTo(context, const CartView());
              },
              backgroundColor: AppColors.primary,
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.white,
              ),
            ),
          ),
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                user?.name != null
                    ? Text('${user?.name}', style: getTitleStyle(context))
                    : SizedBox(
                        height: ResponsiveLayout.getHeight(20, context),
                        child: Shimmer.fromColors(
                          baseColor: AppColors.grey,
                          highlightColor: AppColors.white,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    ResponsiveLayout.getHeight(20, context)),
                              ),
                            ),
                          ),
                        ),
                      ),
                Text("What are you reading today", style: getSmallStyle()),
              ],
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(
                    right: ResponsiveLayout.getWidth(5, context)),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                width: ResponsiveLayout.getWidth(60, context),
                height: ResponsiveLayout.getHeight(60, context),
                child: Image.network(
                  user?.image ?? '',
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      width: 50,
                      height: ResponsiveLayout.getHeight(150, context),
                      child: Shimmer.fromColors(
                        baseColor: AppColors.grey,
                        highlightColor: AppColors.white,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  ResponsiveLayout.getHeight(20, context)),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Gap(
                  ResponsiveLayout.getGap(10, context),
                ),
                CustomHaederSlider(
                  imageSlider: sliders,
                ),
                Gap(
                  ResponsiveLayout.getGap(10, context),
                ),
                CustomBestSellrey(
                  products: productsModel,
                ),
                const CustomBtnSlider(),
                Gap(
                  ResponsiveLayout.getGap(10, context),
                ),
                CustomCategorys(
                  categorys: categoryModel,
                ),
                Gap(
                  ResponsiveLayout.getGap(10, context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

//
}
