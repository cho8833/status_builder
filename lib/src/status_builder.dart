import 'package:flutter/material.dart';
import 'package:status_builder/src/status.dart';

class StatusBuilder extends StatefulWidget {
  const StatusBuilder(
      {super.key,
      required this.statusNotifier,
      this.successBuilder,
      this.failBuilder,
      this.idleBuilder,
      this.loadingBuilder});

  final ValueNotifier<Status> statusNotifier;
  final Widget Function(BuildContext)? successBuilder;
  final Widget Function(BuildContext)? failBuilder;
  final Widget Function(BuildContext)? idleBuilder;
  final Widget Function(BuildContext)? loadingBuilder;

  @override
  State<StatusBuilder> createState() => _StatusBuilderState();
}

class _StatusBuilderState extends State<StatusBuilder> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.statusNotifier, builder: (context, status, _) {
          switch (status) {
            case Status.idle:
              return widget.idleBuilder?.call(context) ?? Container();
            case Status.loading:
              return widget.loadingBuilder?.call(context) ?? const Center(child: CircularProgressIndicator(),);
            case Status.success:
              return widget.successBuilder?.call(context) ?? Container();
            case Status.fail:
              return widget.failBuilder?.call(context) ?? const Center(child: Text("failed"),);
          }
    });
  }
}
