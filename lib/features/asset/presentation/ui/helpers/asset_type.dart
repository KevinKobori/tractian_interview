// import 'package:tractian_interview/src/core/data/models/asset_model.dart';

// enum AssetType {
//   none,
//   energy,
//   alert,
// }

// extension AssetTypeExtension on AssetType {
//   // static AssetType stringToAssetType(String type) {
//   //   switch (type) {
//   //     case 'none':
//   //       return AssetType.none;
//   //     case 'energy':
//   //       return AssetType.energy;
//   //     case 'alert':
//   //       return AssetType.alert;
//   //     default:
//   //       throw ArgumentError('Invalid AssetType: $type');
//   //   }
//   // }

//   static AssetType getAssetTypeFromObject(dynamic object) {
//     if (object is AssetModel) {
//       try {
//         return AssetType.values.byName(object.status ?? '');
//       } catch (_) {
//         try {
//           return AssetType.values.byName(object.sensorType ?? '');
//         } catch (_) {
//           return AssetType.none;
//         }
//       }
//     } else {
//       return AssetType.none;
//     }
//   }
// }
