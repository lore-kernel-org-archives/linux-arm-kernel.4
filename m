Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C46F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 18:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a5+lQA0T;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x5Ir28RQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KLhGHJD0w6qogzd6hlhJL13wlPNhn8Vr3qPOak0i+BQ=; b=a5+lQA0TelXOpoM0EkUFTgOXln
	syaQxNCtTwii1rxQOeOUFbonw/wIvBJqNk+U6AcIdZHKRE7MyRYCDlG0sZd8sDAdwyIL2e6LvKlyL
	ekdVJtcC8wlR37LKkB+hvE6fK5PHXJq/7nyBXoHOhE2meusUsMx4R5zsPhv7hfUzo4J+cA/peeVCV
	wvJwFMe6ngStvynlsd80k+AoA6+c5IHXn+EWv1+0Pyq6GqRpHPjAzCXlooi1ieqiXCK2kU42nlNO+
	eWzlRX/bSTbnO7o6tgQ55QRb3X3P7nHW54/iGHnDyH+jXAbRh3GvMjG0gVf1dfasIg9eMHwt3AGVM
	O3c/dtTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ7uv-0000000GUyU-3UEZ;
	Sun, 08 Nov 2026 18:47:01 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ7ut-0000000GUy9-1znv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 18:47:00 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-3704d30b84fso256925eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 10:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794163618; x=1794768418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KLhGHJD0w6qogzd6hlhJL13wlPNhn8Vr3qPOak0i+BQ=;
        b=x5Ir28RQo2I98wEIk/22X1K1FtWSQEi7PwOQOgWpabd5b0Tf/+gl+qz3FNkYLT+4tX
         WI6BtAmkwprbT4PylkvMDaSRBKSOUc8ToV0ldTSl0FULo5vtajzAp6LA/UnzROvbWU3w
         +OQpYz1pp3HNfLo1fmnEVSONcc8Vtcx7afeHqkqx9WNBr1P9CbLw0bevbrL+yKkLHlLq
         7CeUO2SNodDklPExMJU9qd4HDZzHZ2nRcri0W6+B8Y8/dVZdDj6Q4GZuBZYn6Ojnl6Gp
         gDGvALCJ57CXwqzk5VCtP7RzPoIkGDMYA9WFZi9ps2mBJp8dRTmk/SOhbqaKAJZgXdY8
         xxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794163618; x=1794768418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLhGHJD0w6qogzd6hlhJL13wlPNhn8Vr3qPOak0i+BQ=;
        b=UGlvAdx3Iw/PbtOw3D0F5Jcs590ogysF1+taR3nvdF00M4/suSHDjx87y0PwhZZe3j
         XwAGgmdv5xbl0+Vm2raq/tHx3y+86rciuu4BYeGaX+FPJjFMHogZg1FEHMv87ZTVnY+N
         doE1MWM2J08AF2A0lODKtAzM5sncLijh6VY+8VY4in+bMs47vBJdaHVftovnb9EzAYDS
         svQ+85oBc6xdm82pzwn7CMNX5yh28DR7FPWxJSxR9nZXLcmBSYnaq0f39EUG3tH6he1c
         Gal2ICFTxLgNkOCGbSg7eTFAuLsHFCQrMeR3mw/1pXIWfp9g/EUDjvy1ECqe1paXRuAu
         ye5g==
X-Forwarded-Encrypted: i=1; AL+hErFyYD+Gp4Tf3AVbwZeqLCxox863b2Jcex9sAxGYRwfUKtt/TxZdCn0rCYeNRQ1KVvRlTDCGBkO+JNmibQLK1wLf@lists.infradead.org
X-Gm-Message-State: APuU4Z+U89D6gzNn2FwaAMoQ5oNPKoTgbN+biuRLgxAMJ9Lz8b5s+kSu
	jvCXyf6XgIakUwn82NS10lHOi6QCk3fyselBlgMpdH/cK/U3WeMBYmFE
X-Gm-Gg: AYBFou3q+8KyNksRk8JBtKfYgWaqFh13Fl+V2DrnQy2eI5b/zw64m7CMec9sWgY8plW
	b6uwwjGIpGKovO/5CsupcJyZA5CyyPaibNmEpJx6mpnHgmGbH7QxbIQqJSVNDreGmkIk9DIfb4K
	MiyMVgIEXSCjfZgKqonN3J0bcvFOQVskCwaAbVO6jeT1LIX3PIZ+nQy4n//BrD2B4WROUZ06o48
	317EUxF53nu0iHU/aZ8i66YU1Ea17JLOKQn9lOyq/0S87sSshaM24EnDGzhCC8e1D7zxCZThbtj
	UYyTVqStBVpZxyqSbYJLpnoxMsA7T6Ew7ks3AW1Ro7DAQ8lKMyBYQeeuX/UCPYB1eN2R37ybUwK
	eL6dNGEYj5oXRn0haFAY73P5QoJiavnLxEqxqge7ZP1Ly7z6SvxTbZlje2FgCzglejF8+erZBd/
	ntxKkyC7mm72+YGRvIqi+i/dT0us90Wc3J/2LBE4NDIp1W8fw9nelBzMvbgDV2FOdukf8ra6f9g
	ENRYwRqdq4+cc1vmBz4wcFwtIMIAc3EYCpW8ldkFIFoUPyPZ5uHq2Bzfbsxh/mVQopNm2TP8sm0
	I5H/uoUO21aOapQnGDvyz9lMv2uESr8drIaOM4ruxg==
