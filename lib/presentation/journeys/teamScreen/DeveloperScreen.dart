import 'package:dsc_event/presentation/journeys/teamScreen/team_card.dart';
import 'package:dsc_event/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';

class DeveloperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Logo(
          height: 40,
        ),
        backgroundColor: Colors.grey.shade900,
        brightness: Brightness.dark,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          TeamCard(
            memberName: 'Sameer Saini',
            memberImage:
            "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/avatars/sameer_saini.jpg",
            memberPost: 'DSC Lead',
            memberInsta: 'sameesaini._',
            memberLinkedIn: 'sameer-aka-soyokaze',
            memberTwitter: 'Soyokaz3',
            memberGitHub: 'soyo-kaze',
            aboutMember: "working in a community is the best way to increase your skill set in a short amount of time and building one helps doing the same in exponential rate. That's why Developer Student Clubs was the best thing happened to me.",
            key: ValueKey("Sameer"),
          ),
          TeamCard(
            memberName: 'Vaibhav Vyas',
            memberImage:
                "https://media-exp1.licdn.com/dms/image/C4E03AQEbEV55HL2VYg/profile-displayphoto-shrink_400_400/0/1568396823163?e=1625097600&v=beta&t=xgSBgRqxbcbUbJuyNIvh7DWmPpvfjb2QxxykKIreao0",
            memberPost: 'Tech Lead',
            memberInsta: 'ge_nx',
            memberLinkedIn: 'vaibhav-vyas-b06103193',
            memberTwitter: 'genxthegamer',
            memberGitHub: 'GenxTheGamer',
            aboutMember: "",
            key: ValueKey("Vaibhav"),
          ),
          TeamCard(
            memberName: 'Mayank Gour',
            memberImage:
            "https://media-exp1.licdn.com/dms/image/C5603AQEOBoR_ifIiQg/profile-displayphoto-shrink_400_400/0/1589821673237?e=1625097600&v=beta&t=oV2gT1X8PEe1cSBA4MfCNqTxANzGfW8WmFMkT3_Z1AY",
            memberPost: 'DevOps/Cloud Geek',
            memberInsta: 'mykgod',
            memberLinkedIn: 'mynkg',
            memberTwitter: '_mynk_g',
            memberGitHub: 'mykg',
            aboutMember: "DevOps and Cloud geek, love to automate and integrate technologies. Visit my website on https://mynk.home.blog to see my work on respective fields.",
            key: ValueKey("Mayank"),
          ),
          TeamCard(
            memberName: 'Shekhar Aggarwal',
            memberImage:
            "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/avatars/shekhar_aggarwal.jpg",
            memberPost: 'App Dev Lead',
            memberInsta: 'theshekharaggarwal',
            memberLinkedIn: 'shekharaggarwal',
            memberTwitter: 'ShekharAggarw17',
            memberGitHub: 'shekharAggarwal',
            aboutMember: "It is always a matter of pride to work for the Developer Student Clubs. While working on the application i learnt to pick up the ropes and have tried to blend the individuality and creativity with the rich legacy of the Developer Student Clubs.",
            key: ValueKey("Shekhar"),
          ),
          TeamCard(
            memberName: 'Aniket Kumar Sinha',
            memberImage:
            "https://media-exp1.licdn.com/dms/image/C5603AQGvS__b3Sq1uw/profile-displayphoto-shrink_400_400/0/1602078170938?e=1625097600&v=beta&t=tYysWdFUkH57pnMYOcOPZisTQ8WiSemNnqAPBdchI-c",
            memberPost: 'Web Dev / UI/UX Designer Lead',
            memberInsta: 'aniketksinha',
            memberLinkedIn: 'aniketkumarsinha',
            memberTwitter: 'AniketKSinha',
            memberGitHub: 'aniket-sinha8',
            aboutMember: "Aniket Kumar Sinha: Developer, Content Creator and a community guy. As Matt Mullenweg said, \"Technology is best when it brings people together\", thus making people's present over the internet and trying to help fellow mates to grow in tech in unison.",
            key: ValueKey("Aniket"),
          ),
          TeamCard(
            memberName: 'Ramakrishna Chhipa',
            memberImage:
            "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/featured_attendees/My%20picture-1.jpg",
            memberPost: 'Python/ML Lead',
            memberInsta: 'ramakrishnachhipa_23',
            memberLinkedIn: 'ramakrishna-chhipa',
            memberTwitter: 'RamakrishnaChh4',
            memberGitHub: 'RKC3000',
            aboutMember: "I am a ML Enthusiast, a Front-end Web Developer, and a designer. I love to learn about new technologies.",
            key: ValueKey("Ramakrishna"),
          ),
          TeamCard(
            memberName: 'Anshika Gupta',
            memberImage:
            "https://media-exp1.licdn.com/dms/image/C4E03AQFWVvx_Z6Wq_w/profile-displayphoto-shrink_400_400/0/1609924685033?e=1625097600&v=beta&t=NhVX7iy_iOI_e-AHkRTIG5il9UoOTzqa0upF6WV9Qjo",
            memberPost: 'Web-Dev/ Social Media Handler',
            memberInsta: 'anshika_gupta777',
            memberLinkedIn: 'anshika-gupta-26a019191',
            memberTwitter: 'Anshika_77',
            memberGitHub: 'AG9760',
            aboutMember: "I'm Web Developer and Graphic Designer . I have an amazing experience in Designing and has worked in many events, fests and summits as the Graphic Designer.",
            key: ValueKey("Anshika"),
          ),
          TeamCard(
            memberName: 'Khushi Tulsiyan',
            memberImage:
            "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/avatars/khushi_tulsiyan.jpg",
            memberPost: 'Data Science / Chief Editor',
            memberInsta: 'satine_kryzee',
            memberLinkedIn: 'khushi-tulsiyan-3164b117a',
            memberTwitter: 'KhushiTulsiyan',
            memberGitHub: 'khushitulsiyan',
            aboutMember: "I'm a Data Science enthusiast who's currently working to make AI and ML her field. Quite confident and curious with and a lot of energy.",
            key: ValueKey("Khushi"),
          ),
        ],
      ),
    );
  }
}
