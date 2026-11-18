Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5C3606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HIT4qTUL;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kAJRgVkK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+JJCbgH72G6vONzb178wZztv+bSL7c5y2vdkikA5TlY=; b=HIT4qTUL9cztAQ
	3hNte6M3jkoW02V3SvQA/ubRhSdLIpZSzbC9q+uc6Rm7MC+T8dSb9Cc4vquatTJQKOLZYXwIp2/uf
	EY0qHVVdTJ/PFOzRUkPGNY3CH3eE+yLDjiEVRYs1hPwLFPRgSN0F1g1MPvPCybxGBLBdmgp0NviAQ
	NK01NXov16sAsRShtusk1OBHKDyEGdgJaQXGFSX3PmctzRdrGS45FqwI5rq6hGhhdNiZoHKPudaat
	AQg9+BKEniqp2qr8hBPh1zY0lZTiTRuckv/RddgwSAdUwe46vfcmQ2LQ1J7GkuFORmIzzhPM6AKyi
	mKOmNevN4XakOHXoIgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZH-00000009VY3-0WcN;
	Wed, 18 Nov 2026 16:31:31 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYE-00000009UbI-2jug
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:27 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1080267f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019424; x=1795624224; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JJCbgH72G6vONzb178wZztv+bSL7c5y2vdkikA5TlY=;
        b=kAJRgVkKkAUf4Kg/dWaDT4GVEhd7y5/lvQbHIhVUgUiz3EsEsZ6PtdFP/649pezrCH
         nSMCj/ybRfn3qeHUkGO++LyagaAt2yATnW7R/IbAliSgOoKMCUUR6OpiMTZXRydm6Dq1
         Ec4i8808354mlSEClviEoX7DDv564A5FxTcYpLgjN0FhCdEiN6FGy4oZgrGyiFPNGEsh
         y08mgMtfdRHB3w2+QP2SS5XyM/+aLCRTTSPDugXNC44vPsirvkmQVN027PGNk063iMQt
         G4Usl9XxOxnEXr0XxCJUpxHBoWcdcqld6ZQixRrM9Ys7b14Ysy3htUrcQo48c0Bpr/+D
         ZAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019424; x=1795624224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JJCbgH72G6vONzb178wZztv+bSL7c5y2vdkikA5TlY=;
        b=yAOEJpsDSxPzFP/R2RPKqq/KTGFN9mAOeYmK5JCeotTbUQisHtK1K4Kfzk1irWQcYv
         1JaCAKUPyAaSQFWgYakkjKKMScD48Ew/q2qED2X8XXAVR8HsDmtnRAbZJicYvPUBI1rp
         VP32gXI0fuRA2BXZSrkcfrCGE6+2dFVFfFfS4UWX4lg1qIWLrs9Hqe3+PCNbopTG5l6h
         JQNccPb6gFnLchTKVc62TPTHFw/L1GcZsC2kd9T13F0hOSRM9bCZUn2H2GnMUFg/xGMB
         /K0QBoLtwEA6ZbQafkxMsFQ+IdiCNuHqBzsrxR1mQD6RObDVpvH8T6Z4Yagm71HvduSw
         hwSA==
X-Forwarded-Encrypted: i=1; AL+hErH96/FLEqInwxTENwB/VxYkm1q9PZNkYntIyN+P6EFFO71o7kdeqYdwmo5tjtByot6g1vprALXN3Dp+7eeBQfJS@lists.infradead.org
X-Gm-Message-State: APuU4Z9DwSk1rWeFBBXLrT7Uo15yMjDC6ceccB6Z601myUagyhYXMQYb
	/B0f0NXaoljTRmnB7MAKNvbgoy4F2H+EeqFSBbdMY84gg+fbSRYOlNZPfQyKjq/4qZU=
