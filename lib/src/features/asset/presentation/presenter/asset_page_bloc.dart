import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/src/core/presentation/failures/domain_failure_to_ui_failure_extension.dart';
import 'package:tractian_interview/src/features/asset/domain/usecases/build_asset_trees_usecase.dart';
import 'package:tractian_interview/src/features/asset/domain/usecases/remote_load_company_assets_usecase.dart';
import 'package:tractian_interview/src/features/asset/domain/usecases/remote_load_company_locations_usecase.dart';
import 'package:tractian_interview/src/features/asset/presentation/presenter/asset_page_event.dart';
import 'package:tractian_interview/src/features/asset/presentation/presenter/asset_page_presenter.dart';
import 'package:tractian_interview/src/features/asset/presentation/presenter/asset_page_state.dart';

class AssetPageBloc extends Bloc<AssetPageEvent, AssetPageState>
    implements AssetPagePresenter {
  RemoteLoadCompanyLocationsUseCase loadCompanyLocations;
  RemoteLoadCompanyAssetsUseCase loadCompanyAssets;
  BuildAssetTreesUseCase buildAssetTrees;

  AssetPageBloc(
    this.loadCompanyLocations,
    this.loadCompanyAssets,
    this.buildAssetTrees,
  ) : super(AssetPageLoading()) {
    on<LoadTree>((event, emit) async {
      await onLoadTree(event, emit);
    });

    on<SearchByName>((event, emit) {
      onSearchByName(event, emit);
    });
  }

  late List<dynamic> data;

  @override
  Future<void> onLoadTree(LoadTree event, Emitter<AssetPageState> emit) async {
    emit(AssetPageLoading());

    final locationsResult = await loadCompanyLocations.call(event.companyId);
    final assetsResult = await loadCompanyAssets.call(event.companyId);

    locationsResult.fold(
      (domainFailure) => emit(AssetPageLoadedFailure(domainFailure.toUI())),
      (locationModelList) {
        assetsResult.fold(
          (domainFailure) => emit(AssetPageLoadedFailure(domainFailure.toUI())),
          (assetModelList) {
            data = [...locationModelList, ...assetModelList];

            final List<String> ids = _getAllIds(data);

            final params = AssetTreesParams(data: data, ids: ids);
            final assetTreesResult = buildAssetTrees.call(params);

            assetTreesResult.fold(
              (domainFailure) =>
                  emit(AssetPageLoadedFailure(domainFailure.toUI())),
              (treeNodeList) => emit(AssetPageLoadedSuccess(treeNodeList)),
            );
          },
        );
      },
    );
  }

  @override
  void onSearchByName(SearchByName event, Emitter<AssetPageState> emit) async {
    final List<String> ids = _getIdsByName(data, event.name);

    final params = AssetTreesParams(data: data, ids: ids);
    final assetTreesResult = buildAssetTrees.call(params);

    assetTreesResult.fold(
      (domainFailure) => emit(AssetPageLoadedFailure(domainFailure.toUI())),
      (treeNodeList) => emit(AssetPageLoadedSuccess(treeNodeList)),
    );
  }

  List<String> _getAllIds(List<dynamic> list) {
    final List<String> ids = [];

    for (final data in list) {
      ids.add(data.id);
    }

    return ids;
  }

  List<String> _getIdsByName(List<dynamic> list, String name) {
    final List<String> ids = [];

    for (final data in list) {
      if (data.name.toLowerCase().contains(name.toLowerCase())) {
        ids.add(data.id);
      }
    }
    return ids;
  }
}
