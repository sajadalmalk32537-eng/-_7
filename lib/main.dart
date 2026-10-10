import 'package:flutter/material.dart';

void main() {
  runApp(const TumaninaApp());
}

class TumaninaApp extends StatelessWidget {
  const TumaninaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'طمأنينة',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

// ==================== 1. الشاشة الرئيسية ====================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طمأنينة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: true,
        backgroundColor: const Color(0xFF1B4D3E),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritesScreen()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // أوقات الصلاة في أعلى الواجهة
            _buildPrayerTimesHeader(),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'الأقسام الرئيسية',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1B4D3E)),
                  ),
                  const SizedBox(height: 12),
                  
                  // شبكة الأقسام مع التوجيه للصفحات الجديدة
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.1,
                    children: [
                      _buildCategoryCard(context, 'القرآن الكريم', Icons.menu_book, Colors.amber.shade800, () {
                        _navigateTo(context, const QuranScreen());
                      }),
                      _buildCategoryCard(context, 'الأدعية الكاملة', Icons.auto_stories, Colors.teal, () {
                        _navigateTo(context, const DuasScreen());
                      }),
                      _buildCategoryCard(context, 'المناجيات كاملة', Icons.volunteer_activism, Colors.indigo, () {
                        _navigateTo(context, const MunajatScreen());
                      }),
                      _buildCategoryCard(context, 'الزيارات كاملة', Icons.place, Colors.deepOrange, () {
                        _navigateTo(context, const ZiyaratScreen());
                      }),
                      _buildCategoryCard(context, 'الأذكار اليومية', Icons.wb_sunny, Colors.orange, () {
                        _navigateTo(context, const AzkarScreen());
                      }),
                      _buildCategoryCard(context, 'المسبحة الإلكترونية', Icons.touch_app, Colors.purple, () {
                        _navigateTo(context, const TasbeehScreen());
                      }),
                      _buildCategoryCard(context, 'صلاة الليل', Icons.nights_stay, Colors.blueGrey, () {
                        _navigateTo(context, const NightPrayerScreen());
                      }),
                      _buildCategoryCard(context, 'سيرة أهل البيت (ع)', Icons.history_edu, Colors.brown, () {
                        _navigateTo(context, const AhlulbaytBiographyScreen());
                      }),
                      _buildCategoryCard(context, 'فضائل وهدي الشباب', Icons.star, Colors.darkGoldenrod, () {
                        _navigateTo(context, const VirtuesScreen());
                      }),
                      _buildCategoryCard(context, 'المسائل الفقهية (Gemini)', Icons.psychology, Colors.emerald, () {
                        _navigateTo(context, const FiqhAiScreen());
                      }),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'ميزات إضافية',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1B4D3E)),
                  ),
                  const SizedBox(height: 12),
                  
                  _buildFeatureTile(Icons.explore, 'القبلة التفاعلية', 'تحديد اتجاه القبلة بالبوصلة', () {
                    _navigateTo(context, const QiblaScreen());
                  }),
                  _buildFeatureTile(Icons.calendar_month, 'التقويم الهجري والمناسبات', 'عرض المناسبات والتنبيهات', () {
                    _navigateTo(context, const CalendarScreen());
                  }),
                  _buildFeatureTile(Icons.do_not_disturb_on, 'وضع الهدوء والتركيز', 'كتم الإشعارات أثناء الصلاة', () {
                    _navigateTo(context, const FocusModeScreen());
                  }),
                  _buildFeatureTile(Icons.share, 'شارك آية أو قولاً', 'تصميم بطاقات هادفة للمشاركة', () {
                    _navigateTo(context, const ShareCardScreen());
                  }),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  Widget _buildPrayerTimesHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF1B4D3E),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white70, size: 18),
                  SizedBox(width: 4),
                  Text('بغداد، العراق', style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
              Text('١٥ ربيع الثاني ١٤٤٨ هـ', style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),
          const Text('الصلاة القادمة: الظهر', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('12:15 م', style: TextStyle(color: Colors.amberAccent, fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('متبقي 01:25:00', style: TextStyle(color: Colors.white70, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureTile(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1B4D3E)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

// ==================== 2. شاشات الأقسام الجديدة (Navigation) ====================

// شاشة المناجيات الكاملة
class MunajatScreen extends StatelessWidget {
  const MunajatScreen({super.key});

  final List<String> munajatList = const [
    'المناجاة الأولى: مناجاة التائبين',
    'المناجاة الثانية: مناجاة الشاكين',
    'المناجاة الثالثة: مناجاة الخائفين',
    'المناجاة الرابعة: مناجاة الراجين',
    'المناجاة الخامسة: مناجاة الراغبين',
    'المناجاة السادسة: مناجاة الشاكرين',
    'المناجاة السابعة: مناجاة المطيعين لله',
    'المناجاة الثامنة: مناجاة المريدين',
    'المناجاة التاسعة: مناجاة المحبين',
    'المناجاة العاشرة: مناجاة المتوسلين',
    'المناجاة الحادية عشرة: مناجاة المفتقرين',
    'المناجاة الثانية عشرة: مناجاة العارفين',
    'المناجاة الثالثة عشرة: مناجاة الذاكرين',
    'المناجاة الرابعة عشرة: مناجاة المعتصمين',
    'المناجاة الخامسة عشرة: مناجاة الزاهدين',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المناجيات الخمس عشرة'),
        backgroundColor: const Color(0xFF1B4D3E),
      ),
      body: ListView.builder(
        itemCount: munajatList.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFF1B4D3E),
                child: Icon(Icons.favorite, color: Colors.white, size: 20),
              ),
              title: Text(
                munajatList[index],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // فتح نص المناجاة
              },
            ),
          );
        },
      ),
    );
  }
}

