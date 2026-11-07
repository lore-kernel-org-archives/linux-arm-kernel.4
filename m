Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF91606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 02:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WC+26oaP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pUiAVQ1n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gpBdG3pRFRFDOygXYdEjj/pMvx6yFZ2VtI5mPZqbzcw=; b=WC+26oaPJGM4FI
	Qij0OLGz23oIEe5nuD7A3EnBlb1uxHV3gEzFTRkUp+ya2RpzzHNCl/vXpxguZ3GqT7kpw5OlLUbY/
	T4P2RyOk/6GNFdMTy9sW7kh287JZo7/BnHSh8iPzuu5jeX6Ia3oixeIVbbEE7rICxcfz2f7tiRErY
	AfRkLV6ovazGCP7u0HwNo5kUjcgLSwahOMnd6pF1Ke9sitSFD51PJaVouisf/MQX4I8v83FskXic8
	l+CKGNzwN8pMDxeLiLODxiDF/yd/V4m8hfuqAn9JhXks2KEOuhU9spqUso8dxP0PQXG9ISKYX+thY
	XxCMerEKe1J1YTKT1xaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPW41-0000000E3mx-3MDq;
	Sat, 07 Nov 2026 02:21:53 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPW3z-0000000E3mT-07yf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 02:21:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso706585a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 18:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018110; x=1794622910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gpBdG3pRFRFDOygXYdEjj/pMvx6yFZ2VtI5mPZqbzcw=;
        b=pUiAVQ1nY9LS5tHOtTsvz/9OQ4Ny+xboQWnMluGGc81za0eTSqYjvzT84UgJh2LTEx
         q0VNfkPujN3kSdNscQ3/NxwKeN6vPktJmRkYLALGg/UkMibX80vTgaZUY37gdMKo3Yuo
         huRYXYZuXy+67gyEuiM0Ga0+MLJoWiM9lka8DXz7M0dhs7trckn6T5HNmYdHWwuO4UvK
         W04eEgTyU4/fPNrntCxm/JGJmJ2DhXLNA+NEZwuYB/xyuQkSrmFXejYxMmvYD3w9KKSz
         sCIdh2IO9T0bDBujC+8m91KTD+mqp7LUbSa7FygOup6mvJQV5iaEdx+SF8cQLJHr31gh
         3ISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018110; x=1794622910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gpBdG3pRFRFDOygXYdEjj/pMvx6yFZ2VtI5mPZqbzcw=;
        b=H8ZXipHJjantysXuoKbUR+7QY58F6LLpCZxgKgPFLXAnVROya29rby3dLj7MdHqNq+
         5YQj3dtEqHhZccNN9gYVAP7ORpguX/sRJY2CVsa8Hbs8bSKfk1gZO3QjE1KGNQb6wlgn
         tG0QUcYcJhMmIAikE5vA1DIDNqZImYkgxGxTEJhCxQdN26k9ipAkqZmYBmz08XRB7da2
         oWFsN0UrGdT+4F+G54FeZp0c8KSqj4p0mcQI8e32dYXhxtnDzlokFF8H5yLBcc18hrO+
         hBorAs0SWVDUQwpbuicjESZqc0/nk8hjjo8P+mNI+Z/s+P3UIhuljV7IyzAq7ji1M9pT
         GWvQ==
X-Forwarded-Encrypted: i=1; AL+hErGFKCw47PgtKkHe2j3bAOHSiKoUNjouWsoH6JOSll6mKN0sHmIpGhAj9fB+ifa5+ORFNi8Ji/U5sFOI77/1qtW0@lists.infradead.org
X-Gm-Message-State: APuU4Z/S9voN4eO+NPZNjaUICtsgKBfJ04D6csdwipK/WB+bOqePBRHc
	gs/8UUIFTqfiTRbwhSsOWhn/jd/X9RD89AwlX7353VVA02G1FM8Q9Wte
X-Gm-Gg: AYBFou0eiw79Qfy0JOswxulbhqva+vReq3kl/aPJGSAd/8f0kYske0tEjXLqcBnqBpb
	53Ogy8OI10JYBivJDyXhS5HIi3wmvJLzoiHuhhjxS1ymEpBgsNrx2akMyXyVn1bfKk1eCumK6G1
	QZ0sdNghJgHAz4GF79tNIJPfa5p10Gfa9Xei0BtO3sm7vyotbA282kHcV2YYSLLekzFrcbbKjVU
	AT/KIc18hQJh9LUYArka1u7NblYFoNLNC1oDduh9Pp8Mb+VjxlppeoicLgQYgJGUivWF0x6gcK0
	+EY134zg1V7x0xizYrwUZ+4SrbVH0roBl4rCToOWEay7AtAA1UhzRowL3HCBQMahDidy/bAwQV6
	h7aUF9ARAKLzreo+2nJX2nSmbzsJQevSTFIEEdNUfpy7Xdk5n4mlriuWV+ue4Dla9GwxZibzcCf
	pRKkB43v3oq/EYBv3u373cu6bsgq48b6dkFh9NJSIf5IClcHr723cfJKtXTjtA/DKHAKbXBCMTQ
	kJTUEKSTo/62dCCwWKP7qyQ9e1iikatbkIkvLKHjVeqLpk21U3fSOGhxXmTxWHURAOhuUTUnMi6
	xpYP41fz2J1CNVzlRsNh
