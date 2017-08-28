//
// Disease.swift
//
// Copyright 2017 Aira Tech Inc.
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

class Disease
{
    var diseaseTitle:String = ""
    var descriptionText:String = ""
    var areasAffectedText:String = ""
    var peopleText:String = ""
    var inheritedBool:Bool = false
    var sourcesText:String = ""
    
    
    init( title:String,  description:String,areasAffected:String,people:String,_ inherited:Bool, sources:String)
    {
        diseaseTitle = title;
        descriptionText = description;
        areasAffectedText = areasAffected;
        peopleText = people;
        inheritedBool = inherited;
        sourcesText = sources;
    }
    
    var getDiseaseTitle:String {
        return diseaseTitle;
    }
    
    var getDescriptionText:String {
        return descriptionText;
    }
    
    var getAreasAffectedText:String {
        return areasAffectedText;
    }
    
    var getPeopleText:String {
    return peopleText;
    }
    
    var getInheritedBool:Bool {
        return inheritedBool;
    }
    
    var getSourcesText:String {
    return sourcesText;
    }
    
    
    
//    public ArrayList<Disease> createDiseaseList(int num) {
//    ArrayList<Disease> diseases = new ArrayList<Disease>();
//    
//    diseases.add(new Disease("Glaucoma","Glaucoma is a group of diseases that damage the eye’s optic nerve and can result in vision loss and blindness. (tunnel vision)","Optic Nerve","> 1 million cases a year", false, "Nei"));
//    
//    return diseases;
//    }

}
