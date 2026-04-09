import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String _tagTable = 'tags';
  static const String _orderColumn = 'id';

  late Future<List<String>> _tagsFuture;

  @override
  void initState() {
    super.initState();
    _tagsFuture = _fetchTags();
  }

  Future<List<String>> _fetchTags() async {
    final rows = await Supabase.instance.client
        .from(_tagTable)
        .select()
        .order(_orderColumn);

    final tags = rows
        .map<String?>((row) {
          if (row is! Map<String, dynamic>) return null;

          final value = row['name'];
          return value is String ? value : value?.toString();
        })
        .whereType<String>()
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toList();

    return tags;
  }

  Future<void> _refresh() async {
    final next = _fetchTags();
    setState(() => _tagsFuture = next);
    await next;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _tagsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('태그를 불러오지 못했어요.'),
                const SizedBox(height: 8),
                Text(
                  '${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: _refresh,
                  child: const Text('다시 시도'),
                ),
              ],
            ),
          );
        }

        final tags = snapshot.data ?? const [];
        if (tags.isEmpty) {
          return const Center(child: Text('등록된 태그가 없어요.'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              tags.length,
              (index) => Chip(label: Text(tags[index])),
            ),
          ),
        );
      },
    );
  }
}
