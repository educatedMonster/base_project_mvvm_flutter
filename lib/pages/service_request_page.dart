import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ServiceRequest {
  final String id;
  final String room;
  final String priority; // High, Moderate, Low
  final DateTime targetCompletion;
  final String status; // Pending, On-going, Completed

  ServiceRequest({
    required this.id,
    required this.room,
    required this.priority,
    required this.targetCompletion,
    required this.status,
  });
}

@RoutePage()
class ServiceRequestPage extends StatefulWidget {
  const ServiceRequestPage({super.key});

  @override
  State<ServiceRequestPage> createState() => _ServiceRequestPageState();
}

class _ServiceRequestPageState extends State<ServiceRequestPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  DateTime _startOfWeek = DateTime(2025, 8, 17); // default Aug 17, 2025
  DateTime _endOfWeek = DateTime(2025, 8, 23); // default Aug 23, 2025
  String _priorityFilter = "All"; // All, High, Moderate, Low

  final List<ServiceRequest> requests = [
    ServiceRequest(
      id: "SRN 000001",
      room: "DLX 103",
      priority: "High",
      targetCompletion: DateTime(2025, 8, 19, 12, 0),
      status: "Pending",
    ),
    ServiceRequest(
      id: "SRN 000002",
      room: "STN 303",
      priority: "Moderate",
      targetCompletion: DateTime(2025, 8, 21, 15, 0),
      status: "On-going",
    ),
    ServiceRequest(
      id: "SRN 000003",
      room: "STN 103",
      priority: "Moderate",
      targetCompletion: DateTime(2025, 8, 21, 16, 0),
      status: "Pending",
    ),
    ServiceRequest(
      id: "SRN 000004",
      room: "DLX 403",
      priority: "Low",
      targetCompletion: DateTime(2025, 8, 23, 16, 0),
      status: "Completed",
    ),
    ServiceRequest(
      id: "SRN 000005",
      room: "STN 104",
      priority: "Moderate",
      targetCompletion: DateTime(2025, 8, 23, 18, 0),
      status: "Pending",
    ),
    ServiceRequest(
      id: "SRN 000006",
      room: "DLX 401",
      priority: "Low",
      targetCompletion: DateTime(2025, 8, 17, 7, 0),
      status: "Completed",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _previousWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.subtract(const Duration(days: 7));
      _endOfWeek = _endOfWeek.subtract(const Duration(days: 7));
    });
  }

  void _nextWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.add(const Duration(days: 7));
      _endOfWeek = _endOfWeek.add(const Duration(days: 7));
    });
  }

  Map<String, List<ServiceRequest>> groupByDate(List<ServiceRequest> list) {
    final Map<String, List<ServiceRequest>> grouped = {};
    for (var req in list) {
      String dateKey = DateFormat('MMMM dd').format(req.targetCompletion);
      grouped.putIfAbsent(dateKey, () => []);
      grouped[dateKey]!.add(req);
    }
    return grouped;
  }

  Map<String, List<ServiceRequest>> groupByDate2(List<ServiceRequest> list) {
    final Map<String, List<ServiceRequest>> grouped = {};
    for (var req in list) {
      String dateKey = DateFormat('MMMM dd').format(req.targetCompletion);
      grouped.putIfAbsent(dateKey, () => []);
      grouped[dateKey]!.add(req);
    }

    // Sort the keys by date (descending)
    final sortedKeys = grouped.keys.toList()
      ..sort((a, b) {
        final dateA = DateFormat('MMMM dd').parse(a);
        final dateB = DateFormat('MMMM dd').parse(b);
        return dateA.compareTo(dateB); // low → high
      });

    // Rebuild as LinkedHashMap to maintain sorted order
    final sortedMap = LinkedHashMap<String, List<ServiceRequest>>.fromIterable(
      sortedKeys,
      key: (k) => k as String,
      value: (k) => grouped[k]!,
    );

    return sortedMap;
  }

  @override
  Widget build(BuildContext context) {
    String rangeText =
        "${DateFormat('MMM dd').format(_startOfWeek)} - ${DateFormat('dd, yyyy').format(_endOfWeek)}";

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (bc, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(
              "Service Request",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            pinned: true,
            floating: true,
            snap: true,
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: FittedBox(
                    child: Text(
                      "All",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                Tab(
                  child: FittedBox(
                    child: Text(
                      "Pending",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                Tab(
                  child: FittedBox(
                    child: Text(
                      "On-going",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                Tab(
                  child: FittedBox(
                    child: Text(
                      "Completed",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Sticky date range + priority filters
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyHeaderDelegate(
              onPreviousWeek: _previousWeek,
              onNextWeek: _nextWeek,
              rangeText: rangeText,
              buildPriorityButton: _buildPriorityButton,
              onFilterPressed: _openFilterBottomSheet,
              maxHeight: MediaQuery.of(bc).size.height * 0.12,
              // dynamic
              minHeight: MediaQuery.of(bc).size.height * 0.06, // dynamic
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildRequestList("All"),
            _buildRequestList("Pending"),
            _buildRequestList("On-going"),
            _buildRequestList("Completed"),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityButton(String label, Color color) {
    bool isSelected = _priorityFilter == label;
    return FittedBox(
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: color.withOpacity(0.2),
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: isSelected ? color : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        onSelected: (_) {
          setState(() {
            _priorityFilter = isSelected ? "All" : label; // toggle
          });
        },
      ),
    );
  }

  void _openFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          runSpacing: 12,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              "Filter by Priority",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPriorityButton("High", Colors.red),
                _buildPriorityButton("Moderate", Colors.orange),
                _buildPriorityButton("Low", Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestList(String filter) {
    // Filter by status + date range + priority
    List<ServiceRequest> filtered = requests.where((r) {
      bool inDateRange = r.targetCompletion
              .isAfter(_startOfWeek.subtract(const Duration(days: 1))) &&
          r.targetCompletion.isBefore(_endOfWeek.add(const Duration(days: 1)));
      bool matchesStatus = filter == "All" ? true : r.status == filter;
      bool matchesPriority =
          _priorityFilter == "All" ? true : r.priority == _priorityFilter;
      return inDateRange && matchesStatus && matchesPriority;
    }).toList();

    // Group by date
    final grouped = groupByDate2(filtered);

    if (filtered.isEmpty) {
      return Center(
        child: Text(
          "No requests found",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return Flex(
      direction: Axis.vertical,
      children: [
        Flexible(
          child: ListView(
            shrinkWrap: true,
            children: grouped.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Date Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      entry.key,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12.sp),
                    ),
                  ),
                  // Requests under this date
                  ...entry.value.map((req) => Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: ListTile(
                          title: Text(
                            "${req.id} • ${req.room}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          subtitle: Text(
                            "Target Completion: ${DateFormat('h:mm a').format(req.targetCompletion)}",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: req.priority == "High"
                                  ? Colors.red[100]
                                  : req.priority == "Moderate"
                                      ? Colors.orange[100]
                                      : Colors.blue[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              req.priority,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: req.priority == "High"
                                    ? Colors.red
                                    : req.priority == "Moderate"
                                    ? Colors.orange
                                    : Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

// 🔹 Delegate for sticky header
class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final VoidCallback onPreviousWeek;
  final VoidCallback onNextWeek;
  final String rangeText;
  final Widget Function(String label, Color color) buildPriorityButton;
  final VoidCallback onFilterPressed;
  final double maxHeight;
  final double minHeight;

  _StickyHeaderDelegate({
    required this.onPreviousWeek,
    required this.onNextWeek,
    required this.rangeText,
    required this.buildPriorityButton,
    required this.onFilterPressed,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / (maxExtent - minExtent);
    final clamped = progress.clamp(0.0, 1.0);

    return Material(
      color: Colors.white,
      elevation: overlapsContent ? 4 : 0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // 📌 Date row
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8 - (4 * clamped),
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: onPreviousWeek,
                    ),
                    0 == clamped
                        ? Text(rangeText,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 16 - (2 * clamped)))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(rangeText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 16 - (2 * clamped))),
                              Opacity(
                                opacity: clamped,
                                child: Transform.translate(
                                  offset: Offset(20 * (1 - clamped), 0),
                                  child: IconButton(
                                    icon: const Icon(Icons.filter_list),
                                    onPressed: onFilterPressed,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: onNextWeek,
                    ),
                  ],
                ),
              ),

              // 📌 Priority chips row (only if expanded)
              if (clamped < 1)
                Flexible(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform.scale(
                      scale: 1 - (0.1 * clamped),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildPriorityButton("High", Colors.red),
                            buildPriorityButton("Moderate", Colors.orange),
                            buildPriorityButton("Low", Colors.blue),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => maxHeight; // ~18% of screen

  @override
  double get minExtent => minHeight; // ~9% of screen

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) => true;
}
