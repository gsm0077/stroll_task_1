import 'package:flutter/material.dart';

class VoiceCard extends StatelessWidget {
  final String title;
  final String duration;
  final String imageUrl;

  const VoiceCard({
    super.key,
    required this.title,
    required this.duration,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(imageUrl), radius: 16),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text('"Mine is definitely the peace in the morning."',
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
                SizedBox(height: 8),
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Icon(Icons.play_arrow, color: Colors.white),
                      SizedBox(width: 8),
                      Text(duration, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
