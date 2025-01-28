// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_dispose_family_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autodisposeFamilyHelloHash() =>
    r'2459ec5a0999ac1c1dfcf39bc6b4525c3afedd3f';

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

/// See also [autodisposeFamilyHello].
@ProviderFor(autodisposeFamilyHello)
const autodisposeFamilyHelloProvider = AutodisposeFamilyHelloFamily();

/// See also [autodisposeFamilyHello].
class AutodisposeFamilyHelloFamily extends Family<String> {
  /// See also [autodisposeFamilyHello].
  const AutodisposeFamilyHelloFamily();

  /// See also [autodisposeFamilyHello].
  AutodisposeFamilyHelloProvider call(
    String there,
  ) {
    return AutodisposeFamilyHelloProvider(
      there,
    );
  }

  @override
  AutodisposeFamilyHelloProvider getProviderOverride(
    covariant AutodisposeFamilyHelloProvider provider,
  ) {
    return call(
      provider.there,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'autodisposeFamilyHelloProvider';
}

/// See also [autodisposeFamilyHello].
class AutodisposeFamilyHelloProvider extends AutoDisposeProvider<String> {
  /// See also [autodisposeFamilyHello].
  AutodisposeFamilyHelloProvider(
    String there,
  ) : this._internal(
          (ref) => autodisposeFamilyHello(
            ref as AutodisposeFamilyHelloRef,
            there,
          ),
          from: autodisposeFamilyHelloProvider,
          name: r'autodisposeFamilyHelloProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$autodisposeFamilyHelloHash,
          dependencies: AutodisposeFamilyHelloFamily._dependencies,
          allTransitiveDependencies:
              AutodisposeFamilyHelloFamily._allTransitiveDependencies,
          there: there,
        );

  AutodisposeFamilyHelloProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.there,
  }) : super.internal();

  final String there;

  @override
  Override overrideWith(
    String Function(AutodisposeFamilyHelloRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AutodisposeFamilyHelloProvider._internal(
        (ref) => create(ref as AutodisposeFamilyHelloRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        there: there,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _AutodisposeFamilyHelloProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AutodisposeFamilyHelloProvider && other.there == there;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, there.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AutodisposeFamilyHelloRef on AutoDisposeProviderRef<String> {
  /// The parameter `there` of this provider.
  String get there;
}

class _AutodisposeFamilyHelloProviderElement
    extends AutoDisposeProviderElement<String> with AutodisposeFamilyHelloRef {
  _AutodisposeFamilyHelloProviderElement(super.provider);

  @override
  String get there => (origin as AutodisposeFamilyHelloProvider).there;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
