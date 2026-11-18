Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3201F606A7CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rJGMGqad;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IAt2quV4;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ne4eh51r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+P2Ho1KsTiq+W5WSFOq2uZumwuM5Mc/rAo4vJCP5XRI=; b=rJGMGqadowCZQB
	PO8dTL+kuG41Vwq4YKcc+rQOr/2yINzFgYNhDatg00ilOEdP83dugOLlDb/YP9/RYYgsqM12e1TSX
	C5UJPf8Y5oGyidRIuriJnWSsFWcy1gm+EosApjiD4qVu3TV44OrzABqX1mpIY9/4dIq3wja0WjIUM
	cFVUSpGtlwpE46VlMwsDpwsezhxyxxgV6hM2s0aq7qq5UEJDpHbhLoPxlMiQZ8q/f+mwMUVSlcSh4
	brLVB4C9sTfYuXiDnntbG6/zG4EQKxlm25oF11qadoJcjsVFkvGQZ6nbXX8P7VWdkoDtaO1NhGgDG
	TuiB0mpm+qP+5NvTzTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiZH-00000009VZH-2dc3;
	Wed, 18 Nov 2026 16:31:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYG-00000009UdL-0WM1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 16:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+P2Ho1KsTiq+W5WSFOq2uZumwuM5Mc/rAo4vJCP5XRI=; b=IAt2quV4X4+MGQbGyhHeR+oVRR
	oqQOqQOvDrl4PoZMBf/k7Gqs5Eoc7Q9yvHEDsC9LabG2LAUGY5H+Z4ZSQK5G19lQableDu5ZoTYVO
	XU+xG0XXUzUk8eGmIGwuh/3yZxjLdow8A0tIaM1Y2O6W0Bbl8J7rP9VguvCkKUFc4EsRxN0TJSo/0
	xTP6e4bW1C1lMlXQN78kBpieWmRmvuCvScECvSWulooKkL63o7O84+qqcf5L9SjqmYGxZCJa2CwIG
	SU29/87SAJrtakJ7+nPdB908hnHjaDCeyqfjorXtgKK8sz5nF0Vvw9w3NOnRRXZCUjADzt7I6SX44
	+kP/tjLg==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiYB-0000000GGl9-1cnw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:30:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so12702985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019421; x=1795624221; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+P2Ho1KsTiq+W5WSFOq2uZumwuM5Mc/rAo4vJCP5XRI=;
        b=ne4eh51rCWshTz6Du3c6DnM29IN8DZepAfdNl/VcuQYtTOrtD/G6t9tiw5Mt6pqwOd
         BiYfWQDjpEFUwqvKrpu2tNyNzBkyfdVogx2J3TZZ52ir4Y6Wn4TQtRuE6HQVRNJGR2H6
         elWaj3/bnOcniPABRmkzr1etxzyFWsJrD/YbBihVgJ3lMfM1QbrfQqs2FWIgYeH9iQUY
         61+uT1r6ov4gwmxF4yVk+Dxt7uOT4F1/mEwfEzYOVUncCQ5hTP3m+jYzqidcF9MJBIlK
         DFMPjjQqki+jEltM6J9xSDSnUDbGk1HDzTJGkfNoiDl0y/4KXsgDLLomBRemC/Y6Gtnj
         zKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019421; x=1795624221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+P2Ho1KsTiq+W5WSFOq2uZumwuM5Mc/rAo4vJCP5XRI=;
        b=K/V7w7mYL8Ws3/7zyyK1u3/pbXUeCIEvF8akp6Zx6Yv3KEWCZ3EtwkJOalAU8uZaac
         ejYtYHLR5tlxTxGg99se9c2yD+JlaW3+50f45nRPA7W9fvunFhleo11L3bdH8pumu2HX
         Xzy2kaktixWiB29S4XcisUO7FrzkAcEIFNgyra+gVA7XgNYakhZS7e/XHU3FRRG3aO6C
         kbxn4UXkJtswbYQqB2TS0yb/GSpGKQKyw3RkmKHGNI5ppUKPm4tj0o3bkVfSEpQC1z6i
         AgnzcTBkQLov/s/hR8QJl3eu6B1PTh8MPTioDHmG81UO+06zkAP1xzpnt4kk3ba05/f8
         OklA==
