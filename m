Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1906606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zHCfr913;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gHG4sN4X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oCXi5c27gxkETQPEkp8qfLLdejyp5sedYaxTjamqL5A=; b=zHCfr913W0uc4l
	CujUzxOkLcCWKdmZG+IqKdvWA8/xoXy/boEEJOo2z/VeFxdymTs01A1h58xbRUoiUtt0wVwyw6dic
	kZ4aZRgoLDUbWIajpQuFNGl9JVUXhb+Nk1dtWJxAc7So/ldQ5/nLnp6BfDZlMOpHa/V+0EYCZzKi1
	iMQ0QmHVTnLr7mwk7msVN2a5tLh1ndptG59K+mcunsU7oeWBX5+HX8z8h7p3pxtjIY2TqVdBM6E4/
	Lt4RKAPWiEUL5N/97CJVpLFSXcpxQvAxfoDZpoPL1q+KQ0plv7pWNMoiohntuqUTqjhjx1mL3u6vz
	BspDPJMC6nIwjtaUU2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZK-00000009VfI-3Wja;
	Wed, 18 Nov 2026 16:31:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYF-00000009UcG-2aGA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:29 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48dee593f18so1101677f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019425; x=1795624225; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCXi5c27gxkETQPEkp8qfLLdejyp5sedYaxTjamqL5A=;
        b=gHG4sN4XOVor6ybHfIiecBnBamdvUDVHG4MXvaP3H4TP+zub7vyfaVQRBJ1uUDLeil
         Zy4brkuOoZFogbNRjaxtJi04RUe6lhnCoYM9Oc3D5+e6b40iI4++oTwlVyy93zDnCWF8
         9x3Iw6nQ8MbT9PcaSTuJoinEe25mqYNEIgwyF2qrnKCS4hQnAORp0tweEs3TToeRRWHN
         kRGs98UgTrUdPADcwNA6aEK5CfpQZJOQtE9skwykTF9r6eCRYAbfi4W7V3FtPD7Cq7f2
         g+xo8YAwUWcgxpIfkW0Aw/AuqTt6dW3UPlPRCIWayHkW30o7moO/b60nkLGIOxgye9zt
         njIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019425; x=1795624225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCXi5c27gxkETQPEkp8qfLLdejyp5sedYaxTjamqL5A=;
        b=JF5fswwl0UcwRZGnyN9Qql4Dat7A+0XmePbEyjTBJl0ewDRhr5+hUO3311BAom5ymA
         Y1hrXCCSiHuND5d6j78365lhSxmQMfbR3W8QMdd1JXDPkd6u4/lGuiVgm4fcaRS0osSD
         FA8zbzb76UGGEf2rpKlvv7svUA67I4byCx3XFH2dZjBSNU7ZQ8/y5BIBJ45s7fSdatmY
         32IRjEvnUNdoVDiBTZ7GMKMRTBchozRT2uMf3Eyomo4AMBKuxUzPkrPjaDyTQ+c2325F
         yVSBLmKSIXD2CZWwNVb0/ftFhB7KqCOjngQlr1LInBsfaiFDebQctENMIDUPXgp8d4Ml
         2Y7A==
X-Forwarded-Encrypted: i=1; AL+hErFbgal9bW9Cc9PTF1F7oFfVshSZavb5ocIqQ7h9EweJSkG+kqTndehO4MwnuCqbiXXr6AQ0Tg/7GOlz4nDLfemL@lists.infradead.org
X-Gm-Message-State: APuU4Z/ihiQ8iyTaGQQubK5ghkd0saCjNv1tcwD1BH17qSx/NmBHT+/p
	mnwZhJHVTd1A+YcLKZmPsQWie7fW20MOlK5K3l9KQy2ygbfhui2MDz6fHpYAYK2Ihc0=
X-Gm-Gg: AZFdTZciAkat0qFLJC9zwn7ACDbeulNxsnMf1Pd9KnZwBxGoblunx9kqm7Ho6q1BhUr
	QBTKF2xqvto6t8Wnhgvfwd1YIGE1Y+8ph7eO09BLe74EkQodWVeQ6ssW2dKgL7j5cK7P/GltQ8r
	zaZzlGqJJza6JgFVN3U0xHP9RKoKEr6xq83pooC2ZWlZCe8lLDMPxpEzhgdt1OXdZRyJslquh9C
	biRKQi97+K9LJ5qN65u4W11V44kC9maDgcvQNzns9J/N8AHoZ2fPVjXzgDOqTAdJCWwn2eF8cew
	ORZB/IS8A/YDH2TVcAsTJ4NesGhz79xX/ON+foLMCmTp+pAdmwj944vN6weE8pB6QAPEflIrS4x
	s/CwwQskd21F6IcaYzgAbfQ+RwWvzwn8/nNSbysCFEfgr/7MfK9LFpU4SRK6gJvV4G57vc6Pzve
	43Av3YkbaUAsk0QFMeUX+4ibSTNlS4HbXPdTezyOi9MjhV28ltL/lX+yiIezQ2E5L6+WEVaUQG8
	z5dT7TxtcclwX1y5PXwWc2qrRk+KYlP1lzantZ/hGm2SeY2ruGRJO88hROOvQTa8cthr5cQ+Nwv
	nNvuJDcGvG5cIFGiSO6M/mNgYY8iyfYS
