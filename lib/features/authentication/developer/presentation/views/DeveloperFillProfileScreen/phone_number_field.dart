import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class PhoneNumberField extends StatefulWidget {
  final TextEditingController controller;

  const PhoneNumberField({super.key, required this.controller});

  @override
  PhoneNumberFieldState createState() => PhoneNumberFieldState();
}

class PhoneNumberFieldState extends State<PhoneNumberField> {
  Country selectedCountry = Country(
    phoneCode: "20",
    countryCode: "EG",
    e164Sc: 2,
    geographic: true,
    level: 1,
    name: "Egypt",
    example: "1001234567",
    displayName: "Egypt +20",
    displayNameNoCountryCode: "Egypt",
    e164Key: "20-EG-0",
  );

  String? errorMessage;

  String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required";
    } else if (value.length < 8 || value.length > 12) {
      return "Enter a valid phone number";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormField<String>(
          validator: validatePhoneNumber,
          builder: (FormFieldState<String> field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: field.hasError ? const Color(0xFF964233) : const Color(0xFFB0B8E3)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              setState(() {
                                selectedCountry = country;
                              });
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Text(selectedCountry.flagEmoji, style: const TextStyle(fontSize: 20)),
                            const SizedBox(width: 4),
                            const Icon(Icons.keyboard_arrow_down, color: Color(0xFFE6E6E6), size: 28),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text("(+${selectedCountry.phoneCode})", style: const TextStyle(color: Color(0xFFD3D3D3), fontSize: 16)),
                      Expanded(
                        child: TextFormField(
                          controller: widget.controller,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: " Phone number",
                            hintStyle: TextStyle(color: Color(0xFFD3D3D3)),
                          ),
                          onChanged: (value) {
                            field.didChange(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 100),
                  child: field.hasError
                      ? Padding(
                    padding: const EdgeInsets.only(top: 5, left: 14),
                    child: Text(
                      field.errorText!,
                      style: const TextStyle(color: Color(0xFF964233), fontSize: 12),
                    ),
                  )
                      : const SizedBox.shrink(),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
