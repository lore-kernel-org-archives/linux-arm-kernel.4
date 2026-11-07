Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93DC606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 05:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E5t4MH7T;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zL7XIwJJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vCTgyycIflOX8DIFUkseDn+OY9DjAvHPkZI6oEwJhxA=; b=E5t4MH7TZXCuDTkJ40iRl8D4YK
	CQ92/WbNht0sVAjAzRHNLjcKFh2QwlYO+JFbSlECaNXSVptzGkK+gV1P9S/XvR74PnIUvd2cZ0qsS
	MdReIwha5LXM+8EIK+601yudNi2DU0kRViBd0/mAJnvab41Kpjm5n/X07UEf+uOcJ6qVDx0s8L0Rk
	QqBkv3cz3ZYSamelzh0KBRko0IG7o/GxJFDR3pRREzGv+HsF/p97+tkbT0jOQU1uKgniyubjGFGkm
	kcGdobkf3o76ujaa22Zy9+i8LC1OurTlSigIeoUmdVx4Zl+bFN/aCz5Qwvva+ZNZ2MTsujSCnIVvO
	8WaQMJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPYo6-0000000EDjs-11zf;
	Sat, 07 Nov 2026 05:17:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPYo3-0000000EDjQ-0aIC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 05:17:36 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e9d7791b00so9627635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 21:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028654; x=1794633454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vCTgyycIflOX8DIFUkseDn+OY9DjAvHPkZI6oEwJhxA=;
        b=zL7XIwJJdE/+iORHhLCdcE9W7hcOUSlEYS8FuDIEXmXfmf9rmsm+6PLgKw77NP8Nvk
         T+7qe1DRmYwCcYGaQpveBAZSZtUbDzFG5v7E4HQd2d5MakB3iGoueyih7H6q0qxYFfu/
         2egXDj51A7F+5IAV1PhUtn8B+XrR8PRxN9wVrFvGABVi5Nda2tk35BU4EmpFHchkj9Eg
         cCI6pBFwzIRsikSVAjc/QyRfxIW8NQpJj8iXZmLINk4aA3U/czkaVgDC0sXpGPRfZFGk
         Akou2DGislffQJG1nY+ori6johC+tbO7u6F1pheZ2wO6s9o6YARQ2NKkuewLv5gzcpJL
         UpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028654; x=1794633454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCTgyycIflOX8DIFUkseDn+OY9DjAvHPkZI6oEwJhxA=;
        b=2bw+UrpV/6bNqBG/ewuqNcuVd8x8Yi+5HpMH4UsTAHsD58SNGNAambIsam/2NsUg6D
         CWnUWJQZr7CUvXxfG/TSVAwS1c3d93hc0Sg1zlawJ5AN80a9bShipexy6lZCF5R1q64S
         zMQn57MH/maI03hoyUkWI4fCODktCr28mVROrgVs7CF1Gf/qpOanHoL9UiXk9eDNz38s
         xPzQkv21B5sKHklgGND92zKKyUQPMoT7/mu8ADpzB8i+Wimt0IAIjgwm//8QF3z4eYdJ
         SINkbuUi4D9+YX/0NbuCO9jgdQNO7BbivrWLfSlUh0GcXxMy4W4lB4nyaxj+XMoNwxIG
         BImg==
X-Forwarded-Encrypted: i=1; AL+hErHao8mj/QxfC2lLgk0+YLOyhA0AAOBUxqSwcJiW4mQgq6MiY1a61iWAvGOBoQPk5eR6uTHRY+plNZQYUkWEjP+1@lists.infradead.org
X-Gm-Message-State: APuU4Z9jwp6jpbFuw9x7x2/JBpBNuouxAbvhbYdd0hnwJ/ot8h1/ZgzV
	7bBsGv9D2GvHgaA9FZZfi0+VNDNwvf18Saxv1EEHjs7Tq03q+7fYn+4e
X-Gm-Gg: AYBFou24YI/kNMILBQUFi88l7etDK+YgdpoHXQSo1vGIa+d1/pborRSEUiuu3CIn4fW
	anH6fYQ2iyyXT6KTLwXhmjxvjL0xB03nQiPi24xpwKGVG5XUQ55o58bpImST28y0m/Ao4R/bIwd
	COW6VUWQF3APYQQOwebvfOhL00zWjCvgbUi1DyDIS8GinGmiaehe5SnRiWXLOZ7uMYNPgLDhOss
	GkWnYzHA6U+hFAF1sz5GsXk5f0Y3BBtB/Ky3xq9IELCIn/gfRWXjYyM3/5xXLT1E9UgQok3vcZN
	Pxru6Rsv7w5Xp11ROFTizaVOdgVBXezNSoM8wrcsc+u54fkPPFShoF3RNKO7gpiychOtK/LhWIT
	+1aVfKMDAD7WyGie+LYlRzCmF4tQWrG5zF8Ul762vaacMhTNDCwPyxlwsOmr6dJiAMTVP881D57
	emQqBaFJZAEa54gNJhlOIUDgZ1P/JgUNCV3dZ/gDaBkSJGusuH4I2mClO9uruuZDW5gppUTZ4LW
	Q2MX3YbtbalhFxDLKKOq7asMaQiHWF4zkmXFPLhiTygWNtwXQPCb9UxTdiwbv5KbWpvw1lj2HvF
	iOdchBYpaEa6MT8r9vZAhQ==
