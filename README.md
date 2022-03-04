# learn_flutter_with_codingchef

## 2022.02.25.  
<Stateful 개념 정리> 
* State가 변한 State객체를 비용이 싼 Stateful wiget으로 만들어서 계속 Rebuild하고 MyApp State객체는 Element Tree에서 Mutable하게 존재하면서 필요할 때마다 새로운 State를 저장함과 동시에 새롭게 Rebuild 된 Stateful 위젯만을 업데이트 해줍니다.

## 2022.03.02.
<final과 const개념 정리> 
* final과 const는 modifier(제어자)이다.
* final과 const는 값이 초기화되면 immutable한 변수가 된다.
* const는 컴파일 시에 상수화된다. 이는 런타임 시에도 immutable한 상수가 된다는 의미이다.
* final은 런타임 시에 상수화된다.

void main() {
  
  const constTime = DateTime.now();
  final finalTime = DateTime.now();
  
}
* const는 에러가 발생한다. DateTime은 호출될 때마다 값이 변경되기 때문에 런타임 시에 지정이 되어야한다. 컴파일 시에 상수값이 되는 const변수에는 이 값을 할당할 수 없다.
* final는 에러가 발생하지 않는다. 그래서 await 통해 특정 URL로부터 값을 가져올 경우 final을 써준다.
* const는 언제쓰냐? 3.14같은 Pi값은 그 값이 어디서든 변하지 않기 때문에 컴파일 때부터 상수화를 시킨다.
* final 변수는 rebuild될 수 있다.


## 2022.03.04.
<반복문과 난수 생성, cacade notation> 
* 반복문 1(For - in range)

void main() {
List<String> rainbow = ['빨', '주', '노', '초', '파', '남', '보'];

for(int i=0; i<rainbow.length; i++){
  print(rainbow[i]);
}

for(String x in rainbow){
  print(x);
}
}

  
                                 
* 반복문 2(For - Each) : For - in 보다 효율적이라고 한다.
void main() {
    List<String> carMaker = ['BMW', 'Benz', 'Audi', 'Jaguar'];

    carMaker.forEach((name){
      print(name);
    });                             
  }
  
*  cascade notation
   ** cascade notation인 ..은 한 객체의 맴버함수를 호출하거나 속성에 접근할 수 있다.
   ** shuffle()은 섞어준다. API 참고
   ** sublist는 리스트의 특정 인덱스들을 불러올 때 사용한다.
   var test = (List<int>.generate(45, (i) => i+1)..shuffle()).sublist(0,6);
   print(test);
  
* 난수 생성(math라이브러리와 Set을 이용한 로또 프로그램) 
  
import 'dart:math';
  
void main() {
  
  Set<int> lottoFinal = lottoNumber();
  Set<int> myFinal = myNumber();
  
  checkNumber(lottoFinal, myFinal);
  
}

Set<int> lottoNumber(){
    
    final random = Random();
    final Set<int> lottoSet = {};
    
    while(lottoSet.length != 6) {
      lottoSet.add(random.nextInt(45) + 1);
    }
    
    print('당첨 번호');
    print(lottoSet.toList());
    
    return lottoSet;
  }

Set<int> myNumber(){
    
    final random = Random();
    final Set<int> mySet = {};
    
    while(mySet.length != 6) {
      mySet.add(random.nextInt(45)+1);
    }
    
    print('나의 번호');
    print(mySet.toList());
    
    return mySet;
  }

void checkNumber(lottoSet, mySet) {
  
  int match = 0;
  
  for(int lotto in lottoSet){
    for(int myNum in mySet) {
      
      if(lotto == myNum) {
        match++;
        print('당첨 번호 $myNum');
      }
    }
  }
  
  print('$match개의 당첨번호가 있습니다!');
}




