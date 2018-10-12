# IDE

## VSCode

#### extension package

* BreadCrumb in StatusBar
  * 선택 파일 경로 노출
* GitLens
  * 선택 행 깃 커밋 보여주기
* One Dark Pro
  * 에디터 테마
* vscode-icons
  * 에디터 아이콘
* Material Icon Theme
  * 에디터 아이콘

#### usersetting.json

```javascript
{
    "workbench.startupEditor": "welcomePage",
    "gitlens.advanced.messages": {
        "suppressCommitHasNoPreviousCommitWarning": false,
        "suppressCommitNotFoundWarning": false,
        "suppressFileNotUnderSourceControlWarning": false,
        "suppressGitVersionWarning": false,
        "suppressLineUncommittedWarning": false,
        "suppressNoRepositoryWarning": false,
        "suppressResultsExplorerNotice": false,
        "suppressShowKeyBindingsNotice": true,
        "suppressUpdateNotice": false,
        "suppressWelcomeNotice": true
    },
    "window.zoomLevel": 0,
    "editor.tabSize": 2,
    "editor.fontFamily": "D2Coding ligature",
    "editor.fontLigatures": true,
    "editor.fontSize": 14,
    "gitlens.keymap": "alternate",
    "gitlens.historyExplorer.enabled": true,
    "workbench.colorTheme": "One Dark Pro Vivid",
    "breadcrumbs.enabled": true
//    필요할때 사용     
//    "eslint.options": {
//        "configFile": "/Users/rrest/wemakeprice/workspace/.eslintrc"
//    }
}
```

#### .eslintrc

```javascript
{
  "env": {
    "jquery": true,
    "browser": true,
    "amd": true,
    "commonjs": true,
    "es6": true
  },
  "parser": "babel-eslint",
  "parserOptions": {
    "ecmaVersion": 6,
    "sourceType": "module",
    "ecmaFeatures": {
        "jsx": true
    }
  },
  "globals": {
    "alert": false,
    "clearTimeout": false,
    "clearInterval": false,
    "document": false,
    "exports": false,
    "module": false,
    "navigator": false,
    "require": false,
    "setInterval": false,
    "setTimeout": false,
    "window": false,
    "XMLHttpRequest": false
  },
  "rules": {
    "camelcase": ["error", {"properties": "always"}],
    "comma-spacing": ["error", {"before": false, "after": true}],
    "comma-style": ["error", "last"],
    "comma-dangle": "error",
    "brace-style": ["error", "1tbs", { "allowSingleLine": true }],
    "indent": ["error", 2, { "SwitchCase": 1 }],
    "valid-jsdoc": ["warn", {"requireReturn":false}],
    "block-scoped-var": "warn",
    "curly": "error",
    "eqeqeq": "warn",
    "quotes": ["error", "single"],
    "semi": "error",
    "no-inline-comments": "warn",
    "no-debugger": "error",
    "no-console": "warn",
    "no-empty": "warn",
    "no-spaced-func": "warn",
    "no-array-constructor": "error",
    "no-undefined": "warn",
    "no-alert": "off",
    "no-loop-func": "error",
    "no-multi-spaces": "error",
    "no-new": "error",
    "no-unused-expressions": "error",
    "no-unused-vars": "warn",
    "no-use-before-define": ["error", {"functions": false}],
    "space-before-blocks": "error",
    "semi-spacing": ["error", {"before": false, "after": true}],
    "keyword-spacing": ["error", {"before": true, "after": true}],
    "no-new-object": "error",
    "key-spacing": ["error", {"beforeColon": false, "afterColon": true}],
    "space-infix-ops": ["error"],
    "space-before-function-paren": ["error", {"anonymous": "always", "named": "never"}]
  }
}
```

