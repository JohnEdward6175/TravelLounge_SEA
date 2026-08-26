// lib/myBag.dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/dataHandler/bag_data.dart'; // Adjust this path to your project structure

class MyBagPage extends StatefulWidget {
  const MyBagPage({super.key});

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  late Box<BagCategory> bagBox;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final List<String> southeastAsianCountries = [
    'Brunei', 'Cambodia', 'Indonesia', 'Laos', 'Malaysia',
    'Myanmar', 'Philippines', 'Singapore', 'Thailand', 'Timor-Leste',
  ];

  @override
  void initState() {
    super.initState();
    bagBox = Hive.box<BagCategory>('myBags');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _createNewBagDialog() {
    final titleController = TextEditingController();
    String selectedCountry = "Philippines";

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
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                width: double.infinity,
                child: const Column(
                  children: [
                    Icon(Icons.playlist_add, color: Colors.white, size: 30),
                    SizedBox(height: 8),
                    Text(
                      "CREATE NEW BAG",
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: "Bag Name",
                        hintText: "e.g., Beach Essentials",
                      ),
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: selectedCountry,
                      decoration: const InputDecoration(labelText: "Destination"),
                      items: southeastAsianCountries
                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onChanged: (val) => setDialogState(() => selectedCountry = val!),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("CANCEL", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  final newBag = BagCategory(
                    title: titleController.text,
                    country: selectedCountry,
                    items: [],
                  );
                  bagBox.add(newBag); // Save to Hive
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

  void _showItemDialog(int bagIndex, {int? itemIndex}) {
    // Note: Since the list might be filtered, we need the actual object
    final allBags = bagBox.values.toList();
    final bag = allBags[bagIndex];

    final isEditing = itemIndex != null;
    final item = isEditing ? bag.items[itemIndex] : null;
    
    final nameController = TextEditingController(text: item?.name ?? "");
    final descController = TextEditingController(text: item?.description ?? "");

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? "Edit Item" : "Add Item"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: "Item Name")),
            TextField(controller: descController, decoration: const InputDecoration(labelText: "Description")),
          ],
        ),
        actions: [
          if (isEditing)
            TextButton(
              onPressed: () {
                setState(() => bag.items.removeAt(itemIndex));
                bag.save();
                Navigator.pop(context);
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                setState(() {
                  if (isEditing) {
                    item!.name = nameController.text;
                    item.description = descController.text;
                  } else {
                    bag.items.add(BagItem(name: nameController.text, description: descController.text));
                  }
                });
                bag.save();
                Navigator.pop(context);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _deleteBag(int actualIndex) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete List?"),
        content: const Text("Are you sure you want to remove this entire checklist?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              bagBox.deleteAt(actualIndex);
              setState(() {});
              Navigator.pop(context);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<BagCategory> allBags = bagBox.values.toList();
    
    final List<MapEntry<int, BagCategory>> filteredEntries = allBags
        .asMap()
        .entries
        .where((entry) {
          final query = _searchQuery.toLowerCase();
          return entry.value.title.toLowerCase().contains(query) || 
                 entry.value.country.toLowerCase().contains(query);
        })
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('My Bag', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () => Navigator.of(context).maybePop(), 
                      child: const Icon(Icons.close, color: Colors.white, size: 28)
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 44,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search lists or countries...', 
                      prefixIcon: Icon(Icons.search, color: Colors.grey), 
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const Text("Personal Items", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
          const SizedBox(height: 7),
          Expanded(
            child: filteredEntries.isEmpty 
              ? Center(
                  child: Text(
                    _searchQuery.isEmpty ? "No Personal lists yet." : "No results found for '$_searchQuery'", 
                    style: const TextStyle(color: Colors.grey)
                  )
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: filteredEntries.length,
                  itemBuilder: (context, index) {
                    final actualIndex = filteredEntries[index].key;
                    final bag = filteredEntries[index].value;

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      child: ExpansionTile(
                        title: Text(bag.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("${bag.country} • ${bag.items.length} items", style: const TextStyle(fontSize: 12, color: Colors.blue)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 22),
                          onPressed: () => _deleteBag(actualIndex),
                        ),
                        children: [
                          ...bag.items.asMap().entries.map((entry) {
                            int itemIndex = entry.key;
                            BagItem item = entry.value;
                            return ListTile(
                              leading: Checkbox(
                                value: item.isChecked, 
                                activeColor: Colors.blueAccent, 
                                onChanged: (v) {
                                  setState(() => item.isChecked = v!);
                                  bag.save();
                                }
                              ),
                              title: Text(item.name, style: TextStyle(decoration: item.isChecked ? TextDecoration.lineThrough : null)),
                              subtitle: (item.description != null && item.description!.isNotEmpty) ? Text(item.description!) : null,
                              trailing: IconButton(icon: const Icon(Icons.edit, size: 18), onPressed: () => _showItemDialog(actualIndex, itemIndex: itemIndex)),
                            );
                          }).toList(),
                          TextButton.icon(
                            onPressed: () => _showItemDialog(actualIndex),
                            icon: const Icon(Icons.add, size: 18),
                            label: const Text("Add Item"),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    );
                  },
                ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewBagDialog,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.post_add, color: Colors.white),
      ),
    );
  }
}