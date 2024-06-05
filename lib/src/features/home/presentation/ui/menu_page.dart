import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/src/design_system/atoms/challenge_blanc_box.dart';
import 'package:tractian_interview/src/features/home/presentation/presenter/home_page_bloc.dart';
import 'package:tractian_interview/src/features/home/presentation/presenter/home_page_event.dart';
import 'package:tractian_interview/src/features/home/presentation/presenter/home_page_presenter.dart';
import 'package:tractian_interview/src/features/home/presentation/presenter/home_page_state.dart';
import 'package:tractian_interview/src/features/home/presentation/ui/views/home_page_loaded_failure_view.dart';
import 'package:tractian_interview/src/features/home/presentation/ui/views/home_page_loaded_success_view.dart';
import 'package:tractian_interview/src/features/home/presentation/ui/views/home_page_loading_view.dart';

class HomePage extends StatefulWidget {
  final HomePagePresenter pagePresenter;

  const HomePage(
    this.pagePresenter, {
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageBloc bloc;

  @override
  void initState() {
    bloc = widget.pagePresenter as HomePageBloc;
    bloc.add(const LoadAllCompaniesUnit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is HomePageLoading) {
          return const HomePageLoadingView();
        } else if (state is HomePageLoadedFailure) {
          return HomePageLoadedFailureView(
            message: state.message,
            onReload: () => bloc.add(const LoadAllCompaniesUnit()),
          );
        } else if (state is HomePageLoadedSuccess) {
          return HomePageLoadedSuccessView(
            companies: state.companies,
            onPushToAssetPage: (companyId) =>
                bloc.add(PushToAssetPage(context, companyId)),
          );
        } else {
          return const ChallengeBlancBox();
        }
      },
    );
  }
}