X-Received: by 2002:a05:693c:87dc:10b0:36a:15cb:30bf with SMTP id 5a478bee46e88-3725d1a5eabmr4318401eec.13.1794163617977;
        Sun, 08 Nov 2026 10:46:57 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db733sm6348252eec.23.2026.11.08.10.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:46:57 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	James Clark <james.clark@linaro.org>,
	Shunsuke Nakamura <nakamura.shun@fujitsu.com>,
	John Garry <john.garry@linux.dev>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] perf vendor events arm64: Fix typos in event descriptions
Date: Sun,  8 Nov 2026 18:46:54 +0000
Message-ID: <20261108184654.3811267-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_104659_522574_4BD0874A 
X-CRM114-Status: GOOD (  11.83  )
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

Six entries in common-and-microarch.json spell Statistical as "Statisical"
(the SAMPLE_FEED_* events), and one entry in the Fujitsu a64fx table, the
L2HWPF_STREAM_PF event, spells prefetcher as "prefecher" in both its
BriefDescription and its PublicDescription.

The SAMPLE_FEED_* events are inherited through ArchStdEvent by the
neoverse-n3, neoverse-v3 and t410 tables, so the misspelling reaches those
three generated tables.  The a64fx pair appears once, because the long
description is dropped when it equals the brief one.

Spell the words correctly.  Event names, codes and expressions are
unchanged.

Written with Hermes Agent, an LLM assistant.  Running jevents.py for arm64
before and after this change removes 12 occurrences of "Statisical" and the
one "prefecher" from the generated string table; perf was not rebuilt.

Fixes: 994256a79867 ("perf vendor events arm64: Add N3 events/metrics")
Fixes: 5497b23e870c ("perf vendor events arm64: Add Fujitsu A64FX pmu event")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 .../pmu-events/arch/arm64/common-and-microarch.json  | 12 ++++++------
 .../pmu-events/arch/arm64/fujitsu/a64fx/other.json   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
index 144325d87be4..c61d6c0ceb4f 100644
--- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
+++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
@@ -1340,32 +1340,32 @@
     {
         "EventCode": "0x812A",
         "EventName": "SAMPLE_FEED_BR",
-        "BriefDescription": "Statisical Profiling sample taken, branch"
+        "BriefDescription": "Statistical Profiling sample taken, branch"
     },
     {
         "EventCode": "0x812B",
         "EventName": "SAMPLE_FEED_LD",
-        "BriefDescription": "Statisical Profiling sample taken, load"
+        "BriefDescription": "Statistical Profiling sample taken, load"
     },
     {
         "EventCode": "0x812C",
         "EventName": "SAMPLE_FEED_ST",
-        "BriefDescription": "Statisical Profiling sample taken, store"
+        "BriefDescription": "Statistical Profiling sample taken, store"
     },
     {
         "EventCode": "0x812D",
         "EventName": "SAMPLE_FEED_OP",
-        "BriefDescription": "Statisical Profiling sample taken, matching operation type"
+        "BriefDescription": "Statistical Profiling sample taken, matching operation type"
     },
     {
         "EventCode": "0x812E",
         "EventName": "SAMPLE_FEED_EVENT",
-        "BriefDescription": "Statisical Profiling sample taken, matching events"
+        "BriefDescription": "Statistical Profiling sample taken, matching events"
     },
     {
         "EventCode": "0x812F",
         "EventName": "SAMPLE_FEED_LAT",
-        "BriefDescription": "Statisical Profiling sample taken, exceeding minimum latency"
+        "BriefDescription": "Statistical Profiling sample taken, exceeding minimum latency"
     },
     {
         "EventCode": "0x8130",
diff --git a/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json b/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json
index 10c823ac26cc..6fa2936e427d 100644
--- a/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json
+++ b/tools/perf/pmu-events/arch/arm64/fujitsu/a64fx/other.json
@@ -162,10 +162,10 @@
     "BriefDescription": "This event counts non-allocation type prefetch injection requests to L1D cache generated by hardware prefetcher."
   },
   {
-    "PublicDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefecher.",
+    "PublicDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefetcher.",
     "EventCode": "0x233",
     "EventName": "L2HWPF_STREAM_PF",
-    "BriefDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefecher."
+    "BriefDescription": "This event counts streaming prefetch requests to L2 cache generated by hardware prefetcher."
   },
   {
     "PublicDescription": "This event counts allocation type prefetch injection requests to L2 cache generated by hardware prefetcher.",

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0


