//
//  IntentHandler.swift
//  QuickCallIntent
//
//  Created by Алексей Шумейко on 13.04.2021.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}
extension IntentHandler: SelectContactIntentHandling {
    func provideContactOptionsCollection(
      for intent: SelectContactIntent,
      with completion: @escaping (INObjectCollection<Contact>?, Error?) -> Void
    ) {
      /*var emojiItems = [Contact]()
      EmojiProvider.all().forEach { emojiDetails in
        let emojiIntentObject =
          EmojiINO(identifier: emojiDetails.id, display: "\(emojiDetails.emoji) \(emojiDetails.name)")
        emojiItems.append(emojiIntentObject)*/
      }
      //completion(INObjectCollection(items: emojiItems), nil)
}
