//
//  Disease.swift
//  OpenSource
//
//  Created by Haasith Sanka on 8/15/17.
//  Copyright © 2017 Haasith Sanka. All rights reserved.
//

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
