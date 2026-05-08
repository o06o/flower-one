// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garden_detail_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gardenDetailViewModelHash() =>
    r'2c1ad0af18f05893a4ec4811f037efd143056bc5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$GardenDetailViewModel
    extends BuildlessAutoDisposeNotifier<GardenDetailState> {
  late final GardenDetailType type;

  GardenDetailState build(GardenDetailType type);
}

/// See also [GardenDetailViewModel].
@ProviderFor(GardenDetailViewModel)
const gardenDetailViewModelProvider = GardenDetailViewModelFamily();

/// See also [GardenDetailViewModel].
class GardenDetailViewModelFamily extends Family<GardenDetailState> {
  /// See also [GardenDetailViewModel].
  const GardenDetailViewModelFamily();

  /// See also [GardenDetailViewModel].
  GardenDetailViewModelProvider call(GardenDetailType type) {
    return GardenDetailViewModelProvider(type);
  }

  @override
  GardenDetailViewModelProvider getProviderOverride(
    covariant GardenDetailViewModelProvider provider,
  ) {
    return call(provider.type);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'gardenDetailViewModelProvider';
}

/// See also [GardenDetailViewModel].
class GardenDetailViewModelProvider
    extends
        AutoDisposeNotifierProviderImpl<
          GardenDetailViewModel,
          GardenDetailState
        > {
  /// See also [GardenDetailViewModel].
  GardenDetailViewModelProvider(GardenDetailType type)
    : this._internal(
        () => GardenDetailViewModel()..type = type,
        from: gardenDetailViewModelProvider,
        name: r'gardenDetailViewModelProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$gardenDetailViewModelHash,
        dependencies: GardenDetailViewModelFamily._dependencies,
        allTransitiveDependencies:
            GardenDetailViewModelFamily._allTransitiveDependencies,
        type: type,
      );

  GardenDetailViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final GardenDetailType type;

  @override
  GardenDetailState runNotifierBuild(covariant GardenDetailViewModel notifier) {
    return notifier.build(type);
  }

  @override
  Override overrideWith(GardenDetailViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: GardenDetailViewModelProvider._internal(
        () => create()..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<GardenDetailViewModel, GardenDetailState>
  createElement() {
    return _GardenDetailViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GardenDetailViewModelProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GardenDetailViewModelRef
    on AutoDisposeNotifierProviderRef<GardenDetailState> {
  /// The parameter `type` of this provider.
  GardenDetailType get type;
}

class _GardenDetailViewModelProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          GardenDetailViewModel,
          GardenDetailState
        >
    with GardenDetailViewModelRef {
  _GardenDetailViewModelProviderElement(super.provider);

  @override
  GardenDetailType get type => (origin as GardenDetailViewModelProvider).type;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
