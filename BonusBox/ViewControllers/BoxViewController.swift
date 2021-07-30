//
//  BoxViewController.swift
//  BonusBox
//
//  Created by まえけん on 2021/06/30.
//

import UIKit
import BubbleTransition
import RxSwift
import RxCocoa

class BoxViewController: UIViewController {
    let transition = BubbleTransition()
    let interactiveTransition = BubbleInteractiveTransition()
    let disposeBag = DisposeBag()

//    var userDefault = UserDefaults.standard
//    var lotteyBox:[String] = []
    
    @IBOutlet weak var lotteryButton: UIButton!
    @IBOutlet weak var operationGuidanceLable: UILabel!
    @IBOutlet weak var bonusBoxLable: UILabel!
    @IBOutlet weak var bonusBoxSelectingButton: UIButton!
    @IBOutlet weak var penaltyBoxLable: UILabel!
    @IBOutlet weak var penaltyBoxSelectingButton: UIButton!
    
    var bonusBoxSelected: Observable<Bool> { return bonusBoxSelect }
    var penaltyBoxSelected: Observable<Bool> { return penaltyBoxSelect }
    
    private let bonusBoxSelect = BehaviorSubject(value: true)
    private let penaltyBoxSelect = BehaviorSubject(value: true)
    
    private lazy var lotteryViewModel = LotteryViewModel(
        bonusBoxSelected: bonusBoxSelected,
        penaltyBoxSelected: penaltyBoxSelected,
        model: BoxSelect()
    )
    
    func tappedLotteryButton() {
        let lotteryViewController = UIStoryboard(name: "LotteryView", bundle: nil).instantiateViewController(withIdentifier: "LotteryView") as! LotteryViewController
        let lotteryButtonConvertCGPoint = lotteryButton.convert(CGPoint.zero, to: view)
        let lotteryButtonCGPointY = lotteryButtonConvertCGPoint.y
        lotteryViewController.lotteryButtonY = lotteryButtonCGPointY
        transitionAnimation(lotteryViewController: lotteryViewController)
        present(lotteryViewController, animated: true, completion: nil)
    }

    func transitionAnimation(lotteryViewController: LotteryViewController) {
        lotteryViewController.transitioningDelegate = self
        lotteryViewController.modalPresentationStyle = .custom
        lotteryViewController.modalPresentationCapturesStatusBarAppearance = true
        lotteryViewController.interactiveTransition = interactiveTransition
        interactiveTransition.attach(to: lotteryViewController)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLotteyButton()
        setUpButton(button: bonusBoxSelectingButton)
        setUpButton(button: penaltyBoxSelectingButton)
        
        bonusBoxSelectingButton.rx.tap.asObservable()
            .scan(true) { flag, _ in !flag }
            .subscribe(onNext: { (flag) in
                self.buttonAlpha(button: self.bonusBoxSelectingButton, selected: flag)
                self.bonusBoxSelect.onNext(flag)
            })
            .disposed(by: disposeBag)
        
        penaltyBoxSelectingButton.rx.tap.asObservable()
            .scan(true) { flag, _ in !flag }
            .subscribe(onNext: { (flag) in
                self.buttonAlpha(button: self.penaltyBoxSelectingButton, selected: flag)
                self.penaltyBoxSelect.onNext(flag)
            })
            .disposed(by: disposeBag)
        
        lotteryButton.rx.tap.asObservable()
            .subscribe(onNext: { [weak self] in
                self?.tappedLotteryButton()
            }).disposed(by: disposeBag)
        
        lotteryViewModel.operationGuidanceText
            .bind(to: operationGuidanceLable.rx.text)
            .disposed(by: disposeBag)
            
        lotteryViewModel.operationGuidanceColor
            .bind(to: LabelColor)
            .disposed(by: disposeBag)
        
        lotteryViewModel.lotteryButtonIsEnable
            .bind(to: lotteryButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    func setupLotteyButton() {
        lotteryButton.layer.cornerRadius = 50
        lotteryButton.layer.shadowOpacity = 0.7
        lotteryButton.layer.shadowRadius = 3
        lotteryButton.layer.shadowColor = UIColor.systemGray4.cgColor
        lotteryButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        lotteryButton.imageView?.contentMode = .scaleAspectFit
        lotteryButton.contentHorizontalAlignment = .fill
        lotteryButton.contentVerticalAlignment = .fill
    }
    private var LabelColor: Binder<UIColor> {
        return Binder(self) { me, color in
            me.operationGuidanceLable.textColor = color
        }
    }
    func buttonAlpha(button: UIButton, selected: Bool) {
        if !selected {
            button.alpha = 0.4
        } else {
            button.alpha = 1
        }
    }
}
