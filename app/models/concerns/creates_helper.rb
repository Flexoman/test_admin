module CreatesHelper

  def create_default_stage(atts={})
    stage_type = atts&.dig(:stage_type).to_s

    pipeline_stages.create(
      title: stage_type.titleize,
      stage_type: stage_type,
      is_default: true,
      color: atts&.dig(:color) || PipelineStage::DEFAULT_COLOURS[stage_type.to_sym] || PipelineStage::DEFAULT_COLOR,
      sort_index: atts&.dig(:sort_index) || 0,
    )
  end


end