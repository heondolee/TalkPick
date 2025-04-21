//
//  EditCardModal.swift
//  TalkPick
//
//  Created by rundo on 4/19/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct EditProfileSheet: View {
    
    @Environment(\.dismiss) private var dismiss  // 모달 닫기용
    @Environment(\.modelContext) private var context
    
    let userId: UUID // 유저 아이디를 받는다
    @State private var user: User?

    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

    @State private var editedName: String = "" // New state variable for edited name

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button("취소") {
                    dismiss()
                }
                .foregroundColor(.red)
                .font(.headline.bold())

                Spacer()

                Text("프로필 편집")
                    .font(.headline.bold())

                Spacer()

                Button("완료") {
                    guard let user else { return }
                    user.name = editedName
                    user.imageData = selectedImageData
                    try? context.save()
                    dismiss()
                }
                .foregroundColor(.red)
                .font(.headline.bold())
            }
            .padding(.horizontal)

            Spacer()

            if let data = selectedImageData,
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
            }

            PhotosPicker(
                selection: $selectedItem,
                matching: .images
            ) {
                Text("사진 수정")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }
            .onChange(of: selectedItem) {
                Task {
                    if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("이름")
                    .font(.headline)
                TextField("이름 입력", text: $editedName)
                    .textFieldStyle(.plain)
                    .padding(.bottom, 4)
                Divider()
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top)
        .onAppear {
            let descriptor = FetchDescriptor<User>(
                predicate: #Predicate { $0.id == userId }
            )
            do {
                let result = try context.fetch(descriptor)
                user = result.first
                if let user {
                    editedName = user.name
                    selectedImageData = user.imageData
                }
            } catch {
                print("사용자 조회 실패: \(error)")
            }
        }
    }
}

#Preview {
    EditProfileSheet(userId: UUID())
}
