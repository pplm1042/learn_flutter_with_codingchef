# learn_flutter_with_codingchef

2022.02.25.  
<Stateful 개념 정리> 
* State가 변한 State객체를 비용이 싼 Stateful wiget으로 만들어서 계속 Rebuild하고 MyApp State객체는 Element Tree에서 Mutable하게 존재하면서 필요할 때마다 새로운 State를 저장함과 동시에 새롭게 Rebuild 된 Stateful 위젯만을 업데이트 해줍니다.

2022.03.02.
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
