import 'package:flutter/material.dart';

// --- Colors ---
const Color primaryGreen = Color(0xFF2ECC71);
const Color lightGreen = Color.fromARGB(255, 108, 215, 151);
const Color lightGrey = Color(0xFFE0E0E0); // Used for progress background
const Color pageBackgroundColor = Color(
  0xFFF5F5F5,
); // Assuming Colors.grey[100] -> Use same as Scaffold bg
const Color cardBorderColor = Color(
  0xFFDCDCDC,
); // Slightly darker grey for border (e.g., grey[300])
const Color darkGrey = Color(0xFF616161);

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  // --- Static values ---
  final int progressValue = 47;
  final int totalProblems = 225;
  final int solvedProblems = 179;
  final int availableProblems = 46;

  @override
  Widget build(BuildContext context) {
    final double progressPercent = (solvedProblems / totalProblems).clamp(
      0.0,
      1.0,
    );

    return Card(
      // --- Card Style Modifications ---
      elevation: 0, // Remove elevation if using border and matching background
      color: pageBackgroundColor, // Match page background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        // Add border side
        side: BorderSide(color: cardBorderColor, width: 1.0),
      ),
      // --- End Card Style Modifications ---
      child: Padding(
        padding: const EdgeInsets.all(25.0), // Keep internal padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Top Row - Alignment is already correct
            _buildTopRow(context),
            const SizedBox(height: 24.0),

            // Middle Circular Progress
            _buildCircularProgress(context, progressPercent),
            const SizedBox(height: 24.0),

            // Solved/Available Rows (Indicator changed)
            _buildStatusRow(
              context: context,
              color: primaryGreen,
              label: "Solved",
              count: solvedProblems,
            ),
            const SizedBox(height: 8.0),
            _buildStatusRow(
              context: context,
              color:
                  lightGrey, // Use light grey for available indicator dot background
              label: "Available",
              count: availableProblems,
            ),
            const SizedBox(height: 24.0),

            // Bottom Buttons
            _buildBottomButtons(context),
          ],
        ),
      ),
    );
  }

  // Helper method for the top row (No changes needed for alignment)
  Widget _buildTopRow(BuildContext context) {
    const double iconButtonSize = 20.0;
    const BoxConstraints iconButtonConstraints = BoxConstraints(
      minWidth: 30,
      minHeight: 30,
    );

    return Row(
      children: <Widget>[
        Text(
          "Progress",
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(), // This ensures left/right alignment
        IconButton(
          icon: const Icon(Icons.arrow_upward_rounded),
          iconSize: iconButtonSize,
          color: darkGrey,
          constraints: iconButtonConstraints,
          padding: EdgeInsets.zero,
          onPressed: () {
            print("Up arrow pressed");
          },
          tooltip: 'Increase Progress',
        ),
        Text(
          "$progressValue",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_downward_rounded),
          iconSize: iconButtonSize,
          color: darkGrey,
          constraints: iconButtonConstraints,
          padding: EdgeInsets.zero,
          onPressed: () {
            print("Down arrow pressed");
          },
          tooltip: 'Decrease Progress',
        ),
        // const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.chat_bubble),
          iconSize: iconButtonSize,
          color: darkGrey,
          constraints: iconButtonConstraints,
          padding: EdgeInsets.zero,
          onPressed: () {
            print("Comment button pressed");
          },
          tooltip: 'View Comments',
        ),
      ],
    );
  }

  // --- _buildCircularProgress method remains the same ---
  Widget _buildCircularProgress(BuildContext context, double progressPercent) {
    const double circleSize = 180.0;
    const double strokeWidth = 15.0;

    return SizedBox(
      width: circleSize,
      height: circleSize,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            // Background
            width: circleSize,
            height: circleSize,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: strokeWidth,
              backgroundColor: lightGrey,
              valueColor: AlwaysStoppedAnimation<Color>(lightGrey),
            ),
          ),
          SizedBox(
            // Foreground
            width: circleSize,
            height: circleSize,
            child: CircularProgressIndicator(
              value: progressPercent,
              strokeWidth: strokeWidth,
              valueColor: const AlwaysStoppedAnimation<Color>(primaryGreen),
              backgroundColor: Colors.transparent,
              strokeCap: StrokeCap.round,
            ),
          ),
          Column(
            // Text
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Problems",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 4),
              Text(
                "$totalProblems",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method for the Solved/Available rows (MODIFIED)
  Widget _buildStatusRow({
    required BuildContext context,
    required Color color,
    required String label,
    required int count,
  }) {
    return Row(
      children: <Widget>[
        // Changed from Circle to Square
        Container(
          width: 12, // Size of the square
          height: 12, // Size of the square
          decoration: BoxDecoration(
            color: color,
            // Remove shape property to make it default rectangle/square
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(
              2.0,
            ), // Optional: slightly rounded corners for the square
          ),
        ),
        // End of change
        const SizedBox(width: 8),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const Spacer(),
        Text(
          "$count Problems",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // --- _buildBottomButtons method remains the same ---
  Widget _buildBottomButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            // This borderRadius should match the button's shape
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                // Choose your light green color and opacity
                color: Colors.greenAccent.withOpacity(
                  0.6,
                ), // Adjust color and opacity as needed
                // Offset: dx=0 (no horizontal shift), dy=positive (shifts shadow down)
                offset: const Offset(
                  0,
                  5,
                ), // Adjust the vertical offset (dy) for shadow distance
                // BlurRadius: Controls the softness of the shadow
                blurRadius: 8.0, // Adjust for desired blurriness
                // SpreadRadius: Positive value expands the shadow, negative shrinks it.
                // A small positive value or 0 usually works well.
                spreadRadius: 1.0, // Adjust how much the shadow spreads out
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryGreen,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              // Set elevation to 0 to remove the default button shadow
              elevation: 0,
              // You might also want to explicitly set shadowColor to transparent
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              print("Exercise button pressed");
            },
            child: const Text("Exercise"),
          ),
        ),
        const SizedBox(height: 16.0),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: lightGreen,
            side: const BorderSide(color: lightGreen, width: 1.5),
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            print("Problems button pressed");
          },
          child: const Text("Problems"),
        ),
      ],
    );
  }
}
