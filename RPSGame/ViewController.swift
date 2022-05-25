//
//  ViewController.swift
//  RPS Game
//
//  Created by 권민서 on 2022/05/16.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var comChoice : Rps = Rps(rawValue: Int.random(in: 0...2))!
    var myChoice : Rps = Rps.rock
    
    
    //앱의 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1,2 번째 이미지에 준비 이미지를 띄워야함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        // 1,2 레이블에 준비라고 문자열을 띄워야함
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }


    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        //가위 바위 보에 대한 정보 저장
        
//        guard let title = sender.currentTitle else {
//            return
//        }
        let title = sender.currentTitle!
        
        switch title {
        case "가위" :
            myChoice = Rps.scissors
        case "바위" :
            myChoice = Rps.rock
        case "보" :
            myChoice = Rps.paper
        default:
            break
        }
    
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 컴퓨터가 랜덤 선택한 뷰를 이미지 뷰에 표시
        // 컴퓨터가 랜덤 선택한 뷰를 레이블에 표시
        switch comChoice {
        case Rps.rock:
            comImageView.image = UIImage(named: "rock.png")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = UIImage(named: "paper.png")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = UIImage(named: "scissors.png")
            comChoiceLabel.text = "가위"
        }
        
        // 내가 랜덤 선택한 뷰를 이미지 뷰에 표시
        // 내가 랜덤 선택한 뷰를 레이블에 표시
        switch myChoice {
        case Rps.rock:
            myImageView.image = UIImage(named: "rock.png")
            myChoiceLabel.text = "바위"
        case Rps.paper:
            myImageView.image = UIImage(named: "paper.png")
            myChoiceLabel.text = "보"
        case Rps.scissors:
            myImageView.image = UIImage(named: "scissors.png")
            myChoiceLabel.text = "가위"
        // 선택된 정보를 컴퓨터가 선택한 정보를 비교해서 승패 판단 후 문자열로 표시
            
            if comChoice == myChoice {
                mainLabel.text = "비겼다"
            } else if comChoice == .rock && myChoice == .paper {
                mainLabel.text = "이겼다"
            } else if comChoice == .paper && myChoice == .scissors {
                mainLabel.text = "이겼다"
            } else if comChoice == .scissors && myChoice == .rock {
                mainLabel.text = "이겼다"
            } else {
                mainLabel.text = "졌다"
            }
    }
}

    @IBAction func resetButtonTapped(_ sender: UIButton) {

        //컴퓨터가 다시 준비 이미지뷰를 표시
        //컴퓨터가 다시 준비 레이블을 표시
        comImageView.image = UIImage(named: "ready.png")
        comChoiceLabel.text = "준비"

        //내가 다시 준비 이미지뷰를 표시
        //내가 다시 준비 레이블을 표시
        myImageView.image = UIImage(named: "ready.png")
        myChoiceLabel.text = "준비"

        //메인레이블에서 선택하세요 표시
        mainLabel.text = "선택하세요"

        //컴퓨터가 가위 바위 보 랜덤 표시
        comChoice = Rps(rawValue: Int.random(in: 0...2))!

    }
    
}
    

