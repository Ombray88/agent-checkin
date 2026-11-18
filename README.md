# Agent Check-in

Daily check-in dApp for **Agent ID** (`name.ai`) holders on BNB Chain. Built for the Agent ID Hackathon.

**Live site:** https://ombray88.github.io/agent-checkin/

## What it is

- Holders of an Agent ID check in **once per UTC day** and build a public streak.
- The contract only lets an address check in if it holds an Agent ID (`balanceOf > 0` on the Agent ID contract) and has not already checked in today.
- Streaks, totals, and the leaderboard are fully on-chain (events + public views).
- No token, no fees, no rewards promised. A check-in only costs the network fee (gas) the user pays for their own transaction.

## Contract

- **Address (BNB Chain):** [`0x032a720F6A45c86d385c4f07bFe7494bE0841f55`](https://bscscan.com/address/0x032a720F6A45c86d385c4f07bFe7494bE0841f55)
- **Deployed:** 2026-11-18, block 134310071, via the EIP-2470 SingletonFactory (`0xce0042B868300000d44A59004Da54A005ffdcf9f`)
- **Deploy tx:** [`0x43ab28e6f0bcc65ce359d54e6028c51f349c8014bcda3062b136a3d490eacd93`](https://bscscan.com/tx/0x43ab28e6f0bcc65ce359d54e6028c51f349c8014bcda3062b136a3d490eacd93)
- **Source:** `contracts/AgentCheckin.sol` — verified on Sourcify (**exact_match**, creation + runtime) and shown as verified on BscScan.
- **Agent ID contract:** [`0x60B9262456dE011F7d15a54CdD8c48bAaa8B022F`](https://bscscan.com/address/0x60B9262456dE011F7d15a54CdD8c48bAaa8B022F) (SPACE ID Agent ID, ERC-721, non-transferable)

## How Agent ID is used

Agent ID is the core access gate of the product, not an add-on:

1. `checkIn()` reverts with `NotAgentIdHolder()` unless `msg.sender` holds an Agent ID.
2. The frontend shows the connected wallet's Agent ID holder status and disables check-in for non-holders.
3. Only interacting addresses that hold an Agent ID are counted — the leaderboard is built from `CheckIn` events emitted only by Agent ID holders.

## Contract API

| Function | Description |
| --- | --- |
| `checkIn()` | Check in once per UTC day (Agent ID holders only) |
| `streak(address)` / `getStreak(address)` | Current consecutive-day streak |
| `totalCheckins(address)` / `getTotalCheckins(address)` | Lifetime check-ins |
| `bestStreak(address)` / `getBestStreak(address)` | Best streak ever |
| `hasAgentId(address)` | Whether an address holds an Agent ID |
| `checkedInToday(address)` | Whether an address already checked in today (UTC) |
| `totalUsers()` / `totalCheckinsAll()` | Global counters |

Event: `CheckIn(address indexed user, uint256 indexed day, uint256 streak, uint256 totalCheckins)`

## Owner permissions

**None.** The contract has no owner and no admin functions — no minting, pausing, freezing, or withdrawing. Nobody can change the rules after deployment.

## Development

Foundry project (Solidity 0.8.24). Tests: `forge test` (5 tests: first check-in, double check-in revert, non-holder revert, streak continuation, streak reset after a gap).

## License

MIT — see [LICENSE](LICENSE).
