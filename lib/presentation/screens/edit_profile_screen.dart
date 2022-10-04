import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _isCheckedProfile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Редактировать профиль'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(radius: 50),
              TextButton(
                onPressed: () {},
                child: Text('Изменить фото профиля'),
              ),
              CheckboxListTile(
                title: Text('Подтвержден'),
                subtitle: Text('Устанавливает для профиля галочку'),
                secondary: Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                ),
                controlAffinity: ListTileControlAffinity.leading,
                value: _isCheckedProfile,
                onChanged: (isCheck) {
                  setState(() {
                    _isCheckedProfile = isCheck ?? false;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Имя',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Имя пользователя',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Биография',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Публикации',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Подписчики',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Подписки',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
