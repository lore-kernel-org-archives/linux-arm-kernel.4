Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FA5606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 01:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q80r6sT1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ektdpynn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=h1I4zZU44SQT59N5skU0UP5Zl+f6sTdiRU3S4l9F4sg=; b=Q80r6sT1tQqmWWIHH+7eUIKGme
	ZG8SFmKN+s9LsU6vhYxA2qq6VW3Tzm33QZ6uO6fjRym0mIrDa9mQDk/UvdSAL+XwqT61egHWgacVX
	xlePaPY7RdxjExusgjA3ENSpb4gCEakVlKosg+Jpd9pW0AvCbJCy10X0KyeiCYcC5/81UrKIa4g00
	/EgxLloxhxRX2qxrcDKfMtPUkacip0RF/1cSzfX75DjghXk36MisBBSeVasXIpZlH7Qjm3O5anW/O
	UcN3YUCoIR+svUwDetFS7jkRsbjyY0WPiAeJX2zsO28xOd3tlBDZHbOmhd9JRPB1zt4g5uQBwaAXy
	11On7krg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2zy-0000000F4iJ-1Ysv;
	Sat, 14 Nov 2026 01:56:10 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2zw-0000000F4hq-0Oqu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 01:56:09 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso1792650a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794621367; x=1795226167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1I4zZU44SQT59N5skU0UP5Zl+f6sTdiRU3S4l9F4sg=;
        b=ektdpynnwZyffP9tSlqrXF1JmdkdRvn83KFMF0iabfaBU1a003CfqjO8GkZV41UwWq
         7MIMusAUV/OpvVb76/WSq+2wvmZ9r0wHhrAi+Lq2ezknvpvV8DYKqYRM44+wxrP6fV0Q
         3QKDfGeH4Na4Eb5UGtQDyHhdDgxwVWTpjVni65f+OqoF87SZ5RkvkkC6T0Uk9U6qIwNz
         6EiDDVKLqqYA2vzK70C3POIuv0jYv5QWVSXMmtXlQAMoEClbTr0R+OdSuOSxmKnpjaNx
         SK06Wsl+z9U4tPBkJ9MsSK8U96X8bO/8Lf8Rmh77Gp8vdt7bgfquEDYmwvPVpjbHMV99
         3XxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621367; x=1795226167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1I4zZU44SQT59N5skU0UP5Zl+f6sTdiRU3S4l9F4sg=;
        b=cuN9posvAqBkaQaB95+yrkttD+uL5RlKV+cdkV55QOsOSpdC6CRUjZhQnMcBZ3S5NK
         LB29RwfPdr8h/AX/1/ZcyQywKRX4iPmgSLnkPqP1LyJhFEn3Nv482XyEQATl5OnmfO7G
         YlWyo+FNcx0DlkQp1wCq96oowUYlA8OE179Fplv3q37xRhqo69E8KmTykkD/SKD0kBzk
         u02kPjtYKMP+hBjI22kxIUmB2aON8yfsYjYuSYLA+uxvxFcU3lmjo90BA4sSCAojxRbW
         z06+K5EZUcwQ22dMKP3DZjfDscTJzLgJWCA+8zeqkSNPWLk1qlwcg+AJ8m2J+XVeoieD
         +0BQ==
X-Forwarded-Encrypted: i=1; AL+hErEWIl9BvaN3gVU7viFPfbL5xMrxMfMRnI3fKWP5nCxiuzK22kfqveLVokhxGhvnyUOg1tJnil4veMU/UAjEsAIh@lists.infradead.org
X-Gm-Message-State: APuU4Z+17AQshK5FTDZeSjumcCyqYKdy/Q4ZhnlD97oceki0BOvYAzFW
	k14i6e9Yqhhpe7s/B+jkPleiJ/4Sl0MSe9b24oDwns+Bu5RZudkIVgBh
X-Gm-Gg: AYBFou1hkXH6rnuBpeZawFMccNkp9hZoKGt/ucSk5cl1enF4+eiNFpnSRwJfSZT7p94
	WPhwjP2iGGx1M/jx6vd7/fAKGGjbb/RUIsZY8+NN3BAhCg0QALih7nUHUNc31lgEBSFNXUugIfi
	LXFPnB2clxvLEzxKjsOjh19uzj1fMXqOsuZuAuKIOO497gV1dL80lXnTWXdHLjvcyfIKAvve6xd
	uKlQ4gbHVcnWo9HgcgbQVzNuN6Jh0nUmZZi7IjaJr3aGNmHW/BX0V35SxMH9ka8RBN+Q76nOoiE
	1reg91xJv7R8yPS57ycDtp3QvhtJUMeveq52hE/FmZb9dzocl+gqWRPKMZpBevlumFC3/K1JoXW
	JYBesDy+DI/CZr4fugxnMlUruKBkcayQZcuT4j9fDsmT/aRNQqRQTKLdoYweKyd2Cb70480iC9o
	rlTrytBFk3qOvgYG2z8VJNuKdzZA30by/ZZOHr0MSjeanM04Auc4p5r1fM/VwYvG0zn6XOf9VAi
	FZDwjDlKuDR5072YRyOAD2h40YtO8XQ/jZi4O8/DRlYeuKyKro2uWvCnWyvyJh5+gZjaNRLK8FW
	5Fo97c22nVrYv+3unUlCD3IiVvIe
