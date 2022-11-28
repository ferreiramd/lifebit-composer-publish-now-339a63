nextflow.enable.dsl=2

include { skesa_1 } from './modules/skesa_1/module.nf'
include { fastqc_1 } from './modules/fastqc_1/module.nf'
include { fastqc_2 } from './modules/fastqc_2/module.nf'

workflow {
input1 = Channel.fromPath(params.skesa_1.fastq)
input2 = Channel.fromPath(params.fastqc_1.fastq)
skesa_1(input1)
fastqc_1(input2)
fastqc_2(fastqc_1.out.output1)
}
