import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/ui/screens/ride_pref/widgets/bla_button.dart';
import 'package:week_3_blabla_project/ui/theme/theme.dart';
import 'package:week_3_blabla_project/utils/date_time_utils.dart';
import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  final TextEditingController passengerController = TextEditingController();

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    passengerController.text = '1';
    departureDate = DateTime.now();
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          leading: Icon(Icons.location_on, color: BlaColors.iconLight,size: 16,
          ),
          title: Text('Leave From',
          style: TextStyle(color: BlaColors.textLight),
          ),
          onTap: (){},
        ),

        Divider(indent: 35, endIndent: 35),
        ListTile(
          leading: Icon(Icons.location_on, color: BlaColors.iconLight,size: 16,
          ),
          title: Text('Going to',
          style: TextStyle(color: BlaColors.textLight),
          ),
          onTap: (){},
        ),

        Divider(indent: 35, endIndent: 35),
        ListTile(
          leading: Icon(Icons.calendar_today, color: BlaColors.iconLight,size: 16,
          ), 
          title: Text(
            DateTimeUtils.formatDateTime(departureDate),
            style: TextStyle(color: BlaColors.textLight),
          ),
          onTap: (){},
        ),

        Divider(indent: 35, endIndent: 35),
        ListTile(
          leading: Icon(Icons.person, color: BlaColors.iconLight, size: 16,
          ),
          title: TextField(
            controller: passengerController,
            decoration: InputDecoration(border: InputBorder.none),
            style: TextStyle(color: BlaColors.textLight),
          ),
        ),
        
        BlaButton(
          text: "Search",
          type: BlaButtonType.primary,
          icon: Icons.search,
          onPressed: () {},
        ),
      ],
    );
  }
}
