//nextflow run scratch.nf --myfile -process.debug true -process.scratch false -process.stageInMode 'symlink'
//nextflow run scratch.nf --myfile -process.debug true -process.scratch false -process.stageInMode 'copy'
//nextflow run scratch.nf --myfile -process.debug true -process.scratch true -process.stageInMode 'copy'
//nextflow run scratch.nf --myfile -process.debug true -process.scratch true -process.stageInMode 'symlink'


process test {

  input:
  path myfile
  
  output:
  path "*"
  
  script:
  """
  echo test1
  pwd
  echo "TMPDIR = $TMPDIR"
  readlink -f $myfile
  head -n 5  $myfile > head.txt
  readlink -f head.txt
  """

}

process test2 {

  input:
  path myfile
  
  output:
  path "*"
  
  script:
  """
  echo test2
  pwd
  echo "TMPDIR = $TMPDIR"
  readlink -f $myfile
  head -n1 $myfile > header.txt
  readlink -f header.txt
"""


}

// same as test but with no output
process test3 {

  input:
  path myfile
  
  
  script:
  """
  echo test3
  pwd
  echo "TMPDIR = $TMPDIR"
  readlink -f $myfile
  head -n 5  $myfile > head.txt
  readlink -f head.txt
  """
}

//run
workflow {

test2(test(channel.fromPath(params.myfile)))
test3(channel.fromPath(params.myfile))
}

test2(test(channel.fromPath(params.myfile)))
test3(channel.fromPath(params.myfile))
}
