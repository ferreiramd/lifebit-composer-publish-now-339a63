nextflow.enable.dsl=2

include { fastqc_1 } from './modules/fastqc_1/module.nf'
include { fastqc_2 } from './modules/fastqc_2/module.nf'

workflow {
input1 = Channel.fromPath(params.fastqc_1.fastq)
fastqc_1(input1)
fastqc_2(fastqc_1.out.output1)
}
