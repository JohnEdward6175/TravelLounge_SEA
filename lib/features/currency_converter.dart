import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'currency_converter.g.dart'; // Run: flutter pub run build_runner build

@HiveType(typeId: 10)
class ShoppingList extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String country;
  @HiveField(3)
  final List<ShoppingItem> items;

  ShoppingList({
    required this.id,
    required this.title,
    required this.country,
    required this.items,
  });
}

@HiveType(typeId: 11)
class ShoppingItem extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String? description;
  @HiveField(2)
  double price;
  @HiveField(3)
  bool isBought;

  ShoppingItem({
    required this.name,
    this.description,
    required this.price,
    this.isBought = false,
  });
}

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _fromCurrency = 'USD';
  String _toCurrency = 'THB';
  double? _numericResult;

  // Hive Box reference
  late Box<ShoppingList> _shoppingBox;
  List<ShoppingList> _shoppingLists = [];

  final List<String> _currencies = [
    'USD', 'THB', 'SGD', 'MYR', 'IDR',
    'VND', 'KHR', 'LAK', 'MMK', 'PHP',
  ];

  final List<String> _southeastAsianCountries = [
    'Brunei', 'Cambodia', 'Indonesia', 'Laos', 'Malaysia',
    'Myanmar', 'Philippines', 'Singapore', 'Thailand', 'Timor-Leste', 'Vietnam'
  ];

  // Accurate baseline exchange rates relative to USD
  final Map<String, double> _ratesToUSD = {
    'USD': 1.0,
    'THB': 32.74,
    'SGD': 1.27,
    'MYR': 4.45,
    'IDR': 15500.0,
    'VND': 25400.0,
    'PHP': 61.58,
    'BND': 1.27,
    'KHR': 4050.0,
    'LAK': 22500.0,
    'MMK': 2100.0,
  };

  @override
  void initState() {
    super.initState();
    _shoppingBox = Hive.box<ShoppingList>('shopping_lists');
    _shoppingLists = _shoppingBox.values.toList();
    
    // Automatically recalculate when typing in the text field
    _amountController.addListener(_convert);
  }

  void _syncHive() async {
    await _shoppingBox.clear();
    await _shoppingBox.addAll(_shoppingLists);
    setState(() {
      debugPrint("Database Synced: ${_shoppingBox.length} lists saved.");
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _convert() {
    final input = double.tryParse(_amountController.text);
    if (input == null) {
      setState(() {
        _numericResult = null;
      });
      return;
    }

    double fromRate = _ratesToUSD[_fromCurrency] ?? 1.0;
    double toRate = _ratesToUSD[_toCurrency] ?? 1.0;

    // Convert input to USD base first, then to the target currency
    double amountInUSD = input / fromRate;
    double finalResult = amountInUSD * toRate;

    setState(() {
      _numericResult = finalResult;
    });
  }

  void _addShoppingList() {
    final titleController = TextEditingController();
    String selectedCountry = _southeastAsianCountries.first;

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
                  color: Colors.green,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                width: double.infinity,
                child: const Column(
                  children: [
                    Icon(Icons.playlist_add, color: Colors.white, size: 30),
                    SizedBox(height: 8),
                    Text(
                      "CREATE NEW LIST",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                        labelText: "List Name",
                        hintText: "e.g., Shopping Budget",
                      ),
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: selectedCountry,
                      decoration: const InputDecoration(labelText: "Select Country"),
                      items: _southeastAsianCountries
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
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("CANCEL", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  setState(() {
                    _shoppingLists.add(ShoppingList(
                      id: DateTime.now().millisecondsSinceEpoch,
                      title: titleController.text,
                      country: selectedCountry,
                      items: [],
                    ));
                    _syncHive();
                  });
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

  void _showItemDialog(int listIndex, {int? itemIndex}) {
    final isEditing = itemIndex != null;
    final item = isEditing ? _shoppingLists[listIndex].items[itemIndex] : null;

    final nameController = TextEditingController(text: item?.name ?? "");
    final descController = TextEditingController(text: item?.description ?? "");
    final priceController = TextEditingController(text: item?.price.toString() ?? "");

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              width: double.infinity,
              child: Text(
                isEditing ? "EDIT ITEM" : "ADD NEW ITEM",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(controller: nameController, decoration: const InputDecoration(labelText: "Item Name")),
                  TextField(controller: descController, decoration: const InputDecoration(labelText: "Description")),
                  TextField(
                    controller: priceController, 
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Price"),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          if (isEditing)
            TextButton(
              onPressed: () {
                setState(() {
                  _shoppingLists[listIndex].items.removeAt(itemIndex);
                  _syncHive();
                });
                Navigator.pop(context);
              },
              child: const Text("DELETE", style: TextStyle(color: Colors.red)),
            ),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("CANCEL")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                setState(() {
                  double price = double.tryParse(priceController.text) ?? 0.0;
                  if (isEditing) {
                    item!.name = nameController.text;
                    item.description = descController.text;
                    item.price = price;
                  } else {
                    _shoppingLists[listIndex].items.add(ShoppingItem(
                      name: nameController.text, 
                      description: descController.text, 
                      price: price
                    ));
                  }
                  _syncHive();
                });
                Navigator.pop(context);
              }
            },
            child: Text(isEditing ? "SAVE" : "ADD", style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _editListTitle(int listIndex) {
    final list = _shoppingLists[listIndex];
    final titleController = TextEditingController(text: list.title);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit List Title'),
        content: TextField(
          controller: titleController,
          decoration: const InputDecoration(labelText: 'List Title'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              setState(() {
                list.title = titleController.text;
                _syncHive();
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  double _calculateTotal(int listIndex) {
    return _shoppingLists[listIndex].items.fold(0.0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green, Colors.green.shade700],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.attach_money, color: Colors.white, size: 28),
                    const Text(
                      'Budget Planner',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.close, color: Colors.white, size: 28),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 16),
                          decoration: const InputDecoration(hintText: '0', border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(width: 80, child: _currencyDropdown(_fromCurrency, (val) => setState(() => _fromCurrency = val!))),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _numericResult?.toStringAsFixed(2) ?? '0.00',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(width: 80, child: _currencyDropdown(_toCurrency, (val) => setState(() => _toCurrency = val!))),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _convert,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade800,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Convert', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: 
              ListView.builder(
  itemCount: _shoppingLists.length,
  itemBuilder: (context, index) {
    final list = _shoppingLists[index];
    
    // Map each country to its three-letter currency code
    const currencyCodes = {
      'Brunei': 'BND',
      'Cambodia': 'KHR',
      'Indonesia': 'IDR',
      'Laos': 'LAK',
      'Malaysia': 'MYR',
      'Myanmar': 'MMK',
      'Philippines': 'PHP',
      'Singapore': 'SGD',
      'Thailand': 'THB',
      'Timor-Leste': 'USD',
      'Vietnam': 'VND',
    };
    final currencyCode = currencyCodes[list.country] ?? 'USD';

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _editListTitle(index),
                    child: Text(
                      list.title, 
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                Text(
                  '$currencyCode ${_calculateTotal(index).toStringAsFixed(2)}', 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                  onPressed: () {
                    setState(() {
                      _shoppingLists.removeAt(index);
                      _syncHive();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                list.country,
                style: TextStyle(fontSize: 10, color: Colors.green.shade800, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.items.length,
            itemBuilder: (context, itemIndex) {
              final item = list.items[itemIndex];
              return ListTile(
                leading: Checkbox(
                  value: item.isBought,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      item.isBought = value!;
                      _syncHive();
                    });
                  },
                ),
                title: Text(item.name),
                subtitle: item.description != null ? Text(item.description!) : null,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$currencyCode ${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue, size: 20),
                      onPressed: () => _showItemDialog(index, itemIndex: itemIndex),
                    ),
                  ],
                ),
              );
            },
          ),
          TextButton.icon(
            onPressed: () => _showItemDialog(index),
            icon: const Icon(Icons.add, color: Colors.green),
            label: const Text('Add Item', style: TextStyle(color: Colors.green)),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  },
)
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addShoppingList,
        backgroundColor: Colors.green,
        child: const Icon(Icons.post_add, color: Colors.white, size: 28),
      ),
    );
  }

 Widget _currencyDropdown(String currentValue, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.green.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: currentValue,
        isExpanded: true,
        underline: const SizedBox(),
        iconEnabledColor: Colors.white,
        dropdownColor: Colors.green.shade300,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        isDense: true,
        items: _currencies.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
        onChanged: (val) {
          onChanged(val);
          _convert(); // Recalculate instantly when dropdown changes
        },
      ),
    );
  }
}