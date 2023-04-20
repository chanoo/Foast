# Foast - Simple Toast

안녕하세요! 여러분을 위해 Foast 라이브러리를 소개합니다. 이 라이브러리는 열렸던 뷰가 닫힌 후에도 토스트 메시지를 유지하는 강력한 기능을 제공합니다.

Foast 라이브러리를 사용하면, 사용자에게 중요한 정보를 전달하는 데 있어 더욱 효과적이며, 뷰 전환에 따른 메시지 손실을 방지할 수 있습니다. 이 라이브러리는 사용하기 쉽고 높은 확장성을 가지고 있어, 다양한 프로젝트에 적용하기에 적합합니다.

GitHub에서 Foast 라이브러리를 확인하고 프로젝트에 활용해 보세요. 여러분의 소중한 피드백과 기여를 기다리고 있습니다. 함께 더 나은 사용자 경험을 만들어가요!

# Preview 

<img src="https://user-images.githubusercontent.com/3335290/233443372-ea85b7da-7615-400b-b5a2-d8fe5900c4de.gif" alt="screenshot" width="300">

# Swift Package Manager

Swift Package Manager는 Swift 코드 배포를 관리하는 도구입니다. 종속성 다운로드, 컴파일 및 연결 프로세스를 자동화하기 위해 Swift 빌드 시스템과 통합되었습니다.

Xcode 을 사용하여 Foast를 Xcode 프로젝트에 통합하려면 아래 링크를 참고하세요.  
https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app

```
https://github.com/chanoo/Foast, :branch="main"
```

# Usage

```swift

import Foast

...

Foast.show(message: "This is a sample text using 'Hello, world!'")
```
