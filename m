Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F8606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 00:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XzEIJWPt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQIQrhHG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hcvx2ON/HPwM3Y8wXd2tFwwyBON7gVfpnbbWMA6Bwz8=; b=XzEIJWPtvcxTH9NhSCzSRi9+e0
	8MnMrPCnFfhqLytd8JwmcwYvIko49cKXjh0losKVedQoYDtBd1ckL3p4ZuaSFtLYQBuQLX1zEJpFx
	rH2kIgc29d6K6/yr8SCJLTzx5qeTezmbY8ug5d3+6tnYmsvuHTQ0VgtQrMO4fGevBFDy5ZX2f8IfQ
	LLIcdGwVBStks2diP5tD++EU+iXLi77y3De3ntalJzcrSZx+TPXHEN70tjBKr5YSRDvs5A7nzg5vT
	uOo++vaF/gT5MNLHNPerxznkWBIrpgn7MBod82xImiX63lDZHpYRhZ0acyX7lNyLNdTp8UysjPWLZ
	vQoUzg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSkuQ-00000000ppr-1Mel;
	Mon, 16 Nov 2026 00:49:22 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSkuN-00000000ppV-480F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 00:49:21 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-86288992de5so2703066a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 16:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794790159; x=1795394959; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hcvx2ON/HPwM3Y8wXd2tFwwyBON7gVfpnbbWMA6Bwz8=;
        b=DQIQrhHGE9/jAQIwfAt2ze/3WfGGE34cQgT3COZ43dg/Vm6Tdp9KGK5m1yFCEqPucb
         cyAmcj30hMOVUppHTDTjd0XIWSWhmCfr3H7cZ1KnYLZgC/73spU7XGSWiDfiYjSwBL4L
         LAMJE9fjcF4lghBGO45ZCzcYcnoj/8LGRWn6O4MdCW6nS7Z3BmfqvbRn2/Qu3cVd+0qA
         nUppCeKx6IWvy9BNyJjraXmKAepQOGNmJaw7wC1ARVOjc0GtZvba+COQZUJe6f/NoHL/
         c4akMl+edP75d/addMvQxkA8ZLxtuDesC7YGpDsj2fIlALB+2115njEtURLqYEth/xvP
         Lt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790159; x=1795394959;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hcvx2ON/HPwM3Y8wXd2tFwwyBON7gVfpnbbWMA6Bwz8=;
        b=pg5NT0+wmDqrZVU+2knwYqdhPAi7JvXmRlTMGn7mT01BpOgCmL1qqKXOR6BmKWjwXz
         JXxLJY0bDAupWDQi2Mrk69lLR0ZGtuMYNcHcDfgAtB24VE8bngQXgJ4DrKnkand1GS5n
         Atvs1WO/crjwKhr2v/bE5CvVveDSItgm9qUSnSxg3gnQkavk3wzvNpLXfV4qO30JPT/m
         GrB6BMrX1S8LBed+DiAFecW+g5YxLCWcWXb6k2gUVl5QMEnn/7QErgaEUj21Pkn8TArw
         Kgw/C83vPr4Bkvpzw9Uunwmod62WrGzdzBJ+2ccIxU+aeFSqTbSXU0rc0yt8tRnQhc6k
         KByQ==
X-Gm-Message-State: APuU4Z+Z5LSoMekPQam98ygAfvj1ZlZKhUav3rra+IQmJ84NlpSUCWPN
	AZER8pY/MljOn4uXL6X7VlVi8i0AA/xhBGJbTEKDHcuXgJL3CBQ3dhNc
X-Gm-Gg: AYBFou3ZNAkkB2UOlGrslyf4VodLsyDOYQugGFH4zmI5j6VRyPzpi8/53GQ7s4Hh9R5
	+UO/QrWnqwzlVkjijduTZpk6dvHl57tE7X7JeGRVc57eZpnS+AKTw+zjJnTkvL3LrTDSDQr2Zso
	+xtr31raQwDU3tBsJ5k7nvVGsGhzhC87QCZ5ln8L8czWpi+I0Xa3d+2d5xqt46ovcl4t/yMaTP9
	abiE8xpe0P11WW3cYX1qN753D8rN68E2nSarwjAJcizbWBbefkU7r2NQQOWIFgp0uPEq14H9xgu
	AqRkGVoMeSL+ovF6QLURq1bgewP6Mf79PF0rGpglR5DzHrcm+v0Ot61BeU/Nrk/9e+7ocNYuJDr
	JIGL1o9Z//CaBHwl9c7DZh/AIUws9KsooCf/zJTJw9T8fCeiko9OKeMfY2YP4qpgBK1DDLhSiss
	MsYiL6F63ZtqEzgYom/UqhcxFr1Fi9iHG37IdiqkZX5yzLeIubHhBZMQ55LS41Y4BgPyOghYD8H
	Qz0o+I1UgvY/Rt922zOXi9Rl2YFBxMxBFDkEFso+/xqsghH41qhW7z7uwaUu/MHsjo/615FKV60
	LPawjxVRQkwL3zVIZXCSwPSIrAlwS8mQr6x1k8VeVm5PPQAmmo6mOdr/foqdTVjIgptmDPmLTlI
	KdEZ5IjbegR9Kkc/s9+0h1WxMUKroY6S8Hw2axIYAdY6lXUUgn/obwIEpi47B9ICri53SPbUsyc
	8GqCUOW50nldc3huFa66ge4VTrxMwvqfnKTdnz8mmOXUqK4u3g30SY
X-Received: by 2002:a05:6830:6816:b0:845:8a98:3f1b with SMTP id 46e09a7af769-861527cbaabmr9725195a34.35.1794790158623;
        Sun, 15 Nov 2026 16:49:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880e9abbsm8685537a34.9.2026.11.15.16.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:49:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 17:49:15 -0700
Subject: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6CMBAAv0L27Ca2kQp+xXgo6yKrtpJuIRjC3
 616nDnMrKCchBVO1QqJZ1F5xQJmVwENPt4Y5VoY7N46Y0yNOnVBMmoOwROmBWlgeugUkPzoO3l
 KfuNskHvnDvWxadrWQqmNiXtZfqczRM5w+cvSuzPl7wO27QMIgLnVkAAAAA==
X-Change-ID: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_164920_056309_152067B7 
X-CRM114-Status: GOOD (  15.23  )
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

The GMAC, GMAC4 and XGMAC rx_ipc callbacks return whether checksum offload
is enabled after programming the requested state. A zero return is
therefore expected when hw->rx_csum is zero.

stmmac_hw_setup() treats every zero return as a lack of hardware support
and clears plat->rx_coe. Disabling RX checksum offload with ethtool and
then reopening the interface loses the saved capability. Subsequent
attempts to enable offload are rejected by stmmac_fix_features(), which
uses plat->rx_coe to filter NETIF_F_RXCSUM.

Only clear the capability if offload was requested but could not be
enabled. Keep calling rx_ipc when offload is disabled so that the hardware
is still programmed with the requested state.

Fixes: 0f280e4d23c2 ("stmmac: fix the rx csum feature")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 25894771e9e9..e162976be2e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3723,7 +3723,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	stmmac_safety_feat_configuration(priv);
 
 	ret = stmmac_rx_ipc(priv, priv->hw);
-	if (!ret) {
+	if (priv->hw->rx_csum && !ret) {
 		netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\n");
 		priv->plat->rx_coe = STMMAC_RX_COE_NONE;
 		priv->hw->rx_csum = 0;

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


