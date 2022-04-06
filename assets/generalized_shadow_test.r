color_base <- "lightgrey"
color_bold <- "#36d9dd"

pdf(
  "assets/generalized_shadow_test.pdf",
  bg = "white", width = 8, height = 5
)

par(mar = c(0, 0, 0, 0))

plot(
  0, 0, type = 'n', xlim = c(-3.5, 13.3), ylim = c(8, -0.3),
  xlab = "", ylab = "",
  axes = F,
  xaxs = "i", yaxs = "i")

m <- matrix(0, 6, 12)
m[1, ] <- 1
m[2, 1] <- 1
m[3, seq(1, 12, 6)] <- 1
m[4, seq(1, 12, 4)] <- 1
m[5, 1:6]  <- 1
m[6, c(1, 6:12)] <- 1

text(7, 0, "Item Position")

for (x in seq(1, 12)) {
  text(x + 0.5, 0.5, x)
}

for (y in 1:6) {
  for (x in seq(1, 12)) {
    rect(
      x, y, x + 1, y + 0.6,
      col = ifelse(m[y, x] == 1, color_bold, color_base)
    )
    text(
      x + 0.5, y + 0.3,
      labels = m[y, x]
    )
  }
}

text(-3.2, 1.3, "Fully adaptive"           , adj = 0)
text(-3.2, 2.3, "LOFT or Fixed Form"       , adj = 0)
text(-3.2, 3.3, "2\uadStage MST"           , adj = 0)
text(-3.2, 4.3, "3\uadStage MST"           , adj = 0)
text(-3.2, 5.3, "Hybrid (Adaptive + Fixed)", adj = 0)
text(-3.2, 6.3, "Hybrid (Fixed + Adaptive)", adj = 0)

# Legend
rect(3.6, 7.0, 4.4, 7.4, col = color_bold)
text(4.0, 7.2, "1", cex = 0.8)
rect(3.6, 7.5, 4.4, 7.9, col = color_base)
text(4.0, 7.7, "0", cex = 0.8)
text(4.5, 7.2, "Shadow Test Reassembled", adj = 0)
text(4.5, 7.7, "Shadow Test Frozen"     , adj = 0)

dev.off()
