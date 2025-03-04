type checkAutomaticallyValue = NEVER | ON_ERROR_RECOVERY | ON_LOAD | WIFI_ONLY

type launchContext
type manifest

@module("expo-updates") external channel: option<string> = "channel"
@module("expo-updates")
external checkAutomatically: option<checkAutomaticallyValue> = "checkAutomatically"
@module("expo-updates") external createdAt: Js.Nullable.t<Js.Date.t> = "createdAt"
@module("expo-updates")
external emergencyLaunchReason: Js.Nullable.t<string> = "emergencyLaunchReason"
@module("expo-updates") external isEmbeddedLaunch: bool = "isEmbeddedLaunch"
@module("expo-updates") external isEmergencyLaunch: bool = "isEmergencyLaunch"
@module("expo-updates") external isEnabled: bool = "isEnabled"
@module("expo-updates") external latestContext: launchContext = "latestContext"
@module("expo-updates") external launchDuration: Js.Nullable.t<int> = "launchDuration"
@module("expo-updates") external manifest: manifest = "manifest"
@module("expo-updates") external runtimeVersion: Js.Nullable.t<string> = "runtimeVersion"
@module("expo-updates") external updateId: Js.Nullable.t<string> = "updateId"

// Hooks

type updateInfo = {
  createdAt: Js.Date.t,
  manifest: option<manifest>,
  updateId: option<string>,
}

type currentlyRunningInfo = {
  channel?: string,
  createdAt?: Js.Date.t,
  emergencyLaunchReason: Js.Nullable.t<string>,
  isEmbeddedLaunch: bool,
  isEmergencyLaunch: bool,
  launchDuration?: int,
  manifest?: manifest,
  runtimeVersion?: string,
  updateId?: string,
}

type rec useUpdatesReturnType = {
  availableUpdate?: updateInfo,
  checkError?: Error.t,
  currentlyRunning: currentlyRunningInfo,
  downloadedUpdate?: updateInfo,
  downloadError?: Error.t,
  initializationError?: Error.t,
  isChecking: bool,
  isDownloading: bool,
  isUpdateAvailable: bool,
  isUpdatePending: bool,
  lastCheckForUpdateTimeSinceRestart?: Js.Date.t,
}

@module("expo-updates")
external useUpdates: unit => useUpdatesReturnType = "useUpdates"

type updateCheckResult = {
  isAvailable: bool,
  isRollBackToEmbedded: bool,
  manifest?: manifest,
  reason?: string,
}

@module("expo-updates")
external checkForUpdateAsync: unit => promise<updateCheckResult> = "checkForUpdateAsync"
@module("expo-updates") external fetchUpdateAsync: unit => promise<unit> = "fetchUpdateAsync"
@module("expo-updates") external reloadAsync: unit => promise<unit> = "reloadAsync"

// let getUpdateIdentifier = (~getFullId=false) => {
//   let updateId = updateId->Js.Nullable.toOption
//   let createdAt = createdAt->Js.Nullable.toOption

//   switch (updateId, createdAt) {
//   | (Some(id), Some(date)) =>
//     let dateTime = date->DateFns.formatOpt("yyMMdd-HHmm", DateUtils.formatOpt)
//     let slicedId = getFullId ? id : id->Js.String2.slice(~from=0, ~to_=4)
//     Some(`${dateTime}-${slicedId}`)
//   | _ => None
//   }
// }
