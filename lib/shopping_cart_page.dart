import 'package:flutter/material.dart';

// Colors used throughout the campus store cart page.
const Color kPageBackground = Color(0xFFF3F6FB);
const Color kCardBorder = Color(0xFFE2E8F0);
const Color kMainBlue = Color(0xFF2563EB);
const Color kLightBlue = Color(0xFFDCE9FD);
const Color kDarkNavy = Color(0xFF0F1B3D);
const Color kGray = Color(0xFF64748B);

// The shopping cart page for the Campus Store.
// Shows delivery info, order items, discount banner, payment summary,
// and a place order button. Everything is static (no state).
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: kDarkNavy,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kDarkNavy),
          onPressed: () {
            debugPrint('Back clicked');
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Stack(
              children: [
                IconButton(
                  icon:
                      const Icon(Icons.shopping_bag_outlined, color: kDarkNavy),
                  onPressed: () {
                    debugPrint('Cart clicked');
                  },
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: kMainBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ================= INTRODUCTION SECTION =================
                    // Small light-blue tag that says CAMPUS STORE.
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: kLightBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'CAMPUS STORE',
                          style: TextStyle(
                            color: kMainBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Main heading for the page.
                    const Text(
                      'Ready for checkout',
                      style: TextStyle(
                        color: kDarkNavy,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Subtext explaining what the user is looking at.
                    const Text(
                      'Review your items before placing your order.',
                      style: TextStyle(
                        color: kGray,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ================= DELIVERY INFORMATION CARD =================
                    // Card showing where the order will be delivered.
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: kCardBorder),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: kMainBlue, size: 24),
                            const SizedBox(width: 12),
                            Container(
                              height: 40,
                              width: 1,
                              color: kCardBorder,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Deliver to Angelo Ranes',
                                    style: TextStyle(
                                      color: kDarkNavy,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Matina, Davao City',
                                    style: TextStyle(
                                      color: kGray,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                debugPrint(
                                    'Change delivery address clicked');
                              },
                              child: const Text(
                                'Change',
                                style: TextStyle(
                                  color: kMainBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ================= ORDER ITEMS =================
                    // Section header showing the item count.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: const Text(
                            'Order Items',
                            style: TextStyle(
                              color: kDarkNavy,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Flexible(
                          child: const Text(
                            '3 items',
                            style: TextStyle(
                              color: kGray,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    CartItemCard(
                      name: 'Wireless Mouse',
                      price: 'PHP 450.00',
                      quantity: 1,
                      icon: Icons.mouse_outlined,
                    ),
                    const SizedBox(height: 12),
                    CartItemCard(
                      name: 'USB-C Hub',
                      price: 'PHP 850.00',
                      quantity: 1,
                      icon: Icons.usb,
                    ),
                    const SizedBox(height: 12),
                    CartItemCard(
                      name: 'Laptop Stand',
                      price: 'PHP 700.00',
                      quantity: 1,
                      icon: Icons.laptop_mac,
                    ),
                    const SizedBox(height: 24),

                    // ================= DISCOUNT BANNER =================
                    // Light-blue banner showing the applied student discount.
                    Container(
                      decoration: BoxDecoration(
                        color: kLightBlue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const Icon(Icons.local_offer_outlined,
                              color: kMainBlue, size: 24),
                          const SizedBox(width: 12),
                          Container(
                            height: 40,
                            width: 1,
                            color: kCardBorder,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'STUDENT10 applied',
                                  style: TextStyle(
                                    color: kDarkNavy,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '10% discount on items',
                                  style: TextStyle(
                                    color: kGray,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.check_circle,
                              color: kMainBlue, size: 24),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ================= PAYMENT SUMMARY =================
                    // Card showing the subtotal, discount, delivery fee, and total.
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: kCardBorder),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payment Summary',
                            style: TextStyle(
                              color: kDarkNavy,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _SummaryRow(
                            label: 'Subtotal',
                            amount: 'PHP 2,000.00',
                            isTotal: false,
                          ),
                          _SummaryRow(
                            label: 'Discount (10%)',
                            amount: '- PHP 200.00',
                            isTotal: false,
                          ),
                          _SummaryRow(
                            label: 'Delivery Fee',
                            amount: 'PHP 50.00',
                            isTotal: false,
                          ),
                          const SizedBox(height: 8),
                          const Divider(color: kCardBorder),
                          const SizedBox(height: 8),
                          _SummaryRow(
                            label: 'Total',
                            amount: 'PHP 1,850.00',
                            isTotal: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ================= PLACE ORDER BUTTON =================
                    // Full-width blue button to place the order.
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          debugPrint(
                              'Place order clicked! Total: PHP 1850.00');
                        },
                        icon: const Icon(Icons.lock, color: Colors.white),
                        label: const Text(
                          'Place Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kMainBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// A single row in the payment summary with a label and an amount.
// When isTotal is true, the text is bold and larger.
class _SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  const _SummaryRow({
    required this.label,
    required this.amount,
    required this.isTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                color: isTotal ? kDarkNavy : kGray,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                fontSize: isTotal ? 20 : 16,
              ),
            ),
          ),
          Flexible(
            child: Text(
              amount,
              style: TextStyle(
                color: isTotal ? kDarkNavy : kGray,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                fontSize: isTotal ? 20 : 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// A card representing one item in the shopping cart.
// Shows the product icon, name, price, quantity controls, and a delete button.
class CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kCardBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: product icon inside a light-blue box.
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(icon, size: 44, color: kDarkNavy),
            ),
          ),
          const SizedBox(width: 12),
          // Middle: product name, price, and quantity controls.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: kDarkNavy,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: kMainBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // Minus button.
                    InkWell(
                      onTap: () {
                        debugPrint('Decrease quantity: $name');
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          border: Border.all(color: kMainBlue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(Icons.remove, color: kMainBlue, size: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    // Quantity display.
                    Container(
                      width: 30,
                      height: 28,
                      decoration: BoxDecoration(
                        border: Border.all(color: kCardBorder),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          quantity.toString(),
                          style: const TextStyle(
                            color: kDarkNavy,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    // Plus button.
                    InkWell(
                      onTap: () {
                        debugPrint('Increase quantity: $name');
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          border: Border.all(color: kMainBlue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(Icons.add, color: kMainBlue, size: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Right: delete button aligned to the top.
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.delete_outline, color: kGray),
              onPressed: () {
                debugPrint('Remove item: $name');
              },
            ),
          ),
        ],
      ),
    );
  }
}

