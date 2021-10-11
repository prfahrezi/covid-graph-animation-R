library(ggplot2)
library(gganimate)
kawalcovid19.data <- read.csv(file="kawalcovid19_nodate.csv")

p1 <- ggplot(aes(y = kasus_aktif,
                 x = tanggal, group=1),
             data = kawalcovid19.data) +
  geom_line() +
  geom_point() +
  theme_classic()
  
p1

p1.animation = p1 +
  transition_reveal(tanggal)

#animate(p1.animation, fps=10, duration=5, renderer=gifski_renderer())

animate(p1.animation, height = 720, width = 1280, fps=30,
        duration=300, res=100,rewind=F, start_pause = 120, end_pause = 120,
        renderer = ffmpeg_renderer())
anim_save("covidId.mp4")