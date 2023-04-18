import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class APIQueryErrorMessage extends StatelessWidget {
  APIQueryErrorMessage({super.key, required this.refetch, isNetworkError});

  Future<void> Function() refetch;
  final isNetworkError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(isNetworkError ? '情報の取得に失敗しました' : 'エラーが発生しました',
              style: TextStyle(fontSize: 20, color: Colors.grey.shade600)),
          const Gap(20),
          Text(isNetworkError ? '接続を確認してもう一度お試し下さい。' : '時間を置いてもう一度お試し下さい。',
              style: TextStyle(color: Colors.grey.shade600)),
          // TODO: Display link to error report form
          // isNetworkError ? Text('エラーが続く場合は、お手数ですがお問い合わせフォームよりご連絡下さい。') : const SizedBox(),
          const Gap(20),
          TextButton(
            onPressed: () async {
              await refetch();
            },
            style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(0),
              padding: const EdgeInsets.symmetric(vertical: 12),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              '再読み込み',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