X-Gm-Gg: AZFdTZcCOGYkK3NOfXYXN1E5XtyMTGoISryqOA3ZqQQhk6HeKih/Fk8HW8VAKpwykOw
	gnrChBQ7FllvXf/dGQkDG5ZNbT769SfxOe8m1OWGbBjDW2AZSTdYPh2l0ak0M2abMmWsvk6AcLd
	33GLWVglbiiCG3XBLKhdAU6sObHJChFt1GBhQ28mjm7yfZCldcYzSV3DVXJPiIGMPrnbugK6v4d
	BH0iDlgto+NjhHXPxiQ8vguaH4dAIJ07yDPgrvGhE+WKMEYFPLP+d2gS/H6GVRDYZPuxrEwxYiH
	gQFshYHWGV4z6xkcNur6jm16jtU/G8GATDKbj8OUZm3uLoxhIAqYyagqBPeNkyhcNI0jTNf252S
	L7uBpAdlx0tU3ccnvR57qFFOUZmO9Gr7cWV97bhib1QIVyR44tE4wyzh4X5DauD3U+ABj1aEQpL
	M9Ke8i0NXAmEhSvr9YG6gqbD3wgx6q/qWxHstajYHqtDDAwGhEaH40K2B1h0ZYUPdgaOlJHt0q8
	WL7hOOIMmD3gzIFznBkxYoVtFZ091bByXvSPJXA3tT9M1g6KtcrUJR7NgCKBMJ3s09uMqaYsCFC
	Txtd6ZzD9Y3X9eXG9AUwCIys02f2HDHP7Q==
X-Received: by 2002:a05:6000:4b19:b0:4a7:7bec:e16d with SMTP id ffacd0b85a97d-4a77bece3f4mr3727104f8f.20.1795019424204;
        Wed, 18 Nov 2026 08:30:24 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:23 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:55 +0000
Subject: [PATCH 33/34] perf test cs-etm: Test decoding of kernel modules
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-33-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083026_807704_D3935AC9 
X-CRM114-Status: GOOD (  14.29  )
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

If kernel symbols are available, test that recording the kernel results
in etm4_enable* and etm4_disable* symbols. Use these symbols because
they will always be present when using trace.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/kernel_module.sh | 54 +++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/kernel_module.sh b/tools/perf/tests/shell/coresight/kernel_module.sh
new file mode 100755
index 000000000000..96bacb02b1fb
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/kernel_module.sh
@@ -0,0 +1,54 @@
+#!/bin/bash -e
+# CoreSight kernel module decode (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+if [ "$(id -u)" != 0 ]; then
+	# Requires root for kernel trace and symbols
+	echo "[Skip] No root permission"
+	exit 2
+fi
+
+if ! perf probe --dry-run --module coresight_etm4x \
+	--add etm4_enable_trace_unit > /dev/null 2>&1 &&
+   ! perf probe --dry-run --add etm4_enable_trace_unit > /dev/null 2>&1; then
+	echo "[Skip] Kernel debug symbols for Coresight aren't available"
+	exit 2
+fi
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_kernel_module.XXXXX)
+
+cleanup() {
+	rm -rf "${tmpdir}"
+	trap - EXIT TERM INT
+}
+
+trap_cleanup() {
+	cleanup
+	exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+if ! perf record -o "$tmpdir/data" -e cs_etm//k -- true > /dev/null 2>&1; then
+	echo "[Fail] Failed to record kernel ETM trace"
+	cleanup
+	exit 1
+fi
+
+perf script -i "$tmpdir/data" --itrace=b -F ip,sym \
+	> "$tmpdir/script" 2>/dev/null
+
+# enable_* and disable_* functions always run so check they were decoded
+for symbol in etm4_enable etm4_disable; do
+	if ! grep -q "$symbol" "$tmpdir/script"; then
+		echo "No branches decoded in $symbol"
+		cleanup
+		exit 1
+	fi
+done
+
+cleanup
+exit 0

-- 
2.43.0


