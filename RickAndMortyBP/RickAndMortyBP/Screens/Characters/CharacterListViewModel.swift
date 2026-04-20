//
//  CharacterViewModel.swift
//  RickAndMortyBP
//
//  Created by Bogdan Pankevych on 16.04.2026.
//

import UIKit

protocol CharacterListViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
}

final class CharacterListViewModel: NSObject  {
    weak var delegate: CharacterListViewModelDelegate?
    
    private var charactersList: [RMCharacter] = [] {
        didSet {
            for character in charactersList {
                let viewModel = CharacterCollectionViewCellViewModel(
                    name: character.name,
                    status: character.status.rawValue,
                    imageURL: URL(string:character.image))
                
                cellViewModels.append(viewModel)
            }
            delegate?.didLoadInitialCharacters()
        }
    }
    
    private var cellViewModels: [CharacterCollectionViewCellViewModel] = []
    
    func characterList() -> [Character] {
        RMService.shared.execute(
            .charactersList,
            expecting: RMMultiObjectsResponse<RMCharacter>.self
        ) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.charactersList = data.results
                }
            case .failure(let error):
                print(error)
            }
        }
        
        return []
    }
}

extension CharacterListViewModel: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? CharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        
        let cellViewModel = CharacterCollectionViewCellViewModel(
            name: "Name \(indexPath.item)",
            status: "Status \(indexPath.item)",
            imageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!
        )
        
        cell.configure(with: cellViewModel)
        cell.backgroundColor = .systemGreen
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
    
    
}
