import 'package:flutter/material.dart';

class ServiceItemModel {
  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;

  const ServiceItemModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
  });
}

final List<ServiceItemModel> kServiceItems = [
  ServiceItemModel(
    title: 'Mobile App Development',
    description:
        'Native-quality cross-platform apps using Flutter. We build for Android, iOS, and Web with a single codebase, ensuring high performance and rapid delivery.',
    icon: Icons.smartphone,
    accentColor: Colors.blue.withValues(alpha: 0.2),
  ),
  ServiceItemModel(
    title: 'Web Application Development',
    description:
        'Modern, responsive, and scalable web solutions. From complex enterprise dashboards to stunning landing pages, we deliver web experiences that convert.',
    icon: Icons.web,
    accentColor: Colors.purple.withValues(alpha: 0.2),
  ),
  ServiceItemModel(
    title: 'AI & Automation Solutions',
    description:
        'Intelligent chatbots and workflow automation. Leverage the power of AI to optimize your business processes and enhance user engagement.',
    icon: Icons.psychology,
    accentColor: Colors.teal.withValues(alpha: 0.2),
  ),
  ServiceItemModel(
    title: 'Cloud & Infrastructure',
    description:
        'Secure cloud deployment and server management on AWS. We ensure your applications are always online, fast, and protected against threats.',
    icon: Icons.cloud_upload,
    accentColor: Colors.orange.withValues(alpha: 0.2),
  ),
  ServiceItemModel(
    title: 'UI/UX Design',
    description:
        'User-centric design that captivates. We blend aesthetics with usability to create intuitive interfaces that users love to interact with.',
    icon: Icons.design_services,
    accentColor: Colors.pink.withValues(alpha: 0.2),
  ),
  ServiceItemModel(
    title: 'MVP Development',
    description:
        'Rapid prototyping and MVP development for startups. Launch your idea fast with a solid, scalable foundation.',
    icon: Icons.rocket_launch,
    accentColor: Colors.redAccent.withValues(alpha: 0.2),
  ),
];
