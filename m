Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E7E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 06:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R2GctE5U;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOl9ygyG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VIJHAgcH0kNWNFXAVV2FGeNxRIHtnxTUPfAN1k4v8u4=; b=R2GctE5UdjiJLJ
	U9uHbtb8sWE8UWfXb4jYLO25hqzkRqR/kOfjj+uka+HN1M/iizVRlRNsqDl7EfSjRFc71+OO2REbK
	K4R/e5MVFu9hmct66LrqkxK32OvHEaiMqIU2numwryw2gDcwPni3IjQEER2dnTgoi7uRgQRuLwzd8
	QVNtdD1rqlezFcOxS0swFsnisAwiBvRc0xXkXS2IrJeL4pggEZF8MLPqfQjLD4W+TRbhRNVuL/wEO
	ZwnTdcQm/he1uZMqg7mgNzB73D9vT9/yRvh0hlnxgl168S7AYYG99cb3KIzmlQKXkL3CQxj2wfUwk
	ru+QE6QUOpJsOorijSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRl9h-0000000BoqX-1frA;
	Fri, 13 Nov 2026 06:53:01 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRl9e-0000000Boq1-3WR9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 06:53:00 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso267970a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 22:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794552778; x=1795157578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VIJHAgcH0kNWNFXAVV2FGeNxRIHtnxTUPfAN1k4v8u4=;
        b=dOl9ygyGdQ1bSPD/fPSbWdCqTWdyvMcgCvuT855aVElb3QHRohbgg6i8OZFIkNJ3Qi
         A7167XP4EQXU1SVAkw6rv/qFHVejvtIt1JKT8ILFetu2pMS+HfV7gmR3xhzmwkAhpNJH
         VAK8Bv2r90I75vwwdaHh3ek1J4vlXNXLovs1wZGqoJipg7UP3E89JOB6EolFf3smEnMf
         j9/6G0UNAh/Ks+xtzr3kGkPCLAiL43M7dY5wUIuqCH7qWhsw+7i9hCVEP7QCLnO9GTrz
         mQNYEPOJ9uYjZgJtcXlOYrTXT7VMU75bNJA0xd0cisCO3ZK48RlVacQGqvUctN1/GY8x
         75ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794552778; x=1795157578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VIJHAgcH0kNWNFXAVV2FGeNxRIHtnxTUPfAN1k4v8u4=;
        b=N/KXHBk57uDIVmR9gVA3l2ybDZhxkpQ9mvpQSMtcTvYrrrdJNJezSdNFiujEu5IcVn
         MZeJV9zJ5bfN0xHIsDgR+iL6MwWC7PMxb5UcA1eKt+2gyUEA0IzFyoQuoN8qqBhsoz6h
         K8ClZVZxj0b6ZsKQEOOrDEMIH9KVZDmrqh2mrJNprh/F2Jw3eqBikRiY818F7RYBegHA
         ww1UGm265pRJ16ppZJgInc51MSgaQGY4X6o2T/fYLByafn3exCrquG/wcjxCeWWSJ24A
         169uoNztcb2+pa+1Bb5S8N73PcDFIJ9yrXdkDbE3UhEVoBGDw55WoFXHgUxKHNh0tULL
         s7lA==
X-Forwarded-Encrypted: i=1; AL+hErG7i/VOdSRY16jNMIO9B7EACo0Ym5DsXS2t4gT3bGYo5Bd19PbqCSU2J5t4T45hEzOD4Xir7rn/LHcAEYUkS7ZW@lists.infradead.org
X-Gm-Message-State: APuU4Z9rOSaXF1Eknh3kPubdExGu/L09bgiYGcW4SeLZjqPktw5MWhYp
	OwTSJoXeiJF+/DhqE25jsVAYYctORo63CPRhY/GFZ3c207r+Q8P0oifR
X-Gm-Gg: AYBFou2EyWRJd9QdkyVHYIG4aE6fNRITRAYh0fH5JtdGq7XBWZFlJTCsNaLqgc5JA/r
	pO2HJgWwuYNWxWn/tE3bu7QTn7DSfWAgGnynLDbL9TIPVDELZeQwBuHLYU70iYigBTtMi6pAFBC
	qUXVKVwG3WEjndH+Y67rK9aMdQvSE4GApScgT2/D9GTdCDVNcYJc/IQDlAqFAdMXsGuK03ZxZz6
	IVmXnPDSKJdC727jTeulLHG3tbGZhVck4r2XONefu45SsvtYq0SaA3S/o/vcO8OSdzaSlOThkUl
	fqJc0rl7uNXqv23jcXM/HVF8XYrPC+h4eFHma2sO9Ueq4lym7/1+bdPnSEjZUXyl9tY9Dn9AzCX
	Hn0AapodM9EJ/HsBGdOTmDmhC0I5SvKh5qPT4sz2apUNW+rn+7ax0J4s61WihisAjYjfX0/9Ssv
	XCpsfT0pOgoM/0ZidjiZwts8UysY6HwGXv7e4wl7VjQQdOjGXvLD6BA9GlQkYIxFdqgcDpARW2Z
	Wqis8TwEgyAecTbM8jR6vOArEvNUWZdo3FM88lPnwM3wnLcibtyhVzE54MLDw1fPJ8LFFdskFy+
	rQET9chA+RbSEcCcaqvq
X-Received: by 2002:a17:90b:5910:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3b1b0cc8f69mr806113a91.29.1794552777743;
        Thu, 12 Nov 2026 22:52:57 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3d279d8sm869257a91.2.2026.11.12.22.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:52:57 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: James Clark <james.clark@linaro.org>,
	Ian Rogers <irogers@google.com>,
	John Garry <john.garry@linux.dev>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2] perf vendor events arm64 AmpereOneX: Fix misspelled PublicDescription keys
Date: Fri, 13 Nov 2026 06:52:53 +0000
Message-ID: <20261113065253.746615-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108183846.3804875-1-takano32@gmail.com>
References: <20261108183846.3804875-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_225258_965151_54148D96 
X-CRM114-Status: GOOD (  13.65  )
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

Sixteen of the 28 entries in mmu.json spell PublicDescription as
"PublicDescrition"; the other 12 spell it correctly.  jevents.py reads
only the keys it asks for by name, so those 16 fields are dead.

Fixing them does not change the perf list output: every one of the 16
entries has a BriefDescription with the same text, and jevents.py drops
the long description when it equals the brief one (jevents.py:405).
Running jevents.py for arm64 before and after this change gives a
byte-identical generated string table (1580383 bytes both times).

The file becomes self-consistent again, and the field works if the brief
text is ever changed on its own.  No text, name, code or expression
changes.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran the generator as described.  perf was built, not run against
hardware.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: rebased on 7.4-rc2.  The arm64 string table generated with
    jevents.py is byte identical before and after the change
    (1580383 bytes), measured again on this base.

 .../arch/arm64/ampere/ampereonex/mmu.json     | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

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

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0


