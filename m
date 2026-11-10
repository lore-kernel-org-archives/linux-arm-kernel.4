Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C4F606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pjMV+PTk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahrmCBsG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GnMoHkTM6iQtkpAgle+3oy1uhVcPxUIIpLVPaorm1V0=; b=pjMV+PTkMTtw34Ytj9Inn4iTJg
	rMSQZ3PClbWthEPoynnwTuic/GdjSljOclTjbW871DH+69Jvm7hdetgieussSSjDwFO6EFMIDDbw2
	LLuPD7cgy6r+XSxvDpX+95V382gH+k3befBGOM9ZkOQrxMat8sYD2xttHBoZNomybW6uNw0xLYM0N
	Qu5zN3dhqywysUlsizX+qHazNF//AI5GhrIqDKQ4qtSthkE+pV8iW3PSoL6dx4Pz6TxwO7reDJQis
	7nP4+nEWxoXS6hYgn9BTJZnflXDTAoLa3wzJKk31+khFo2cNo67IFumuCfpwwTJjdXBngc0eIphQv
	jO+yP0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQosL-00000004Zfh-1Poh;
	Tue, 10 Nov 2026 16:39:13 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQosJ-00000004Zf6-0pr2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:39:12 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1531630f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328749; x=1794933549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnMoHkTM6iQtkpAgle+3oy1uhVcPxUIIpLVPaorm1V0=;
        b=ahrmCBsGumv2jYRK9PoFveJCkfkpTThzzc48kEhFn2iEyCHdvJVyOY8h1Zc3c0Hut+
         e64DHxXQvdjej3LNcR7+CGkYehtzt1sjy0FPJyMJRiZ6FxC4ZBdQ/MUyW6KI3CAVx0aI
         hjqScLyQQc9OouhnS9IFYQVAMEq+YhGmoiQMsOnNNAQsWDLGm2+uIQr3Me7xlOaFlJfG
         /gDFdSmGx18h2H71evMXvHJW9lj5+qQHr+atENfr+JL9RAs+utNfZsvfY+lWwTfRhl0f
         qwfgT/wWy36o1jatFKyczI43knphMoMK7cwhZiGrYr9iXAOcqWTSZkcvWaXkstw0IocE
         qZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328749; x=1794933549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnMoHkTM6iQtkpAgle+3oy1uhVcPxUIIpLVPaorm1V0=;
        b=KgLKB0CrZ+3ZQQM7XrXUhzzWY8Qvq4GrKo+kWPhkE0M/HS5EobETW+2M8Vp81gWg90
         QFrWF5CGcYRu1zspnEcEhlIXM0i7DcwWFZoZUU/J5E1nTRjH3WXVdbVEfZMgz/ctiS2h
         i6rGoYoouSA9mAcTcbam7nINcDLRo1J8QbaZfoCxv2hHQSKACd7a9BV2R76iOf0E5i74
         u5Ro8gcpBp3jmYzkituR2uny9atnHqaStpNqcxGV210oW9udPys0NImZNZBZeOcOVUyF
         t7iie7tqpNXxx+8ek5JQ7PE6uT7ds18kov2AcEZQjapzqBekrCkiIaqv51ogPt20DLCs
         BzCA==
X-Forwarded-Encrypted: i=1; AL+hErH/6XrDQ18Sb7gWv8rE7qT6BKR9f2WD3F9P4YXAtqOTA1/gncuWiGCsSw2IHqATlJHhB7NC07fOsRTBnOKZXgf1@lists.infradead.org
X-Gm-Message-State: APuU4Z/6F+2LJ65kwDLWbhO3TtBXmD5QsFTQ0T6oPNB9mKH9MV3+b6ZW
	cAlAX2oW1CVARVEi16QKH/5xD9iQ+CiFL5ghoRkavLKJqWz4CCnx2E+P
