Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845C660A3821
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3ID07rd/;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=j0o0x4Su
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZoY49G9OBW2Ss+uxh9zKm04Sv5cGEWU0IEPT/pkp6FA=; b=3ID07rd/zk4dHj
	7Lo1q9g0LFMOdVW9WwTPh2LdclTPtr/gyXHWuBUUfQiq1P0TY3VADdkqYoiTJ94xVtHXV6bO5TRZy
	m5KprJiZ+eBO32PCb9NXbA215DywCR9fmiqAT+EuBejkG0lT6Iw0QVKdFGdJu41BC8LEB7p8SsXmY
	S9FwU7+TgGWggOCvrPaIiI7kz83xhxjosr/c/b7/3uX6zeQdYEo4Q9mebPWFv5dnOwcrxONGTy6pu
	xDoTJ9pv0y2CwCIWvwyGaPN+YiyoS5pDVQoFVQA5y2F/eMeRFGM7xdU2h7jK0mv/l0lUMIi2pZd5A
	rDyhpswN+D5pJsJQPx5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXp-00000009U5i-2WlG;
	Wed, 18 Nov 2026 16:30:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiXf-00000009TyZ-2sdM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:29:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48e46e449e8so790280f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019389; x=1795624189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZoY49G9OBW2Ss+uxh9zKm04Sv5cGEWU0IEPT/pkp6FA=;
        b=j0o0x4SuFyydl+6yacN2HJ6HxE7BwKn0qNoJhbcwiqN+a6Fvhv+6VLsoxY0cxAWTp6
         1+DaJBWT9Ub0Oc7p1aCOz9JoytpoxwY/kb7vo2Zgg6ZgmqtDh2kuax0YDgeXnbY0afsT
         tHBaZKFzxTvFt/372b4z9ZBET86nkTayHvcwn85d8cpNe+OjSUgghXWpCab5V1L6sDbg
         CD/fVK4O5mS7Jn2J+JJidVzgcqwlGzNVP4PXut/q5o1U+5qWMVVAK4meHBXH9q7hKJ0P
         7WcxjrpFDh2uBmwid6YvPu54QZjI5TPqU4s8aZavUS0YXwh72mJ0SjByLP7gH0e8pXy8
         Wuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019389; x=1795624189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoY49G9OBW2Ss+uxh9zKm04Sv5cGEWU0IEPT/pkp6FA=;
        b=qz7E7dofIGDel0PykJ6w0LERxfZ0GQqauAltAtYQu+1sWOch4ElSzS3ZP366vtcUmG
         c+cRt3FI7Z8HxKJCpkePVT3nO93rXVGcJ6egHK7J/0kfp9QZkYAt0W5l4liQsUZFesRk
         /dqNI4I9uK57sRNGuXBir+oxqKkfFA90a/WQShoSHOLaMMG4OvYA1vEGWi3rxvtYR/Il
         G9DkwW8TNCc2MZyFASYtESnWHi90bggO/zuY8JP1tcmqAcaZEVqF+YhuBQfS4I96iNfR
         DQ8SDDyJpUD9tZCRbtOnZiB6R8lyc3sNq9mI12ziYbunnT43FVmSf2eyo4cNl1WKpArQ
         kgmw==
X-Forwarded-Encrypted: i=1; AL+hErGiX1VeBjp1waaCCIGMzGZ7NvRVNqGkfHXA3cQTXkM+YuDBWS0FtuFi06otJ5oZjtHUfG3uETc+tMpatGtQdWyX@lists.infradead.org
X-Gm-Message-State: APuU4Z+IzrsBQhG1ikgVxGsOo3F1HFVCfp+gDUXf9Q4c3CpQgVrNfweA
	N4/CWmYUgIeC+t72E5z7nODmxDfCB1yRI3B4b5UvJbcwPS1n+bXcIbIiFm62OHIgPvc=
