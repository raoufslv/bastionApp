import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:bastonapp/screens/video_guide.dart';

List<ImageDetails> _imageDetails = [
  ImageDetails(
      imagePath: 'assets/images/gallery/bastion_1.jpg',
      title: 'Bastion 23',
      description:
          'Construit au XVIe siècle, le Palais des Rais est un joyau historique situé au cœur de la Casbah dAlger.'),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_2.jpg',
    title: 'Bastion 23',
    description:
        'Explorez un mélange de styles architecturaux ottomans, mauresques et andalous dans ce palais unique.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_3.jpg',
    title: 'Bastion 23',
    description:
        'Situé de manière stratégique, le palais a servi à la fois de résidence pour les gouverneurs ottomans et de forteresse militaire redoutable.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_4.jpg',
    title: 'Bastion 23',
    description:
        'Promenez-vous à travers des cours et des jardins captivants, offrant une évasion sereine au sein du complexe.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_5.jpg',
    title: 'Bastion 23',
    description:
        'Du statut de résidence à ses origines, le palais sest transformé au fil des ans, sadaptant à différentes périodes historiques.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_6.jpg',
    title: 'Bastion 23',
    description:
        'Plongez dans lhistoire - le Palais des Rais sert désormais de musée, abritant des artefacts qui racontent lhistoire dAlger.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_7.jpg',
    title: 'Bastion 23',
    description:
        'Émerveillez-vous devant les éléments architecturaux islamiques exquis, y compris une superbe mosquée au sein du complexe.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_8.jpg',
    title: 'Bastion 23',
    description:
        'Profitez de vues panoramiques à couper le souffle sur Alger et la mer Méditerranée depuis lemplacement surélevé.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_9.jpg',
    title: 'Bastion 23',
    description:
        'Appréciez lélégance des efforts de restauration, préservant la beauté authentique de ce site culturel.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_10.jpg',
    title: 'Bastion 23',
    description:
        'Admirez les décorations de plafond complexes et les détails artistiques qui ornent lintérieur du palais.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_11.jpg',
    title: 'Bastion 23',
    description:
        'Plus quun simple palais, le complexe accueille des événements culturels, des expositions et des activités, contribuant à la scène artistique locale.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_12.jpg',
    title: 'Bastion 23',
    description:
        'Découvrez lhistoire à travers des inscriptions en calligraphie arabe qui donnent du contexte dans tout le complexe.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_13.jpg',
    title: 'Bastion 23',
    description:
        'Ouvert au public, le Palais des Rais accueille aussi bien les habitants que les touristes pour explorer sa riche histoire.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_14.jpg',
    title: 'Bastion 23',
    description:
        'Témoin dévénements historiques majeurs, le palais a traversé les époques, reflétant lhistoire mouvementée de la région.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_15.jpg',
    title: 'Bastion 23',
    description:
        'Le complexe a été le théâtre de négociations diplomatiques et de décisions politiques cruciales au fil des siècles.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_16.jpg',
    title: 'Bastion 23',
    description:
        'Pendant la période ottomane, le palais était le centre du pouvoir et de ladministration de la régence dAlger.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_17.jpg',
    title: 'Bastion 23',
    description:
        'Les murs du palais ont résisté à des sièges et des batailles, témoignant de son rôle stratégique dans la défense de la ville.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_18.jpg',
    title: 'Bastion 23',
    description:
        'Des personnalités historiques ont séjourné dans le palais, laissant une empreinte indélébile sur son histoire.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_19.jpg',
    title: 'Bastion 23',
    description:
        'Les expositions du musée mettent en lumière des artefacts datant de différentes époques, offrant un voyage à travers le temps.',
  ),
  ImageDetails(
    imagePath: 'assets/images/gallery/bastion_20.jpg',
    title: 'Bastion 23',
    description:
        'La restauration minutieuse du palais a été entreprise pour préserver son caractère authentique et son importance historique.',
  ),
];

final List<String> videoUrls = [
  'https://www.youtube.com/watch?v=wCE899Bl7R0',
  'https://www.youtube.com/watch?v=-OBa3p9QYP8',
  'https://www.youtube.com/watch?v=ReVXPDx1Huo',
  'https://www.youtube.com/watch?v=zL9NzH5zKSE&pp=ygUQYmFzdGlvbiAyMyBhbGdlcg%3D%3D',
  'https://www.youtube.com/watch?v=S9PYgVGDkOc&pp=ygUQYmFzdGlvbiAyMyBhbGdlcg%3D%3D'
  // Add more YouTube video URLs as needed
];

