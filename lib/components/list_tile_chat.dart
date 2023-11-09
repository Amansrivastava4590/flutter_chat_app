import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class ListTileChat extends StatelessWidget {
  final image;
  final title;
  final subtitle;
  final date;
  final icon;
  final count;
  final onTap;
  final onImageTap;
  final border;
  const ListTileChat(
      {Key? key,
      this.image,
      this.count,
      this.date,
      this.title,
      this.icon,
      this.subtitle,
      this.onTap,
      this.onImageTap,
      this.border})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => onImageTap(),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primary,
                child: CircleAvatar(
                  radius: border ? 26 : 30,
                  backgroundImage: NetworkImage(image),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title != null
                    ? Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )
                    : Container(),
                subtitle != null
                    ? Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.normal),
                      )
                    : Container(),
              ],
            ),
            Spacer(),
            Column(
              children: [
                date != null
                    ? Text(
                        "18:00",
                        style:
                            TextStyle(fontSize: 12, color: AppColors.primary),
                      )
                    : Container(),
                count != null
                    ? CircleAvatar(
                        radius: 10,
                        backgroundColor: AppColors.primary,
                        child: Text(count))
                    : Container()
              ],
            ),
            Icon(
              icon ?? CupertinoIcons.chevron_right,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
