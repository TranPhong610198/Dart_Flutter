import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../controller/auth_controller.dart';
import '../screens/home_screen.dart';

class SelectChildBottomSheet extends StatefulWidget {
  final UserModel parentUser;

  const SelectChildBottomSheet({super.key, required this.parentUser});

  @override
  State<SelectChildBottomSheet> createState() => _SelectChildBottomSheetState();
}

class _SelectChildBottomSheetState extends State<SelectChildBottomSheet> {
  final AuthController _authController = AuthController();
  List<UserModel> _children = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchChildren();
  }

  Future<void> _fetchChildren() async {
    try {
      final children = await _authController.getChildren(
          widget.parentUser.id, widget.parentUser.accessToken);
      setState(() {
        _children = children;
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
      setState(() => _isLoading = false);
    }
  }

  Future<void> _selectChild(UserModel child) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedChildId', child.id.toString());
    
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(user: child)),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Chọn học sinh',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF16623),
            ),
          ),
          const SizedBox(height: 15),
          if (_isLoading)
            const Center(child: CircularProgressIndicator(color: Color(0xFFF16623)))
          else if (_children.isEmpty)
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Không tìm thấy thông tin học sinh.'),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _children.length,
              itemBuilder: (context, index) {
                final child = _children[index];
                return Card(
                  elevation: 0,
                  color: const Color(0xFFFDECDA),
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Color(0xFFF16623)),
                    ),
                    title: Text(
                      child.fullName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(child.className),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => _selectChild(child),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
