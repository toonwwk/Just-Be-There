class NewEventForm {
  const NewEventForm(
    this.eventName,
    this.address,
    this.description,
    this.startDate,
    this.endDate,
    this.tel,
    this.lat,
    this.long,
    this.urlList,
  );

  final String address;
  final String description;
  final String startDate;
  final String endDate;
  final String eventName;
  final String tel;
  final double lat;
  final double long;
  final List<String> urlList;
}
