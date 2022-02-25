local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local types = require("luasnip.util.types")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local snippet = ls.parser.parse_snippet

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {{"🤔", "Comment"}}
      }
    }
  },
  enable_autosnippets = true
}

ls.snippets = {
  all = {},
  javascript = {
    snippet("im", "import { $2 } from '$1';"),
    snippet("ex", "export * from '$1';"),
    snippet("co", "console.log('$1');"),
    snippet("exp", "export const ${1:name} = (${2:params}) => $3;"),
    s(
      "des",
      {
        t("import { "),
        i(2),
        t(" } from '"),
        i(1),
        t({"';", ""}),
        t(
          {
            "",
            "const cases = [",
            "\t[",
            "\t\t'Case 1',",
            "\t\t{},",
            "\t\t[]",
            "\t]",
            "];",
            ""
          }
        ),
        t({"", "describe('"}),
        rep(2),
        t(
          {
            "', () => {",
            "\tit.each(cases)('%s', (_title, args, expected) => {",
            "\t\texpect("
          }
        ),
        rep(2),
        t(
          {
            "(args)).toEqual(expected);",
            "\t});",
            "});"
          }
        )
      }
    )
  },
  javascriptreact = {
    s(
      "re",
      {
        t({"import React from 'react';", "import PropTypes from 'prop-types';"}),
        t({"", "", "export const "}),
        i(1, "Component"),
        t(" = ({ "),
        i(2, "prop"),
        t({" }) => {", "\t"}),
        i(3),
        t({"", "};", "", ""}),
        rep(1),
        t({".propTypes = {", "\t"}),
        rep(2),
        t({": PropTypes.string,", ""}),
        t({"};"})
      }
    )
  },
  rust = {},
  tex = {
    snippet("list", "\\begin{${1|enumerate,itemize|}}\n\t\\item ${2:item}\n\\end{$1}")
  }
}

ls.filetype_extend("javascriptreact", {"javascript"})

vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