X-Received: by 2002:a17:90b:2e0b:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3b0db7258a0mr3904710a91.67.1794018110033;
        Fri, 06 Nov 2026 18:21:50 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c3db1sm1287015a91.4.2026.11.06.18.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:21:49 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	John Garry <john.garry@linux.dev>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: [PATCH v3] perf vendor events arm64 AmpereOneX: Deprecate BPU_FLUSH_MEM_FAULT
Date: Sat,  7 Nov 2026 02:21:45 +0000
Message-ID: <20261107022145.1713159-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103112609.3772250-1-takano32@gmail.com>
References: <20261103112609.3772250-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_182151_079875_5B0A7B71 
X-CRM114-Status: GOOD (  17.34  )
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

AmpereOne named event 0x121 BPU_FLUSH_MEM_FAULT until
commit 10a149e4b4a9 ("perf vendor events arm64 AmpereOne: Rename
BPU_FLUSH_MEM_FAULT to GPC_FLUSH_MEM_FAULT") renamed it.  The next patch
in that series, 16438b652b46, added the AmpereOneX tables with the old
name in memory.json, so 0x121 carries two names: GPC_FLUSH_MEM_FAULT in
core-imp-def.json and BPU_FLUSH_MEM_FAULT in memory.json, and the
default perf list output shows both.  The old name has been in every
release since v6.8, so removing the name would break anything that
refers to it.

Mark the entry deprecated instead of deleting it, as Ian Rogers asked:
perf list then shows 0x121 once, and perf stat -e bpu_flush_mem_fault
keeps working.  The x86 tables use the same wording, and the same
reasoning brought back deprecated AMD events in
commit eda39f98bbc5 ("perf vendor events amd: Reintroduce deprecated
Zen 5 core events").  The entry still registers event=0x121, and no
other event changes; after regenerating the tables only the two
descriptions and the deprecation flag differ.
perf list --deprecated still prints the name in the text output.  perf
list -j cannot show deprecated events at all: the JSON printer honours
the flag, but --deprecated is wired only into the text print state, so
the JSON state never sees it.  No metric expression and no other file
refers to either name.

The duplicate came in because jevents checks repeated names, not event
codes, and one encoding carrying several names is legitimate, so nothing
is added for that here.  No AmpereOneX machine was available, so the
listing was not run on hardware; Ilkka Koskinen, who added both tables,
tried v1 and v2 and reports that they behave as expected, and his
Acked-by covers v2, which differs from this version only in that full
stop.  The JSON edit and this changelog were written with an LLM
assistant, Hermes Agent, working from the code and the thread; the
checks above were run here.

Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU events and metrics")
Suggested-by: Ian Rogers <irogers@google.com>
Link: https://lore.kernel.org/20261021224527.167637-1-takano32@gmail.com
Link: https://lore.kernel.org/CAP-5=fX+2eRGCHcU43sqU=gi9iKvxqyS6ipwRSnvFcap3D+QzQ@mail.gmail.com
Link: https://lore.kernel.org/42801873-8908-07a6-aed1-c7076c689e8e@os.amperecomputing.com
Link: https://lore.kernel.org/a188c604-46c0-48fb-9cbd-9eacad88b5c9@linaro.org
Reviewed-by: James Clark <james.clark@linaro.org>
Acked-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v3: add the full stop after the new event name, as James Clark
    asked, and carry his Reviewed-by.  Also correct three
    statements in this changelog: the JSON printer does consult
    the flag (the option is simply not wired to it),
    regeneration changes the two descriptions as well as the
    flag, and Ilkka Koskinen's Acked-by was given for v2.

 .../perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
index 6c06bc928415..b0934a7b252c 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
@@ -35,9 +35,10 @@
         "ArchStdEvent": "MEM_ACCESS_CHECKED_WR"
     },
     {
-        "PublicDescription": "Flushes due to memory hazards",
+        "PublicDescription": "This event is deprecated. Refer to new event GPC_FLUSH_MEM_FAULT. Flushes due to memory hazards",
         "EventCode": "0x121",
         "EventName": "BPU_FLUSH_MEM_FAULT",
-        "BriefDescription": "Flushes due to memory hazards"
+        "BriefDescription": "This event is deprecated. Refer to new event GPC_FLUSH_MEM_FAULT",
+        "Deprecated": "1"
     }
 ]

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0


