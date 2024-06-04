import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_interview/src/core/data/models/asset_model.dart';
import 'package:tractian_interview/src/core/domain/failures/domain_failure.dart';
import 'package:tractian_interview/src/features/asset/domain/usecases/remote_load_company_assets_usecase.dart';
import 'package:tractian_interview/src/features/asset/presentation/presenter/asset_page_event.dart';
import 'package:tractian_interview/src/features/asset/presentation/presenter/asset_page_presenter.dart';
import 'package:tractian_interview/src/features/asset/presentation/presenter/asset_page_state.dart';

class AssetPageBloc extends Bloc<AssetPageEvent, AssetPageState>
    implements AssetPagePresenter {
  RemoteLoadCompanyAssetsUseCase remoteLoadCompanyAssets;

  AssetPageBloc(this.remoteLoadCompanyAssets) : super(AssetPageLoading()) {
    on<LoadTree>((event, emit) async {
      await onLoadTree(event, emit);
    });

    on<SearchItem>((event, emit) {
      onSearchItem(event, emit);
    });
  }

  Future<Either<DomainFailure, List<AssetModel>>> _loadCompanyAssets(
      String companyId) async {
    final Either<DomainFailure, List<AssetModel>> usecaseResult =
        await remoteLoadCompanyAssets.call(companyId);

    return usecaseResult;
  }

  Future<void> _loadCompanyLocations(String companyId) async {}

  @override
  Future<void> onLoadTree(LoadTree event, Emitter<AssetPageState> emit) async {
    emit(AssetPageLoading());
    final companyAssetsResult = _loadCompanyAssets(event.companyId);
  }

  @override
  void onSearchItem(SearchItem event, Emitter<AssetPageState> emit) async {}
}
