// import 'package:flutter/material.dart';

// import '../../features/details/presentation/pages/tv_series_details.dart';
// import '../../features/movie_search/presentaion/widgets/movie_details.dart';


// class descriptioncheckui extends StatefulWidget {
//   var newId;
//   var newType;
//   descriptioncheckui(this.newId, this.newType);

//   @override
//   State<descriptioncheckui> createState() => _descriptioncheckuiState();
// }

// class _descriptioncheckuiState extends State<descriptioncheckui> {
//   checktype() {
//     if (widget.newtype.toString() == 'movie') {
//       return MovieDetails(
//         id: widget.newid, movie: null,
//       );
//     } else if (widget.newtype.toString() == 'tv') {
//       return TvSeriesDetails(id: widget.newid);
//     } else if (widget.newtype.toString() == 'person') {
//       // return persondescriptionui(widget.id);
//     } else {
//       return errorui(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return checktype();
//   }
// }

// Widget errorui(context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Error'),
//     ),
//     body: Center(
//       child: Text('no Such page found'),
//     ),
//   );
// }