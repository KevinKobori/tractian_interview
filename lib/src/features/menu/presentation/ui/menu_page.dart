import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/src/design_system/app_blanc_box.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_bloc.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_event.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_presenter.dart';
import 'package:tractian_interview/src/features/menu/presentation/presenter/menu_page_state.dart';
import 'package:tractian_interview/src/features/menu/presentation/ui/views/menu_page_loaded_failure_view.dart';
import 'package:tractian_interview/src/features/menu/presentation/ui/views/menu_page_loaded_success_view.dart';
import 'package:tractian_interview/src/features/menu/presentation/ui/views/menu_page_loading_view.dart';

class MenuPage extends StatefulWidget {
  final MenuPagePresenter pagePresenter;

  const MenuPage({
    required this.pagePresenter,
    super.key,
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late MenuPageBloc bloc;

  @override
  void initState() {
    bloc = widget.pagePresenter as MenuPageBloc;
    bloc.add(const LoadAllCompanies());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuPageBloc, MenuPageState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is MenuPageLoading) {
          return const MenuPageLoadingView();
        } else if (state is MenuPageLoadedFailure) {
          return MenuPageLoadedFailureView(
            failureMessage: state.message,
            onReload: () => bloc.add(const LoadAllCompanies()),
          );
        } else if (state is MenuPageLoadedSuccess) {
          return MenuPageLoadedSuccessView(
            companies: state.companies,
            onPushToCompanyAssetsPage: (companyId) =>
                bloc.add(PushToCompanyAssetsPage(companyId)),
          );
        } else {
          return const AppBlancBox();
        }
      },
    );
  }
}