X-Gm-Gg: AYBFou0ycombYdCFwMVu6kZGc11W8UrBYf6nZ3VXEn9SRMEpgcneVBwAmvwDsUyXgJK
	GgRXa+550HQ4hlPt45YESoaMIlg2SLfXIvTz87jRUbiWF42uqZo4tomBj6D3F8oyK5rsnA/5pV+
	HeXXnoXTSWHm70V7fFpD7tes3BuA1nFdEZ1SeXU1svXjunjFEFpwbPr1B6R32kyL6N3cg4/KKkE
	s2OsgcAseaFBpfz911aPC6zS91jlRErO+MCDt+dWoc1/9EK1SsUQqv9jtrzEDpm/BGOZzI2vvYN
	xj2+Uw+ZN+EzhcEfAGd6Fh/9CIu9WKS7WUCo4yrUObAUaPe2xDP19CDHNwZS08bQqiSE8JQImdD
	6Z5DopdTv0oIvN1osBw1NjwyVEna5AJ//lUOkNXmftUfVIlfalbxkNNPUeAyRoQSoyBzni9T/Px
	+LfZwRE8lMKvZlfThn4SrlOE+ip56xmgCLF7mjgiUJgLJJk8jNTxShsZQNfoY2244SsVNL/R2Z7
	i3ZuQ5RVytA0OThpdIFYqZo+vwgVGF0e+OWzzcXJ4j0qxvDQVv05PD1IF5yw785+gy8EQzXRHLk
	EXCJPt0cHNuDAGFkACdao/NVX7cq+fRlMZNfBM+4k9x/D5gEKrT1TCXLkwSrDMGxwk8C4tmjvYG
	CEFTbvbzO6Z24M5JG5waYLLgPsK0V02Jqe/ORUgKtCpBSwV8BsD3EGZxgG9sTAP7MY5elUuBvvL
	lLtvtLZ3cT0IV2wqyJ18AGYrz+RsM8PS/ETr9BOYTH5s152lHV51io5TygpsHkU0wD0g9RL0S5D
	kOSotdf+v2/U6320HoZq82A5Q3ITriurIOyjni4Mg==
X-Received: by 2002:a05:6000:25f7:b0:492:4156:b8f2 with SMTP id ffacd0b85a97d-498318fccdcmr5748430f8f.54.1794328749233;
        Tue, 10 Nov 2026 08:39:09 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm5888355f8f.10.2026.11.10.08.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:08 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Icenowy Zheng <icenowy@aosc.io>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] clk: sunxi-ng: h6: Keep both parents running while switching VP9 clock
Date: Tue, 10 Nov 2026 17:39:04 +0100
Message-ID: <20261110163904.1098187-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_083911_253322_A602F24D 
X-CRM114-Status: GOOD (  14.00  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The VP9 clock mux only switches while both parents are running. Its
reset default parent is pll-ve, which is off at boot. When the Hantro
driver sets the clock rate to 300 MHz, the clock gets reparented to
pll-periph0-2x, but the mux doesn't actually switch until pll-ve is
enabled for the video engine. Until then, the VP9 decoder has no clock
and every frame times out.

Set CLK_OPS_PARENT_ENABLE, so both parents are enabled during the
switch.

Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 7fccda96d444..a10f0502c5c1 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -336,12 +336,17 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(emce_clk, "emce", ce_parents, 0x6b0,
 static SUNXI_CCU_GATE(bus_emce_clk, "bus-emce", "psi-ahb1-ahb2",
 		      0x6bc, BIT(0), 0);
 
+/*
+ * The mux only switches while both parents run. pll-ve is off at boot, so
+ * moving the clock away from it would otherwise leave the VP9 decoder
+ * without a clock until pll-ve gets enabled for the video engine.
+ */
 static const char * const vp9_parents[] = { "pll-ve", "pll-periph0-2x" };
 static SUNXI_CCU_M_WITH_MUX_GATE(vp9_clk, "vp9", vp9_parents, 0x6c0,
 				       0, 3,	/* M */
 				       24, 1,	/* mux */
 				       BIT(31),	/* gate */
-				       0);
+				       CLK_OPS_PARENT_ENABLE);
 
 static SUNXI_CCU_GATE(bus_vp9_clk, "bus-vp9", "psi-ahb1-ahb2",
 		      0x6cc, BIT(0), 0);
-- 
2.43.0


