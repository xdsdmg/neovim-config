local status, telescope = pcall(require, "telescope")
if not status then
  print("load telescope failed")
  return
end

telescope.setup({})

