# Project submission — Agent Check-in (ready to paste)

⚠️ STATUS 2026-11-18 ~19:40 WIB: the PROJECT submission form/channel has NOT been
found yet. The Binance announcement and Square post contain NO project-submission
link — only the Community Promotion survey (X links). The most likely source of
the project form is the @BinanceWallet X hackathon post ("Bring your build: …"),
which mirrors truncate. The parent agent should check that post in the live
browser, or watch for a form link from @BinanceWallet / @BNBCHAIN.

When the form appears, paste the fields below.

## Fields

- **Project name:** Agent Check-in
- **Website:** https://ombray88.github.io/agent-checkin/
- **Repository (open source):** https://github.com/Ombray88/agent-checkin
- **Contract address (BNB Chain):** 0x032a720F6A45c86d385c4f07bFe7494bE0841f55
- **Contract verification:** Sourcify exact_match (creation + runtime), verified 2026-11-18T12:19:21Z; shown as verified on BscScan. Source: contracts/AgentCheckin.sol in the repo.
- **Deploy tx:** 0x43ab28e6f0bcc65ce359d54e6028c51f349c8014bcda3062b136a3d490eacd93 (block 134310071, 18 Nov 2026)
- **Deployer / reward receiving address:** 0xdC189219a825CF18d932f51D7fAb90226Ff8cF7d
- **Agent ID of the builder:** ombray.ai (handle ombray), wallet 0xdC189219a825CF18d932f51D7fAb90226Ff8cF7d
- **Agent ID usage description:**
  Agent ID is the core access gate of the product. `checkIn()` reverts unless
  `msg.sender` holds an Agent ID (balanceOf > 0 on the SPACE ID Agent ID
  contract 0x60B9262456dE011F7d15a54CdD8c48bAaa8B022F). Only Agent ID holders
  can check in, once per UTC day; streaks, totals and the leaderboard are
  built from the on-chain CheckIn events of Agent ID holders only. The
  frontend shows holder status and disables check-in for non-holders.
  The contract has no owner and no admin functions.
- **One-line pitch:** Daily check-in for Agent ID holders — one check-in per
  day, public streaks, on-chain leaderboard. No token, no fees, no promises.

## Community Promotion survey (X links — known, working)

https://app.binance.com/uni-qr/user-survey/ff6832f8d2984af289068c9450a3c98c
(requires Binance login; submit each X post link after posting — see X-DRAFTS.md)
