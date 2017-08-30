//
// Disease.swift
//
// Copyright 2017 Aira Tech Corp.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation

class Disease {
    var diseaseTitle: String = ""
    var descriptionText: String = ""
    var areasAffectedText: String = ""
    var peopleText: String = ""
    var inheritedBool: Bool = false
    var sourcesText: String = ""
    var keyFactsText: String = ""
    init (title: String, description: String, areasAffected: String, people: String, inherited: Bool, sources: String, keyFacts: String) {
        diseaseTitle = title
        descriptionText = description
        areasAffectedText = areasAffected
        peopleText = people
        inheritedBool = inherited
        sourcesText = sources
        keyFactsText = keyFacts
    }
    var getDiseaseTitle: String {
        return diseaseTitle
    }
    var getKeyFacts: String {
        return keyFactsText
    }
    var getDescriptionText: String {
        return descriptionText
    }
    var getAreasAffectedText: String {
        return areasAffectedText
    }
    var getPeopleText: String {
    return peopleText
    }
    var getInheritedBool: Bool {
        return inheritedBool
    }
    var getSourcesText: String {
    return sourcesText
    }
}
