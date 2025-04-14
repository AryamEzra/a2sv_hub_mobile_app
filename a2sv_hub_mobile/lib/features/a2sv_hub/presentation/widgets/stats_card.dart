import 'package:flutter/material.dart';

// --- Colors ---
const Color primaryGreen = Color(0xFF2ECC71);
const Color primaryYellow = Color(0xFFF1C40F);
const Color lightGrey = Color(0xFFE0E0E0);
const Color pageBackgroundColor = Color(0xFFF5F5F5);
const Color cardBorderColor = Color(0xFFDCDCDC);
const Color dividerColor = Color(0xFFBDBDBD);
const Color textColorRegular = Color(0xFF616161);
const Color textColorHeading = Color(0xFF212121);

// --- Spacing and Size Constants ---
const double kCardHorizontalPadding =
    24.0; // Increased horizontal padding inside card sections
const double kCardVerticalPadding =
    24.0; // Increased vertical padding inside card sections
const double kDividerVerticalSpacing =
    20.0; // Increased space above/below divider
const double kCircleTextBlockSpacing =
    65.0; // Increased space between circle and text
const double kMiniCircleSize = 70.0; // Slightly larger circle
const double kMiniCircleStrokeWidth = 8.0; // Slightly thicker stroke
const double kStatsSectionLeftIndent = 57.0; // left indent for stats section

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  // --- Static data ---
  final int solvedValue = 179;
  final int availableValue = 46;
  final int solvedPercent = 80;
  final int availablePercent = 20;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: pageBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: cardBorderColor, width: 1.0),
      ),
      // Remove the overall Padding widget here
      child: Column(
        // Main content is now a Column directly inside the Card
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Section 1 (Solved) with Padding
          Padding(
            padding: const EdgeInsets.only(
              top: kCardVerticalPadding,
              left: kCardHorizontalPadding,
              right: kCardHorizontalPadding,
            ),
            child: _buildStatsSection(
              context: context,
              percentage: solvedPercent,
              value: solvedValue,
              label: "Solved",
              progressColor: primaryGreen,
            ),
          ),

          // Space before Divider
          const SizedBox(height: kDividerVerticalSpacing),

          // Horizontal Divider (now spans full width of the Column)
          const Divider(
            color: dividerColor,
            thickness: 1.0,
            height: 1, // Minimal height for the divider itself
            // No need for indent/endIndent as it's edge-to-edge in the column
          ),

          // Space after Divider
          const SizedBox(height: kDividerVerticalSpacing),

          // Section 2 (Available) with Padding
          Padding(
            padding: const EdgeInsets.only(
              bottom: kCardVerticalPadding,
              left: kCardHorizontalPadding,
              right: kCardHorizontalPadding,
            ),
            child: _buildStatsSection(
              context: context,
              percentage: availablePercent,
              value: availableValue,
              label: "Available",
              progressColor: primaryYellow,
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget for each stats section (MODIFIED with left indent)
  Widget _buildStatsSection({
    required BuildContext context,
    required int percentage,
    required int value,
    required String label,
    required Color progressColor,
  }) {
    return Row(
      // Keep alignment to start
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Add fixed SizedBox for left indent
        const SizedBox(width: kStatsSectionLeftIndent), // <-- ADDED INDENT HERE
        // Mini Circular Progress
        _buildMiniCircularProgress(
          context: context,
          percentage: percentage,
          progressColor: progressColor,
        ),

        // Space between Circle and Text Block
        const SizedBox(
          width: kCircleTextBlockSpacing,
        ), // Space remains the same
        // Text Block
        _buildTextBlock(context: context, value: value, label: label),

        // Spacer still takes up remaining space on the right
        const Spacer(),
      ],
    );
  }

  // Helper Widget for the small circular progress indicator (MODIFIED size)
  Widget _buildMiniCircularProgress({
    required BuildContext context,
    required int percentage,
    required Color progressColor,
  }) {
    // Using constants defined above
    const double circleSize = kMiniCircleSize;
    const double strokeWidth = kMiniCircleStrokeWidth;
    final double progressValue = percentage / 100.0;

    return SizedBox(
      width: circleSize,
      height: circleSize,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Background Circle
          SizedBox.expand(
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: strokeWidth,
              backgroundColor: lightGrey,
              valueColor: const AlwaysStoppedAnimation<Color>(lightGrey),
            ),
          ),
          // Progress Arc
          SizedBox.expand(
            child: CircularProgressIndicator(
              value: progressValue,
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              backgroundColor: Colors.transparent,
              strokeCap: StrokeCap.round,
            ),
          ),
          // Percentage Text
          Text(
            "${percentage}%",
            // Adjust font size slightly if needed for the larger circle
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: textColorHeading,
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget for the text block (Value + Label) - No changes needed here
  Widget _buildTextBlock({
    required BuildContext context,
    required int value,
    required String label,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$value",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: textColorHeading,
          ),
        ),
        const SizedBox(height: 2.0),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: textColorRegular),
        ),
      ],
    );
  }
}
