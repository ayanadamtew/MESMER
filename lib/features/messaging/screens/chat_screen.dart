import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/shared/widgets/common_widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({required this.chatId, super.key});

  final String chatId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _client = Supabase.instance.client;
  final _msgCtrl = TextEditingController();
  final _scrollCtrl = ScrollController();
  final List<Map<String, dynamic>> _messages = [];
  late final RealtimeChannel _channel;
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    _loadMessages();
    _subscribeToRealtime();
  }

  Future<void> _loadMessages() async {
    final response = await _client
        .from('messages')
        .select()
        .eq('chat_room_id', widget.chatId)
        .order('created_at', ascending: true);

    if (mounted) {
      setState(
        () => _messages
          ..clear()
          ..addAll(List<Map<String, dynamic>>.from(response as List)),
      );
      _scrollToBottom();
    }
  }

  void _subscribeToRealtime() {
    _channel = _client
        .channel('messages:${widget.chatId}')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'messages',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'chat_room_id',
            value: widget.chatId,
          ),
          callback: (payload) {
            if (mounted) {
              setState(() => _messages.add(payload.newRecord));
              _scrollToBottom();
            }
          },
        )
        .subscribe();
  }

  Future<void> _sendMessage() async {
    final text = _msgCtrl.text.trim();
    if (text.isEmpty) return;

    setState(() => _sending = true);
    _msgCtrl.clear();

    try {
      await _client.from('messages').insert({
        'chat_room_id': widget.chatId,
        'sender_id': _client.auth.currentUser?.id,
        'content': text,
        'created_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Send failed: $e'),
          backgroundColor: AppColors.error,
        ),
      );
      _msgCtrl.text = text; // restore
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollCtrl.hasClients) {
        _scrollCtrl.animateTo(
          _scrollCtrl.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _channel.unsubscribe();
    _msgCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = _client.auth.currentUser?.id;

    return Scaffold(
      appBar: const MesmerAppBar(title: 'Chat'),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? const EmptyStateWidget(
                    icon: Icons.chat_rounded,
                    title: 'Say hello!',
                    subtitle: 'Start a conversation below.',
                  )
                : ListView.builder(
                    controller: _scrollCtrl,
                    padding: const EdgeInsets.all(AppSpacing.md),
                    itemCount: _messages.length,
                    itemBuilder: (_, i) {
                      final msg = _messages[i];
                      final isMe = msg['sender_id'] == currentUserId;
                      return _MessageBubble(
                        content: msg['content'] as String,
                        isMe: isMe,
                        time: msg['created_at'] != null
                            ? DateTime.parse(
                                msg['created_at'] as String,
                              )
                            : null,
                      );
                    },
                  ),
          ),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.sm + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _msgCtrl,
              decoration: const InputDecoration(
                hintText: 'Type a message…',
              ),
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          IconButton(
            onPressed: _sending ? null : _sendMessage,
            icon: _sending
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send_rounded, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
    required this.content,
    required this.isMe,
    this.time,
  });

  final String content;
  final bool isMe;
  final DateTime? time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isMe
              ? AppColors.primary
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(AppRadius.md),
            topRight: const Radius.circular(AppRadius.md),
            bottomLeft: isMe
                ? const Radius.circular(AppRadius.md)
                : const Radius.circular(4),
            bottomRight: isMe
                ? const Radius.circular(4)
                : const Radius.circular(AppRadius.md),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              content,
              style: TextStyle(
                color: isMe ? Colors.white : Theme.of(context).colorScheme.onSurface,
              ),
            ),
            if (time != null) ...[
              const SizedBox(height: 2),
              Text(
                DateFormat.jm().format(time!),
                style: TextStyle(
                  fontSize: 10,
                  color: isMe ? Colors.white70 : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