X-Received: by 2002:a17:90b:33c7:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3b1b089e2cfmr4020163a91.8.1794621366556;
        Fri, 13 Nov 2026 17:56:06 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm3084124a91.3.2026.11.13.17.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:56:06 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	horms@kernel.org,
	0x1207@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net: stmmac: re-enable on-chip parity checkers for XGMAC ASP 0x2
Date: Sat, 14 Nov 2026 09:55:54 +0800
Message-Id: <20261114015554.2187341-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_175608_157687_F0F1ACCB 
X-CRM114-Status: GOOD (  12.37  )
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

Commit 669a55560e4b ("net: stmmac: Check more MAC HW features for XGMAC
Core 3.20") made dwxgmac3_safety_feat_config() bail out early for
asp == 0x2, assuming that configuration has no parity protection.

Per the DWC_xgmac databook, the ASP field of MAC_HW_Feature3 selects:

  0x1 (AS_EPPE):  all automotive safety features, with ECC and parity
                  ports on the external application interface
  0x2 (AS_NEPPE): all automotive safety features, without ECC or
                  parity ports on the external application interface
  0x3 (AS_PPE):   all automotive safety features, with parity ports
                  on the external application interface

The reset value of the field is defined as:

  (DWCXG_ASP_ALL && DWCXG_ASP_PPE == 1) ? "3"
  : (DWCXG_ASP_ALL && DWCXG_ASP_PPE == 0) ? "2"
  : (DWCXG_ASP_ALL && DWCXG_ASP_PPE == 2) ? "1" : "0"

so ASP 0x2 implies DWCXG_ASP_ALL = 1, where the internal FSM state
parity and timeout (MAC_FSM_Control) and the on-chip data-path parity
(MTL_DPP_CONTROL) features exist; only the ports on the external
application interface are absent.  The early return therefore skips
enabling safety checkers that are present in the hardware.

Drop 0x2 from the condition so the FSM and data-path parity checkers
are enabled again.

Also update the safety feature descriptions printed by
stmmac_dma_cap_show() to spell out that ASP 0x1/0x2/0x3 differ only
in the ECC or parity ports on the external application interface; the
previous wording, "All Safety Features without ECC or Parity",
suggests the on-chip checkers are absent from an ASP 0x2 device.

Keep the early return for ASP 0x4 (EASP), which selects only ECC
protection for external memory and has no on-chip parity features.

Tested on XGMAC 3.10 and 3.40 cores.

Fixes: 669a55560e4b ("net: stmmac: Check more MAC HW features for XGMAC Core 3.20")
Cc: stable@vger.kernel.org
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 1a88cbaed70c..6b2bfc241109 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -859,10 +859,10 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 	value |= XGMAC_TCEIE; /* TSO Memory Correctable Error */
 	writel(value, ioaddr + XGMAC_DMA_ECC_INT_ENABLE);
 
-	/* 0x2: Without ECC or Parity Ports on External Application Interface
-	 * 0x4: Only ECC Protection for External Memory feature is selected
+	/* 0x4: Only ECC Protection for External Memory feature is
+	 * selected, without any on-chip parity protection
 	 */
-	if (asp == 0x2 || asp == 0x4)
+	if (asp == 0x4)
 		return 0;
 
 	/* 4. Enable Parity and Timeout for FSM */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 25894771e9e9..24f887df88fa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6741,9 +6741,9 @@ static int stmmac_dma_cap_show(struct seq_file *seq, void *v)
 	};
 	static const char * const dwxgmac_safety_feature_desc[] = {
 		"No",
-		"All Safety Features with ECC and Parity",
-		"All Safety Features without ECC or Parity",
-		"All Safety Features with Parity Only",
+		"All Safety Features with ECC and Parity Ports on External Application Interface",
+		"All Safety Features without ECC or Parity Ports on External Application Interface",
+		"All Safety Features with Parity Ports on External Application Interface",
 		"ECC Only",
 		"UNDEFINED",
 		"UNDEFINED",
-- 
2.34.1