// شاشة صلاة الليل
class NightPrayerScreen extends StatelessWidget {
  const NightPrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قسم صلاة الليل'),
        backgroundColor: const Color(0xFF1B4D3E),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'كيفية صلاة الليل (11 ركعة)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1B4D3E)),
            ),
            const SizedBox(height: 10),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  '1. نافلة الليل: 8 ركعات (تُصلى ركعتين ركعتين بنية نافلة الليل).\n'
                  '2. صلاة الشفع: ركعتان بعد الثمان ركعات.\n'
                  '3. صلاة الوتر: ركعة واحدة مع الاستغفار 70 مرة والدعاء لـ 40 مؤمناً.',
                  style: TextStyle(fontSize: 15, height: 1.6),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'فضل صلاة الليل عن أهل البيت (ع)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1B4D3E)),
            ),
            const SizedBox(height: 10),
            _buildHadithCard('قال الصادق (ع): "صلاة الليل تبيض الوجه، وتذهب بالهم، وتجلب الرزق."'),
            _buildHadithCard('قال النبي (ص): "عليك بصلة الليل فإنها دأب الصالحين قبلك."'),
          ],
        ),
      ),
    );
  }

  Widget _buildHadithCard(String text) {
    return Card(
      color: Colors.teal.shade50,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// شاشات فارغة مجهزة لباقي الأقسام
class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('القرآن الكريم'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('صفحة سور وأجزاء القرآن الكريم القادمة')));
}

class DuasScreen extends StatelessWidget {
  const DuasScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('الأدعية الكاملة'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('قائمة جميع الأدعية (كميل، التوسل، العهد...)')));
}

class ZiyaratScreen extends StatelessWidget {
  const ZiyaratScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('الزيارات الكاملة'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('قائمة الزيارات (عاشوراء، أمين الله...)')));
}

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('الأذكار اليومية'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('أذكار الصباح والمساء والتعقيبات')));
}

class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('المسبحة الإلكترونية'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('شاشة العداد المسبحة اليدوية والاهتزاز')));
}

class AhlulbaytBiographyScreen extends StatelessWidget {
  const AhlulbaytBiographyScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('سيرة أهل البيت (ع)'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('صفحة سيرة النبي والأئمة الاثني عشر (ع)')));
}

class VirtuesScreen extends StatelessWidget {
  const VirtuesScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('فضائل وهدي الشباب'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('10 أقوال تربوية ومفيدة لكل إمام موجهة للشباب')));
}

class FiqhAiScreen extends StatelessWidget {
  const FiqhAiScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('المسائل الفقهية (Gemini AI)'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('شاشة الدردشة والمجيب الفقهي بالذكاء الاصطناعي')));
}

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('القبلة التفاعلية'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('شاشة البوصلة وتحديد القبلة')));
}

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('التقويم والمناسبات'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('شاشة التقويم الهجري والمناسبات')));
}

class FocusModeScreen extends StatelessWidget {
  const FocusModeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('وضع الهدوء والتركيز'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('إعدادات كتم التنبيهات أثناء الصلاة')));
}

class ShareCardScreen extends StatelessWidget {
  const ShareCardScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('شارك آية أو قولاً'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('مصمم البطاقات للتواصل الاجتماعي')));
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('المفضلة'), backgroundColor: const Color(0xFF1B4D3E)), body: const Center(child: Text('الأدعية والزيارات المحفوظة')));
}
