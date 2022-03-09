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
   * cascade notation인 ..은 한 객체의 맴버함수를 호출하거나 속성에 접근할 수 있다.
   * shuffle()은 섞어준다. API 참고
   * sublist는 리스트의 특정 인덱스들을 불러올 때 사용한다.
   
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

  
## 2022.03.09.
<Future - async 심화 개념 정리>  [프로젝트](https://github.com/pplm1042/codingchef_future_ex)
### Future
1. 다트에 의해서 future 객체가 내부적인 배열에 등록
2. Future 관련해서 실행되어야 하는 코드들이 이벤트 큐에 등록
3. 불완전한 future 객체가 반환
4. Synchronous 방식으로 실행되어야 할 코드 먼저 실행
5. 최종적으로 실제적인 data값이 future 객체로 전달


#### Future 예제1

        void main() {
          print('Before the Future');
          Future((){print('Running the Future');}).
          then((_){print('Future is complete');});
          print('After the Future');
        }
        
        // 출력
        Before the Future(Synchronous)
        After the Future(Synchronous)
        Running the Future(EventLoop) <- EventLoop(선입선출)는 Synchronous먼저 처리 한 후 나중에 실행
        Future is complete(EventLoop)
        
### Async method
1. 메서드를 통해서 나오는 결과물은 future
2. await 키워드를 만날때까지 synchronous 방식으로 코드처리
3. await 키워드를 만나면 future가 완료될 때까지 대기
4. future가 완료되자마자 그 다음 코드들을 실행


#### Async 예제1
        
        String createOrderMessage(){
          var order = fetchUserOrder();
          return 'Your order is: $order';
        }

        Future<String> fetchUserOrder(){
          return Future.delayed(
            Duration(seconds: 2), 
            () => 'Large Latte',
          );
        }

        void main() {
          print('Fetching user order...');
          print(createOrderMessage());
        }
        
        // 출력
        Fetching user order...
        Your order is: Instance of '_Future<String>'
        
#### Async 예제1        
        
        Future<String> createOrderMessage() async{
          print('synchronous');
          var order = await fetchUserOrder();
          return 'Your order is: $order';
        }

        Future<String> fetchUserOrder(){
          return Future.delayed(
            Duration(seconds: 2), 
            () => 'Large Latte',
          );
        }

        void main() async{
          print('Fetching user order...');
          print(await createOrderMessage());
          print('sync1');
        }
        
        // 출력
        Fetching user order...
        synchronous
        Your order is: Large Latte
        sync1 <- await을 만나면 synchronous의 처리를 잠시 멈추는 것을 알 수 있다.
        
#### Async 예제2  
        
       
        void main() async {
          methodA();
          await methodB();
          await methodC('main');
          methodD();
        }

        methodA(){
          print('A');
        }

        methodB() async {
          print('B start');
          await methodC('B');
          print('B end');
        }

        methodC(String from) async {
          print('C start from $from');

          Future( () {
            print('C running Future from $from');
          }).then((_) {
            print('C end of Future from $from');
          });

          print('C end from $from');
        }

        methodD() {
          print('D');
        }
        
        // 출력
        A
        B start
        C start from B
        C end from B
        B end
        C start from main
        C end from main
        D
        C running Future from B <- EventLoop에 들어갔기 때문에 가장 나중에 출력된다.
        C end of Future from B
        C running Future from main
        C end of Future from main
  
        




