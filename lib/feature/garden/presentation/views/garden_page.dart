import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/theme/theme_data.dart';
import '../../../../core/network/supabase/supabase_api.dart';
import '../../../../core/network/supabase/supabase_providers.dart';
import '../../../../libraries/logger/logger.dart';

class GardenPage extends ConsumerStatefulWidget {
  const GardenPage({super.key});

  @override
  ConsumerState<GardenPage> createState() => _GardenPageState();
}

class _FavoriteFlowerRow {
  final int? flowerId;
  final String name;
  final String? meaning;
  final String? imageUrl;

  const _FavoriteFlowerRow({
    this.flowerId,
    required this.name,
    this.meaning,
    this.imageUrl,
  });

  static _FavoriteFlowerRow? tryParse(dynamic raw) {
    if (raw is! Map) return null;
    final m = Map<String, dynamic>.from(raw);
    final name = _pickString(m, const [
      'korean_name',
      'english_name',
      'name',
      'flower_name',
      'title',
    ]);
    if (name == null || name.isEmpty) return null;
    return _FavoriteFlowerRow(
      flowerId: _pickInt(m, const ['flower_id', 'id']),
      name: name,
      meaning: _pickString(m, const [
        'description',
        'meaning',
        'flower_meaning',
        'reason',
        'scientific_name',
      ]),
      imageUrl: _pickString(m, const ['image_url', 'imageUrl', 'photo_url']),
    );
  }
}

String? _pickString(Map<String, dynamic> m, List<String> keys) {
  for (final k in keys) {
    final v = m[k];
    if (v == null) continue;
    final s = v.toString().trim();
    if (s.isNotEmpty) return s;
  }
  return null;
}

int? _pickInt(Map<String, dynamic> m, List<String> keys) {
  for (final k in keys) {
    final v = m[k];
    if (v == null) continue;
    if (v is int) return v;
    if (v is num) return v.toInt();
    final p = int.tryParse(v.toString());
    if (p != null) return p;
  }
  return null;
}

List<_FavoriteFlowerRow> _parseFavoriteRows(dynamic res) {
  if (res is! List) return const [];
  final out = <_FavoriteFlowerRow>[];
  for (final item in res) {
    final row = _FavoriteFlowerRow.tryParse(item);
    if (row != null) out.add(row);
  }
  return out;
}

class _GardenPageState extends ConsumerState<GardenPage> {
  bool _loading = true;
  String? _error;
  List<_FavoriteFlowerRow> _rows = const [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites({bool blockUi = true}) async {
    if (blockUi) {
      setState(() {
        _loading = true;
        _error = null;
      });
    }
    try {
      final res = await ref
          .read(supabaseApiProvider)
          .rpc(SupabaseApi.rpcGetMyFavoriteFlowers);
      "res -> $res".logW();
      if (!mounted) return;
      setState(() {
        _rows = _parseFavoriteRows(res);
        _loading = false;
        _error = null;
      });
    } catch (e) {
      "err -> $e".logE();

      if (!mounted) return;
      setState(() {
        _loading = false;
        if (blockUi) _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavWithContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SpacingVertical20(),
          Text(
            AppMessages.gardenTitle,
            style: context.textTheme.headline1RegularHakgyo,
          ),
          const SizedBox(height: 16),
          Expanded(child: _buildBody(context)),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppMessages.favoriteLoadFailed,
              style: context.textTheme.default15Medium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _loadFavorites,
              child: const Text(AppMessages.gardenRetry),
            ),
          ],
        ),
      );
    }
    if (_rows.isEmpty) {
      return Center(
        child: Text(
          AppMessages.favoriteEmpty,
          style: context.textTheme.default15Medium,
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: () => _loadFavorites(blockUi: false),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _rows.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final row = _rows[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 4),
            leading: _FavoriteLeading(imageUrl: row.imageUrl),
            title: Text(
              row.name,
              style: context.textTheme.default16SemiBold,
            ),
            subtitle: row.meaning != null && row.meaning!.isNotEmpty
                ? Text(
                    row.meaning!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.default14Regular.copyWith(
                      color: context.colorScheme.text_2,
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }
}

class _FavoriteLeading extends StatelessWidget {
  final String? imageUrl;

  const _FavoriteLeading({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final url = imageUrl?.trim();
    if (url == null || url.isEmpty) {
      return CircleAvatar(
        backgroundColor: scheme.white,
        child: Icon(Icons.local_florist_rounded, color: scheme.primary),
      );
    }
    return CircleAvatar(
      backgroundColor: scheme.white,
      backgroundImage: NetworkImage(url),
      onBackgroundImageError: (_, _) {},
      child: null,
    );
  }
}
