import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/designsystem/components/container/bottom_nav_with_container.dart';
import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/theme/theme_data.dart';
import '../../../../libraries/logger/logger.dart';

class GardenPage extends StatefulWidget {
  const GardenPage({super.key});

  @override
  State<GardenPage> createState() => _GardenPageState();
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

class _GardenPageState extends State<GardenPage> {
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
      final res = await Supabase.instance.client.rpc('get_my_favorite_flowers');
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
            '나의 정원',
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
              '즐겨찾기를 불러오지 못했어요',
              style: context.textTheme.default15Medium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _loadFavorites,
              child: const Text('다시 시도'),
            ),
          ],
        ),
      );
    }
    if (_rows.isEmpty) {
      return Center(
        child: Text(
          '즐겨찾기한 꽃이 없어요',
          style: context.textTheme.default15Medium,
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: () => _loadFavorites(blockUi: false),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _rows.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
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
    final scheme = Theme.of(context).colorScheme;
    final url = imageUrl?.trim();
    if (url == null || url.isEmpty) {
      return CircleAvatar(
        backgroundColor: scheme.primaryContainer,
        child: Icon(Icons.local_florist_rounded, color: scheme.onPrimaryContainer),
      );
    }
    return CircleAvatar(
      backgroundColor: scheme.surfaceContainerHighest,
      backgroundImage: NetworkImage(url),
      onBackgroundImageError: (_, __) {},
      child: null,
    );
  }
}
