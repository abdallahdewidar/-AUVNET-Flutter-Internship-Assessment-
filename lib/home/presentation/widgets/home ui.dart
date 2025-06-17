import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final supabase = Supabase.instance.client;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  String username = "";

  Future<void> fetchUser() async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      final data = await supabase.from('profiles').select().eq('id', user.id).single();
      setState(() {
        username = data['username'] ?? 'User';
      });
    }
  }

  final List<Widget> _pages = [
    const HomePageBody(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: 'Deliver'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8900FE), Color(0xFFFFDE59)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Delivering to', style: TextStyle(color: Colors.black54)),
                      const SizedBox(height: 4),
                      Text('Hi hepa!', ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Services
            const Text('Services:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ServiceCard(title: 'Food', badge: 'Up to 50%', image: SvgPicture.asset("asstes/images/13 1.svg"
                    ""),),
                _ServiceCard(title: 'Health & wellness', badge: '20% Off', image: SvgPicture.asset("asstes/images/6.svg"),),
                _ServiceCard(title: 'Groceries', image: SvgPicture.asset("asstes/images/vector-a-set-of-medicine-and-prescription-removebg-preview-2048x1773 1.svg"),),
              ],
            ),
            const SizedBox(height: 16),

            // Promo Card
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: const [
                  Icon(Icons.qr_code, color: Colors.deepPurple),
                  SizedBox(width: 12),
                  Expanded(child: Text("Got a code! Apply it to your order.")),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Shortcuts
            const Text('Shortcuts:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ShortcutItem(label: 'Past Orders', icon: SvgPicture.asset("asstes/images/icon-park-solid_transaction-order.svg"), ),
                 _ShortcutItem(label: 'Super Saver', icon: SvgPicture.asset("asstes/images/Security Vault.svg"), ),
                 _ShortcutItem(label: 'Must-tries', icon: SvgPicture.asset("asstes/images/n.svg"), ),
                 _ShortcutItem(label: 'Give Back', icon: SvgPicture.asset("asstes/images/Group 9.svg"),),
                 _ShortcutItem(label: 'Best Seller', icon: SvgPicture.asset("asstes/images/ic_baseline-star.svg"), ),
              ],
            ),
            const SizedBox(height: 16),

            // Banners
            SizedBox(
              height: 120,
              child: PageView(
                children: [
                  _BannerItem(text: 'Made with M&Ms'),
                  _BannerItem(text: 'Discount for Students'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Popular Restaurants
            const Text('Popular restaurants nearby', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _RestaurantAvatar(name: 'Alo Beirut', image:  SvgPicture.asset("asstes/images/ic_baseline-star.svg"),),
                _RestaurantAvatar(name: 'Laffah', image: SvgPicture.asset("asstes/images/logo637749035515703697 1.svg")),
                 _RestaurantAvatar(name: 'FALAFEL Al Rabeh', image:SvgPicture.asset("asstes/images/LOGO(4)_637357125093900864 1.svg") ),
                 _RestaurantAvatar(name: 'Barbar', image:SvgPicture.asset("asstes/images/Group 15.svg") ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final String? badge;
  final SvgPicture image;
  const _ServiceCard({required this.title, this.badge, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(12),
              ),


            ),
            if (badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(badge!, style: const TextStyle(color: Colors.white, fontSize: 10)),
              )
          ],
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

class _ShortcutItem extends StatelessWidget {
  final String label;
  final SvgPicture icon ;
  const _ShortcutItem({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: Colors.deepPurple[50],
            borderRadius: BorderRadius.circular(12),
          ),

        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _BannerItem extends StatelessWidget {
  final String text;
  const _BannerItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}

class _RestaurantAvatar extends StatelessWidget {
  final String name;
  final SvgPicture image;
  const _RestaurantAvatar({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(

        ),
        const SizedBox(height: 4),
        Text(name, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

