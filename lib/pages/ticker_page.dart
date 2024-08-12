import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/providers/ticker_provider.dart';

class TickerPage extends ConsumerWidget {
  const TickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickerValue = ref.watch(tickerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Ticker')),
      body: tickerValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text(e.toString())),
        data: (ticker) {
          return Center(child: Text(ticker.toString()));
        },
      ),
    );
  }
}
