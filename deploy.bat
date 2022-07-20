@echo on

plink -batch sol@%kin1% "gsutil cp /home/sol/stage/bin/solana-validator gs://kin-snapshots/bin/solana-validator"

plink -batch sol@%kin1% "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
plink -batch sol@%kin2% "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
plink -batch sol@%kin3% "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
plink -batch sol@%kin4% "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
plink -batch sol@%rpc1% "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
plink -batch sol@%rpc2% "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"


plink -batch sol@%kin1% "~/wipe_ledger.sh"
plink -batch sol@%kin2% "~/wipe_ledger.sh"
plink -batch sol@%kin3% "~/wipe_ledger.sh"
plink -batch sol@%kin4% "~/wipe_ledger.sh"
plink -batch sol@%rpc1% "~/wipe_ledger.sh"
plink -batch sol@%rpc2% "~/wipe_ledger.sh"

plink -batch sol@%kin1% "cp ~/snapshot-99273-9XQgP53GH2bqHLvKGfAePHPAN9a1tNwYRo4s9EzoMfRw.tar.zst ~/ledger"
plink -batch sol@%kin2% "cp ~/snapshot-99273-9XQgP53GH2bqHLvKGfAePHPAN9a1tNwYRo4s9EzoMfRw.tar.zst ~/ledger"
plink -batch sol@%kin3% "cp ~/snapshot-99273-9XQgP53GH2bqHLvKGfAePHPAN9a1tNwYRo4s9EzoMfRw.tar.zst ~/ledger"
plink -batch sol@%kin4% "cp ~/snapshot-99273-9XQgP53GH2bqHLvKGfAePHPAN9a1tNwYRo4s9EzoMfRw.tar.zst ~/ledger"
plink -batch sol@%rpc1% "cp ~/snapshot-99273-9XQgP53GH2bqHLvKGfAePHPAN9a1tNwYRo4s9EzoMfRw.tar.zst ~/ledger"
plink -batch sol@%rpc2% "cp ~/snapshot-99273-9XQgP53GH2bqHLvKGfAePHPAN9a1tNwYRo4s9EzoMfRw.tar.zst ~/ledger"
