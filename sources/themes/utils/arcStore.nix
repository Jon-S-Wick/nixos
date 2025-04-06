{ pkgs }:

let
  mkGtk = import ./mkGtk.nix { inherit pkgs; };
  mkCursor = import ./mkCursor.nix { inherit pkgs; };
  mkIcon = import ./mkIcon.nix { inherit pkgs; };
  mkFont = import ./mkFont.nix { inherit pkgs; };

  sources = {

    gtk = {
      "Everforest-Dark" = {
        url = "https://github.com/Itz-Abhishek-Tiwari/AbyssGreen/raw/f7e4655f4923a3a4e556b3dab688a5fabadf7675/Source/arcs/Gtk_Everforest-Dark.tar.xz";
        hash = "sha256-P2cCgWHvhoGCeGJ9gOo6aSTfMFG9S9axWQNz2suX8ec=";
      };
      "Abyssal-Wave" = {
        url = "https://github.com/Itz-Abhishek-Tiwari/Abyssal-Wave/raw/1f6eff0eb85ed05ac2c402d9e608cc70a3bb16a0/Source/arcs/Gtk_Abyssal-Wave.tar.xz";
        hash = "sha256-Yq+YnyrUWKNR+cbz94xIK1CfnBlZjT3fmB0U87y6aOw=";
      };
      "Bad-Blood" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/162a40d67b07c7f7f63ac4262e2d007c21919aca/Source/Gtk_Bad-Blood.tar.gz";
        hash = "sha256-CWYOZVQjA9cavf8iptjot3EVrgEoyuXmL8T+boFpHAc=";
      };
      "Catppuccin-Latte" = {
        url = "https://github.com/rishav12s/Cat-Latte/raw/1ee66b25ce7e8251e1af0556a9a486832bbef14c/Source/arcs/Gtk_Catppuccin-Latte.tar.xz";
        hash = "sha256-NLrDv7oLzceqILkassGOyNSVAxIXWMIyBRV2/rM4j8I=";
      };
      "Catppuccin-Mocha" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/d2052a18ed6e1f9e6d70c3431d27bf94f42be628/Source/Gtk_CatppuccinMocha.tar.gz";
        hash = "sha256-DPSKSDxwxByj59nU5EUtb5APeGdLeJ+/61AqX21OylI=";
      };
      "Decay-Green" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/1287bb71b1519c8fdab2bba642a7b24ec8364b6c/Source/Gtk_DecayGreen.tar.gz";
        hash = "sha256-j+isQgrfSrfK9kbmkoEAU1obbqz9wcKxJpEKPZFFLic=";
      };
      "Dracula" = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/fc51f05927f2fe9d90393fdf2debc1afaf429df6/Source/arcs/Gtk_Dracula.tar.xz";
        hash = "sha256-iUgOFNw6tBtTbkSuehgp9tMbRr9Z+jRonZwXz1aqwPw=";
      };
      "Edge-Runner" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/a007d1b32cb98fa5eef4b0450fc5ba9bfc5c2545/Source/Gtk_EdgeRunner.tar.gz";
        hash = "sha256-zbhOXgd2cJmFDCh+KufhJ4KICUuafmVJAYMgROpNEUk=";
      };
      "Frosted-Glass" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/c6f5c5ca25c66741772b5c25582ab1ad8972ba49/Source/Gtk_FrostedGlass.tar.gz";
        hash = "sha256-VAQ8hYKVoBnb+o7SkFmwDTKe/lqZvRdvOjCgVJ9Sueg=";
      };
      "Graphite-Mono" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/20710b605787b54489bbb9881e2a011258c2956a/Source/Gtk_GraphiteMono.tar.gz";
        hash = "sha256-ImRaZSSH1X6rAqp/uI4dU5CnuapW7Duzhbs1qsdMcG8=";
      };
      "Greenify" = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/c7d369fb3cdac01572a8b21b077cd59b3379e878/Source/arcs/Gtk_Greenify.tar.gz";
        hash = "sha256-SBlWUXxTuA+b54VX0goSxrnNRDwQiCcGEHcOH1IEjms=";
      };
      "Gruvbox-Retro" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/11e0face8c74526fca5519f47cbe90458eef6cd1/Source/Gtk_GruvboxRetro.tar.gz";
        hash = "sha256-UfBtBpuVYG6TmXJKchCfhOs719PqKQM2EzUWEijnJwM=";
      };
      "Hackthebox" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/36fa09171cd1d14156086542df020369b9f8b8fa/Source/Gtk_Hack%20the%20Box.tar.gz";
        hash = "sha256-5Z/fnHfr8VnfPGQFaLJ4615dlBDCRbyGqwyauY5pOrU=";
      };
      "VALYRIAN-Blue-Steel" = {
        url = "https://github.com/saber-88/Ice-Age/raw/3f2fe81611ee036c4f0845454d05fbf263ac5c84/Source/arcs/Gtk_VALYRIAN-Blue-Steel.tar.gz";
        hash = "sha256-jK+3S/67vp8qPpwU4ZYyt+GczMCbGKf13unr73J8VvU=";
      };
      "Material-Sakura" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/76077f39ed496a4b84d38473b0419343734c323e/Source/Gtk_MaterialSakura.tar.gz";
        hash = "sha256-TMe+nBJQxu6pOg08o4tnBhSf1OdjBbH6R75ZkAR4g9M=";
      };
      "Monokai" = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/2c4ecf9e32753da36832d2aa9f32908a92caab15/Source/arcs/Gtk_Monokai.tar.gz";
        hash = "sha256-6BmaQh4NMAeiXF9C+l8YS7QrR6Nf/k8AK6P11VeD+WI=";
      };
      "WhiteSur-Dark" = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/256fe4ab744a3e4682b014250c472dcc38fca6d4/Source/arcs/Gtk_WhiteSur-Dark.tar.xz";
        hash = "sha256-Ux1WdD77rYuG6hsUd1jtTj6oykdlKq8UMKRtnjVmd3U=";
      };
      "Nordic-Blue" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/bbe3b5c7b10743bb2c274d51f5efce6e5f51d7e4/Source/Gtk_NordicBlue.tar.gz";
        hash = "sha256-Xnt2ZG111nCD00dTyBf6LictAdgAQeFJUVYpr9RMf1o=";
      };
      "One-Dark" = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/4109ebca756257b63f22b2b74a5597e1650f3434/Source/arcs/Gtk_One%20Dark.tar.xz";
        hash = "sha256-PXjSR+mIE9AjhfxDbi5OCDX9BuIqOq/qvMGeZafdai8=";
      };
      "Oxo-Carbon" = {
        url = "https://github.com/rishav12s/Oxo-Carbon/raw/91eff63b9ba2b0a2ad002661c3e7f327237e4d02/Source/arcs/Gtk_Oxo-Carbon.tar.gz";
        hash = "sha256-wFv92WxWNsfvXUrTSXhEddQ663RYnQ3VCi6evNgwJQI=";
      };
      "Sweet-Dark" = {
        url = "https://github.com/rishav12s/Paranoid-Sweet/raw/668f6a5a403416e5f50c1924ee5667bcccd2c1af/Source/arcs/Gtk_Sweet.tar.gz";
        hash = "sha256-TvrBf3ReCuUxAPlUlsIiGWkTbk+dy/WXp6Q+7sJWH7w=";
      };
      "Pixel-Dream" = {
        url = "https://github.com/rishav12s/Pixel-Dream/raw/c7765210fe3610742ccb955278f2f3a2ebe3f0d9/Source/arcs/Gtk_Pixel-Dream.tar.gz";
        hash = "sha256-/6G24jtxKkjeJiS4eMW9TFsuF5TafoiGHV4oChldgkc=";
      };
      "Rain-Dark" = {
        url = "https://github.com/rishav12s/Rain-Dark/raw/385d92ed53bc0190f7f8712eb541e6a703f6961f/Source/arcs/Gtk_Rain-Dark.tar.gz";
        hash = "sha256-2xLE/wmck51dUKby/beeueod6dtS9zm9a9JMM/8WnJo=";
      };
      "Red-Stone" = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/371030f2236f1713d084a4fc90b479fa821b0067/Source/arcs/Gtk_Red-Stone.tar.gz";
        hash = "sha256-gKZOzqmsn7Nq243ETJEsf8/X/rMTobVMvK2+ZWlAhWY=";
      };
      "Rose-Pine" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/b009a30d15c994fcbfa30f8a3fc5d1b0670d9653/Source/Gtk_RosePine.tar.gz";
        hash = "sha256-ckYU6apCV7zs2K0T6VcrJXayBrVYAPpDAblCNnE3/0Q=";
      };
      "Sci-fi" = {
        url = "https://github.com/KaranRaval123/Sci-fi/raw/52091e9658319a4d0da0bc19c57f55f3c1b539f0/Source/arcs/Gtk_Sci_fi.tar.gz";
        hash = "sha256-CeXAXj0EqP3YDIBezre9L7AeBgS1HtiW6e5vB+QGY0Y=";
      };
      "Solarized Dark" = {
        url = "https://github.com/rishav12s/Solarized-Dark/raw/0222e6a9efc5f1cbdffe263d7cc523efae659e6a/Source/arcs/Gtk_Solarized-Dark.tar.gz";
        hash = "sha256-WgKOxXFXH3JNERdvK6bkazRczlVjvm4BfiO4ZnjbYac=";
      };
      "Synth-Wave" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/61c389a0ba3c0858e000436a359385389cda7f44/Source/Gtk_SynthWave.tar.xz";
        hash = "sha256-1fGpp5G0AkShDxd9pK+mmQvGqtvFIhezWjD16bZizcs=";
      };
      "Tokyo-Night" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/da8c38b7a6927eb585203e28fb8e403203578fe5/Source/Gtk_TokyoNight.tar.gz";
        hash = "sha256-caflnEo9hNpjTAIsbnjoktz2Zaz2P02dcvdWNZ4l2s4=";
      };
      "Windows-11" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/ea30c190b526555c06b6c716d0c062f48a996897/Source/arcs/Gtk_Windows%2011.tar.xz";
        hash = "sha256-A9+724c8YsdS+5PMnTK1GkJqQvhpdf5Pj3x6UjVZ3Qc=";
      };
      "MacOS" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/1701be171600db27b04f8bf704dc37efe36cd282/Source/arcs/Gtk_Mac%20OS.tar.gz";
        hash = "sha256-BYqgleWmV5PaDcv+G8/IDGO7JxffHPxMANpMYBLgOtE=";
      };
      "Kripton" = {
        url = "https://github.com/cyb3rgh0u1/Crimson-Blade/raw/4b1afd9f62c4b64a7c35628c2e80fa632cb81735/Source/arcs/Gtk_Kripton.tar.gz";
        hash = "sha256-HuXJTwTVWhfIaLDsyhqGDGR6+cPxa2NoKUsSGUFqaGE=";
      };
      "Vanta-Black" = {
        url = "https://github.com/rishav12s/Vanta-Black/raw/e8ef0d6b8b1a13e7b471f3c803bb96bd46cb4837/Source/arcs/Gtk_Vanta-Black.tar.gz";
        hash = "sha256-g/rLPOu+ngPxNnHc5oO3w18Y1MFNRSx4T2Sfz4o5bFg=";
      };
    };

    icon = {
      "Gruvbox-Plus-Dark" = {
        url = "https://github.com/Itz-Abhishek-Tiwari/AbyssGreen/raw/93903b7d38bb2ab9e705016cc52cf62105d47dd7/Source/arcs/Icon_Gruvbox-Plus-Dark.tar.gz";
        hash = "sha256-sWL1G54qELp2bVhQ+qKjUcOvCRVTNniHvlCojKXAwvA=";
      };
      "Papirus-kanagawa" = {
        url = "https://github.com/Itz-Abhishek-Tiwari/Abyssal-Wave/raw/1f6eff0eb85ed05ac2c402d9e608cc70a3bb16a0/Source/arcs/Icon_Papirus-kanagawa.tar.xz";
        hash = "sha256-SqL0ZIo8qVbD/tmLBSTg8qnUuCp7pdEsiBA6VUBZC58=";
      };
      "besgnulinux-mono-red" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/162a40d67b07c7f7f63ac4262e2d007c21919aca/Source/Icon_Bad-Blood.tar.gz";
        hash = "sha256-keTsrfVU2AWL8XxWzihWs59QJ8a9iIRw7l0WjVi3zC4=";
      };
      "Papirus-Latte" = {
        url = "https://github.com/rishav12s/Cat-Latte/raw/1ee66b25ce7e8251e1af0556a9a486832bbef14c/Source/arcs/Icon_Papirus-Latte.tar.xz";
        hash = "sha256-CpqMVZrsz2qscMYQxD9H7pbdmjOTvtUhCf1mlbeCviw=";
      };
      "Papirus" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/36fa09171cd1d14156086542df020369b9f8b8fa/Source/Icon_Hack%20the%20Box.tar.gz";
        hash = "sha256-s6IIWMFDbDYE3+VidnKj/S8kYFs2Ny9RlwU2oRafKEY=";
      };
      "Tela-circle-grey" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/2b526598b76ae613d1de42fd3b089ba919ea6aec/Source/Icon_TelaGrey.tar.gz";
        hash = "sha256-3kr6Glwqw3lYXWr8LxPhDc+IcTQenh7wnML8CHi4J8w=";
      };
      "Tela-circle-dracula" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/d2052a18ed6e1f9e6d70c3431d27bf94f42be628/Source/Icon_TelaDracula.tar.gz";
        hash = "sha256-Fmh9ZqPicbgGCJiECAx0xaAsIEqus+RRtI5WNrJt1Zs=";
      };
      "Tela-circle-green" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/1287bb71b1519c8fdab2bba642a7b24ec8364b6c/Source/Icon_TelaGreen.tar.gz";
        hash = "sha256-nhCCdM+YoUif5kIkPy3DMCvGbv6eBvIPbVkxWfRYzOw=";
      };
      "Azure-Dark-Icons" = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/fc51f05927f2fe9d90393fdf2debc1afaf429df6/Source/arcs/Icon_Azure-Dark-Icons.tar.gz";
        hash = "sha256-rzuvk/II3UOGliTbwgMtsZ8yP3RnN/IrBAHB5EpBUzc=";
      };
      "Tela-circle-yellow" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/a007d1b32cb98fa5eef4b0450fc5ba9bfc5c2545/Source/Icon_TelaYellow.tar.gz";
        hash = "sha256-/XUzJ/29dsEWzhhCNC6B4OJW4ThAztl3tUxbxPEdQFE=";
      };
      "Tela-circle-blue" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/c6f5c5ca25c66741772b5c25582ab1ad8972ba49/Source/Icon_TelaBlue.tar.gz";
        hash = "sha256-O/yE9vkNVlksdlbgL9zCx3m/WCH0cYo81daGWgwrNLg=";
      };
      "Hackthebox" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/refs/heads/Hack-the-Box/Source/Cursor_Hack%20the%20Box.tar.gz";
        hash = "";
      };
      "Breeze-Noir-White-Blue" = {
        url = "https://github.com/saber-88/Ice-Age/raw/56564067e8bf74416eaaf68e8c6730e4c381c67a/Source/arcs/Icon_Breeze-Noir-White-Blue.tar.gz";
        hash = "sha256-Cq80TfKKqovZcg2XHCe2gwIl55vHXKH1m8Gr7t25koQ=";
      };
      "Tela-circle-black" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/76077f39ed496a4b84d38473b0419343734c323e/Source/Icon_TelaBlack.tar.gz";
        hash = "sha256-qKyPdDl8uZJmrAMaPU+p+TBtga/x7CodxBsYRevhOqU=";
      };
      "Monokai" = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/2c4ecf9e32753da36832d2aa9f32908a92caab15/Source/arcs/Icon_Monokai.tar.gz";
        hash = "sha256-SIJ1uI8AnPEIZew3MQAKF0+w7JhAGA5Ii2R0ncxLAqY=";
      };
      "WhiteSur" = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/256fe4ab744a3e4682b014250c472dcc38fca6d4/Source/arcs/Icon_WhiteSur.tar.xz";
        hash = "sha256-9hy9czOGSe8Wuc6aLPolieNJPitHNcTtbgRwiK1/Wds=";
      };
      "Nordzy" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/bbe3b5c7b10743bb2c274d51f5efce6e5f51d7e4/Source/Icon_NordicBlue.tar.gz";
        hash = "sha256-13l6VHacjA0d5px85ZbCPY7nREOPnxq5GjKVhuLgpF8=";
      };
      "One-Dark" = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/4109ebca756257b63f22b2b74a5597e1650f3434/Source/arcs/Icon_One%20Dark.tar.gz";
        hash = "sha256-ukTMd/zmT7jyMUhxeYGFoj0r4TCWraM15/Dne+tH9EA=";
      };
      "Tela-circle-pink" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/b009a30d15c994fcbfa30f8a3fc5d1b0670d9653/Source/Icon_TelaPink.tar.gz";
        hash = "sha256-J3zNzEioCB+hQ6EuT6BEk1KMRdWlwHz/kfDeUg/lEQQ=";
      };
      "candy-icons" = {
        url = "https://github.com/rishav12s/Paranoid-Sweet/raw/668f6a5a403416e5f50c1924ee5667bcccd2c1af/Source/arcs/Icon_Candy.tar.gz";
        hash = "sha256-NMH9hvF+of1tm6jGh9XJ1t2/XabUaxQGq7ubWEOntKo=";
      };
      "pixel-dream" = {
        url = "https://github.com/rishav12s/Pixel-Dream/raw/c7765210fe3610742ccb955278f2f3a2ebe3f0d9/Source/arcs/Icon_pixel-dream.tar.gz";
        hash = "sha256-3GP36vBoy/RP6KQrPcTitQogUP/Vu2GAyoDkzxJESNo=";
      };
      "Rain-Dark" = {
        url = "https://github.com/rishav12s/Rain-Dark/raw/385d92ed53bc0190f7f8712eb541e6a703f6961f/Source/arcs/Icon_Rain-Dark.tar.gz";
        hash = "sha256-Lygsa09km/Nxl7hHpEsi+NAGcKSeV7iWiHTqHXEYdeI=";
      };
      "Tela-circle-red" = {
        url = "https://github.com/mahaveergurjar/Theme-Gallery/raw/371030f2236f1713d084a4fc90b479fa821b0067/Source/arcs/Icon_Tela-circle-red.tar.gz";
        hash = "sha256-uVSK919x0+EAOxP3gESdta67yhS0mrMhPldC0gvaOho=";
      };
      "Tela-circle-hotred" = {
        url = "https://github.com/abenezerw/Scarlet-Night/raw/1c80ed42231de2afcda28e48793e395e3f0955d2/Source/arcs/Icon_Tela-circle-hotred.tar.gz";
        hash = "sha256-v0nj1uYRAhxvo7SW933WCIlPfbUphJOpPOnPpZU0BJg=";
      };
      "cyberpunk-technotronic-icon-theme" = {
        url = "https://github.com/KaranRaval123/Sci-fi/raw/52091e9658319a4d0da0bc19c57f55f3c1b539f0/Source/arcs/Icon_Cyberpunk.tar.gz";
        hash = "sha256-3GWLP2w66ISQWRwYSM5P6Hr01ytzwgNQLNAXMl6vJi4=";
      };
      "Tela-circle-solarized" = {
        url = "https://github.com/rishav12s/Solarized-Dark/raw/0222e6a9efc5f1cbdffe263d7cc523efae659e6a/Source/arcs/Icon_Tela-circle-solarized.tar.gz";
        hash = "sha256-5P7pZQmyD9KIiP8pO2Jvh5PzfNRXoPBMAe+h9RYHkbU=";
      };
      "BeautyLine" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/61c389a0ba3c0858e000436a359385389cda7f44/Source/Icon_SynthWave.tar.gz";
        hash = "sha256-ytlrVPfCyQmtvHvvmTPewEtRES7DhhW7zMIeiNOXuto=";
      };
      "Tela-circle-purple" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/da8c38b7a6927eb585203e28fb8e403203578fe5/Source/Icon_TelaPurple.tar.gz";
        hash = "sha256-ECRw0vx3sd5m0uS1zqLI7qGrolu5z6vcnJ/RXuLOMuM=";
      };
      "Windows-11" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/ea30c190b526555c06b6c716d0c062f48a996897/Source/arcs/Icon_Windows%2011.tar.gz";
        hash = "sha256-dHeTKQ2T0xPiLBy2pToTU6Z7hgf95OaZY21lY0WVcLU=";
      };
      "MacOS" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/1701be171600db27b04f8bf704dc37efe36cd282/Source/arcs/Icon_Mac%20OS.tar.xz";
        hash = "sha256-EJQxsNlXUDheK+tlTXBHpkBn1AHyIRCOHl4Mf90uG+U=";
      };
      "Colorful-Dark-Icons" = {
        url = "https://github.com/cyb3rgh0u1/Crimson-Blade/raw/4b1afd9f62c4b64a7c35628c2e80fa632cb81735/Source/arcs/Icon_Dark_Beam.tar.gz";
        hash = "sha256-og4r0bnEVCYTfz20hRp39jr7gudeuTtauo9hj2eRHCk=";
      };

    };

    cursor = {
      "Night-Diamond-Red" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/162a40d67b07c7f7f63ac4262e2d007c21919aca/Source/Cursor_Bad-Blood.tar.gz";
        hash = "sha256-238WKgGN2uUi4Yqf+CJD2IWiXhH94AyeNyicqgllWSM=";
      };
      "Bibata-Modern-Classic" = {
        url = "https://github.com/rishav12s/Cat-Latte/raw/1ee66b25ce7e8251e1af0556a9a486832bbef14c/Source/arcs/Cursor_Bibata-Modern-Classic.tar.xz";
        hash = "sha256-yJGqxgNJew5D+0dwtddqAwEi0ZTeLRQ5INTbMjZNn1s=";
      };
      "Dracula-cursors" = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/fc51f05927f2fe9d90393fdf2debc1afaf429df6/Source/arcs/Cursor_Dracula.tar.gz";
        hash = "sha256-8CMJEmkhg8XJZGwjKyXlLvvzeAUMuNqIgE6vLWqVyOs=";
      };
      "Gruvbox-Retro" = {
        url = "https://github.com/prasanthrangan/hyde-themes/raw/11e0face8c74526fca5519f47cbe90458eef6cd1/Source/Cursor_Gruvbox.tar.gz";
        hash = "sha256-ER72v4cFhzO0N2ZYWOsK4kBp6DOe21/mklpDxhqUE7k=";
      };
      "HackCursor" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/36fa09171cd1d14156086542df020369b9f8b8fa/Source/Cursor_Hack%20the%20Box.tar.gz";
        hash = "sha256-kMHmuhk72IYCKbv6dIQk7ECEJV0h6zns3G3FjE8w5L0=";
      };
      "Bibata-Modern-Ice" = {
        url = "https://github.com/prasanthrangan/hyprdots/raw/refs/heads/main/Source/arcs/Cursor_BibataIce.tar.gz";
        hash = "sha256-1stJ6CoRrfxa4W1op0x36KvqlTaxB55lvV7EUJB/Jeo=";
      };
      "macOS-Black" = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/256fe4ab744a3e4682b014250c472dcc38fca6d4/Source/arcs/Cursor_macOS-Black.tar.xz";
        hash = "sha256-nk94mTFX0TTLgEnx7/clLgSxwBK9g4HUy2Vj2tL9i0U=";
      };
      "onedark-cursor" = {
        url = "https://github.com/RAprogramm/HyDe-Themes/raw/4109ebca756257b63f22b2b74a5597e1650f3434/Source/arcs/Cursor_One%20Dark.tar.gz";
        hash = "sha256-nclZMZWrXJMF09fZ824zjN8s2O/sPV8SbTM5M815rro=";
      };
      "Capitaine-Cursors" = {
        url = "https://github.com/rishav12s/Oxo-Carbon/raw/91eff63b9ba2b0a2ad002661c3e7f327237e4d02/Source/arcs/Cursor_Capitaine-Cursors.tar.xz";
        hash = "sha256-+0D+Kjl2tQq2ASL/uyPgYQfINVs69zb91blcp4KLawo=";
      };
      "Sweet-cursors" = {
        url = "https://github.com/rishav12s/Paranoid-Sweet/raw/668f6a5a403416e5f50c1924ee5667bcccd2c1af/Source/arcs/Cursor_Sweet.tar.gz";
        hash = "sha256-eHTwva4ohV65PReJF5P5Hm+suATDbLk51w43R79kqhg=";
      };
      "pixel-dream-cursor" = {
        url = "https://github.com/rishav12s/Pixel-Dream/raw/c7765210fe3610742ccb955278f2f3a2ebe3f0d9/Source/arcs/Cursor_pixel-dream-cursor.tar.gz";
        hash = "sha256-rSeu789ginRkw75cGLQ3YtweEtfraW2KSKADIiMg9LE=";
      };
      "Capitaine-Cursors-Tokyonight" = {
        url = "https://github.com/rishav12s/Rain-Dark/raw/385d92ed53bc0190f7f8712eb541e6a703f6961f/Source/arcs/Cursor_Capitaine-Cursors-Tokyonight.tar.xz";
        hash = "sha256-d3byEET0i55vqmx0YykHetkC1V2Xvkr9lbPR2e1h9vQ=";
      };
      "Capitaine-Cursors-White" = {
        url = "https://github.com/rishav12s/Solarized-Dark/raw/0222e6a9efc5f1cbdffe263d7cc523efae659e6a/Source/arcs/Cursor_Capitaine-Cursors-White.tar.xz";
        hash = "sha256-1bqJDSNyGK3vGQxAwEfxp34JvjPxw4rDhUM4TN8Pb+U=";
      };
      "Cursor-Windows" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/ea30c190b526555c06b6c716d0c062f48a996897/Source/arcs/Cursor_Windows%2011.tar.gz";
        hash = "sha256-Rx7Vs9MR0VL0H912FF2Y8Vn80psb9afW/1BF4nHbpvA=";
      };
      "MacOS-Cursor" = {
        url = "https://github.com/HyDE-Project/hyde-gallery/raw/1701be171600db27b04f8bf704dc37efe36cd282/Source/arcs/Cursor_Mac%20OS.tar.gz";
        hash = "sha256-ZzzDgT8Zf7QDaZmIodTOBoU0/rW3efn6khRHhZkRwEU=";
      };
    };
    font = {
      "SF" = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/refs/heads/main/Source/arcs/Font_SF%20Pro%20Rounded%20Regular%2010.5.tar.xz";
        hash = "sha256-evawP8zNSYqGat/DjjuE2qT45/7cCsJdPK7lUSFhBjs=";
      };
      "Monocraft Nerd Font Book" = {
        url = "https://github.com/rishav12s/Pixel-Dream/raw/c7765210fe3610742ccb955278f2f3a2ebe3f0d9/Source/arcs/Font_Monocraft-Nerd-Font-Book.tar.gz";
        hash = "sha256-XtyZvuDoToBRSz97vyShVrDr7y6QmjiKanDbZbVO7zI=";
      };
      "Future-cyan-cursors" = {
        url = "https://github.com/cyb3rgh0u1/Crimson-Blade/raw/4b1afd9f62c4b64a7c35628c2e80fa632cb81735/Source/arcs/Cursor_future-cyan.tar.gz";
        hash = "";
      };
      "SF Pro Rounded Regular 10.5" = {
        url = "https://github.com/rishav12s/Monterey-Frost/raw/256fe4ab744a3e4682b014250c472dcc38fca6d4/Source/arcs/Font_SF%20Pro%20Rounded%20Regular%2010.5.tar.xz";
        hash = "";
      };
    };
  };

  # Create the final sets using the sources
  gtk = builtins.mapAttrs (
    name: src:
    mkGtk {
      inherit (src) url hash;
      gtkName = name;
    }
  ) sources.gtk;
  icon = builtins.mapAttrs (
    name: src:
    mkIcon {
      inherit (src) url hash;
      iconName = name;
    }
  ) sources.icon;
  cursor = builtins.mapAttrs (
    name: src:
    mkCursor {
      inherit (src) url hash;
      cursorName = name;
    }
  ) sources.cursor;
  font = builtins.mapAttrs (
    name: src:
    mkFont {
      inherit (src) url hash;
      fontName = name;
    }
  ) sources.font;

in
{
  inherit
    gtk
    icon
    cursor
    font
    ;
}
