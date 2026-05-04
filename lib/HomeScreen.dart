import 'package:flutter/material.dart';
import 'DetailsScreen.dart'; // تأكد أن الملف موجود وبنفس الاسم

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text(
          'Movie Explorer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
        // تغيير اللون البنفسجي إلى الأزرق الداكن الاحترافي
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: SingleChildScrollView( // لضمان عدم حدوث خطأ عند زيادة الأفلام
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.blueGrey.shade50,
              padding: const EdgeInsets.all(16),
              child: Text(
                'Popular Movies',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900],
                ),
              ),
            ),
            // قائمة الأفلام مع إضافة التقييم والفيلم الرابع
            _buildMovieCard(context, 'Inception', 'Sci-Fi • 2010',
                'A thief who steals corporate secrets...', '8.8'),
            _buildMovieCard(context, 'The Matrix', 'Sci-Fi • 1999',
                'When a beautiful stranger leads computer hacker Neo...', '8.7'),
            _buildMovieCard(context, 'Interstellar', 'Sci-Fi • 2014',
                'A team of explorers travel through a wormhole...', '8.6'),
            // الفيلم الرابع الجديد
            _buildMovieCard(context, 'The Dark Knight', 'Action • 2008',
                'Batman raises the stakes in his war on crime...', '9.0'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueGrey[900],
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildMovieCard(BuildContext context, String title, String subtitle, String description, String rating) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // الضغط على الأيقونة فقط هو ما ينقل للصفحة التالية
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    title: title,
                    subtitle: subtitle,
                    description: description,
                    rating: rating, // تمرير التقييم لصفحة التفاصيل
                  ),
                ),
              );
            },
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.movie_filter_rounded, color: Colors.blueGrey[800]),
            ),
          ),
          const SizedBox(width: 16),
          // بيانات الفيلم (غير قابلة للضغط)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          // التقييم في أقصى اليمين
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  rating,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}