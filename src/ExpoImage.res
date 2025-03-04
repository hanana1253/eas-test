open ReactNative

type props = {source: Image.Source.t, style: Style.t, resizeMode: Style.resizeMode}

@module("expo-image")
external make: React.component<props> = "Image"