X-Forwarded-Encrypted: i=1; AL+hErG26l0OxR8O8Nt0Pp0aBAJ4uMs3ASjxEQegpurE4DtmOA0udK6B60vyjISI3QON2C6EIrXUUUx2Fzj05rd76rxO@lists.infradead.org
X-Gm-Message-State: APuU4Z8h5s1BRK5ZsQQI5PtjjtHwvH3pn+WwXPDEFXprCkxTxCsxai9g
	lXbpm/g+lR2+HfuPZoC82Sk4UewhriSJaHdn20I2AubSRsg3djuXORMxJDFDRrntIlk=
X-Gm-Gg: AYBFou3kvOd0wNbKBHzDw6wNffgW00hwdeN+qdX53Cfv0KQUJQC8W422NQZczpDnvcP
	1NKuZidfgBOP0lFyiMUpwxWQMQVYXXNjxAm6lUXocATmDAmdhftnir9wVQbkT9p3CoTWhzzvCqT
	qdlSHkjFKR9HZxQDCn1I3SfUZb+u2CtlUVPGbY4Ms/FDncjTIC2sgMyZHskQJmiFULE8QTd3D84
	opdDBz0DzyMg5dNbEriAu2lVgQB76mZvOcRVe9897ln4sb1VQmmC9ERzapBkyC+hBTZxq10w6+3
	XgY8/+WeOMQs6uUvm7SNKJThXJZ6gsN0YzaexSUNv3zNAuOGK4na8XBFEBRHy9+XGDnSNlRQOEE
	5CiWhH6vktkeTZIf5Rx8CeIZ82AjEa2g8Mz7cEjmpdZvmBA8SvIaZHGjg8rn3Rbod3OXqK7ldUC
	bKkYO2BZj24yrRISvK4oUDz3AcjhqkNsJjxMDbQcQAI7uxwBiOaonZCFH6RINAdJpfizSP6H+O8
	YJ2Y6aBWmw/h/qaGJXt8UqpObUg6+ZKv+eolK2QimTwCgXsycgc3lIDQ2fRQLbkrbPv4INOSGUG
	iqvQoFnwJqLXQWyTIUoS7j5mkZK3Lg5SSkxpZKTR/aZ+z1TcUWKs8w==
X-Received: by 2002:a05:600c:8b6d:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb83248ecbmr75595e9.1.1795019421153;
        Wed, 18 Nov 2026 08:30:21 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:20 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:52 +0000
Subject: [PATCH 30/34] perf cs-etm: Invalidate OpenCSD's cache on MMAPs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-30-dad4d90747f6@linaro.org>
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
X-CRM114-CacheID: sfid-20261118_163023_584253_FDCC91AC 
X-CRM114-Status: GOOD (  21.34  )
X-Spam-Score: -0.2 (/)
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

OpenCSD caches instruction bytes, but with a JIT runtime a new jitdump
mmap can replace code at a cached address without changing the context,
so subsequent decoding can use stale instructions.

Invalidate the packet decoder's caches on MMAPs when virtual timestamps
are enabled. Without virtual timestamps there's no proper ordering so
this wouldn't increase accuracy. This is unlikely to cause any
significant increase in overhead because MMAPs should be relatively rare
and OpenCSD invalidates the cache on context switches anyway.

The API has no explicit cache invalidation operation, so disable and
re-enable caching to discard its contents.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 42 +++++++++++++++++++++++++
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |  2 ++
 tools/perf/util/cs-etm.c                        | 36 +++++++++++++++++++--
 3 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index b7ed7847f209..d6c2ae0b6a04 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -9,6 +9,7 @@
 #include <asm/bug.h>
 #include <linux/coresight-pmu.h>
 #include <linux/err.h>
+#include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/overflow.h>
 #include <linux/zalloc.h>
