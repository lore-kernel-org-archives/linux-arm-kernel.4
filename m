Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95742606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 18:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w2aeCh0Y;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mx+PLTyF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/B4X/7yk4kEItQksOCxb/0SjSH6EesHie45gtXRCpSs=; b=w2aeCh0Y+aLDe3lKiPw5IO1QgF
	HK0Px3O0+HfZbMBMTgiPRD/TYaIDmdKo61omV0oMf7Us+w/rvor241r4HK2UZ3wX70SmpRnNc0MpQ
	DNYj54lCRjEGjrNsJ2fEn6hHRh7CPo2qO/YajoiJhoLeKKs3j0WBggTrwhkep+irDWy8yf9UE38b8
	WcZTrRcJxUJJPWLaPTSqEMyls8pA4vBBYqyq/A+EMGW2awg26ssQlseWzFqoxY+2ustplWsPxdw0k
	hRpResTq5FuqW0hlfYKubYm5ejSFDmLA7vTyOLwqyFPs65aF7gBb77ySoqPy+FEnhgNx9ifS/vhtw
	QVk4tlaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ7n5-0000000GUnK-0DXT;
	Sun, 08 Nov 2026 18:38:55 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ7n1-0000000GUmx-1KwN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 18:38:52 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso353049c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 10:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794163130; x=1794767930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/B4X/7yk4kEItQksOCxb/0SjSH6EesHie45gtXRCpSs=;
        b=Mx+PLTyF0PlXmhdAR4gIRNBeOPzqSSaY5y8/2pOVuZqTMBlLgdRrG7+fmv3P9pykl0
         JHJbZdIsLH9sdFYxqSGMnE5vCFsXYQ0RfkcyiT13AJAiscR92e2REUNCs0l3BzpmqSU1
         cJtbPymQgwCo77JG5SqR7wLrzvul51qse7TE/8Dq+3nIUizsmDPNd7TuO4Ag7gpdmTVn
         WNefJOtDVSpSDr0VrcI5epJpwZ8Cb2+bU02zjceA82l2fRJKzvoJrgiGoqChRmJ34b8R
         gjjHNikpMoS66jUlWEaIBM/ZRbF5reTgS1dpXggQzlBGeaOH26p7j1W3W2pUQaoY8ucL
         6wmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794163130; x=1794767930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/B4X/7yk4kEItQksOCxb/0SjSH6EesHie45gtXRCpSs=;
        b=18mDbKqCKzzXo+pXCofoulTqpPNFZnAJYlPzkPnmkIhcKD9Vwxpn2JQj7uQ4d7qq8g
         OTVFqWjHmyFWMH1qwSZKAIjs0xNiDUIuc/D73rPzxVXbuZ527d99Q/ikFJNAOB84URv7
         MOE26bYCzIritE3SrzDmanELbKmV3pFofDRfbuNXYe0MP24NYlOsenYAfzVfA/ZMuBkG
         GeAD5/FU65/+PySoPA6ApauvSxEaPPMjQ4NLg2fRSUlcdY5Hym0CMC+R2buFKmH8GnZj
         8w16OgHmcS7SAxJFTW8xiWcOFcWc8M5paIlCTrNBSoWglazjf5fhgnbyv5nTv3Se2luU
         BOJw==
X-Forwarded-Encrypted: i=1; AL+hErGoywCAY2irErjPEor/AbR5jWC8eKE5o6ZK7t/jeMJsP3MP2BvXKOsBrHlKuW19m7FxCKebv088mRxfluu2kChs@lists.infradead.org
X-Gm-Message-State: APuU4Z/mlAvuRL4D4ScjC+yR+sQfKbGOveZSYJhJIC+1HoV3/bQaRtZ0
	B2XKEoQN1lOQqKK0/n8Ahdy/0frdg4UxvJi2nnxQwLNs9fH0nWso8YCt
X-Gm-Gg: AYBFou0P0FSm+4zgmXlaTt0bQWJNoyUzjMrssb0fzs5WXR9MeXOkShxxV5wmNyz3O6u
	So0iGS4jtFDEkJUPU3se2S4O9M10T+2Ky7uKCZWbIBPqsmFnYnQqLHY4RMXjwIarNZOeKiDZToe
	ZpbCQRS7jtxnp6qhQfAeXyJ+owMiQtipKJlm5du28iWt5fHBcfxBZwSc7sX+n9R1dkfu8L555h3
	EaG65eVscc0kws5hZCtYSxXbRI95J+3L5ZWgnRPacwOqpjECGqMHm1aUjl6T5tdEUWdYeY3Lf0X
	3KCeGc7CeFmLR+zySG/RfWS7rSvTGDUNRy8h9DVnhGlnJ3ZacW7usLYmWA7xviEFm82f50PrOoE
	Mwb0rk6oyZNCQK8ltZDxaMG9aQmqen08ULiu+0QiH0+uXBryDxYdRDlrHn1X9h13PSsZmQD88Y7
	sPO4/wdrgSZaJH47CHQzOpIQcc84m1UkEmX1DEWyx1pj8MoVQ0pGbbXSFYP3jajKUr7b5/WIj1V
	KBLh6kN7e9cP/Q96C3VU6FcAsJCzB7gKrCTcq+GEJHxtajVN8B8e+Ks81ThCpUlGYRWvs+IwrrN
	ZkEXczjGYmyEWE6UNBEkLSw/wvyEMbTIJCK89AwHfQ==
X-Received: by 2002:a05:7300:ea17:b0:36f:6d81:3f99 with SMTP id 5a478bee46e88-37254d99c2dmr3974841eec.7.1794163129784;
        Sun, 08 Nov 2026 10:38:49 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372632d7d62sm10527237eec.3.2026.11.08.10.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:38:49 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] perf vendor events arm64 AmpereOneX: Fix misspelled PublicDescription keys
Date: Sun,  8 Nov 2026 18:38:46 +0000
Message-ID: <20261108183846.3804875-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_103851_381533_FB1EB78E 
X-CRM114-Status: GOOD (  13.49  )
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
byte-identical generated string table.  This is a cleanup, not a fix for
anything a user can see.

The file becomes self-consistent again, and the field works if the brief
text is ever changed on its own.  No text, name, code or expression
changes.

Written with Hermes Agent, an LLM assistant; the tables were regenerated
with jevents.py on top of this change, perf was not rebuilt.

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

base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
-- 
2.53.0


