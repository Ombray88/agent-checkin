// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title AgentCheckin — daily check-in for Binance Agent ID (name.ai) holders
/// @notice One check-in per UTC day, only for addresses holding an Agent ID
///         (SPACE ID ERC-721, 0x60B9262456dE011F7d15a54CdD8c48bAaa8B022F).
///         No owner, no admin functions, no fees, no token, no approvals.
///         Streaks and totals are public; the frontend leaderboard reads the
///         CheckIn events. Built for the Binance Agent ID Hackathon.
interface IAgentId {
    function balanceOf(address owner) external view returns (uint256);
}

contract AgentCheckin {
    IAgentId public constant AGENT_ID =
        IAgentId(0x60B9262456dE011F7d15a54CdD8c48bAaa8B022F);

    mapping(address => uint256) public lastCheckinDay;
    mapping(address => uint256) public streak;
    mapping(address => uint256) public totalCheckins;
    mapping(address => uint256) public bestStreak;
    uint256 public totalCheckinsAll;
    uint256 public totalUsers;

    event CheckIn(
        address indexed user,
        uint256 indexed day,
        uint256 streak,
        uint256 totalCheckins
    );

    error NotAgentIdHolder();
    error AlreadyCheckedInToday();

    /// @notice Check in once per UTC day. Requires holding an Agent ID.
    function checkIn() external {
        if (AGENT_ID.balanceOf(msg.sender) == 0) revert NotAgentIdHolder();
        uint256 day = block.timestamp / 1 days;
        if (lastCheckinDay[msg.sender] == day) revert AlreadyCheckedInToday();

        uint256 prevDay = lastCheckinDay[msg.sender];
        uint256 newStreak = (prevDay == day - 1) ? streak[msg.sender] + 1 : 1;

        if (totalCheckins[msg.sender] == 0) totalUsers += 1;
        lastCheckinDay[msg.sender] = day;
        streak[msg.sender] = newStreak;
        totalCheckins[msg.sender] += 1;
        totalCheckinsAll += 1;
        if (newStreak > bestStreak[msg.sender]) {
            bestStreak[msg.sender] = newStreak;
        }

        emit CheckIn(msg.sender, day, newStreak, totalCheckins[msg.sender]);
    }

    function getStreak(address user) external view returns (uint256) {
        return streak[user];
    }

    function getTotalCheckins(address user) external view returns (uint256) {
        return totalCheckins[user];
    }

    function getBestStreak(address user) external view returns (uint256) {
        return bestStreak[user];
    }

    function hasAgentId(address user) external view returns (bool) {
        return AGENT_ID.balanceOf(user) > 0;
    }

    function checkedInToday(address user) external view returns (bool) {
        return lastCheckinDay[user] == block.timestamp / 1 days;
    }
}
