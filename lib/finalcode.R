library(rhdf5)
setwd("~/Desktop/project_4")
name <- read.table("project4_data/common_id.txt")
lyr <- lyr[,-c(2:3,6:30)]

trainNum <- 2350
trainset <- sort(sample(2350,trainNum))
train.feature <- matrix(0, nrow = trainNum, ncol = 45)
## train part
for(i in 1:trainNum)
{
  print(i)
  filename <- sprintf("project4_data/data/%s/%s/%s/%s.h5",
                      substr(name[trainset[i],],3,3),
                      substr(name[trainset[i],],4,4),
                      substr(name[trainset[i],],5,5),
                      name[trainset[i],])
  sound <- h5read(filename, "/analysis")
  
  feature <- rep(0,45)
  ## bar start 1
  feature[1:3] <- c(
    mean(sound$bars_start[-1]-sound$bars_start[-length(sound$bars_start)]),
    sd(sound$bars_start[-1]-sound$bars_start[-length(sound$bars_start)]),
    IQR(sound$bars_start[-1]-sound$bars_start[-length(sound$bars_start)])
  )
  
  ## bar confidence 2
  feature[4:6] <- c(
    mean(sound$bars_confidence),
    sd(sound$bars_confidence),
    IQR(sound$bars_confidence)
  )
  
  ## beat start 3
  feature[7:9] <- c(
    mean(sound$beats_start[-1]-sound$beats_start[-length(sound$beats_start)]),
    sd(sound$beats_start[-1]-sound$beats_start[-length(sound$beats_start)]),
    IQR(sound$beats_start[-1]-sound$beats_start[-length(sound$beats_start)])
  )
  
  ## beat confident 4
  feature[10:12] <- c(
    mean(sound$beats_confidence),
    sd(sound$beats_confidence),
    IQR(sound$beats_confidence)
  )
  
  ## section start 5
  feature[13:15] <- c(
    mean(sound$sections_start[-1]-sound$sections_start[-length(sound$sections_start)]),
    sd(sound$sections_start[-1]-sound$sections_start[-length(sound$sections_start)]),
    IQR(sound$sections_start[-1]-sound$sections_start[-length(sound$sections_start)])
  )
  
  ## section confident 6
  feature[16:18] <- c(
    mean(sound$sections_confidence),
    sd(sound$sections_confidence),
    IQR(sound$sections_confidence)
  )
  
  ## tatum start 7
  feature[19:21] <- c(
    mean(sound$tatums_start[-1]-sound$tatums_start[-length(sound$tatums_start)]),
    sd(sound$tatums_start[-1]-sound$tatums_start[-length(sound$tatums_start)]),
    IQR(sound$tatums_start[-1]-sound$tatums_start[-length(sound$tatums_start)])
  )
  
  ## tatum confident 8
  feature[22:24] <- c(
    mean(sound$tatums_confidence),
    sd(sound$tatums_confidence),
    IQR(sound$tatums_confidence)
  )
  
  ## segments start 9
  feature[25:27] <- c(
    mean(sound$segments_start[-1]-sound$segments_start[-length(sound$segments_start)]),
    sd(sound$segments_start[-1]-sound$segments_start[-length(sound$segments_start)]),
    IQR(sound$segments_start[-1]-sound$segments_start[-length(sound$segments_start)])
  )
  
  ## segments confident 10
  feature[28:30] <- c(
    mean(sound$segments_confidence),
    sd(sound$segments_confidence),
    IQR(sound$segments_confidence)
  )
  
  ## segments_loudness_max 11
  feature[31:33] <- c(
    mean(sound$segments_loudness_max),
    sd(sound$segments_loudness_max),
    IQR(sound$segments_loudness_max)
  )
  
  ## segments_loudness_max_time 12
  feature[34:36] <- c(
    mean(sound$segments_loudness_max_time),
    sd(sound$segments_loudness_max_time),
    IQR(sound$segments_loudness_max_time)
  )
  
  ## segments_loudness_start 13
  feature[37:39] <- c(
    mean(sound$segments_loudness_start),
    sd(sound$segments_loudness_start),
    IQR(sound$segments_loudness_start)
  )
  
  ## segments_pitches 14
  feature[40:42] <- c(
    mean(sound$segments_pitches),
    sd(sound$segments_pitches),
    IQR(sound$segments_pitches)
  )
  
  ## segments_timbre 15
  feature[43:45] <- c(
    mean(sound$segments_timbre),
    sd(sound$segments_timbre),
    IQR(sound$segments_timbre)
  )
  
  ## set up feature matrix
  train.feature[i,] <- feature
}

trainset <- trainset[-unique(which(is.na(train.feature),arr.ind = T)[,1])]
trainNum <- length(trainset)
train.feature <- na.omit(train.feature)






##############  Test Part ###############

