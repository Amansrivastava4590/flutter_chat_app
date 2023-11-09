class meModel {
  final String firstName;
  final String lastName;
  final String avatar;
  final String city;
  final String relationship;
  final String gender;
  final String job_title;
  final String job_area;
  final bool story;
  final String status;
  final List<dynamic> stories;

  meModel(
      {required this.firstName,
      required this.lastName,
      required this.avatar,
      required this.city,
      required this.relationship,
      required this.gender,
      required this.job_title,
      required this.job_area,
      required this.story,
      required this.status,
      required this.stories});

  factory meModel.fromJson(Map<String, dynamic> data) => meModel(
      firstName: data['firstname'],
      lastName: data['lastname'],
      avatar: data['avatar'],
      city: data['city'],
      relationship: data['relationship'],
      gender: data['gender'],
      job_title: data['job_title'],
      job_area: data['job_area'],
      story: data['story'],
      status: data['status'],
      stories: data['stories']);
}
