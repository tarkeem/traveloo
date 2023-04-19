class AirCompany {
  String name, Price, CountryFlag;
  List<String> TakeOff;
  AirCompany(this.CountryFlag, this.Price, this.TakeOff, this.name);
}

List<AirCompany> companies = [
  AirCompany(
      'https://th.bing.com/th/id/R.f4eaaf4e5023e5cc06e83d8c4876a321?rik=Md2r4l2lPO%2fIaw&riu=http%3a%2f%2f4.bp.blogspot.com%2f-6GG7MEcVw1o%2fUJVaBPD1_oI%2fAAAAAAAAAUQ%2fwFARO0NPTFo%2fs1600%2flogo.jpg&ehk=apwd%2bDSCo8wychd4iX52T7XnKsStQtPfcG76Uj1uGMM%3d&risl=&pid=ImgRaw&r=0',
      '1500\$',
      ['5:10 AM','12:10 PM','10:10 AM'],
      'LuftHanse'),
      AirCompany(
      'https://th.bing.com/th/id/OIP.7SwsOulgYxbXc0bNA3QuyQHaEC?pid=ImgDet&rs=1',
      '800\$',
       ['5:10 AM','12:10 PM','10:10 AM'],
      'Egyptian Air'),
      AirCompany(
      'https://th.bing.com/th/id/R.3a4af411fc0e0ed24de96740dba8767a?rik=mzvlNxkfQzj7%2fA&riu=http%3a%2f%2f1000marcas.net%2fwp-content%2fuploads%2f2020%2f03%2fAir-France-Logo-1976.jpg&ehk=s0OG7EsDKRxUNU4ljTa9l9eFip6heVcBuCSOQJVjULA%3d&risl=&pid=ImgRaw&r=0',
      '1100\$',
       ['5:10 AM','12:10 PM','10:10 AM'],
      'France Air'),
      

];
