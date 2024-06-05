import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/src/core/data/models/asset_model.dart';
import 'package:tractian_interview/src/core/data/models/location_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/features/asset/domain/usecases/remote_load_company_assets_usecase.dart';
import 'package:tractian_interview/src/features/asset/domain/usecases/remote_load_company_locations_usecase.dart';
import 'package:tractian_interview/src/features/asset/presentation/presenter/asset_page_event.dart';
import 'package:tractian_interview/src/features/asset/presentation/presenter/asset_page_presenter.dart';
import 'package:tractian_interview/src/features/asset/presentation/presenter/asset_page_state.dart';

class AssetPageBloc extends Bloc<AssetPageEvent, AssetPageState>
    implements AssetPagePresenter {
  RemoteLoadCompanyLocationsUseCase loadCompanyLocations;
  RemoteLoadCompanyAssetsUseCase loadCompanyAssets;

  AssetPageBloc(
    this.loadCompanyLocations,
    this.loadCompanyAssets,
  ) : super(AssetPageLoading()) {
    on<LoadTree>((event, emit) async {
      await onLoadTree(event, emit);
    });

    on<Search>((event, emit) {
      onSearch(event, emit);
    });
  }

  Future<Either<DomainFailure, List<AssetModel>>> _loadCompanyAssets(
      String companyId) async {
    final Either<DomainFailure, List<AssetModel>> result =
        await loadCompanyAssets.call(companyId);

    return result;
  }

  Future<Either<DomainFailure, List<LocationModel>>> _loadCompanyLocations(
      String companyId) async {
    final Either<DomainFailure, List<LocationModel>> result =
        await loadCompanyLocations.call(companyId);

    return result;
  }

  @override
  Future<void> onLoadTree(LoadTree event, Emitter<AssetPageState> emit) async {
    emit(AssetPageLoading());
    final locationsResult = _loadCompanyLocations(event.companyId);
    final assetsResult = _loadCompanyAssets(event.companyId);
  }

  @override
  void onSearch(Search event, Emitter<AssetPageState> emit) async {}
}
