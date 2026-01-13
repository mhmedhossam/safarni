import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/utils/text_styles.dart';
import 'package:safarni/features/Hotal_Booking/presentation/manager/GalleryRoomCubit/gallery_room_cubit.dart';

class GalleryContent extends StatelessWidget {
  const GalleryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Gallery',
              style: TextStyles.details.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111928),
              ),
            ),
            Text(
              '(200)',
              style: TextStyles.details.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111928),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.photo_camera_outlined, color: Color(0xFF1E429F)),
            ),
            Text(
              'add Photo',
              style: TextStyles.details.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E429F),
              ),
            ),
          ],
        ),
        BlocBuilder<GalleryRoomCubit, GalleryRoomState>(
          builder: (context, state) {
            if (state is GalleryRoomSuccess) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: state.galleryRooms.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.network(
                      state.galleryRooms[index].url ?? "",
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            } else if (state is GalleryRoomFailure) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
