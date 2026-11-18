Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56171606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k2nCKoRz;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bITZurwG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OWO/4pb+xROsjF0+5i909plVTiV5kvL03eZF9ypm+2s=; b=k2nCKoRzT4poiI
	yM92Bvc6vI7uFwjqRTAFXgVesHQd9NuO37iM/o8v7+TJ4nk278SFKecS6B3m3l1upTl1yyE5tqf+E
	8Yn+e8c18raIHN+n0EIORh3LnL6f/kUYc2rAlm8jaDJeTz7q70kpaXsctL3uqNKIQeWHFKw1aE/x2
	8OIEtjYyUlfJPMT9fzy1Wl2qf83k93dgOytaRWKUXvHPxIrWLX4IbMjjBgXC3wC3DjrpddFosL+jA
	d/AgzwbWOOCtxoCx/pr7lcleF6yVj6uvl5fbJJO30MrEWZoTqh/5IpiyoN1xPYhi/LMoFhd4mC8WG
	wgU+jMMrTE+TXKa8NuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZG-00000009VWX-1mQH;
	Wed, 18 Nov 2026 16:31:30 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYC-00000009UZe-1jEd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:26 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491971ac844so1206920f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019422; x=1795624222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWO/4pb+xROsjF0+5i909plVTiV5kvL03eZF9ypm+2s=;
        b=bITZurwGmZk6MieFVRFirgyocR2pvHLNCPQ/oOM678dT2Yj/uxj8a3xtqTCq4KMp3t
         5fDqYBom4QMTfjdm9VXkDbGUGMWUJlyZZyyAwguZ2yX5XpuVYAxM9gDIvCJeV0B1qzaJ
         ScUuZHkqh1yAQPnTmLVilIic5sZLcV25hJiTgvnfd1wlcUjf8a0+D9E+PUyfRrDDUCwj
         Lq6pPfNbWA6j/z90vuXp9WiipyZIzOz0tmvdUpDJbOuLz1lKXZR3U+5wTbYAn5GnaWdc
         8woFNyY4kQpESY3F75VEUnU8BbWqHLxxReuvtkE64FoAuCOZW72rGIxdfEiI96ZiQm48
         aPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019422; x=1795624222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWO/4pb+xROsjF0+5i909plVTiV5kvL03eZF9ypm+2s=;
        b=Nvz34XEsewhclxeFllDS9Oi2gSEZWD5m2GJ5IZ90hFZ+V7x0wskDA2NQpgpo6uuuVe
         0UMKaaD3xcvaW7jEHbHboZ05HR2b4nnALgm+U59LOxRBUsw9T6HzLzOMqq/6otVup2B5
         8As7hzapGH5HcMx7Aby7RxupDcaBawe48Oip36t0m6+aIYVUImsnVqW2cmEH/DI6zpdx
         7gMx+vSXsw8HJT3BubmLD67DVjdlH+KoFsfDCR0z7DdmKlz1c9YH5Ckw48R2MKBrHu3V
         NvHGCVrD4Yjm2cAPiIx1TNBoeEckFlyGxER7UnXv9PcFQOKl+aJWJi+dyxRcU9UneDn9
         eSlA==
X-Forwarded-Encrypted: i=1; AL+hErFaCVCRHOUh8tWKYF5TJc2DNDoAK+qQ58ep0ZGDasxHimHrgr40bmYWN5VgZiCr6/2o0GSvME5EP+lE4RPrn+fH@lists.infradead.org
X-Gm-Message-State: APuU4Z9E2UTPneTK51hWmio7XY+a5dQmIUY+re5EbIXPoqd3Wq+6g5PL
	sCx7t2p5WYTL3KE7Yg/x8UeL++1YxNka88931DyXnxoFHAdLZYSaHKkuej1mcfGJfP8=
X-Gm-Gg: AZFdTZcLlnWdwdnclkSv2mhI8Zc0DRELstIA+UJP9EUp0DlPc5DDagNPDB3I6EsipUV
	kvotTPLUxxUutGes/OZoCiKDbS4RKxWO//9Y9FrfGYOmrvd6FjyCB2xxThRiqBwDQ/Va4qCsFNi
	VZTTuhEqqvZ7iwbYl6ni4hwpCR0FC2qHZ9UQcpMKx2Y0J/VlNLzwW25BDuWHerVJJ6eQ2819Evk
	uyhGXZlvde4fftTEk+FdCcXRZFElF3DScEqOpZCEvE/DmwGkOkHAo6VdEOi1Nmj1pUilc5tIQJl
	75WYIKQj1ICVZtEAlSPP5vZu50BB/ia9doEqWSkT5C5eFxjBUZjsbW4y7jze70tbpUXY4Juh+8K
	nDwgThu4Ugx0qdLzSqCwZzRyjreKGOFIq8+3NlSfR2kHQWpyHcrixOW3JRJlwy1M0bpIEBW4hBa
	wUGcKynkOZQmsg6JP14UWcQzNzs+kp+HUsJo3nbtXM2287b+cleWcQKS7qEpShijAbCax74kKCJ
	hkJao2TXPQ2aIJW3PfCQGYjmac33u9X+kaTq9F+NjzI4jNtRQn/LQRMwmYWgZe5MN6ija/Z+PUD
	CLoqZRPkkJDyEzs9oPai0zXivBKD8Md/
