#!/bin/bash

ssh sol@$kin1 "gsutil cp /home/sol/stage/bin/solana-validator gs://kin-snapshots/bin/solana-validator"

ssh sol@$kin1 "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
ssh sol@$kin2 "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
ssh sol@$kin3 "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
ssh sol@$kin4 "cd /home/sol/.local/share/solana/install/active_release/bin/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
ssh sol@$rpc1 "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"
ssh sol@$rpc2 "cd /home/sol/ && gsutil cp gs://kin-snapshots/bin/solana-validator solana-validator && chmod u+x solana-validator"


ssh sol@$kin1 "~/wipe_ledger.sh"
ssh sol@$kin2 "~/wipe_ledger.sh"
ssh sol@$kin3 "~/wipe_ledger.sh"
ssh sol@$kin4 "~/wipe_ledger.sh"
ssh sol@$rpc1 "~/wipe_ledger.sh"
ssh sol@$rpc2 "~/wipe_ledger.sh"

SNAP=snapshot-99273-9XQgP53GH2bqHLvKGfAePHPAN9a1tNwYRo4s9EzoMfRw.tar.zst
#SNAP=snapshot-249289-FxH3fQKYTRdoxoCvxMsMvjyr7GQRveaNftPTKmyTdMhf.tar.zst

ssh sol@$kin1 "cp ~/$SNAP ~/ledger"
ssh sol@$kin2 "cp ~/$SNAP ~/ledger"
ssh sol@$kin3 "cp ~/$SNAP ~/ledger"
ssh sol@$kin4 "cp ~/$SNAP ~/ledger"
ssh sol@$rpc1 "cp ~/$SNAP ~/ledger"
ssh sol@$rpc2 "cp ~/$SNAP ~/ledger"
