-- In your Neovim configuration (e.g., init.lua or a dedicated plugins file)
require("mdxsnap").setup({
	-- Default path for saving images.
	-- If DefaultPastePathType is "relative", this is relative to the project root.
	-- If "absolute", this is used as an absolute path.
	DefaultPastePath = "snaps/images/posts", -- Default: "mdxsnaps_data/images/posts"
	DefaultPastePathType = "relative", -- Default: "relative" ("absolute" is also an option)

	-- Override default settings for specific projects.
	-- Rules are evaluated in order; the first match is used.
	ProjectOverrides = {
		-- Example 1: Match by project directory name
		{
			matchType = "projectName", -- "projectName" or "projectPath"
			matchValue = "portfolio", -- The name of the project's root directory
			PastePath = "client/src/images/posts/", -- Custom path for this project
			PastePathType = "relative",
			customImports = { -- Override global customImports for this project
				{
					line = 'import { Image } from "astro:assets";',
					checkRegex = "astro:assets",
				},
				{
					line = 'import { ImportImage } from "@/lib/functions";',
					checkRegex = "@/lib/functions",
				},
			},
			customTextFormat = '<Image alt="%s" src={ImportImage("%s")} />', -- Override global customTextFormat
		},
		-- Example 2: Match by project's absolute path (supports ~ and $HOME)
	},

	-- Custom import statements to ensure are present in the file.
	-- The plugin checks if an import matching `checkRegex` exists before adding `line`.
	customImports = {
		-- {
		-- line = 'import { Image } from "astro:assets";', -- The full import line
		-- checkRegex = "astro:assets", -- A string/regex to check for existing import
		-- },
		-- Example:
		-- { line = 'import MyCustomImage from "@/components/MyCustomImage.astro";', checkRegex = '@/components/MyCustomImage.astro' },
	},

	-- Format for the inserted image reference text.
	-- `%s` is a placeholder.
	-- - If one `%s`: it's replaced by the image path.
	-- - If two `%s`: the first is replaced by alt text (filename stem of the new image),
	--                 and the second by the image path.
	customTextFormat = "![%s](%s)", -- Default: Markdown image format "![alt](src)"
	-- Example for Astro <Image /> component:
	-- customTextFormat = '<Image src={"%s"} alt="%s" />',
	-- Example for a simple <img> tag:
	-- customTextFormat = '<img src="%s" alt="%s" />',
})
