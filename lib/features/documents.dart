import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/dataHandler/travel_requirements.dart';
import 'package:my_app/dataHandler/document_data.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  Box<DocumentList>? documentBox;
  bool showDocuments = true;
  String globalSelectedCountry = 'Brunei';

  final List<String> southeastAsianCountries = [
    'Brunei', 'Cambodia', 'Indonesia', 'Laos', 'Malaysia',
    'Myanmar', 'Philippines', 'Singapore', 'Thailand', 'Timor-Leste', 'Vietnam'
  ];

  final Map<String, String> countryToCode = {
    'Brunei': 'BN', 'Cambodia': 'KH', 'Indonesia': 'ID', 'Laos': 'LA',
    'Malaysia': 'MY', 'Myanmar': 'MM', 'Philippines': 'PH',
    'Singapore': 'SG', 'Thailand': 'TH', 'Timor-Leste': 'TL', 'Vietnam': 'VN'
  };

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    if (!Hive.isBoxOpen('myDocuments')) {
      documentBox = await Hive.openBox<DocumentList>('myDocuments');
    } else {
      documentBox = Hive.box<DocumentList>('myDocuments');
    }
    if (mounted) setState(() {});
  }

  bool _isBase64(String str) {
    try {
      base64Decode(str);
      return true;
    } catch (_) {
      return false;
    }
  }

  void _confirmDeleteItem(DocumentList list, int itemIndex) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Document?"),
        content: const Text("Are you sure you want to remove this item?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("CANCEL")),
          TextButton(
            onPressed: () {
              setState(() {
                list.items.removeAt(itemIndex);
                list.save();
              });
              Navigator.pop(context);
            },
            child: const Text("DELETE", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _addDocumentList() {
    if (documentBox == null) return;
    final titleController = TextEditingController();
    String selectedCountry = globalSelectedCountry;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                width: double.infinity,
                child: const Column(
                  children: [
                    Icon(Icons.playlist_add, color: Colors.white, size: 30),
                    SizedBox(height: 8),
                    Text("CREATE NEW LIST",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                        controller: titleController,
                        decoration: const InputDecoration(labelText: "List Name")),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: selectedCountry,
                      items: southeastAsianCountries
                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onChanged: (v) => setDialogState(() => selectedCountry = v!),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("CANCEL")),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  final newList = DocumentList(
                      title: titleController.text, country: selectedCountry, items: []);
                  documentBox!.add(newList);
                  setState(() {});
                  Navigator.pop(context);
                }
              },
              child: const Text("CREATE", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  void _showItemDialog(int actualIndex, {int? itemIndex}) {
    final docList = documentBox!.getAt(actualIndex)!;
    final isEditing = itemIndex != null;
    final item = isEditing ? docList.items[itemIndex] : null;

    final nameController = TextEditingController(text: item?.name ?? "");
    final descController = TextEditingController(text: item?.description ?? "");
    String? localImagePath = item?.imagePath;
    final ImagePicker picker = ImagePicker();

    // Update this in your code:
Future<void> pickNewImage(Function setDialogState) async {
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    // ALWAYS read as bytes and convert to Base64
    final bytes = await pickedFile.readAsBytes();
    setDialogState(() => localImagePath = base64Encode(bytes));
  }
}

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(isEditing ? "Edit Document" : "Add Document"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    if (localImagePath != null) {
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          backgroundColor: Colors.transparent,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              InteractiveViewer(
                                child: kIsWeb || _isBase64(localImagePath!)
                                    ? Image.memory(base64Decode(localImagePath!))
                                    : Image.file(File(localImagePath!)),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      pickNewImage(setDialogState);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: localImagePath != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: kIsWeb || _isBase64(localImagePath!)
                                ? Image.memory(base64Decode(localImagePath!), fit: BoxFit.cover)
                                : Image.file(File(localImagePath!), fit: BoxFit.cover),
                          )
                        : const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_a_photo, color: Colors.grey),
                              Text("Tap to Insert Image", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                  ),
                ),
                if (localImagePath != null)
                  TextButton.icon(
                    onPressed: () => pickNewImage(setDialogState),
                    icon: const Icon(Icons.sync, size: 18),
                    label: const Text("Replace Image"),
                  ),
                TextField(controller: nameController, decoration: const InputDecoration(labelText: "Document Name")),
                TextField(controller: descController, decoration: const InputDecoration(labelText: "Description")),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                if (localImagePath != null)
                  TextButton(
                    onPressed: () => setDialogState(() => localImagePath = null),
                    child: const Text("Remove", style: TextStyle(color: Colors.red)),
                  ),
                const Spacer(),
                TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty) {
                      setState(() {
                        if (isEditing) {
                          item!.name = nameController.text;
                          item.description = descController.text;
                          item.imagePath = localImagePath;
                        } else {
                          docList.items.add(DocumentItem(
                            name: nameController.text,
                            description: descController.text,
                            imagePath: localImagePath,
                          ));
                        }
                        docList.save();
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (documentBox == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator(color: Colors.orange)));
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.orange, Color(0xFFFF9800)]),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("My Documents", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    GestureDetector(onTap: () => Navigator.maybePop(context), child: const Icon(Icons.close, color: Colors.white, size: 28)),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  child: DropdownButtonFormField<String>(
                    value: globalSelectedCountry,
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.search, color: Colors.grey), border: InputBorder.none),
                    items: southeastAsianCountries.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                    onChanged: (v) => setState(() => globalSelectedCountry = v!),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: ToggleButtons(
              borderRadius: BorderRadius.circular(12),
              fillColor: Colors.orange,
              selectedColor: Colors.white,
              color: Colors.orange,
              constraints: const BoxConstraints(minWidth: 130, minHeight: 36),
              isSelected: [showDocuments, !showDocuments],
              onPressed: (i) => setState(() => showDocuments = i == 0),
              children: const [Text("Documents"), Text("Requirements")],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: showDocuments ? _buildDocumentList() : _buildRequirementsList(),
            ),
          ),
        ],
      ),
      floatingActionButton: showDocuments
          ? FloatingActionButton(onPressed: _addDocumentList, backgroundColor: Colors.orange, child: const Icon(Icons.post_add, color: Colors.white))
          : null,
    );
  }

  Widget _buildDocumentList() {
    final allLists = documentBox!.values.toList();

    return ListView.builder(
      itemCount: allLists.length,
      itemBuilder: (_, index) {
        final currentList = allLists[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: ExpansionTile(
            title: Row(
              children: [
                Expanded(child: Text(currentList.title, style: const TextStyle(fontWeight: FontWeight.bold))),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(8)),
                  child: Text(currentList.country, style: const TextStyle(fontSize: 10, color: Colors.orange, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () => setState(() { documentBox!.deleteAt(index); })),
            children: [
              ...currentList.items.asMap().entries.map((entry) {
                int itemIndex = entry.key;
                DocumentItem doc = entry.value;
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  leading: Checkbox(
                      value: doc.isChecked,
                      activeColor: Colors.orange,
                      onChanged: (v) {
                        setState(() => doc.isChecked = v!);
                        currentList.save();
                      }),
                  title: Row(
                    children: [
                      Flexible(child: Text(doc.name, overflow: TextOverflow.ellipsis)),
                      if (doc.imagePath != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: kIsWeb || _isBase64(doc.imagePath!)
                                ? Image.memory(base64Decode(doc.imagePath!), width: 35, height: 35, fit: BoxFit.cover, errorBuilder: (c, e, s) => const Icon(Icons.broken_image, size: 35))
                                : Image.file(File(doc.imagePath!), width: 35, height: 35, fit: BoxFit.cover, errorBuilder: (c, e, s) => const Icon(Icons.broken_image, size: 35)),
                          ),
                        ),
                    ],
                  ),
                  subtitle: doc.imagePath != null ? const Text("Image attached", style: TextStyle(fontSize: 11, color: Colors.green)) : null,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.orange, size: 20),
                        onPressed: () => _showItemDialog(index, itemIndex: itemIndex),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                        onPressed: () => _confirmDeleteItem(currentList, itemIndex),
                      ),
                    ],
                  ),
                );
              }).toList(),
              TextButton.icon(
                onPressed: () => _showItemDialog(index),
                icon: const Icon(Icons.add, color: Colors.orange),
                label: const Text("Add Document", style: TextStyle(color: Colors.orange)),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRequirementsList() {
    final code = countryToCode[globalSelectedCountry];
    final info = travelInfoData.firstWhere((element) => element.countryCode == code, orElse: () => travelInfoData.first);

    return ListView(
      children: [
        const SizedBox(height: 10),
        const Text("Mandatory Requirements", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
        const SizedBox(height: 8),
        ...info.requirements.map((req) => Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade200)),
              child: ListTile(
                leading: const Icon(Icons.verified_user, color: Colors.green, size: 20),
                title: Text(req, style: const TextStyle(fontSize: 14)),
              ),
            )),
        const SizedBox(height: 16),
        const Text("Suggested Items", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
        const SizedBox(height: 8),
        ...info.whatToBring.map((item) => Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade200)),
              child: ListTile(
                leading: const Icon(Icons.shopping_bag, color: Colors.blue, size: 20),
                title: Text(item, style: const TextStyle(fontSize: 14)),
              ),
            )),
        const SizedBox(height: 16),
        Card(
          color: Colors.orange.shade50,
          child: ListTile(
            leading: const Icon(Icons.currency_exchange, color: Colors.orange),
            title: const Text("Exchange Rate (1 USD)", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text("${info.usdRate} ${info.countryCode}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ),
      ],
    );
  }
}