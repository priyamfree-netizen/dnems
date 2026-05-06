import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_school/api_handle/api_client.dart';
import 'package:mighty_school/common/global_widget/custom_web_scroll_view_widget.dart';
import 'package:mighty_school/common/widget/custom_app_bar.dart';
import 'package:mighty_school/util/app_constants.dart';

class InstituteScreen extends StatefulWidget {
  const InstituteScreen({super.key});

  @override
  State<InstituteScreen> createState() => _InstituteScreenState();
}

class _InstituteScreenState extends State<InstituteScreen> {
  final ScrollController scrollController = ScrollController();
  List<dynamic> institutes = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadInstitutes();
  }

  Future<void> _loadInstitutes() async {
    setState(() { isLoading = true; error = null; });
    try {
      final apiClient = Get.find<ApiClient>();
      final response = await apiClient.getData(AppConstants.institutes);
      if (response.statusCode == 200) {
        final body = response.body;
        List<dynamic> data = [];
        if (body is Map) {
          // Handle paginated response: { data: { data: [...] } }
          final outerData = body['data'];
          if (outerData is Map && outerData['data'] is List) {
            data = outerData['data'];
          } else if (outerData is List) {
            data = outerData;
          } else if (body['institutes'] is List) {
            data = body['institutes'];
          }
        } else if (body is List) {
          data = body;
        }
        setState(() {
          institutes = data;
          isLoading = false;
        });
      } else {
        setState(() {
          error = response.statusText ?? 'Failed to load institutes (${response.statusCode})';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Institutes'),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 56, color: Colors.red.shade300),
                        const SizedBox(height: 16),
                        Text(
                          error!,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red.shade700),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: _loadInstitutes,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                )
              : institutes.isEmpty
                  ? const Center(child: Text('No institutes found'))
                  : RefreshIndicator(
                      onRefresh: _loadInstitutes,
                      child: CustomWebScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverPadding(
                            padding: const EdgeInsets.all(16),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final inst = institutes[index];
                                  final isActive = inst['status'] == 1;
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        children: [
                                          // Avatar
                                          CircleAvatar(
                                            radius: 24,
                                            backgroundColor: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.12),
                                            child: Text(
                                              ((inst['name'] ?? 'I') as String)
                                                  .isNotEmpty
                                                  ? (inst['name'] as String)[0]
                                                      .toUpperCase()
                                                  : 'I',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context).primaryColor,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          // Info
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  inst['name'] ?? '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                if (inst['domain'] != null &&
                                                    inst['domain'].toString().isNotEmpty)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(top: 4),
                                                    child: Text(
                                                      '🌐 ${inst['domain']}',
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                if (inst['phone'] != null &&
                                                    inst['phone'].toString().isNotEmpty)
                                                  Text(
                                                    '📞 ${inst['phone']}',
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                if (inst['institute_type'] != null)
                                                  Text(
                                                    '🏫 ${inst['institute_type']}',
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          // Status badge
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              color: isActive
                                                  ? Colors.green.shade50
                                                  : Colors.red.shade50,
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(
                                                color: isActive
                                                    ? Colors.green.shade300
                                                    : Colors.red.shade300,
                                              ),
                                            ),
                                            child: Text(
                                              isActive ? 'Active' : 'Inactive',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: isActive
                                                    ? Colors.green.shade700
                                                    : Colors.red.shade700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                childCount: institutes.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
}
