//
// HomeViewController.swift
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

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var diseaseTitle = ""
    var currentDisease: Disease?
    var diseaseArray = [Disease]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        diseaseArraySetup()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
    }
    func diseaseArraySetup() {
        diseaseArray.append(Disease(title: "Bardet Biedle Syndrome",description: "Bardet-Biedl syndrome is a complex disorder that affects many parts of the body including the retina. Individuals with this syndrome have a retinal degeneration similar to retinitis pigmentosa (RP).",areasAffected: "Retina",people: "1 in 140,000 to 1 in 160,000 Newborns. 1 in 17,000 Newborns in Newfoundland.",inherited: true,sources: "blindness.org, nih.org",keyFacts: "\u{2022} Lack of peripheral vision"))
        diseaseArray.append(Disease(title: "Cataracts",description:"A cataract is a clouding of the lens in the eye that affects vision. Most cataracts are related to aging. Cataracts are very common in older people. By age 80, more than half of all Americans either have a cataract or have had cataract surgery.",areasAffected:"Lens",people: "> 10 Million People",inherited:false,sources: "NEI",keyFacts:"\u{2022} Blurry vision \n\u{2022} It affects older people more"))
        diseaseArray.append(Disease(title: "Corneal Dystrophy", description: "Corneal dystrophies affect vision in different ways. Some cause severe visual impairment, while a few cause no vision problems and are only discovered during a routine eye exam. Other dystrophies may cause repeated episodes of pain without leading to permanent vision loss. Some of the most common corneal dystrophies include keratoconus, Fuchs’ dystrophy, lattice dystrophy, and map­-dot­-fingerprint dystrophy.", areasAffected: "Cornea", people: "About 8 Million People",inherited: true, sources: "nih.gov, NEI", keyFacts: "\u{2022} Blurry vision"))
        diseaseArray.append(Disease(title: "Diabetic Retinopathy", description: "In some people with diabetic retinopathy, blood vessels may swell and leak fluid. In other people, abnormal new blood vessels grow on the surface of the retina. The retina is the light-sensitive tissue at the back of the eye. A healthy retina is necessary for good vision.", areasAffected: "Retina", people: "8 Million People Affected Approximately",inherited: true, sources: "NEI", keyFacts: "\u{2022} Can't see random portions of their vision \n\u{2022} Affects people with Diabetes"))
        diseaseArray.append(Disease(title: "Glaucoma", description: "Glaucoma is a group of diseases that damage the eye’s optic nerve and can result in vision loss and blindness. (tunnel vision)", areasAffected: "Optic Nerve", people: "> 1 Million Cases a Year",inherited: false, sources: "NEI", keyFacts: "\u{2022} Lack of peripheral vision"))
        diseaseArray.append(Disease(title: "Leber's Congenital Amaurosis", description: "Leber congenital amaurosis (LCA) is an inherited retinal degenerative disease characterized by severe loss of vision at birth.  A variety of other eye-related abnormalities including roving eye movements, deep-set eyes, and sensitivity to bright light also occur with this disease.  Some patients with LCA also experience central nervous system abnormalities.", areasAffected: "Retinas", people: "2 to 3 per 100,000 Newborns",inherited: true, sources: "Blindness.org, Nih.gov", keyFacts: "\u{2022} Blurry vision"))
         diseaseArray.append(Disease(title: "Leber Hereditary Optic Neuropathy (LHON)", description: "Leber hereditary optic neuropathy (LHON) is a condition characterized by vision loss. Vision loss is typically the only symptom of LHON. Some families with additional signs and symptoms have been reported and are said to have \"LHON plus\", a condition which includes vision loss, tremors, and abnormalities of the electrical signals that control the heartbeat (cardiac conduction defects). Some affected individuals develop features similar to multiple sclerosis. Treatment is supportive and may include visual aids.", areasAffected: "Optic Nerve", people: "3.22 People per 100,000 People",inherited: true, sources: "Nih.gov", keyFacts: "\u{2022} Loss of central vision"))
        diseaseArray.append(Disease(title: "Macular Degeneration", description: "Age-related macular degeneration (AMD) is a disease that blurs the sharp, central vision you need for “straight-ahead” activities such as reading, sewing, and driving. AMD affects the macula, the part of the eye that allows you to see fine detail. AMD causes no pain.", areasAffected: "Retina, Macula", people: "> 10 Million People", inherited: false, sources: "NEI, Apollo Hospital", keyFacts: "\u{2022} Loss of central vision \n\u{2022} One of the most common vision diseases"))
        diseaseArray.append(Disease(title: "Neuromyelitis Optica (Devic's Disease)", description: "Devic’s disease, also known as neuromyelitis optica, is characterized by optic neuritis (inflammation of the optic nerve) and transverse myelitis (inflammation of the spinal cord). The condition is rare and similar to multiple sclerosis.", areasAffected: "Optic nerve, Spine", people: "0.52 to 4.4 People per 100,000 People",inherited: false, sources: "NEI, nih.gov/, fundaciongaem.org", keyFacts: "\u{2022} Loss of central vision"))
        diseaseArray.append(Disease(title: "Optic Nerve Hypoplasia", description: "Optic nerve hypoplasia (ONH) is a condition present at birth, characterized by an underdeveloped or absent optic nerve (bundle of nerves which transmit messages between the eyes and the brain). The effects of optic nerve hypoplasia have a broad range dependent on the adequacy of visual messages sent from the eyes to the brain, from little or no visual impairment to near-total blindness. The condition may affect one or both eyes.", areasAffected: "Optic Nerve", people: "10.9 People per 100,000 People",inherited: true, sources: "AFB, nih.gov", keyFacts: "\u{2022} Blurry vision"))
        diseaseArray.append(Disease(title: "Optic Neuritis (Neuropathy)", description: "Optic neuritis, an inflammation of the optic nerve, can be caused by infection and immune-related illnesses. In many cases, doctors are unable to determine a cause for the neuritis.", areasAffected: "Optic Nerve.", people: "15-20% of People with Multiple Sclerosis",inherited: true, sources: "NEI", keyFacts: "\u{2022} Blurry vision"))
        diseaseArray.append(Disease(title: "Retinal Detachment", description: "The retina is the light-sensitive layer of tissue that lines the inside of the eye and sends visual messages through the optic nerve to the brain. When the retina detaches, it is lifted or pulled from its normal position. If not promptly treated, retinal detachment can cause permanent vision loss.", areasAffected: "Optic Nerve", people: "< 1 Million People Cases a Year",inherited: false, sources: "NEI", keyFacts: "\u{2022} Loss of corner vision \n\u{2022} Black dots may be spread out in their vision"))
        diseaseArray.append(Disease(title: "Retinitis Pigmentosa (RP)", description: "Retinitis Pigmentosa is a group of rare, genetic disorders that involve a breakdown and loss of cells in the retina. Common symptoms include difficulty seeing at night and a loss of side (peripheral) vision.",areasAffected: "Retina (Photorecepter Cells)", people: "> 1 Million People",inherited:true, sources: "http://healthresearchfunding.org/, NEI", keyFacts: "\u{2022} Lack of peripheral vision"))
        diseaseArray.append(Disease(title: "Stargardt Disease", description: "Stargardt disease is the most common form of inherited juvenile macular degeneration. The progressive vision loss associated with Stargardt disease is caused by the death of photoreceptor cells in the central portion of the retina called the macula.", areasAffected: "Macula", people: "1 in 8-10 Thousand People",inherited: true, sources: "NEI, Blindness.org", keyFacts: "\u{2022} Lack of central vision \n\u{2022} Juvenile Macular Degeneration"))
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "disease") as? TableViewCell {
            cell.label.text = diseaseArray[indexPath.row].getDiseaseTitle
            cell.disease = diseaseArray[indexPath.row]
            cell.detail.text = diseaseArray[indexPath.row].getKeyFacts
            return cell
        }
        return UITableViewCell()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diseaseArray.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? TableViewCell
        diseaseTitle = (cell?.label.text)!
        tableView.deselectRow(at: indexPath, animated: true)
        currentDisease = cell?.disease
        self.performSegue(withIdentifier: "cameraView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cameraView" {
            if let destination = segue.destination as? CameraViewController {
                destination.diseaseTitle = (currentDisease?.getDiseaseTitle)!
                destination.currentDisease = currentDisease
            }
        }
    }
}