X-Received: by 2002:a05:6000:26ca:b0:4a7:9630:7b57 with SMTP id ffacd0b85a97d-4a7963080f2mr4671595f8f.44.1795019425254;
        Wed, 18 Nov 2026 08:30:25 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:24 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:56 +0000
Subject: [PATCH 34/34] perf test cs-etm: Add an HHVM JIT call stack test
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-34-dad4d90747f6@linaro.org>
References: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
In-Reply-To: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>, 
 Suyash Mahar <smahar@meta.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_083027_709478_4A5D95A6 
X-CRM114-Status: GOOD (  14.05  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Record a Hack workload with HHVM's jitdump enabled and compare the
decode matches the expected order of execution.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/hhvm-jit.sh | 89 ++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/hhvm-jit.sh b/tools/perf/tests/shell/coresight/hhvm-jit.sh
new file mode 100755
index 000000000000..cde8725519e6
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/hhvm-jit.sh
@@ -0,0 +1,89 @@
+#!/bin/bash
+# CoreSight HHVM JIT call stacks (exclusive)
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+set -o pipefail
+
+perf list pmu | grep cs_etm > /dev/null || exit 2
+# Require TRBE so that the trace always has virtual timestamps.
+if ! ls /sys/bus/coresight/devices/trbe* > /dev/null 2>&1; then
+	echo "No TRBE sinks, skipping"
+	exit 2
+fi
+command -v hhvm > /dev/null || { echo "SKIP: missing hhvm"; exit 2; }
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_hhvm_jit.XXXXX)
+trap '[ "$?" -eq 0 ] && rm -rf "$tmpdir" || echo "HHVM JIT test files retained in $tmpdir"' EXIT
+trap 'exit 1' TERM INT
+
+# Use the control pipe to only trace the two call stacks rather than all of HHVM's startup.
+# Run stacks() twice to test hot and cold versions.
+cat > "$tmpdir/hello.hack" << 'EOF'
+function command(resource $ctl, resource $ack, string $cmd): void {
+  \fwrite($ctl, $cmd."\n");
+  \fflush($ctl);
+  // perf writes sizeof("ack\n"), including the trailing NUL.
+  invariant(\fread($ack, 5) === "ack\n\0", "Missing perf control ack");
+}
+
+<<__NEVER_INLINE>>
+function leaf(string $s): void {
+  echo $s;
+}
+
+<<__NEVER_INLINE>>
+function a2(string $s): void {
+  leaf($s);
+}
+
+<<__NEVER_INLINE>>
+function a1(string $s): void {
+  a2($s);
+}
+
+<<__NEVER_INLINE>>
+function b1(string $s): void {
+  leaf($s);
+}
+
+<<__NEVER_INLINE>>
+function stacks(string $hello, string $world): void {
+  a1($hello);
+  b1($world);
+}
+
+<<__EntryPoint>>
+function main(): void {
+  $ctl = \fopen(\getenv("PERF_CTL_FIFO") as string, "w");
+  $ack = \fopen(\getenv("PERF_ACK_FIFO") as string, "r");
+  command($ctl, $ack, "enable");
+  stacks("Hello, ", "world\n");
+  stacks("Hello, ", "world\n");
+  command($ctl, $ack, "disable");
+}
+EOF
+mkfifo "$tmpdir/ctl" "$tmpdir/ack"
+export PERF_CTL_FIFO="$tmpdir/ctl" PERF_ACK_FIFO="$tmpdir/ack"
+export JITDUMP_USE_ARCH_TIMESTAMP=1
+
+# HHVM deletes the jitdump on exit unless KeepPerfPidMap is set.
+perf record \
+	-o "$tmpdir/data" -e cs_etm//u -D -1 -m ,8M \
+	--control "fifo:$tmpdir/ctl,$tmpdir/ack" -- \
+	hhvm -vEval.PerfJitDump=1 -vEval.PerfJitDumpDir="$tmpdir" \
+	-vEval.KeepPerfPidMap=1 "$tmpdir/hello.hack" > "$tmpdir/out"
+[ "$(cat "$tmpdir/out")" = "$(printf 'Hello, world\nHello, world')" ]
+
+perf inject --jit -b \
+	-i "$tmpdir/data" -o "$tmpdir/injected.data"
+
+perf script -i "$tmpdir/injected.data" \
+	--itrace=b -F ip,sym > "$tmpdir/script"
+
+stacks="stacks a1 a2 leaf a2 a1 stacks b1 leaf b1 stacks"
+printf '%s\n' main $stacks main $stacks main > "$tmpdir/expected"
+sed -nE 's/^.*hello\.hack::(main|stacks|a1|a2|b1|leaf)$/\1/p' "$tmpdir/script" |
+	uniq > "$tmpdir/actual"
+diff -u "$tmpdir/expected" "$tmpdir/actual"
+echo "HHVM JIT call stacks match the expected sequence"

-- 
2.43.0


