open ReactNative

module Section = {
  @react.component
  let make = (~title: string, ~children: React.element) => {
    <View style={Style.s({marginTop: 32.->Style.dp, paddingHorizontal: 24.->Style.dp})}>
      <Text
        style={Style.s({
          fontSize: 24.,
          fontWeight: #600,
          color: "black",
        })}>
        {title->React.string}
      </Text>
      <Text
        style={Style.s({
          marginTop: 8.->Style.dp,
          fontSize: 18.,
          fontWeight: #400,
        })}>
        {children}
      </Text>
    </View>
  }
}

@react.component
let make = () => {
  <SafeAreaView style={Style.s({backgroundColor: "white"})}>
    <StatusBar barStyle=#"dark-content" backgroundColor="white" />
    <ScrollView style={Style.s({backgroundColor: "white"})}>
      <View style={Style.s({backgroundColor: "white"})}>
        <Section title="EAS TEST"> {"Bare React Native App"->React.string} </Section>
        // expo-updates가 잘 설정되었는지 확인하기 위한 문구
        <Text>
          {EASUpdates.runtimeVersion
          ->Js.Nullable.toOption
          ->Option.getOr("no runtime")
          ->React.string}
        </Text>
        // local에서만 되고 preview/production 빌드에서는 안됨
        <Image
          style={Style.s({width: 100.->Style.pct, height: 100.->Style.dp})}
          resizeMode=#contain
          source={Image.Source.fromRequired(Packager.require("./assets/ad-sample.png"))}
        />
      </View>
    </ScrollView>
  </SafeAreaView>
}