X-Gm-Gg: AZFdTZfHYgeT3Dg6l3x9BvotLS0Y/6adrOIQHwaq4ijQc8MLiqxQFzxLnR+saWVs+Hq
	HtRbpyyZv0pe8SQQyr1+QZpEmq3WxBE5/+fRAqsRAHmpcS7sLFPFp9o5yYR5bSis5XAd+7d3sJ0
	WgmMHlcmVkQlUspQROUP5+R3iTm2Nd1Po8qnzqjp7fswdQVy54xG2l6oSPHpi+yXsS8IUpaAMKC
	NVlizoHSTvHbmbvp+42l8phfh4YlVBO5fZG0Vxd4wjG1TK48uL5Zb4u0GUWI/sWiQ5pF5Ai48Ad
	FJlE6kPS+P9IVID2I0Ivm8GHlXOtrZ3kG/k337LTpohOGBK1cOpIhRxbmIToBmQxrsfWglvqCTW
	FTW0Rnyq6WTQrnu0e4auC1BLjM7chPCQWuolRK2fFAPS5KnMWOvJWD0dembuHq/4ghgBEZGw1ZJ
	FpBIw8vWEXXvGOzeQSpgxwkaYY/frg6EbvZ5QjVxty16J7kJgMdBOZg+bnh/MqmGqGiKIAja8A/
	5i/a2d+RZCGBUXSq0DS+/BtqrUPV7YmPTCQmKDsB1roKMlmSHwr8v6oHMPOfo7ckkeT9rNGh9Zr
	EHl9B306eqj8fFXHU4kqU5HD2ariEWo6
X-Received: by 2002:a05:6000:61e:b0:4a8:e472:a50 with SMTP id ffacd0b85a97d-4a8e4720c5amr42347f8f.7.1795019388940;
        Wed, 18 Nov 2026 08:29:48 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:23 +0000
Subject: [PATCH 01/34] perf jit: Support JITDUMP_USE_ARCH_TIMESTAMP on
 arm64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-1-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_082951_756143_1C2090BC 
X-CRM114-Status: GOOD (  12.13  )
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

CLOCK_MONOTONIC can't be correlated with timestamps in trace, so to
allow the JVMTI agent to be used with SPE and Coresight, use CNTVCT_EL0
when JITDUMP_USE_ARCH_TIMESTAMP is set.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/jvmti/jvmti_agent.c       | 5 +++++
 tools/perf/tests/workloads/jitdump.c | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/perf/jvmti/jvmti_agent.c b/tools/perf/jvmti/jvmti_agent.c
index 526dcaf9f079..674eed455586 100644
--- a/tools/perf/jvmti/jvmti_agent.c
+++ b/tools/perf/jvmti/jvmti_agent.c
@@ -96,6 +96,11 @@ get_arch_timestamp(void)
 	asm volatile("rdtsc" : "=a" (low), "=d" (high));
 
 	return low | ((uint64_t)high) << 32;
+#elif defined(__aarch64__)
+	uint64_t val;
+
+	asm volatile("mrs %0, cntvct_el0" : "=r" (val));
+	return val;
 #else
 	return 0;
 #endif
diff --git a/tools/perf/tests/workloads/jitdump.c b/tools/perf/tests/workloads/jitdump.c
index 01cbbbd564e8..8422b66ee600 100644
--- a/tools/perf/tests/workloads/jitdump.c
+++ b/tools/perf/tests/workloads/jitdump.c
@@ -34,6 +34,11 @@ static inline uint64_t get_timestamp(void)
 	asm volatile("rdtsc" : "=a"(low), "=d"(high));
 
 	return low | ((uint64_t)high) << 32;
+#elif defined(__aarch64__)
+	uint64_t val;
+
+	asm volatile("mrs %0, cntvct_el0" : "=r" (val));
+	return val;
 #else
 	struct timespec ts;
 	int ret;
@@ -55,7 +60,7 @@ static FILE *open_jitdump(void)
 		.pid = getpid(),
 		.timestamp = get_timestamp(),
 		.flags =
-#if defined(__x86_64__) || defined(__i386__)
+#if defined(__x86_64__) || defined(__i386__) || defined(__aarch64__)
 			JITDUMP_FLAGS_ARCH_TIMESTAMP,
 #else
 			0,

-- 
2.43.0


