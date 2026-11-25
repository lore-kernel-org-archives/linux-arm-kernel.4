Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E1A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=STiYUekh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WtRR4HRv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z272wPPw5zG0BP9Dk4LUCTCHRpu0SV9ZoE4xf+jSm8M=; b=STiYUekhSkkrCu
	hUWsy54/KrfFIPl2XVKCRqzmviMQNbaVkNJwDG11/4jZxXA/Cg4T2Mq9mfy99JB+UNRySmcfOQBwY
	WrOynfc79VD6/YtUMoteS7TEGwEFm3IYHCGS5ydmfNtR9M9hj1lp00+pw6CRTMqKf6bsQhmzEgP9O
	kF0OAS2dF7b+4X/Qo9qnTSBhNAcmtDcjyHaTRzNFNAj/Cz/vQbLTWNwWIrRKttBX6a/sDUiSeet+n
	3sYS4g0CtpbXHekGMweGvqCZCukqgu97LkfYtQ8Idj9JO6U2u0+mbMnNGyjYha20tQuRygQW5Rbgt
	3C/yL9c0HgUAzxsZdJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4BX-00000008MUg-1ZvK;
	Wed, 25 Nov 2026 04:00:44 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4BG-00000008MRf-03Gh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 04:00:29 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1b546061d58so11951772c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 20:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795579225; x=1796184025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z272wPPw5zG0BP9Dk4LUCTCHRpu0SV9ZoE4xf+jSm8M=;
        b=WtRR4HRve3jYEPq9cfSz1tBPix2CmHrKUX0fFZGM37xHwjndRBJIooB2K0MdFLw3Wm
         cVkW656wAet9KPSujGV6z18LWhdkExrD85EiGB+cGHuKeN8Ib80/QdrxhpC4FXH36fPW
         cWpCKw0ZBSIzitGmz25G5nkcRsYllcReZ6Tzk+K1hs6Ei6Q2LBLkObzt3ugR7mhn6zqX
         WohPXVDyINf+Nci0Nej7eov0k2gv1u19Sk63jFCxPKk+hI6l3XrxlAXZFrUHggiBIiTw
         E4ExzE/jpx+VUtLO53tvxAiOnzDLHGqGNVTxvhj0lKcQQF7IINJhSuVOLGLoxPzjweE9
         ZS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579225; x=1796184025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z272wPPw5zG0BP9Dk4LUCTCHRpu0SV9ZoE4xf+jSm8M=;
        b=d1dM6A+0hGwoz2k1qfGMAlDDTm/Wl3pjtRKlEfp6nVUyyWxPjzt5C652+Fv4EkJVsb
         dCm72UyDTNDBP9wA33HuHlSvhZxaixZMUUBbRnSdeZ/FJ0sMo7NSMIewNjcZxgU6Ryhd
         Oz9Ljpv6r+wcURCPs5jIw1D4ZWKjSJ2AjhQITUdFAZWeWl0urBqLGE4d44TbCDFlRdDw
         rF6EBx73zjpaN80/IxpSlIiSgd5jyHQqWe33IDc5ih0Wd84cj8yAeN44zrm2ZDGVoUP+
         RpzcaCTnw91wVErDdu6TQVzwDFnJ09kpPp3kH+Lkl9gySixObGEsIJ15ruViqumWTOgl
         gJGw==
X-Forwarded-Encrypted: i=1; AL+hErGdKL/m9CnPtHhsBndhPaGt6N1wnVLvHkzqnBbuXtHR9GUlog7k/8XstO26iYU4NmrPD81Yudi+6u6MS6sXYhm8@lists.infradead.org
X-Gm-Message-State: APuU4Z8GSxz4aOr5G0vvsDQo31OPxHcGCmlPZirJK2yRBooBdvuJjfjd
	7SCkJLTf2WVnPry+4bVslyT8yDW67d/XB6z1ccGnk+ovz6xxgHV1baky
X-Gm-Gg: AZFdTZdK+5CVIPzcf4cl4AJQuR5wefVtJDK9T7Z1Km3WZckoDT21huRTf0rhP/o4Ul+
	Vvx5Pkfgi5oky/EnbdxAfGE6ZyFZpDuikAAwEhzuU0OExZ4h4fE+eAABHdPi5dzsZESuncPiFKj
	ZQ9sChKVL0rZWIBgIn2Ykwg9WQyjAcQPElSTtGjllEp7WCwARUV2YNyAWn5tHQyr2SG88acMUWW
	JHWk6ZeaDAmvg44noXa9OmkQtuKXdLvBBu0TIu1N7ZSgXfix9KQMz95gL94wr10FZLDnU5rzgRK
	oyylPDGbjK3x1oK4TMCXCXOIu4s4oVUR3Dk7PcTQ47yRCihHE2SzZ4SCT1imlbxkiANUCcgROZV
	bomTvpsHQ6t5dEIxLLLziT3qdlfpaJYKNG58kXGkhDgfC52hcuPSN12srbiaXZE67N7ndJ7BsOD
	ZVA3yqiDGgM7pF38X3H02e1Q00hUVYAs33LS5XoMMjP4uupU+PvyMkSdTON7a3Mqj40Fw9VgdS4
	xhHv4gZNGJQZ3F2iXgFIEFYjabW7nHgPQ/20vR29GshFGS14Zt9Hq22M8KYjFzBmhg4X0S6paCc
	sq83j+etuAKx/NiEamsa
X-Received: by 2002:a05:7022:92a:b0:143:26eb:18e9 with SMTP id a92af1059eb24-1b5568eb4dfmr23336562c88.28.1795579224787;
        Tue, 24 Nov 2026 20:00:24 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm57094127c88.14.2026.11.24.20.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:00:24 -0800 (PST)
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
Subject: [PATCH v13 1/2] perf vendor events arm64 AmpereOneX: Fix misspelled PublicDescription keys
Date: Wed, 25 Nov 2026 04:00:15 +0000
Message-ID: <20261125040016.1675748-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125040016.1675748-1-takano32@gmail.com>
References: <20261125040016.1675748-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_200027_794784_5BC2F1AC 
X-CRM114-Status: GOOD (  15.97  )
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

Sixteen of the 28 entries in mmu.json spell PublicDescription as
"PublicDescrition"; the other 12 spell it correctly.  jevents.py reads
only the keys it asks for by name, so those 16 fields are dead: the text
is dropped without a word and never reaches the generated tables.

Fixing them does not change the perf list output: every one of the 16
entries has a BriefDescription with the same text, and jevents.py drops
the long description when it equals the brief one.

Running jevents.py for arm64 before and after this change gives a
byte-identical generated string table, pmu-events-string.c.

The file becomes self-consistent, and the field works if the brief
text is ever changed on its own.  No text, name, code or expression
changes.

The three AMD entries that spelled BriefDescription as "BriefDescript6ion"
were fixed in a separate patch, which is already in perf-tools-next as
commit edd09316bd37 ("perf vendor events amd: Fix a misspelled JSON key"),
so this patch now touches only the AmpereOneX file.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran the generator as described.  perf was built, not run against
hardware.

Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU events and metrics")
Acked-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
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
-- 
2.53.0


