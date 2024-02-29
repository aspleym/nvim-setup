return {
	"barrett-ruth/live-server.nvim",
	build = "pnpm install -g live-server",
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = true,
}
