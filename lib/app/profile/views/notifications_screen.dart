import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pranermart/widgets/back_floatingButton.dart';

class NotificationsScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Order Shipped',
      description: 'Your order #12345 has been shipped.',
      dateTime: DateTime.now().subtract(Duration(minutes: 30)),
      isRead: false,
    ),
    NotificationItem(
      title: 'New Message',
      description: 'You have a new message from support.',
      dateTime: DateTime.now().subtract(Duration(hours: 2)),
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return _buildNotificationItem(context, notification);
          },
        ),
      ),
      floatingActionButton: BackFloatingbutton(),
    );
  }

  Widget _buildNotificationItem(
      BuildContext context, NotificationItem notification) {
    return Dismissible(
      key: Key(notification.title),
      background: _buildDismissibleBackground(),
      onDismissed: (direction) {
        // Handle delete action
        // Remove the notification from the list
        notifications.remove(notification);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${notification.title} deleted'),
            backgroundColor: Colors.redAccent,
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: _buildNotificationIcon(notification),
          title: Text(
            notification.title,
            style: TextStyle(
              fontWeight:
                  notification.isRead ? FontWeight.normal : FontWeight.bold,
              color: notification.isRead ? Colors.grey[700] : Color(0xFF203A43),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.description,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 5),
              Text(
                _formatDateTime(notification.dateTime),
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.more_vert, color: Color(0xFF203A43)),
            onPressed: () {
              _showNotificationOptions(context, notification);
            },
          ),
          onTap: () {
            // Mark notification as read
            notification.isRead = true;
            (context as Element).markNeedsBuild();
          },
        ),
      ),
    );
  }

  Widget _buildDismissibleBackground() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerRight,
      color: Colors.redAccent,
      child: Icon(Icons.delete, color: Colors.white),
    );
  }

  Widget _buildNotificationIcon(NotificationItem notification) {
    return CircleAvatar(
      backgroundColor:
          notification.isRead ? Colors.grey[300] : Color(0xFF0F2027),
      child: SvgPicture.asset(
        'assets/icons/notification.svg',
        color: Colors.white,
        height: 24,
        width: 24,
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

  void _showNotificationOptions(
      BuildContext context, NotificationItem notification) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.mark_email_read, color: Color(0xFF203A43)),
                title: Text('Mark as Read'),
                onTap: () {
                  Navigator.of(context).pop();
                  notification.isRead = true;
                  (context as Element).markNeedsBuild();
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.redAccent),
                title: Text('Delete'),
                onTap: () {
                  Navigator.of(context).pop();
                  notifications.remove(notification);
                  (context as Element).markNeedsBuild();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${notification.title} deleted'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class NotificationItem {
  final String title;
  final String description;
  final DateTime dateTime;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.description,
    required this.dateTime,
    this.isRead = false,
  });
}

void main() {
  runApp(MaterialApp(
    home: NotificationsScreen(),
  ));
}