@@ -112,6 +113,47 @@ int cs_etm_decoder__add_mem_access_cb(struct cs_etm_packet_decoder *decoder,
 	return 0;
 }
 
+#if OCSD_VER_NUM >= 0x010503
+static int cs_etm_decoder__cache_param(const char *name, int default_value,
+				       long min_value, long max_value)
+{
+	const char *env = getenv(name);
+	long value = env ? strtol(env, NULL, 0) : 0;
+
+	if (value <= 0)
+		return default_value;
+
+	return clamp(value, min_value, max_value);
+}
+
+int cs_etm_decoder__invalidate_cache(struct cs_etm_packet_decoder *decoder)
+{
+	int page_size, nr_pages;
+
+	if (getenv("OPENCSD_MEMACC_CACHE_OFF"))
+		return 0;
+
+	/* Match OpenCSD's defaults and environment overrides. */
+	page_size = cs_etm_decoder__cache_param("OPENCSD_MEMACC_CACHE_PAGE_SIZE",
+						2048, 64, 16384);
+	nr_pages = cs_etm_decoder__cache_param("OPENCSD_MEMACC_CACHE_PAGE_NUM",
+					       16, 4, 256);
+
+	/* The C API has no invalidate operation; disabling destroys the cache. */
+	if (ocsd_dt_set_mem_acc_cacheing(decoder->base.dcd_tree, 0, 0, 0) ||
+	    ocsd_dt_set_mem_acc_cacheing(decoder->base.dcd_tree, 1, page_size, nr_pages))
+		return -1;
+
+	return 0;
+}
+
+#else
+int cs_etm_decoder__invalidate_cache(struct cs_etm_packet_decoder *decoder __maybe_unused)
+{
+	return 0;
+}
+#endif
+
 static int cs_etm_decoder__reset_core(struct cs_etm_decoder *core)
 {
 	ocsd_datapath_resp_t dp_ret;
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 67592b93778e..6e56ac57b311 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -108,6 +108,8 @@ int cs_etm_decoder__add_mem_access_cb(struct cs_etm_packet_decoder *decoder,
 				      u64 start, u64 end,
 				      cs_etm_mem_cb_type cb_func);
 
+int cs_etm_decoder__invalidate_cache(struct cs_etm_packet_decoder *decoder);
+
 /* Reset all decoders to the start index of a new AUX buffer. */
 int cs_etm_decoder__reset(struct cs_etm_packet_decoder *decoder, u64 index);
 const char *cs_etm_decoder__get_name(struct cs_etm_packet_decoder *decoder);
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 5a704dfeebd3..a747c5873bc8 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2682,6 +2682,25 @@ static int cs_etm__process_switch(struct cs_etm_auxtrace *etm,
 	return cs_etm__associate_tid(etm, sample->pid, sample->tid);
 }
 
+static int cs_etm__invalidate_cache(struct cs_etm_auxtrace *etm)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < etm->queues.nr_queues; i++) {
+		struct cs_etm_queue *etmq = etm->queues.queue_array[i].priv;
+
+		if (!etmq || !etmq->decoder)
+			continue;
+
+		ret = cs_etm_decoder__invalidate_cache(etmq->decoder);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int cs_etm__process_event(struct perf_session *session,
 				 union perf_event *event,
 				 struct perf_sample *sample,
@@ -2764,8 +2783,21 @@ static int cs_etm__process_event(struct perf_session *session,
 		break;
 	}
 
-	if (has_sample_time)
-		return cs_etm__pop_heap(etm, sample->time);
+	if (has_sample_time) {
+		ret = cs_etm__pop_heap(etm, sample->time);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Invalidate after popping and decoding because Perf only updates the
+	 * map after returning from this function. That way decoding doesn't
+	 * pull the old map back into the cache again.
+	 */
+	if (etm->has_virtual_ts &&
+	    (event->header.type == PERF_RECORD_MMAP ||
+	     event->header.type == PERF_RECORD_MMAP2))
+		return cs_etm__invalidate_cache(etm);
 
 	return 0;
 }

-- 
2.43.0


