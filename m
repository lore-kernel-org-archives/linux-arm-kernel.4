Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B0860A3826
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tzn4JW5j;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zr4HWIUA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3/jsMe/Qc48pu/imVYvdVloDOJ6fnxt5dXnAjgruQUk=; b=Tzn4JW5jMvQyFw
	MHgXA9j8ZlWUil9ne1d/bdlGXXUFIhxpzLtWyl3tbgcJpvL4+IDETXgRxeDie113o+KT4IRvwPnMJ
	99PqhGwIIfIL3KRcKP8P8xagnZBYqXy0XxFiipNQP9yVzdnA2qMnjS2j/UOOp+oZxdYorgqSHRpd0
	+ljxIJB4GbZA3U5s0P2iCk1t2QgG5HJ1HITFjnpCv37/5FugMEXOXkZuCTxUvaturaDN7DNcW4UyC
	NMV6G8Jw5sEOs4GhWixGm8qquPx7U7XdqdI559A3sf+9LZ18NBnfBnsJ1GRdJLMF85kOmYt4YLAbL
	Q9JMvYy00y8vDlUC4Ahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtf-0000000F7we-0C7H;
	Fri, 20 Nov 2026 13:43:23 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtJ-0000000F7cB-0wis
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:43:02 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-372bdb942dbso1193673eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182180; x=1795786980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/jsMe/Qc48pu/imVYvdVloDOJ6fnxt5dXnAjgruQUk=;
        b=Zr4HWIUAI08Q2PM81CWbmdjcAy4gVrkKQLnOv4dM1uifsOhtFwEXM5uzqfXBsgEx+m
         JfSeMCbT4kpQjvs2ISadyc9sXVQe08tV615KVlUp25JXQb86Z4K+sFTRswHDij/KSHEY
         hQrOWWjimx6qoCeX6Dhocg7vd4uRXBxckDi01P7pdVdGxAulqE/tRjdV6J9imuoVJE5o
         gwMPYNBiOAAuB7Xtgb9JKlGiIQ31DpfjAVlPaUrzKHWsp5mXBn9A9E1k9fYAffmlCTXL
         lXQmJGsMcFV7bhttBDGzHcLn9nCXmGSx6dnyVCrwEwBsIUbDKUq+UClgb1rDUAfPT0Ax
         dQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182180; x=1795786980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/jsMe/Qc48pu/imVYvdVloDOJ6fnxt5dXnAjgruQUk=;
        b=rqNmAY0JAD6QlCR8XUHLUTLRo66QXJznpLAU9iuxM8gwrGNBbc0S3mRpTr8C3EDdpg
         SsTW9XVmc8VgnK6wX1riGJ9lTb9TSp8DnqotmQhFJolB0sBcD/6M5JTsSYmUw3vOuKRs
         gKrnyTl2T4mCAVyshi8n8hE8Vcikmd3AY89wfK+jrAwthT9dGT7AXONwgjz10VugX3rO
         lHnR0lbVXaJkj4mliUAQut0MsVwyUERDK5yjhfOi77QqiY4m8AU78p7Fp3XP7ixpQjvo
         x7Q/r3Uw7vPDrOKL6VyYIkNPTn/gZqpoh/GfMsz6EFzrnHxD6W1OYVu3Ez6iaE8/hkKE
         S1dw==
X-Forwarded-Encrypted: i=1; AL+hErGJguf2zk5MRuhYnDlkGNd6ZPsx0h/RLRZnsxwh+HeCX9gfZhIfTSSAxZ6l/Lx6svqsexphQInc7neQQILYXNZT@lists.infradead.org
X-Gm-Message-State: APuU4Z9pTE9PkqUNXVXv6o93N7d0/px8dXNYtmhkKst7Yu0lMos4v+Bf
	R0Gv6GFjSVUAvaxoiPFgc1gq/ZyIs+ebWvHUDioAfQfFQ9Y0ksWCbbZv
X-Gm-Gg: AZFdTZdryJOrhug4sMRsliwMT1ML+Msq2v87CwVQns4OyM+qKK6MC80P/7QeSsjtCl9
	W4sYii2P162JjKQJJrSZaEsc1h8+kXMkmVXrN7fK6LbUVb/H3rQY9uROFYuTyxMZDLojkzqI8/K
	fvld5AYogkueq3gV0JNlO7wBnaemrqokl2DjivMT31G/BKDeONyn0msUB/5L9oQuou3RTaH6tTk
	6OSpGm+9BBYPidxBgqi44D2802mbMAnfNRsQ4KAUPKGpm4DsyZdeYkh4zcZu8RM/L7KyrAtHekE
	bzS5duO7JR1qcYU+/Pg1vT+CIuMKsNMkTtJlJw2ea3e48rE5w/6gMbesGXvKNAJD4MEzZ1YWoBa
	MakiLu79c9wl+xdJoL1+eOO73cjLqEt7B+ouuL8jwKuDDQq7SyuC9Rk97uZI7DP5OLNjwMYMd35
	8k3m9eaCVBNYmGfc8u9x2u4jCja3xR/yEjjAHKUVqczrILslWVzQBiVT+3wOrdpcspUYh1fwKv9
	vsnDsPPtcPl3R4mWt72vm8Xo1W/AAmsdWEXZABH3XAUvHdSzeN3C5kYTBVvGkxEfGJEH7CbUk19
	XVcFhzDkC/2Tp/IxUnxh
