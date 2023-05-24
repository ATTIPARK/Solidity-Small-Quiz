// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Quiz21 {
    // 3의 배수만 들어갈 수 있는 array를 구현하세요
    uint[] public array;

    function setArray(uint number) public {
        require(number%3 == 0);
        array.push(number);
    }
}

contract Quiz22 {
    // 뺄셈 함수를 구현하세요. 임의의 두 숫자를 넣으면 자동으로 둘 중 큰수로부터 작은 수를 빼는 함수를 구현하세요.
    // 예) 2,5 input → 5-2=3(output)

    function subtract(uint num1, uint num2) public pure returns(uint) {
        if(num1 > num2) {
            return num1-num2;
        } else {
            return num2-num1;
        }
    }
}

contract Quiz23 {
    // 3의 배수라면 “A”를, 나머지가 1이 있다면 “B”를, 나머지가 2가 있다면 “C”를 반환하는 함수를 구현하세요.
    function getABC(uint number) public pure returns(string memory) {
        if(number%3 == 0) {
            return 'A';
        } else if(number%3 == 1) {
            return 'B';
        } else {
            return 'C';
        }
    }
}

contract Quiz24 {
    // string을 input으로 받는 함수를 구현하세요. “Alice”가 들어왔을 때에만 true를 반환하세요.
    function getTrue(string memory a) public pure returns(bool) {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked("Alice"));
    }
}

contract Quiz25 {
    // 배열 A를 선언하고 해당 배열에 n부터 0까지 자동으로 넣는 함수를 구현하세요.
    uint[] A;

    function setA(uint n) public {
        while(n != 0) {
            A.push(n);
            n--;
        }
        A.push(0);
    }
    function getA() public view returns(uint[] memory) {
        return A;
    }
}

contract Quiz26 {
    // 홀수만 들어가는 array, 짝수만 들어가는 array를 구현하고 숫자를 넣었을 때 자동으로 홀,짝을 나누어 입력시키는 함수를 구현하세요.
    uint[] odd;
    uint[] even;

    function setOddEven(uint n) public {
        if(n%2==0) {
            even.push(n);
        } else {
            odd.push(n);
        }
    }

    function getOddEven() public view returns(uint[] memory, uint[] memory) {
        return (odd, even);
    }
}

contract Quiz27 {
    // string 과 bytes32를 key-value 쌍으로 묶어주는 mapping을 구현하세요. 해당 mapping에 정보를 넣고, 지우고 불러오는 함수도 같이 구현하세요.
    mapping (string=>bytes32) keyValue;
    
    function setMapping(string memory a) public {
        keyValue[a] = keccak256(abi.encodePacked(a));
    }

    function getMapping(string memory a) public view returns(bytes32) {
        return keyValue[a];
    }

    function deleteMapping(string memory a) public {
        delete keyValue[a];
    }
}

contract Quiz28 {
    // ID와 PW를 넣으면 해시함수(keccak256)에 둘을 같이 해시값을 반환해주는 함수를 구현하세요.
    
    function getHash(string memory ID, string memory PW) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(ID,PW));
    }
}

contract Quiz29 {
    // 숫자형 변수 a와 문자형 변수 b를 각각 10 그리고 “A”의 값으로 배포 직후 설정하는 contract를 구현하세요.
    uint public a;
    string public b;

    constructor() {
        a = 10;
        b = 'A';
    }
}

contract Quiz30 {
    // 1. 임의대로 숫자를 넣으면 알아서 내림차순으로 정렬해주는 함수를 구현하세요
    // (sorting 코드 응용 → 약간 까다로움)
    // 예 : [2,6,7,4,5,1,9] → [9,7,6,5,4,2,1]

    uint[] array;

    function setArray(uint n) public {
        if(array.length > 0) {
            array.push(n);
            for(uint i = 1; i < array.length; i++) {
                for(uint j = 0; j < i; j++) {
                    if(array[j] < array[i]) {
                        (array[j], array[i]) = (array[i], array[j]);
                    }
                }
            }    
        } else {
            array.push(n);
        }
    }

    function getArray() public view returns(uint, uint[] memory) {
        return (array.length, array);
    }
}