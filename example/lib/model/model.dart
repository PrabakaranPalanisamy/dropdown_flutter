import 'package:dropdown_flutter_fork/custom_dropdown.dart';
import 'package:flutter/material.dart';

const List<JobType> jobItems = [
  JobType('Student', Icons.school),
  JobType('Designer', Icons.design_services),
  JobType('Developer', Icons.developer_mode),
  JobType('Consultant', Icons.account_balance),
];

const List<JobType> biggerJobItems = [
  JobType('Student', Icons.school),
  JobType('Designer', Icons.design_services),
  JobType('Developer', Icons.developer_mode),
  JobType('Consultant', Icons.account_balance),
  JobType('Student 1', Icons.school),
  JobType('Designer 1', Icons.design_services),
  JobType('Developer 1', Icons.developer_mode),
  JobType('Consultant 1', Icons.account_balance),
];

class JobType with CustomDropdownListFilter {
  final String name;
  final IconData icon;

  const JobType(this.name, this.icon);

  @override
  String toString() {
    return name;
  }

  @override
  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }
}
