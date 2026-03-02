// lib/data/antivirus_data.dart
import 'package:flutter/material.dart';
import '../models/antivirus.dart';

class AntivirusData {
  static final List<Antivirus> antivirusList = [
    Antivirus(
      name: 'Kaspersky Internet Security',
      description: 'Комплексная защита от всех типов угроз для дома и бизнеса с продвинутыми функциями родительского контроля и безопасных платежей.',
      shortDescription: 'Комплексная защита от всех типов угроз',
      iconUrl: 'https://img.icons8.com/color/256/security-checked.png',
      color: Colors.red,
    ),
    Antivirus(
      name: 'Norton Antivirus',
      description: 'Надежная защита с минимальным воздействием на систему. Обладает smart firewall и защитой от кражи личных данных.',
      shortDescription: 'Надежная защита с минимальным воздействием на систему',
      iconUrl: 'https://img.icons8.com/color/256/shield.png',
      color: Colors.blue,
    ),
    Antivirus(
      name: 'Avast Free Antivirus',
      description: 'Бесплатное решение с базовой защитой, включая антивирус, антишпион и веб-защиту. Идеально для начинающих пользователей.',
      shortDescription: 'Бесплатное решение с базовой защитой',
      iconUrl: 'https://img.icons8.com/color/256/antivirus-scanner.png',
      color: Colors.green,
    ),
    Antivirus(
      name: 'Bitdefender Total Security',
      description: 'Полный набор функций для максимальной безопасности: VPN, менеджер паролей, защита веб-камеры и оптимизация системы.',
      shortDescription: 'Полный набор функций для максимальной безопасности',
      iconUrl: 'https://img.icons8.com/color/256/cyber-security.png',
      color: Colors.orange,
    ),
    Antivirus(
      name: 'ESET NOD32 Antivirus',
      description: 'Быстрый и эффективный антивирусный движок с низким потреблением ресурсов. Отлично подходит для игровых ПК.',
      shortDescription: 'Быстрый и эффективный антивирусный движок',
      iconUrl: 'https://img.icons8.com/color/256/security-configuration.png',
      color: Colors.purple,
    ),
  ];

  static final List<Map<String, String>> protectionTypes = [
    {
      'url': 'https://img.icons8.com/color/256/antivirus-scanner.png',
      'name': 'Поиск вирусов'
    },
    {
      'url': 'https://img.icons8.com/color/256/security-checked.png',
      'name': 'Защита ПК'
    },
    {
      'url': 'https://img.icons8.com/color/256/shield.png',
      'name': 'Устранение угроз'
    },
    {
      'url': 'https://img.icons8.com/color/256/cyber-security.png',
      'name': 'Кибербезопасность'
    },
    {
      'url': 'https://img.icons8.com/color/256/security-configuration.png',
      'name': 'Настройки безопасности'
    },
  ];
}