Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84D5606A51B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 06:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w4fsA41u;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMc9z+Ba
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3/jsMe/Qc48pu/imVYvdVloDOJ6fnxt5dXnAjgruQUk=; b=w4fsA41uMS2xAS
	Fp51Qe9JccCFGgUc9TAzznapF2yHOTepbbMWYQsW4b2lfpwmNwbpb41TlESmS073zjHs6voXrNMNr
	KhHDC5Suhk/OUwRiqFzevHRJYlinGfCy0IZacYb09+TwhdJKCqqQ6CxbtmCTeaprF9dHPMgGxSeJ+
	2mSfm6LN4VJxCt1NZFAmYwuB/gDw/pH/yNIDwbZDkfrU1HDaoLzIRYP9CVCk3a46hSQfAAnAejUMy
	sxVqb2GfU7vVovn2/zx36eCJ4PlTlWR8Zaw2wyeE8m70eXa6YwL8OtRVuktQOhCpoWh2bA9n3IuE8
	o03NS8mm/mxfL6xbWkhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHog-0000000E8J9-2KrC;
	Fri, 20 Nov 2026 06:09:46 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHoZ-0000000E8Hj-2bin
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 06:09:41 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-38190551625so848699eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 22:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795154979; x=1795759779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/jsMe/Qc48pu/imVYvdVloDOJ6fnxt5dXnAjgruQUk=;
        b=EMc9z+BaVwmDhvM6twLRoBWGWJ3vYw0ddeaiE7X2I1u7skWIEtjiVW2vKUTgI474j4
         yGAaAkaB/xFBpBYPj2fMgWaOzyBPTCFVJwxQSbe6/hbiYahRQsMyZzJdaj+p5EEy2dFU
         ab6Zsd52kKGfX71pmvYj58bLHW7rBTgkRgc/weJjuCJatk33mUfEHht8d8Q/qzSV9hPn
         vMDEK6DY03FUh7OcPZqgkE4f7FrWBG3DRGBRq4JOuO4FszJog6KpdMZPCju5Mo/e4zhx
         EU63aEPWdSVVZG2FOvbvBcbEeThyso3bTPyd9/qLIeardwANbtAJPMYIfJb5bDIUh3EK
         ZKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154979; x=1795759779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/jsMe/Qc48pu/imVYvdVloDOJ6fnxt5dXnAjgruQUk=;
        b=Y2TlRnJcTmcG7IHzojHp6M5C/iml0VQIDpec+U5rUNnnSY1Ai9+77zuWeLEnEDMuJN
         gCO7c7iIX+cDMLNnnaOpme5p66ekzJzeQr+WAn3M8IppLtlJgA9O87HBuYFQsDpCPSxK
         FdiuvZGKdxkNcu6ANLYpXH1hlBbtm9WpEg3Zx0bCl3Yt8meKBGWm+Wy3KAG7DyRJv96l
         OvJVikwFALxKmMDHcrW4lG7s7BheJuGzuaOBrRaGXAahBd9KQlGSvOhlBR5WoTImw0nN
         GgkQpXpW77hAtJMrvHnrYHQhNwXEWpVaVECVLWDAyxauiwdUMg2qBilNnLEXvvstdche
         XPlA==
X-Forwarded-Encrypted: i=1; AL+hErES7dDhDWMqBFAhFyBhykz5cj72ScjC6PyRwpXCxqsNy3LkvcKkMLn9unziyxjcWqgVc0xDAxTDgucyfAl7AucY@lists.infradead.org
X-Gm-Message-State: APuU4Z9u9X8ox4W4Dvgc1pj+XOaGFM9VVwaHW415ER/d0dQ7A3FjalhD
	32OMlm9c4NHv9KAkJ4YebHpUDQJGhQzDN95jB86fCk45HqbDCMHlMsQH
X-Gm-Gg: AZFdTZfNmmp4dcoZKFAZ5R5X8n5FvJtgNjXHD4cwvdjnkyfhEc4BvQz4H+PXswQLOtb
	f+qnIFiqwfJP1bCNR/VZuP9fnsWP8oO7zpHI172HoBQgVQt9mMrGrjkGvFlr5NZXpjFWlCZctos
	SNnsv+l7stRVuLqI4py0+dMXQN/nvP+5veuEsbhYssuQFB5058Yo2WurlBMJgy0NJxJCZLMB1Bz
	ztUPNDX+zrI3+rw0y3LaKXEwI2hRoI8SOiWZzGtzAodJ2Ea2WpfUcFsiJBnUSboRS3cxPfk6cfn
	WveJDgbPKTlbYfbvuakbOH/mYv/7p/QHyep0kKA53dAdLC3/AuYtCg14cfpopSZSIAAs4FzXIMw
	hSHRGL6ppI6JoF7JQw+h7mCEz1NmJoQFhDKwKptDkxzSTMOwtl0TNyC54DaVqaTs3bgU3pxyf6y
	pytXYszVX3qbsewR3ylp6qtUDjiEQ3/WdebKGtsjOoeIujg9H+CPa/JHC7kks6zkseptQP+DmF2
	pvsthWH8n2F/+HRlaO5REOJf5xRifoeRSFqz5kmyH9RtiEwy1xgdWG/S8xadWApsyt5u1tumPTr
	OYbjO59ShF1a/LKyC/wn
X-Received: by 2002:a05:693c:83cf:10b0:376:b957:c01 with SMTP id 5a478bee46e88-3856f755152mr1860396eec.16.1795154978549;
        Thu, 19 Nov 2026 22:09:38 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm4609725eec.21.2026.11.19.22.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:09:38 -0800 (PST)
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
Subject: [PATCH v11 1/2] perf vendor events: Fix misspelled keys in the event tables
Date: Fri, 20 Nov 2026 06:09:30 +0000
Message-ID: <20261120060931.711483-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120060931.711483-1-takano32@gmail.com>
References: <20261113032927.634183-1-takano32@gmail.com>
 <20261120060931.711483-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_220939_690911_6727192F 
X-CRM114-Status: GOOD (  14.72  )
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


