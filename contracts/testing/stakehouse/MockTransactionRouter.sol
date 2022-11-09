// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import { IDataStructures } from "@blockswaplab/stakehouse-contract-interfaces/contracts/interfaces/IDataStructures.sol";
import { MockSlotRegistry } from "./MockSlotRegistry.sol";
import { MockStakeHouseUniverse } from "./MockStakeHouseUniverse.sol";
import { StakeHouseRegistry } from "./StakeHouseRegistry.sol";
import { MockERC20 } from "../MockERC20.sol";

contract MockTransactionRouter {

    MockSlotRegistry public mockSlotRegistry;
    MockStakeHouseUniverse public mockUniverse;

    function setMockSlotRegistry(MockSlotRegistry _slotRegistry) external {
        mockSlotRegistry = _slotRegistry;
    }

    function setMockUniverse(MockStakeHouseUniverse _universe) external {
        mockUniverse = _universe;
    }

    function authorizeRepresentative(
        address,
        bool
    ) external {
        // No mock implementation at the moment
    }

    function registerValidatorInitials(
        address,
        bytes calldata,
        bytes calldata
    ) external {
        // No mock implementation at the moment
    }

    function registerValidator(
        address,
        bytes calldata,
        bytes calldata,
        bytes calldata,
        IDataStructures.EIP712Signature calldata,
        bytes32
    ) external payable {
        // No mock implementation at the moment
    }

    function createStakehouse(
        address _user,
        bytes calldata _blsKey,
        string calldata,
        uint256,
        IDataStructures.ETH2DataReport calldata,
        IDataStructures.EIP712Signature calldata
    ) external {
        address house = address(new StakeHouseRegistry());
        MockERC20 sETH = new MockERC20("sETH", "sETH", _user);

        mockUniverse.setAssociatedHouseForKnot(_blsKey, house);

        mockSlotRegistry.setShareTokenForHouse(house, address(sETH));
    }

    function joinStakehouse(
        address _user,
        bytes calldata _blsPublicKey,
        address _stakehouse,
        uint256 _brandTokenId,
        uint256 _savETHIndexId,
        IDataStructures.ETH2DataReport calldata _eth2Report,
        IDataStructures.EIP712Signature calldata _reportSignature
    ) external {
        // No mock implementation at the moment
    }
}