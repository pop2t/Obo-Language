import {
  workspace,
  window,
  commands,
  ExtensionContext,
  Terminal,
} from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  TransportKind,
} from "vscode-languageclient/node";

let client: LanguageClient | undefined;
let oboTerminal: Terminal | undefined;

function getOrCreateTerminal(): Terminal {
  if (oboTerminal && !oboTerminal.exitStatus) {
    return oboTerminal;
  }
  oboTerminal = window.createTerminal("OBO");
  return oboTerminal;
}

function runOboCommand(subcmd: string) {
  const editor = window.activeTextEditor;
  if (!editor) {
    window.showErrorMessage("No active file to run");
    return;
  }
  const filePath = editor.document.fileName;
  if (!filePath.endsWith(".obo")) {
    window.showErrorMessage("Not an OBO file");
    return;
  }
  // Save before running
  editor.document.save().then(() => {
    const config = workspace.getConfiguration("obo");
    const oboPath = config.get<string>("serverPath", "obo");
    const terminal = getOrCreateTerminal();
    terminal.show(true);
    terminal.sendText(`${oboPath} ${subcmd} "${filePath}"`);
  });
}

export function activate(context: ExtensionContext) {
  // Register run/build/check/test commands FIRST (before LSP, so they always work)
  context.subscriptions.push(
    commands.registerCommand("obo.runFile", () => runOboCommand("run")),
    commands.registerCommand("obo.buildFile", () => runOboCommand("build")),
    commands.registerCommand("obo.checkFile", () => runOboCommand("check")),
    commands.registerCommand("obo.testFile", () => runOboCommand("test")),
  );

  // Start LSP (non-blocking — if obo binary isn't found, commands still work)
  const config = workspace.getConfiguration("obo");
  const serverPath = config.get<string>("serverPath", "obo");

  const serverOptions: ServerOptions = {
    command: serverPath,
    args: ["lsp"],
    transport: TransportKind.stdio,
  };

  const clientOptions: LanguageClientOptions = {
    documentSelector: [{ scheme: "file", language: "obo" }],
  };

  client = new LanguageClient(
    "oboLanguageServer",
    "OBO Language Server",
    serverOptions,
    clientOptions
  );

  client.start().catch((_err: unknown) => {
    // LSP failed to start — commands still work, diagnostics won't
  });
}

export function deactivate(): Thenable<void> | undefined {
  if (!client) {
    return undefined;
  }
  return client.stop();
}
