#!/usr/bin/env python3
"""Statusline Claude Code - Version Python.

Lit un JSON depuis stdin (contexte Claude Code) et affiche une
ligne de statut formatée avec couleurs ANSI. Équivalent de
statusline-command.sh (bash + jq).
"""

import json
import subprocess
import sys
import time
from pathlib import Path

CYAN = "\033[36m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
RED = "\033[31m"
BLUE = "\033[34m"
MAGENTA = "\033[35m"
DIM = "\033[2m"
BOLD = "\033[1m"
RESET = "\033[0m"


def formatDuration(ms):
    """Formate une durée en millisecondes en chaîne lisible.

    Args:
        ms: Durée en millisecondes.

    Returns:
        str: Durée formatée (ex: "1h5m", "3m20s", "45s").
    """
    secs = ms // 1000
    mins = secs // 60
    hours = mins // 60
    days = hours // 24

    if days > 0:
        return f"{days}j{hours % 24}h"
    if hours > 0:
        return f"{hours}h{mins % 60}m"
    if mins > 0:
        return f"{mins}m{secs % 60}s"
    return f"{secs}s"


def formatRemaining(resetsAt):
    """Formate le temps restant avant réinitialisation du quota.

    Args:
        resetsAt: Timestamp de reset (epoch secondes).

    Returns:
        str: Temps restant formaté (ex: "1h5m"), ou "0s" si dépassé.
    """
    remainingMs = int(max(0, resetsAt - time.time()) * 1000)
    return formatDuration(remainingMs)


def getGitInfo():
    """Récupère la branche Git courante et son statut.

    Returns:
        str: "branche ✓" (propre) ou "branche ●" (modifs en
        cours), ou "" hors dépôt Git / sans branche.
    """
    isGitRepo = subprocess.run(
        ["git", "rev-parse", "--git-dir"],
        capture_output=True,
    )
    if isGitRepo.returncode != 0:
        return ""

    branchResult = subprocess.run(
        ["git", "branch", "--show-current"],
        capture_output=True,
        text=True,
    )
    branch = branchResult.stdout.strip()
    if not branch:
        return ""

    statusResult = subprocess.run(
        ["git", "status", "--porcelain"],
        capture_output=True,
        text=True,
    )
    marker = "●" if statusResult.stdout.strip() else "✓"
    return f"{branch} {marker}"


def contextColor(contextInt):
    """Choisit la couleur ANSI selon le pourcentage de contexte.

    Args:
        contextInt: Pourcentage d'utilisation du contexte (0-100).

    Returns:
        str: Code couleur ANSI.
    """
    if contextInt >= 80:
        return RED
    if contextInt >= 60:
        return YELLOW
    return GREEN


def buildLine(data):
    """Construit la ligne de statusline à partir des données.

    Args:
        data: Dictionnaire JSON du contexte Claude Code.

    Returns:
        str: Ligne formatée avec codes couleur ANSI.
    """
    model = data.get("model", {}).get("display_name", "?")
    workspace = data.get("workspace", {})
    projectDir = (
        workspace.get("project_dir")
        or workspace.get("current_dir")
        or data.get("cwd", "")
    )
    cost = data.get("cost", {})
    totalCost = cost.get("total_cost_usd", 0)
    contextPercent = data.get("context_window", {}).get(
        "used_percentage", 0
    )
    linesAdded = cost.get("total_lines_added", 0)
    linesRemoved = cost.get("total_lines_removed", 0)
    durationMs = cost.get("total_duration_ms", 0)
    apiDurationMs = cost.get("total_api_duration_ms", 0)
    outputStyle = data.get("output_style", {}).get("name", "")
    effortLevel = data.get("effort", {}).get("level", "")
    effort = effortLevel[:1].upper() + effortLevel[1:] if effortLevel else ""
    rateLimits = data.get("rate_limits", {})
    fiveHour = rateLimits.get("five_hour", {})
    sevenDay = rateLimits.get("seven_day", {})
    fiveHourPct = fiveHour.get("used_percentage")
    fiveHourResetsAt = fiveHour.get("resets_at")
    sevenDayPct = sevenDay.get("used_percentage")
    sevenDayResetsAt = sevenDay.get("resets_at")

    projectName = Path(projectDir).name
    gitInfo = getGitInfo()
    contextInt = round(contextPercent)
    ctxColor = contextColor(contextInt)
    duration = formatDuration(durationMs)
    apiSecs = apiDurationMs / 1000

    line = f"{DIM}📁{RESET} {projectName}"

    if gitInfo:
        line += f" │ {BLUE}🌿 {gitInfo}{RESET}"

    line += f" │ {GREEN}💰 ${totalCost:.4f}{RESET}"
    line += f" │ ⏱ {duration} {DIM}({apiSecs:.1f}s API){RESET}"
    line += f" │ {YELLOW}📝 +{linesAdded}/-{linesRemoved}{RESET}"
    line += f" │ {ctxColor}📊 {contextInt}%{RESET}"

    if fiveHourResetsAt is not None:
        pct = round(fiveHourPct) if fiveHourPct is not None else 0
        line += f" │ {contextColor(pct)}⏳ {formatRemaining(fiveHourResetsAt)} ({pct}%){RESET}"
    if sevenDayResetsAt is not None:
        pct = round(sevenDayPct) if sevenDayPct is not None else 0
        line += f" │ {contextColor(pct)}📅 {formatRemaining(sevenDayResetsAt)} ({pct}%){RESET}"

    line += f" │ {CYAN}{BOLD}{model}{RESET}"

    if effort:
        line += f" │ {YELLOW}⚡ {effort}{RESET}"

    if outputStyle and outputStyle != "default":
        line += f" │ {MAGENTA}🎨 {outputStyle}{RESET}"

    return line


def main():
    """Point d'entrée : lit le JSON stdin et affiche la ligne."""
    try:
        data = json.load(sys.stdin)
    except json.JSONDecodeError:
        print("⚠️ statusline : JSON invalide")
        return
    print(buildLine(data))


if __name__ == "__main__":
    main()