X-Received: by 2002:a05:693c:87d2:20b0:381:ad6f:75ea with SMTP id 5a478bee46e88-3856f14748amr2810204eec.13.1795182179979;
        Fri, 20 Nov 2026 05:42:59 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm9590857eec.28.2026.11.20.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:59 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH v12 1/2] perf vendor events: Fix misspelled keys in the event tables
Date: Fri, 20 Nov 2026 13:42:51 +0000
Message-ID: <20261120134252.1036963-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120134252.1036963-1-takano32@gmail.com>
References: <20261120060931.711483-1-takano32@gmail.com>
 <20261120134252.1036963-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054301_297499_1CF365BD 
X-CRM114-Status: GOOD (  14.60  )
X-Spam-Score: -1.8 (-)
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

Sixteen objects in arch/arm64/ampere/ampereonex/mmu.json carry
"PublicDescrition" and one object in each of amdzen4/cache.json,
amdzen5/load-store.json and amdzen6/load-store.json carries
"BriefDescript6ion".  jevents.py reads only the keys it knows by name, so
these fields have no effect: the text is dropped without a word and never
reaches the generated tables.

For the three AMD events that leaves them with no description at all, and
the text comes back.  The AmpereOneX events carry the same text in
BriefDescription and the generator drops a duplicate long description, so
the generated arm64 tables are unchanged.