X-Received: by 2002:a05:6000:184d:b0:4a6:4862:28fc with SMTP id ffacd0b85a97d-4a648622a17mr7753290f8f.7.1795019422213;
        Wed, 18 Nov 2026 08:30:22 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:21 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:53 +0000
Subject: [PATCH 31/34] perf test cs-etm: Add a Java JIT source-line test
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-31-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083024_512915_4C652055 
X-CRM114-Status: GOOD (  21.79  )
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

Record a deterministic Java workload using the JVMTI agent and check
that the decoded source lines match the expected sequence.

Alternate fresh class loaders and request garbage collection to
encourage address re-use so that we can test if trace timestamps match
up to jitdump events.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Makefile.perf                          |  4 +-
 tools/perf/tests/shell/coresight/java-jit.sh      | 65 ++++++++++++++++++
 tools/perf/tests/shell/coresight/lib/PerfJit.java | 82 +++++++++++++++++++++++
 3 files changed, 150 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index b74b534e1153..53c10e8e4556 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -992,7 +992,9 @@ install-tests: all install-gtk
 		$(INSTALL) tests/shell/base_report/*.sh '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/base_report'; \
 		$(INSTALL) tests/shell/base_report/*.txt '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/base_report'; \
 		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/coresight' ; \
-		$(INSTALL) tests/shell/coresight/*.sh '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/coresight'
+		$(INSTALL) tests/shell/coresight/*.sh '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/coresight'; \
+		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/coresight/lib'; \
+		$(INSTALL) tests/shell/coresight/lib/*.java -m 644 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/coresight/lib'
 
 install-bin: install-tools install-tests
 
diff --git a/tools/perf/tests/shell/coresight/java-jit.sh b/tools/perf/tests/shell/coresight/java-jit.sh
new file mode 100755
index 000000000000..cb6099efa899
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/java-jit.sh
@@ -0,0 +1,65 @@
+#!/bin/bash
+# CoreSight Java JIT source lines and code address reuse (exclusive)
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+set -o pipefail
+
+script_dir=$(dirname "$0")
+
+# Requires a HotSpot JDK (11+) and libperf-jvmti with line number support.
+perf list pmu | grep cs_etm > /dev/null || exit 2
+# Require TRBE so that the trace always has virtual timestamps.
+if ! ls /sys/bus/coresight/devices/trbe* > /dev/null 2>&1; then
+	echo "No TRBE sinks, skipping"
+	exit 2
+fi
+command -v java > /dev/null || exit 2
+command -v javac > /dev/null || exit 2
+command -v timeout > /dev/null || exit 2
+for lib in "${LIBJVMTI:-}" \
+	"$(dirname "$(readlink -f "$(type -P perf)")")/libperf-jvmti.so" \
+	"${PREFIX:-/usr}/lib64/libperf-jvmti.so" "${PREFIX:-/usr}/lib/libperf-jvmti.so"; do
+	if [ -f "$lib" ]; then
+		LIBJVMTI=$(readlink -f "$lib")
+		break
+	fi
+done
+[ -f "${LIBJVMTI:-}" ] || { echo "SKIP: missing libperf-jvmti.so"; exit 2; }
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_java_jit.XXXXX)
+trap '[ "$?" -eq 0 ] && rm -rf "$tmpdir" || echo "Java JIT test files retained in $tmpdir"' EXIT
+trap 'exit 1' TERM INT
+
+javac -g --release 11 -d "$tmpdir" "$script_dir/lib/PerfJit.java"
+mkfifo "$tmpdir/ctl" "$tmpdir/ack"
+export JITDUMPDIR="$tmpdir" JITDUMP_USE_ARCH_TIMESTAMP=1
+
+# Compile only run(), and collect trace only while it executes.
+# A small code cache and class unloading encourage address reuse.
+timeout 60s perf record \
+	-o "$tmpdir/data" -e cs_etm//u -D -1 -m ,8M \
+	--control "fifo:$tmpdir/ctl,$tmpdir/ack" -- \
+	java -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 \
+	-XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints \
+	'-XX:CompileCommand=compileonly,PerfJit$*::run' \
+	-XX:ReservedCodeCacheSize=4m -XX:+UseSerialGC \
+	-agentpath:"$LIBJVMTI" -cp "$tmpdir" PerfJit "$tmpdir/ctl" "$tmpdir/ack"
+
+perf inject --jit -b \
+	-i "$tmpdir/data" -o "$tmpdir/injected.data"
+
+perf script \
+	-i "$tmpdir/injected.data" --itrace=i1i -F ip,srcline \
+	--symbols 'PerfJit$First.run(),PerfJit$Second.run()' > "$tmpdir/script"
+
+# The workload runs eight pairs of First.run() and Second.run().
+awk '/\/\/ TRACE$/ { lines = lines "PerfJit.java:" NR "\n" }
+     END { for (i = 0; i < 8; i++) printf "%s", lines }' \
+	"$script_dir/lib/PerfJit.java" > "$tmpdir/expected"
+
+# Ignore entry/return lines and retain the order of the marked Java lines.
+sed -n 's/^.*PerfJit\.java:/PerfJit.java:/p' "$tmpdir/script" | uniq > "$tmpdir/lines"
+grep -Fxf "$tmpdir/expected" "$tmpdir/lines" > "$tmpdir/actual" || true
+diff -u "$tmpdir/expected" "$tmpdir/actual"
+echo "Java JIT source lines match the expected sequence"
diff --git a/tools/perf/tests/shell/coresight/lib/PerfJit.java b/tools/perf/tests/shell/coresight/lib/PerfJit.java
new file mode 100644
index 000000000000..30b22e952bd4
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/lib/PerfJit.java
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+import java.io.FileInputStream;
+import java.io.FileWriter;
+import java.io.InputStream;
+import java.util.Arrays;
+
+public class PerfJit {
+    public static class First implements Runnable {
+        public static volatile int value;
+        public void run() {
+            value += 1; // TRACE
+            value += 2; // TRACE
+            value += 3; // TRACE
+            value += 0; // Give the last checked line a DWARF end address.
+        }
+    }
+
+    public static class Second implements Runnable {
+        public static volatile int value;
+        public void run() {
+            value += 4; // TRACE
+            value += 5; // TRACE
+            value += 6; // TRACE
+            value += 0; // Give the last checked line a DWARF end address.
+        }
+    }
+
+    static FileWriter control;
+    static FileInputStream ack;
+
+    static void command(String command) throws Exception {
+        if (control != null) {
+            control.write(command + "\n");
+            control.flush();
+            // perf writes sizeof("ack\n"), including the trailing NUL.
+            byte[] reply = new byte[5];
+            if (ack.readNBytes(reply, 0, reply.length) != reply.length ||
+                !Arrays.equals(reply, new byte[] {'a', 'c', 'k', '\n', 0}))
+                throw new Exception("Missing perf control ack");
+        }
+    }
+
+    static void phase(String name, int repeats) throws Exception {
+        byte[] code;
+        try (InputStream in = PerfJit.class.getResourceAsStream("PerfJit$" + name + ".class")) {
+            code = in.readAllBytes();
+        }
+        // A fresh loader allows this class and its compiled code to be reclaimed.
+        Class<?> block = new ClassLoader(null) {
+            Class<?> load() { return defineClass(null, code, 0, code.length); }
+        }.load();
+        Runnable work = (Runnable) block.getConstructor().newInstance();
+        for (int i = 0; i < 20000; i++)
+            work.run();
+        command("enable");
+        for (int i = 0; i < repeats; i++)
+            work.run();
+        command("disable");
+    }
+
+    public static void main(String[] args) throws Exception {
+        if (args.length >= 2) {
+            control = new FileWriter(args[0]);
+            ack = new FileInputStream(args[1]);
+        }
+        int rounds = args.length >= 3 ? Integer.parseInt(args[2]) : 8;
+        int repeats = args.length >= 4 ? Integer.parseInt(args[3]) : 1;
+        // Warm up the FIFO path before enabling trace for the first method.
+        command("disable");
+        for (int i = 0; i < rounds * 2; i++) {
+            phase(i % 2 == 0 ? "First" : "Second", repeats);
+            for (int gc = 0; gc < 3; gc++) {
+                System.gc();
+                Thread.sleep(20);
+            }
+        }
+        if (control != null) {
+            control.close();
+            ack.close();
+        }
+    }
+}

-- 
2.43.0


