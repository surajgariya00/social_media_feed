import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_feed/Data/dummy_daata.dart';

class AnimatedPostCard extends StatefulWidget {
  final Post post;

  const AnimatedPostCard(this.post, {super.key});

  @override
  AnimatedPostCardState createState() => AnimatedPostCardState();
}

class AnimatedPostCardState extends State<AnimatedPostCard> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Card(
        key: ValueKey(widget.post.id),
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(widget.post.userImageUrl),
              ),
              title: Text(
                widget.post.username,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(widget.post.location),
            ),
            Container(
              height: 400,
              color: const Color.fromARGB(255, 251, 251, 251),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.blue[50],
                    strokeWidth: 2,
                  ),
                  Visibility(
                    visible: widget.post.imageUrl.isNotEmpty,
                    child: CachedNetworkImage(
                      imageUrl: widget.post.imageUrl,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      errorWidget: (context, url, error) => Container(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(
                          widget.post.isLiked
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: widget.post.isLiked ? Colors.red : null,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.post.isLiked = !widget.post.isLiked;
                            if (widget.post.isLiked) {
                              widget.post.likes++;
                            } else {
                              widget.post.likes--;
                            }
                          });
                        },
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: const Icon(CupertinoIcons.chat_bubble),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: '${widget.post.username}: ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: widget.post.description),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        '${widget.post.likes} likes',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '${widget.post.comments.length} comments',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          setState(() {
                            widget.post.comments.add(_commentController.text);
                            _commentController.clear();
                          });
                        },
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.post.comments.map((comment) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(faker.image.image()),
                            ),
                            const SizedBox(width: 8.0),
                            Text(comment),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
