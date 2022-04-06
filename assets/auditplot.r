library(TestDesign)

cfg <- createShadowTestConfig(
  refresh_policy = list(
    method = "THRESHOLD"
  )
)

set.seed(1)
solution <- Shadow(cfg, constraints_science, true_theta = rep(-2.508, 5))

pdf("assets/auditplot.pdf", bg = "white", width = 7, height = 5)
plot(solution, examinee_id = 3)
dev.off()
