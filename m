Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2256606A7CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vYu6ISNY;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vj+LCQRU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LgJ8rjvYkBYBkoWffggbcRDgyGHjF5UUVD3pCXNPiIQ=; b=vYu6ISNYQ5bajg
	Cs1Q3Zu/Ofo83iiTkABtEsunKUhl+HeiWjoJw0A8ehCBt4yyLjafRgiu/gCKuuhycmuQr5LkW6fbb
	CZk4d6RT+6iLQDC3kIeztElOcueMIbA8Mzf79ymRrD3ORl+zeJXStuN4tzu5SQnS5yKIlyzyjkBlc
	tlRsTULY3Cq0KFMNUa7NdGjIA71DwtW9TobAcXPJMARzu98fKimI0a967rFkkcZ2/HZPUdN8nHiOA
	hz6qlMyTvUoF8/3Dr/JcBiFAA0kPweICOCtii/xOMsXeY+vDh4udq/BXZiMG5aKnK1SvJ3v8Ts9gx
	YQbdIuAz/iwcg22K6Mlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZA-00000009VK5-2lJD;
	Wed, 18 Nov 2026 16:31:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXt-00000009UC9-2yfm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so10745925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019403; x=1795624203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgJ8rjvYkBYBkoWffggbcRDgyGHjF5UUVD3pCXNPiIQ=;
        b=Vj+LCQRUgzbJPOpfvWGHC4p0SXVsQ+66ttczOT79gyUdpt+bY8RmEyIWmsZq2t6vY1
         RgHX2UK25jAhiFZ7zshPw3OgpOOtI1f8k6tGC0oB6f75eQ7XrhLkI3p5YJlxvfYhdvOB
         yG1HWVTP4ytXUCqE7pTLIZOaf7iEnxOlOUBNJFnchNiPmMJhmFpXXn8MRIbk9wdT2qiY
         r1H8hP2iNKCMmrUOHGtBvateoKkAJU0gOOTn0z6is3pyzPu9Mhcq/+aKOHhugEnJXbyX
         ud4JPn3WjAnm3kYjrtSs0YA/FNd04iWCIDpCo1WF7Q1IRzg/vLA+VQe/JohmEknvdlMt
         nSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019403; x=1795624203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgJ8rjvYkBYBkoWffggbcRDgyGHjF5UUVD3pCXNPiIQ=;
        b=GrwkwTpvKsJF0DM0X+pEjmhG96UJGMGI/8g6HQORQ323lkMYdrTW5UsTAqRf2TiMPu
         3Io5siP251pyEEY/dly8dB6FtifbaZNZKtP2se3ymHZZd0f6TXSo7GJVyazEi2K/7Biu
         NnJetvYj7bKt+OlSHSHRGznXmfUEFb2b7skrQ0/md4X9Hxm9de0RlOJa0PiY+DWBMe5E
         HVwRhJ5u7Q6f+9wyrnydaki0fRb+4GKDeuXRAq3EoJZkqCgUeQvcJHmSB/3TjnIAZmlO
         mYiHMRJtXGJ0iYikmFuBbmFYIaBXjXFuW1Q3HVgi6LikerYecCvm+T4ypWLkVVr3M18w
         7D4w==
X-Forwarded-Encrypted: i=1; AL+hErFhHRx72k/HS3C1Nd9bCnWNzthz8jGgsu8E1QWu1C89sCF4KmoPjFMc80+JBYLHsmkFwM6HKC26GniT6arubW5R@lists.infradead.org
X-Gm-Message-State: APuU4Z8pP+PIREzBj+XSBcW8bbfQK7B4XO5DVRt1i6/AemC5lTf/z7PH
	pL9lNnI5D2CmdUn42N6eE32WAZEOK8SsPHHq8WdKXFOZxFZGxs7K8No3VLIAcbcXYcg=
X-Gm-Gg: AYBFou2vPmaCKQuhOjGgJJWy8oWY6+Y3ABolYsAAJDZAqgJtMp81O1ZMNx+WF/Sl+pp
	8IZKcVCE2CFpg+dnLumZ1PPYM9YTMSDdXmNczDVuskKuZ/cJVOXN0HnABrSZRex7X9Y4OrE29Lo
	f45u3Nx3bzwWKbYzqPcg2ybCcSD42QPOOtPWkFj9wN+vGM9oCkM7x/XP1H+LbX00uyeGlA6B0Hh
	ePVkY0i8NsewCqZFd1kEXk8gHQP6Wl25PFArugTSckp6X0AXumkFf4a+4MKmv3qjL7BIr38M51o
	RUQoR59JAoGKY/qeF6WFB+5HCKqAP5s8lC2AHc+hehG8xp0WlLUyMujR4JIoIlrO0enC/6hKUtn
	6pIwsWmuCmOCNC7XNPxFhSw3tQ3IjqHCWLiuU+qInLloIXnnV5aYJwQzanlhE3c+DhApb0wayXF
	a8gmniOH2Au8IMV3tBL1uMxeX8rVCR+YTA+LjdnxMJcaVKL5tx0YqjvML9WHKVV7DkKGlhkGAPU
	NIjz19nfZueBkJYZMh0SRLv8oTP8LiiJZOu0xa/h/y0eTBt2UJB6OkfZ0UGFBJ3OX7SAIgIBGiK
	1Hn6jQo1cTc1ZD41iw==
X-Received: by 2002:a05:600c:8b71:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4bb7da2ba0emr55386575e9.29.1795019403309;
        Wed, 18 Nov 2026 08:30:03 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:02 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:36 +0000
Subject: [PATCH 14/34] perf cs-etm: Always enable Perf event timestamps
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-14-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_083007_106558_9C9E6A1D 
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

We still need MMAP timestamps in per-thread mode for overlapping mmaps,
so always enable them. Also update the comment above to reflect the fact
that Coresight timestamps are on by default, -T just gives more frequent
ones.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 5a64c17cf254..28aaaabf36bc 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -456,6 +456,9 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 */
 	evsel__set_sample_bit(cs_etm_evsel, CPU);
 
+	/* Need the time of AUX events */
+	evsel__set_sample_bit(cs_etm_evsel, TIME);
+
 	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
 		/*
 		 * Timestamps are required to interleave samples from different
@@ -479,9 +482,9 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	}
 
 	/*
-	 * When the option '--timestamp' or '-T' is enabled, the PERF_SAMPLE_TIME
-	 * bit is set for all events.  In this case, always enable Arm CoreSight
-	 * timestamp tracing.
+	 * When the Perf option '--timestamp' or '-T' is enabled, expect that
+	 * the user also wants more frequent Coresight timestamps than only
+	 * context packet ones.
 	 */
 	if (opts->sample_time_set)
 		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
@@ -495,9 +498,8 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	evsel->core.attr.freq = 0;
 	evsel->core.attr.sample_period = 1;
 
-	/* In per-cpu case, always need the time of mmap events etc */
-	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus))
-		evsel__set_sample_bit(evsel, TIME);
+	/* Need the time of mmap and sched events etc */
+	evsel__set_sample_bit(evsel, TIME);
 
 	err = cs_etm_validate_config(cs_etm_pmu, cs_etm_evsel);
 out:

-- 
2.43.0


