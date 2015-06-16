#region Old Stuff
#_ = require 'lodash'
# EventEmitter = (require 'events').EventEmitter
# history = require './history'
# download = require './download'
#
# emitter = new EventEmitter()
#
#
# chrome.runtime.onConnect.addListener (port)->
#   port.onMessage.addListener (msg)->
#     if msg.payload.op is 'queryHistory'
#       result = history.query(msg.payload.data)
#       port.postMessage {id:msg.id,payload:result}
#     if msg.payload.op is 'download'
#       download msg.payload.data
#     if msg.payload.op is 'queryHistoryAll'
#       result = history.queryAll()
#       port.postMessage {id:msg.id,payload:result}
#
# #Black Magic.
# chrome.webRequest.onBeforeSendHeaders.addListener((details)->
#   details.requestHeaders.push({name:'Referer',value:'http://www.pixiv.net'})
#   return {requestHeaders: details.requestHeaders}
# ,{urls:["http://*.pixiv.net/*"],tabId:-1},["blocking", "requestHeaders"])

#chrome.storage.local.set({history:require './out.json'})

# chrome.tabs.onUpdated.addListener (tabId,changeInfo,tab)->
# 	return if changeInfo.status is 'loaded'
# 	drawIcon(tabId,false)

if DEBUG then require 'shared/debug'
# Start Manager
manager = require './TabManager'

icon = require './IconService'
popup = require './PopupService'
#tabMeta = require './TabMetaService'

target = require 'target'

setup = ->
  target.PageMod [
    "*://www.pixiv.net/*"
    "*://bcy.net/*"
  ],['bundles/deps.js','bundles/content.js']

setup()