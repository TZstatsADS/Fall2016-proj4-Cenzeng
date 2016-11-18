# Project: Words 4 Music

### [Project Description](doc/Project4_desc.md)

![image](http://cdn.newsapi.com.au/image/v1/f7131c018870330120dbe4b73bb7695c?width=650)

Term: Fall 2016

+ [Data link](https://courseworks2.columbia.edu/courses/11849/files/folder/Project_Files?preview=763391)-(**courseworks login required**)
+ [Data description](doc/readme.html)
+ Contributor's name:
  Cen Zeng
+ Projec title: Lyric Recommendation According to Music
+ Project summary: 
  In this project, we'll predict or recommend lyric distribution for songs by analysis of their sound. We basically extract 45 variables as our feature to represent sound of one song. These variables includes mean, standard deviation and IQR of bars_start, bars_confidence, beats_start, beats_confidence and so on. And our analysis is based on the assumption that the sound of a song can be represented by these 45 variables. Our idea is that musics with similar sound tend to share similar lyrics. So in our project, for each song we are going to predict, we'll find 500 other songs from the train set which are most similar to the object, and use these 500 songs to predict the distribution of lyrics.
	
Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
