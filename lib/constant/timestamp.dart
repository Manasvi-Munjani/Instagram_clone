// lib/utils/time_helper.dart
import 'package:cloud_firestore/cloud_firestore.dart';

String timeAgoFromTimestamp(Timestamp timestamp) {
  final now = DateTime.now();
  final date = timestamp.toDate();
  final diff = now.difference(date);

  if (diff.inSeconds < 60) return '${diff.inSeconds}s ago';
  if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
  if (diff.inHours < 24) return '${diff.inHours}h ago';
  if (diff.inDays < 7) return '${diff.inDays}d ago';

  return '${date.day}/${date.month}/${date.year}';
}
