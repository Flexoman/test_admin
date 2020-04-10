class Evaluation < ApplicationRecord

  belongs_to :candidate
  belongs_to :job, optional: true
  belongs_to :pipeline_stage, optional: true
  belongs_to :evaluation_form, optional: true
  has_many :evaluation_answers, dependent: :destroy

  enum rating: %w{
    dislike
    like
    perfect
  }

  def self.evaluation_data(c_ids)
    grouped_countes = self.group('rating', 'candidate_id').count

    c_ids.reduce({}) do |memo, c_id|
      memo[c_id] = ratings.keys.reduce({}) do |mm, rating|
        mm["#{rating}_count"] = grouped_countes[[rating, c_id]] || 0
        mm
      end
      memo[c_id]['total_count'] = memo[c_id].values.sum
      memo
    end
  end


end