X-Received: by 2002:a17:90b:3c86:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3b0db7074c1mr4345247a91.37.1794028654209;
        Fri, 06 Nov 2026 21:17:34 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b103435561sm1133772a91.3.2026.11.06.21.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:17:33 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	John Garry <john.garry@linux.dev>,
	James Clark <james.clark@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] perf vendor events arm64: AmpereOne/AmpereOneX: Fix typos
Date: Sat,  7 Nov 2026 05:17:30 +0000
Message-ID: <20261107051730.1880691-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_211735_216000_470B5C92 
X-CRM114-Status: GOOD (  12.62  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Three distinct words are misspelled in eight description fields in the
AmpereOne and AmpereOneX PMU tables: "Preditable" in BPU_BTB_UPDATE
(AmpereOneX only), "satisified" in LD_FROM_ST_FWD, and "misprediciton"
in the branch_mispredict metric.  jevents.py copies the strings into the
generated tables, so perf list prints them and a grep for the correct
spelling misses the entries.

Fix both fields where an entry has them; the metrics entries carry only a
brief description.  No event code, metric expression or reported value
changes, and the generated tables are not tracked, so the diff is JSON
only.  ISTALL - the other codespell hit here - is the ETM stall-control
bit name, left alone.

Written with Hermes Agent, an LLM assistant.  Running jevents.py on this
change produces none of the three words; perf was not rebuilt, so the
perf list output was not checked.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 .../arch/arm64/ampere/ampereone/core-imp-def.json         | 4 ++--
 .../pmu-events/arch/arm64/ampere/ampereone/metrics.json   | 2 +-
 .../arch/arm64/ampere/ampereonex/core-imp-def.json        | 8 ++++----
 .../pmu-events/arch/arm64/ampere/ampereonex/metrics.json  | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/core-imp-def.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/core-imp-def.json
index 879ff21e0b17..5a82a7717060 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/core-imp-def.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/core-imp-def.json
@@ -450,10 +450,10 @@
         "BriefDescription": "OFB full cycles"
     },
     {
-        "PublicDescription": "Load satisified from store forwarded data",
+        "PublicDescription": "Load satisfied from store forwarded data",
         "EventCode": "0xD605",
         "EventName": "LD_FROM_ST_FWD",
-        "BriefDescription": "Load satisified from store forwarded data"
+        "BriefDescription": "Load satisfied from store forwarded data"
     },
     {
         "PublicDescription": "L1 prefetcher, load prefetch requests generated",
diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/metrics.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/metrics.json
index 324104438e78..76cdf38b1e58 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/metrics.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/metrics.json
@@ -260,7 +260,7 @@
     {
         "MetricName": "branch_mispredict",
         "MetricExpr": "(BR_MIS_PRED_RETIRED / GPC_FLUSH) * slots_lost_misspeculation_fraction",
-        "BriefDescription": "Fraction of slots lost due to branch misprediciton",
+        "BriefDescription": "Fraction of slots lost due to branch misprediction",
         "MetricGroup": "TopdownL2",
         "ScaleUnit": "1percent of slots"
     },
diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/core-imp-def.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/core-imp-def.json
index eb5a2208d260..558b13fd7d0d 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/core-imp-def.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/core-imp-def.json
@@ -84,10 +84,10 @@
         "BriefDescription": "Predictable branch speculatively executed, unpredicted, that mispredict"
     },
     {
-        "PublicDescription": "Preditable branch update the BTB region buffer entry",
+        "PublicDescription": "Predictable branch update the BTB region buffer entry",
         "EventCode": "0x11c",
         "EventName": "BPU_BTB_UPDATE",
-        "BriefDescription": "Preditable branch update the BTB region buffer entry"
+        "BriefDescription": "Predictable branch update the BTB region buffer entry"
     },
     {
         "PublicDescription": "Count predict pipe stalls due to speculative return address predictor full",
@@ -438,10 +438,10 @@
         "BriefDescription": "Fill buffer full"
     },
     {
-        "PublicDescription": "Load satisified from store forwarded data",
+        "PublicDescription": "Load satisfied from store forwarded data",
         "EventCode": "0xD605",
         "EventName": "LD_FROM_ST_FWD",
-        "BriefDescription": "Load satisified from store forwarded data"
+        "BriefDescription": "Load satisfied from store forwarded data"
     },
     {
         "PublicDescription": "Store retirement pipe stall",
diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
index a29aadc9b2e3..a0dc917b9462 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
@@ -260,7 +260,7 @@
     {
         "MetricName": "branch_mispredict",
         "MetricExpr": "(BR_MIS_PRED_RETIRED / GPC_FLUSH) * slots_lost_misspeculation_fraction",
-        "BriefDescription": "Fraction of slots lost due to branch misprediciton",
+        "BriefDescription": "Fraction of slots lost due to branch misprediction",
         "MetricGroup": "TopdownL2",
         "ScaleUnit": "1percent of slots"
     },

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0


