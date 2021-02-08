class BookCommentsController < ApplicationController
    def create
        @book_comments = BookComment.where(book_id: params[:book_id])
        @book = Book.find(params[:book_id])
        @book_comment = BookComment.new(book_comment_params)
        @book_comment.user_id = current_user.id
        @book_comment.book_id = @book.id
        if @book_comment.save
            @book_comment = BookComment.new
        end
    end
    
    def destroy
        @book_comments = BookComment.where(book_id: params[:book_id])
        @book = Book.find(params[:book_id])
        @book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
        if current_user.id == @book_comment.user_id
          if @book_comment.destroy
            @book_comment = BookComment.new
          end
        end
    end
    
    private
    
    def book_comment_params
       params.require(:book_comment).permit(:comment)
    end
end