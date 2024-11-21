import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/design_system/atoms/challenge_blanc_box.dart';
import 'package:tractian_interview/features/asset/presentation/presenter/asset_page_bloc.dart';
import 'package:tractian_interview/features/asset/presentation/presenter/asset_page_event.dart';
import 'package:tractian_interview/features/asset/presentation/presenter/asset_page_presenter.dart';
import 'package:tractian_interview/features/asset/presentation/presenter/asset_page_state.dart';
import 'package:tractian_interview/features/asset/presentation/ui/views/asset_page_loaded_failure_view.dart';
import 'package:tractian_interview/features/asset/presentation/ui/views/asset_page_loaded_success_view.dart';
import 'package:tractian_interview/features/asset/presentation/ui/views/asset_page_loading_view.dart';

class AssetPage extends StatefulWidget {
  final String companyId;
  final AssetPagePresenter pagePresenter;

  const AssetPage(
    this.companyId,
    this.pagePresenter, {
    super.key,
  });

  @override
  State<AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  late AssetPageBloc bloc;

  @override
  void initState() {
    bloc = widget.pagePresenter as AssetPageBloc;
    bloc.add(LoadTree(widget.companyId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetPageBloc, AssetPageState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is AssetPageLoading) {
          return const AssetPageLoadingView();
        } else if (state is AssetPageLoadedFailure) {
          return AssetPageLoadedFailureView(
            message: state.message,
            onReload: () => bloc.add(LoadTree(widget.companyId)),
          );
        } else if (state is AssetPageLoadedSuccess) {
          return AssetPageLoadedSuccessView(
            trees: state.trees,
            onSearchByName: (value) => bloc.add(SearchByName(value)),
            onSearchByEnergySensor: () =>
                bloc.add(const SearchByEnergySensor()),
            onSearchByAlertStatus: () => bloc.add(const SearchByAlertStatus()),
          );
        } else {
          return const ChallengeBlancBox();
        }
      },
    );
  }
}