final List<String> placeholderImageUrls = [
  'http://i3.ytimg.com/vi/wCE899Bl7R0/hqdefault.jpg',
  'http://i3.ytimg.com/vi/-OBa3p9QYP8/hqdefault.jpg',
  'http://i3.ytimg.com/vi/ReVXPDx1Huo/hqdefault.jpg',
  'https://img.youtube.com/vi/zL9NzH5zKSE/sddefault.jpg',
  'https://img.youtube.com/vi/S9PYgVGDkOc/sddefault.jpg'
];

final List<String> videoTitles = [
  'قصر رياس البحر|Bastion 23, Alger, 🇩🇿 ',
  'Algiers The Palace of The Raïs Bastion 23 (2nd Part',
  'جولة في قصر رؤساء البحر حصن 23 القصبة الجزائر العاصمة ',
  'VIDÉO. Visite guidée du Bastion 23 à Alger',
  'Ce qu' 'il faut savoir sur le Palais des raïs-Bastion 23 à Alger'
];

class ImageDetails {
  final String imagePath;
  final String title;
  final String description;

  ImageDetails({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

class CombinedGallery extends StatefulWidget {
  const CombinedGallery({Key? key}) : super(key: key);

  @override
  _CombinedGalleryState createState() => _CombinedGalleryState();
}

class _CombinedGalleryState extends State<CombinedGallery> {
  late AudioPlayer audioPlayer;
  bool isPlaying = true;
  bool isMuted = false;
  bool isImageSection = true;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    playMusic();
  }

  Future<void> playMusic() async {
    try {
      await audioPlayer.setAsset('assets/sounds/yarayah.mp3');
      audioPlayer.playerStateStream.listen((playerState) {
        if (playerState.processingState == ProcessingState.completed) {
          audioPlayer.seek(Duration.zero);
          audioPlayer.play();
        }
      });
      await audioPlayer.play();
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      setState(() {
        isPlaying = false;
      });
    }
  }

  Future<void> toggleMute() async {
    if (isMuted) {
      await audioPlayer.setVolume(1.0);
    } else {
      await audioPlayer.setVolume(0.0);
    }
    setState(() {
      isMuted = !isMuted;
    });
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Expanded(
            child: IconButton(
              onPressed: () {
                audioPlayer.play();
                setState(() {
                  isImageSection = true;
                });
              },
              icon: const Icon(Icons.image),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                audioPlayer.stop();
                setState(() {
                  isImageSection = false;
                });
              },
              icon: const Icon(Icons.video_library),
            ),
          ),
        ],
      ),
      body: isImageSection ? _buildImageGallery() : _buildVideoGallery(),
      floatingActionButton: isImageSection
          ? FloatingActionButton(
              onPressed: toggleMute,
              backgroundColor: Colors.white,
              child: isMuted
                  ? const Icon(Icons.volume_off, color: Colors.brown)
                  : const Icon(Icons.volume_up, color: Colors.brown),
            )
          : null,
    );
  }

  Widget _buildImageGallery() {
    return GridView.builder(
      itemCount: _imageDetails.length,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _showImageDetails(context, _imageDetails[index]);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(_imageDetails[index].imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      // Implement your image gallery builder here
    );
  }

  void _showImageDetails(BuildContext context, ImageDetails imageDetails) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: _calculateDialogHeight(context, imageDetails.description),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9, // Adjust aspect ratio as needed
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      imageDetails.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  imageDetails.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      child: Text(
                        imageDetails.description,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  double _calculateDialogHeight(BuildContext context, String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 16),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 100,
    )..layout(maxWidth: MediaQuery.of(context).size.width - 40);

    final textHeight = textPainter.size.height;
    final screenHeight = MediaQuery.of(context).size.height;

    return textHeight + screenHeight * 0.33;
  }

  Widget _buildVideoGallery() {
    return VideoGridActivity(
      videoTitles: videoTitles,
      videoUrls: videoUrls,
      placeholderImageUrls: placeholderImageUrls,
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CombinedGallery(),
  ));
}
