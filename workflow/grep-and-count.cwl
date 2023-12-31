#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
inputs:
  grep_pattern:
    type: string #文字列
  target_file:
    type: File #ファイル
outputs:
  counts:
    type: File
    outputSource: 2_wc/word_counts 
steps:
  1_grep:
    run: ../Tools/grep.cwl
    in:
      pattern: grep_pattern
      file_to_search: target_file
    out: [results]
  2_wc:
    run: ../Tools/wc.cwl
    in:
      file: 1_grep/results
    out: [word_counts] 