This is the same change as "perf vendor events arm64 AmpereOneX: Fix
misspelled PublicDescription keys" (Message-ID
<20261113065253.746615-1-takano32@gmail.com>) and "perf vendor events amd:
Fix a misspelled JSON key" (<20261108184600.3810059-1-takano32@gmail.com>),
squashed into one patch so that this series applies on its own.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran the generator as described.

Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU events and metrics")
Fixes: 658448281d19 ("perf vendor events amd: Add Zen 4 core events")
Fixes: 45c072f2537a ("perf vendor events amd: Add Zen 5 core events")
Fixes: 2f42fb0661d9 ("perf vendor events amd: Add Zen 6 core events")
Acked-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 .../arch/arm64/ampere/ampereonex/mmu.json     | 32 +++++++++----------
 .../pmu-events/arch/x86/amdzen4/cache.json    |  2 +-
 .../arch/x86/amdzen5/load-store.json          |  2 +-
 .../arch/x86/amdzen6/load-store.json          |  2 +-
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
index 66d83b680651..9457f9be4ecc 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
@@ -30,37 +30,37 @@
         "BriefDescription": "Data TLB translation cache hit on S2L2 walk cache entry"
     },
     {
-        "PublicDescrition": "Data TLB translation cache hit on S2L1 walk cache entry",
+        "PublicDescription": "Data TLB translation cache hit on S2L1 walk cache entry",
         "EventCode": "0xd805",
         "EventName": "MMU_D_TRANS_CACHE_HIT_S2L1_WALK",
         "BriefDescription": "Data TLB translation cache hit on S2L1 walk cache entry"
     },
     {
-        "PublicDescrition": "Data TLB translation cache hit on S2L0 walk cache entry",
+        "PublicDescription": "Data TLB translation cache hit on S2L0 walk cache entry",
         "EventCode": "0xd806",
         "EventName": "MMU_D_TRANS_CACHE_HIT_S2L0_WALK",
         "BriefDescription": "Data TLB translation cache hit on S2L0 walk cache entry"
     },
     {
-        "PublicDescrition": "Data-side S1 page walk cache lookup",
+        "PublicDescription": "Data-side S1 page walk cache lookup",
         "EventCode": "0xd807",
         "EventName": "MMU_D_S1_WALK_CACHE_LOOKUP",
         "BriefDescription": "Data-side S1 page walk cache lookup"
     },
     {
-        "PublicDescrition": "Data-side S1 page walk cache refill",
+        "PublicDescription": "Data-side S1 page walk cache refill",
         "EventCode": "0xd808",
         "EventName": "MMU_D_S1_WALK_CACHE_REFILL",
         "BriefDescription": "Data-side S1 page walk cache refill"
     },
     {
-        "PublicDescrition": "Data-side S2 page walk cache lookup",
+        "PublicDescription": "Data-side S2 page walk cache lookup",
         "EventCode": "0xd809",
         "EventName": "MMU_D_S2_WALK_CACHE_LOOKUP",
         "BriefDescription": "Data-side S2 page walk cache lookup"
     },
     {
-        "PublicDescrition": "Data-side S2 page walk cache refill",
+        "PublicDescription": "Data-side S2 page walk cache refill",
         "EventCode": "0xd80a",
         "EventName": "MMU_D_S2_WALK_CACHE_REFILL",
         "BriefDescription": "Data-side S2 page walk cache refill"
@@ -90,61 +90,61 @@
         "BriefDescription": "Level 2 instruction translation buffer allocation"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S1L2 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S1L2 walk cache entry",
         "EventCode": "0xd901",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S1L2_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S1L2 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S1L1 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S1L1 walk cache entry",
         "EventCode": "0xd902",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S1L1_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S1L1 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S1L0 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S1L0 walk cache entry",
         "EventCode": "0xd903",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S1L0_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S1L0 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S2L2 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S2L2 walk cache entry",
         "EventCode": "0xd904",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S2L2_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S2L2 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S2L1 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S2L1 walk cache entry",
         "EventCode": "0xd905",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S2L1_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S2L1 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S2L0 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S2L0 walk cache entry",
         "EventCode": "0xd906",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S2L0_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S2L0 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction-side S1 page walk cache lookup",
+        "PublicDescription": "Instruction-side S1 page walk cache lookup",
         "EventCode": "0xd907",
         "EventName": "MMU_I_S1_WALK_CACHE_LOOKUP",
         "BriefDescription": "Instruction-side S1 page walk cache lookup"
     },
     {
-        "PublicDescrition": "Instruction-side S1 page walk cache refill",
+        "PublicDescription": "Instruction-side S1 page walk cache refill",
         "EventCode": "0xd908",
         "EventName": "MMU_I_S1_WALK_CACHE_REFILL",
         "BriefDescription": "Instruction-side S1 page walk cache refill"
     },
     {
-        "PublicDescrition": "Instruction-side S2 page walk cache lookup",
+        "PublicDescription": "Instruction-side S2 page walk cache lookup",
         "EventCode": "0xd909",
         "EventName": "MMU_I_S2_WALK_CACHE_LOOKUP",
         "BriefDescription": "Instruction-side S2 page walk cache lookup"
     },
     {
-        "PublicDescrition": "Instruction-side S2 page walk cache refill",
+        "PublicDescription": "Instruction-side S2 page walk cache refill",
         "EventCode": "0xd90a",
         "EventName": "MMU_I_S2_WALK_CACHE_REFILL",
         "BriefDescription": "Instruction-side S2 page walk cache refill"
diff --git a/tools/perf/pmu-events/arch/x86/amdzen4/cache.json b/tools/perf/pmu-events/arch/x86/amdzen4/cache.json
index e6d710cf3ce2..01c848a9dbb3 100644
--- a/tools/perf/pmu-events/arch/x86/amdzen4/cache.json
+++ b/tools/perf/pmu-events/arch/x86/amdzen4/cache.json
@@ -182,7 +182,7 @@
   {
     "EventName": "ls_inef_sw_pref.all",
     "EventCode": "0x52",
-    "BriefDescript6ion": "Software prefetches that did not fetch data outside of the processor core for any reason.",
+    "BriefDescription": "Software prefetches that did not fetch data outside of the processor core for any reason.",
     "UMask": "0x03"
   },
   {
diff --git a/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json b/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json
index b1994539ece8..774da0bfa0dd 100644
--- a/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json
+++ b/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json
@@ -351,7 +351,7 @@
   {
     "EventName": "ls_inef_sw_pref.all",
     "EventCode": "0x52",
-    "BriefDescript6ion": "Software prefetches that did not fetch data outside of the processor core for any reason.",
+    "BriefDescription": "Software prefetches that did not fetch data outside of the processor core for any reason.",
     "UMask": "0x03"
   },
   {
diff --git a/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json b/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json
index 4291eb59426f..4adba70bffb1 100644
--- a/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json
+++ b/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json
@@ -351,7 +351,7 @@
   {
     "EventName": "ls_inef_sw_pref.all",
     "EventCode": "0x52",
-    "BriefDescript6ion": "Software prefetches that did not fetch data outside of the processor core for any reason.",
+    "BriefDescription": "Software prefetches that did not fetch data outside of the processor core for any reason.",
     "UMask": "0x03"
   },
   {
-- 
2.53.0


