// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Quiz31 {
    // string을 input으로 받는 함수를 구현하세요. "Alice"나 "Bob"일 때에만 true를 반환하세요.
    function getTrueOrFalse(string memory a) public pure returns(bool) {
        if(keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked("Alice")) || keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked("Bob"))) {
            return true;   
        } else {
            return false;
        }
    }
}

contract Quiz32 {
    /*
    3의 배수만 들어갈 수 있는 array를 구현하되, 3의 배수이자 동시에 10의 배수이면 들어갈 수 없는 추가 조건도 구현하세요.
    예) 3 → o , 9 → o , 15 → o , 30 → x
    */
    uint[] array;

    function setArray(uint n) public {
        require(n%3 == 0 && n%10 != 0);
        array.push(n);
    }

    function getArray() public view returns(uint[] memory) {
        return array;
    }
}

contract Quiz33 {
    // 이름, 번호, 지갑주소 그리고 생일을 담은 고객 구조체를 구현하세요.
    // 고객의 정보를 넣는 함수와 고객의 이름으로 검색하면 해당 고객의 전체 정보를 반환하는 함수를 구현하세요.
    struct guest {
        string name;
        uint number;
        address addr;
        uint birth;
    }

    mapping(string=>guest) Info;

    function setInfo(string memory _name, uint _number, address _addr, uint _birth) public {
        Info[_name] = guest(_name, _number, _addr, _birth);
    }

    function getInfo(string memory _name) public view returns(guest memory) {
        return Info[_name];
    }
}

contract Quiz34 {
    // 이름, 번호, 점수가 들어간 학생 구조체를 선언하세요. 
    // 학생들을 관리하는 자료구조도 따로 선언하고 학생들의 전체 평균을 계산하는 함수도 구현하세요.
    struct student {
        string name;
        uint number;
        uint score;
    }

    student[] Students;

    function setStudents(string memory _name, uint _score) public {
        Students.push(student(_name, Students.length+1, _score));
    }

    function getStudents() public view returns(student[] memory) {
        return Students;
    }

    function getAverageScore() public view returns(uint) {
        require(Students.length > 0);
        uint average;
        uint sum;
        for(uint i = 0; i < Students.length; i++) {
            sum += Students[i].score;
        }
        average = sum/Students.length;

        return average;
    }
}

contract Quiz35 {
    /*
    숫자만 들어갈 수 있는 array를 선언하고 해당 array의 짝수번째 요소만 모아서 반환하는 함수를 구현하세요.
    예) [1,2,3,4,5,6] -> [2,4,6] // [3,5,7,9,11,13] -> [5,9,13]
    */

    uint[] array;

    function setArray(uint n) public {
        array.push(n);
    }

    function getArray() public view returns(uint[] memory) {
        return array;
    }

    function makeEvenArray() public view returns(uint[] memory) {
        require(array.length > 0);

        uint count;
        for(uint i = 0; i < array.length; i++) {
            if(array[i]%2==0) {
                count++;
            }
        }

        uint[] memory evenArray = new uint[](count);
        uint n;
        for(uint i = 0; i < array.length; i++) {
            if(array[i]%2==0) {
                evenArray[n++] = array[i];
            }
        }

        return evenArray;
    }
}

contract Quiz36 {
    // high, neutral, low 상태를 구현하세요. a라는 변수의 값이 7이상이면 high, 4이상이면 neutral 그 이후면 low로 상태를 변경시켜주는 함수를 구현하세요.
    uint public a;
    enum status {
        none,
        high,
        neutral,
        low
    }
    status public AStatus;

    function setA(uint _a) public {
        if(_a>=7) {
            AStatus = status.high;
        } else if(_a>=4) {
            AStatus = status.neutral;
        } else {
            AStatus = status.low;
        }
        a = _a;
    }
}

contract Quiz37 {
    /*
    1 wei를 기부하는 기능, 1finney를 기부하는 기능 그리고 1 ether를 기부하는 기능을 구현하세요. 
    최초의 배포자만이 해당 smart contract에서 자금을 회수할 수 있고 다른 이들은 못하게 막는 함수도 구현하세요.
    (힌트 : 기부는 EOA가 해당 Smart Contract에게 돈을 보내는 행위, contract가 돈을 받는 상황)
    */
    
}

contract Quiz38 {
    /*
    상태변수 a를 "A"로 설정하여 선언하세요. 이 함수를 "B" 그리고 "C"로 변경시킬 수 있는 함수를 각각 구현하세요. 
    단 해당 함수들은 오직 owner만이 실행할 수 있습니다. owner는 해당 컨트랙트의 최초 배포자입니다.
    (힌트 : 동일한 조건이 서로 다른 두 함수에 적용되니 더욱 효율성 있게 적용시킬 수 있는 방법을 생각해볼 수 있음)
    */

    string public a = 'A';
    address owner = msg.sender;

    function setAToB() public {
        require(msg.sender == owner);
        a = "B";
    }
    function setAToC() public {
        require(msg.sender == owner);
        a = "C";
    }
}

contract Quiz39 {
    /*
    특정 숫자의 자릿수까지의 2의 배수, 3의 배수, 5의 배수 7의 배수의 개수를 반환해주는 함수를 구현하세요.
    예) 15 : 7,5,3,2  (2의 배수 7개, 3의 배수 5개, 5의 배수 3개, 7의 배수 2개),
    100 : 50,33,20,14  (2의 배수 50개, 3의 배수 33개, 5의 배수 20개, 7의 배수 14개)
    */

    function getCount(uint n) public pure returns(uint, uint, uint, uint, uint) {
        uint _n = n;
        uint Two = _n/2;
        _n = n;
        uint Three = _n/3;
        _n = n;
        uint Five = _n/5;
        _n = n;
        uint Seven = _n/7;
        return(n, Two, Three, Five, Seven);
    }
}

contract Quiz40 {
    /*
    숫자를 임의로 넣었을 때 오름차순으로 정렬하고 가장 가운데 있는 숫자를 반환하는 함수를 구현하세요. 
    가장 가운데가 없다면 가운데 2개 숫자를 반환하세요.
    예) [5,2,4,7,1] -> [1,2,4,5,7], 4 // 
    [1,5,4,9,6,3,2,11] -> [1,2,3,4,5,6,9,11], 4,5 // 
    [6,3,1,4,9,7,8] -> [1,3,4,6,7,8,9], 6
    */

    uint[] array;

    function setArray(uint n) public {
        array.push(n);
    }

    function getArray() public view returns(uint[] memory) {
        return array;
    }

    function sorting() public view returns(uint[] memory, uint[] memory) {
        uint[] memory copyArray = array;
        for(uint i = 0; i < copyArray.length-1; i++) {
            for(uint j = i+1; j < copyArray.length; j++) {
                if(copyArray[i] > copyArray[j]) {
                    (copyArray[i], copyArray[j]) = (copyArray[j], copyArray[i]);
                }
            }
        }
        uint[] memory middleNum;
        if(copyArray.length%2 == 0) {
            middleNum = new uint[](2);
            middleNum[0] = copyArray[copyArray.length/2-1];
            middleNum[1] = copyArray[copyArray.length/2];
        } else {
            middleNum = new uint[](1);
            middleNum[0] = copyArray[copyArray.length/2];
        }

        return (copyArray, middleNum);
    }
}