testNum <- 100
test.feature <- matrix(0, nrow = testNum, ncol = 45)
## train part
for(i in 1:testNum)
{
  print(i)
  filename <- sprintf("~/Desktop/TestSongFile100/testsong%s.h5",i)
  sound <- h5read(filename, "/analysis")
  
  feature <- rep(0,45)
  ## bar start 1
  feature[1:3] <- c(
    mean(sound$bars_start[-1]-sound$bars_start[-length(sound$bars_start)]),
    sd(sound$bars_start[-1]-sound$bars_start[-length(sound$bars_start)]),
    IQR(sound$bars_start[-1]-sound$bars_start[-length(sound$bars_start)])
  )
  
  ## bar confidence 2
  feature[4:6] <- c(
    mean(sound$bars_confidence),
    sd(sound$bars_confidence),
    IQR(sound$bars_confidence)
  )
  
  ## beat start 3
  feature[7:9] <- c(
    mean(sound$beats_start[-1]-sound$beats_start[-length(sound$beats_start)]),
    sd(sound$beats_start[-1]-sound$beats_start[-length(sound$beats_start)]),
    IQR(sound$beats_start[-1]-sound$beats_start[-length(sound$beats_start)])
  )
  
  ## beat confident 4
  feature[10:12] <- c(
    mean(sound$beats_confidence),
    sd(sound$beats_confidence),
    IQR(sound$beats_confidence)
  )
  
  ## section start 5
  feature[13:15] <- c(
    mean(sound$sections_start[-1]-sound$sections_start[-length(sound$sections_start)]),
    sd(sound$sections_start[-1]-sound$sections_start[-length(sound$sections_start)]),
    IQR(sound$sections_start[-1]-sound$sections_start[-length(sound$sections_start)])
  )
  
  ## section confident 6
  feature[16:18] <- c(
    mean(sound$sections_confidence),
    sd(sound$sections_confidence),
    IQR(sound$sections_confidence)
  )
  
  ## tatum start 7
  feature[19:21] <- c(
    mean(sound$tatums_start[-1]-sound$tatums_start[-length(sound$tatums_start)]),
    sd(sound$tatums_start[-1]-sound$tatums_start[-length(sound$tatums_start)]),
    IQR(sound$tatums_start[-1]-sound$tatums_start[-length(sound$tatums_start)])
  )
  
  ## tatum confident 8
  feature[22:24] <- c(
    mean(sound$tatums_confidence),
    sd(sound$tatums_confidence),
    IQR(sound$tatums_confidence)
  )
  
  ## segments start 9
  feature[25:27] <- c(
    mean(sound$segments_start[-1]-sound$segments_start[-length(sound$segments_start)]),
    sd(sound$segments_start[-1]-sound$segments_start[-length(sound$segments_start)]),
    IQR(sound$segments_start[-1]-sound$segments_start[-length(sound$segments_start)])
  )
  
  ## segments confident 10
  feature[28:30] <- c(
    mean(sound$segments_confidence),
    sd(sound$segments_confidence),
    IQR(sound$segments_confidence)
  )
  
  ## segments_loudness_max 11
  feature[31:33] <- c(
    mean(sound$segments_loudness_max),
    sd(sound$segments_loudness_max),
    IQR(sound$segments_loudness_max)
  )
  
  ## segments_loudness_max_time 12
  feature[34:36] <- c(
    mean(sound$segments_loudness_max_time),
    sd(sound$segments_loudness_max_time),
    IQR(sound$segments_loudness_max_time)
  )
  
  ## segments_loudness_start 13
  feature[37:39] <- c(
    mean(sound$segments_loudness_start),
    sd(sound$segments_loudness_start),
    IQR(sound$segments_loudness_start)
  )
  
  ## segments_pitches 14
  feature[40:42] <- c(
    mean(sound$segments_pitches),
    sd(sound$segments_pitches),
    IQR(sound$segments_pitches)
  )
  
  ## segments_timbre 15
  feature[43:45] <- c(
    mean(sound$segments_timbre),
    sd(sound$segments_timbre),
    IQR(sound$segments_timbre)
  )
  
  ## set up feature matrix
  test.feature[i,] <- feature
}

train.mean <- colMeans(train.feature)
test.feature[which(is.na(test.feature),arr.ind = T)] <- train.mean[which(is.na(test.feature),arr.ind = T)[,2]]
adjust <- rbind(lyr[,-1],colMeans(lyr[,-1]))[nrow(lyr[,-1])+1,]

final.rank <- rep(0,ncol(lyr)-1)
for(i in 1:testNum)
{
  print(i)
  distance <- rowSums(t(t(train.feature) - test.feature[i,])^2)
  closest <- trainset[which(rank(distance)<=500)]
  predicts <- rbind(lyr[closest,-1],colSums(lyr[closest,-1]))[nrow(lyr[closest,-1])+1,]
  final.pre <- predicts + adjust * 500
  final.rank <- rbind(final.rank,abs(rank(final.pre)-ncol(lyr)))
}
final.rank <- final.rank[-1,]

submission <- read.csv("~/Desktop/submission.csv")
for(i in 1:100)
{
  submission[i,c(3:4,7:31)] <- 4987
  submission[i,-c(1:4,7:31)] <- final.rank[i,]
}

write.csv(submission, "submission.csv", row.names = FALSE)

