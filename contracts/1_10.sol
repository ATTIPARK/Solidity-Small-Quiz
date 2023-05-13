// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Quiz1 {
    // 더하기, 빼기, 곱하기, 나누기 그리고 제곱을 반환받는 계산기를 만드세요
    function Plus(uint a, uint b) public pure returns(uint) {
        return a+b;
    }

    function Minus(uint a, uint b) public pure returns(uint) {
        return a-b;
    }

    function Multiply(uint a, uint b) public pure returns(uint) {
        return a*b;
    }

    function Divide(uint a, uint b) public pure returns(uint) {
        return a/b;
    }

    function Square(uint a) public pure returns(uint) {
        return a**2;
    }
}

contract Quiz2 {
    // 2개의 Input값을 가지고 1개의 output값을 가지는 4개의 함수를 만드시오. 각각의 함수는 더하기, 빼기, 곱하기, 나누기(몫)를 실행합니다.
    function Plus(uint a, uint b) public pure returns(uint) {
        return a+b;
    }

    function Minus(uint a, uint b) public pure returns(uint) {
        return a-b;
    }

    function Multiply(uint a, uint b) public pure returns(uint) {
        return a*b;
    }

    function Divide(uint a, uint b) public pure returns(uint, uint) {
        return (a/b, a%b);
    }
}

contract Quiz3 {
    // 1개의 Input값을 가지고 1개의 output값을 가지는 2개의 함수를 만드시오. 각각의 함수는 제곱, 세제곱을 반환합니다.

    function Square(uint a) public pure returns(uint) {
        return a**2;
    }

    function Cubic(uint a) public pure returns(uint) {
        return a**3;
    }
}

contract Quiz4 {
    // 이름(string), 번호(uint), 듣는 수업 목록(string[])을 담은 student라는 구조체를 만들고 그 구조체들을 관리할 수 있는 array, students를 선언하세요.
    struct student {
        string name;
        uint number;
        string[] class;
    }

    student[] students;
}

contract Quiz5 {
    /*
    아래의 함수를 만드세요
    1~3을 입력하면 입력한 수의 제곱을 반환받습니다.
    4~6을 입력하면 입력한 수의 2배를 반환받습니다.
    7~9를 입력하면 입력한 수를 3으로 나눈 나머지를 반환받습니다.
    */

    function getResultByNum(uint number) public pure returns(uint) {
        if(number >=1 && number <= 3) {
            return number**2;
        } else if(number >= 4 && number <= 6) {
            return number*2;
        } else if(number >= 7 && number <= 9) {
            return number%3;
        } else {
            revert("Wrong Input Number");
        }
    }
}

contract Quiz6 {
    // 숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 9까지 자동으로 채우는 함수를 구현하세요.(for 문)
    uint[10] numbers;

    function setNumbers() public {
        for(uint i = 0; i < numbers.length; i ++) {
            numbers[i] = i + 1;
        }
    }

    function getNumbers() public view returns (uint[10] memory) {
        return numbers;
    }
}

contract Quiz7 {
    // 숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 5까지 자동으로 채우는 함수와 array안의 모든 숫자를 더한 값을 반환하는 함수를 각각 구현하세요.(for 문)
    uint[6] numbers;

    function setNumbers() public {
        for(uint i = 0; i < numbers.length; i++) {
            numbers[i] = i + 1;
        }
    }

    function getNumbers() public view returns(uint[6] memory) {
        return numbers;
    }

    function addAllNumbers() public view returns(uint) {
        uint sum;
        for(uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
}

contract Quiz8 {
    /*
    아래의 함수를 만드세요
    1~10을 입력하면 “A” 반환받습니다.
    11~20을 입력하면 “B” 반환받습니다.
    21~30을 입력하면 “C” 반환받습니다.
    */
    function getABCByNumber(uint number) public pure returns(string memory) {
        if(number >= 1 && number <= 10) {
            return "A";
        } else if(number >= 11 && number <= 20) {
            return "B";
        } else if(number >= 21 && number <= 30) {
            return "C";
        } else {
            revert("Wrong Input Number");
        }
    }
}

contract Quiz9 {
    // 문자형을 입력하면 bytes 형으로 변환하여 반환하는 함수를 구현하세요.
    function StringToByte(string memory _string) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_string));
    }
}

contract Quiz10 {
    // 숫자만 들어가는 array numbers를 선언하고 숫자를 넣고(push), 빼고(pop), 특정 n번째 요소의 값을 볼 수 있는(get)함수를 구현하세요.
    uint[] numbers;

    function pushNumber(uint _number) public {
        numbers.push(_number);
    }

    function popNumber() public {
        numbers.pop();
    }

    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n -1];
    }
}