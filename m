Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4D3606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZKFQlSYg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fsvZzeCP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w0iUd6Uae7/9DsYoCpyTzPmzaHpxV8RPjMLG//AJIZk=; b=ZKFQlSYgUamdD4Ix6YB7Nb8534
	dCv8/s2drbWvG4U89MxpR56JxxpOywZm4BDtqEzaeA2zuK7x2SqRGSrwQhSQRbMlu3RjDhS6q5lRn
	EzWfWXuGQHFDVsvikliLnz6EJqNPDLUDy1mEHdmcoDdYIjE4Awa1/i1wh3ayFtzaqLnuact8ATrk1
	MdtjOQGmj8hp21FqHQDR5OF+/2zZEpUyY0U5VrV0JZuIUZyH08oQLj6VSORHSy8ucmluAB6zxosKG
	5NTPrU86Ih/pAfN6dpGsEFnAidnXE3L/TXFmje+I7xPfHBloRnQ+Iiy/D0YOhAHQUBFBkmeIlCA03
	PIRjmWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7DU-0000000D3PY-1RwT;
	Thu, 19 Nov 2026 18:50:40 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7DS-0000000D3Od-063k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:50:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e47347279so15789f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795114236; x=1795719036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w0iUd6Uae7/9DsYoCpyTzPmzaHpxV8RPjMLG//AJIZk=;
        b=fsvZzeCPkuMfxhORID3vCN30MHj1NrH/NfhmHg6YPyE1paJPyJ6Zm2Yptb1ny9ugPA
         XoggEbLFHnelV6f8MFiXSGU/XU7WXruq9pAkF+ZOozsswgWkpAX3v32BCULam+mVUnHz
         NTlaru/Uf90ndJsxtcLmqBf1W0PJLPGX6xv1vy6XtrZK94t3GQcJEA049lf6hu+emeag
         /k34orbD/XubE6rpA2hAcOkO0yTTqWyRVyBjGtiSJP58Z0nUoyCNaxf0laxx2Y9M212A
         fTNC3Ck2XPVyoIg+Xptgsee1gspSFVhJWbXYZ4kImcgkNDCZBv7Jby4pg3n/7Hsntu87
         X9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114236; x=1795719036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0iUd6Uae7/9DsYoCpyTzPmzaHpxV8RPjMLG//AJIZk=;
        b=p7t03vVUo3/gRH7Mnx49vSVad1QTqtXbbnvBWAXLJTIZrFWh3GVnl9OKIMExk3jgol
         nGGAb49IayJ2d577tT5ou+8+MINCD+hyH6IN0QW7fugckrrAQFMUzcwBYG6sZ19+tV1n
         iPVTdo90fCcZQwOLCiGdjoqWmc2QX11rsdn4DP3ovck+i6u7hPvcTC5yYmpUFkXX/LbS
         s/PkytE4rSoZVeMyF+3ip9RYToYe5+1bdUx8xW1VHmopU5+OJ1MaznDukthY7Z/Rkq18
         HLMINuGU3I0HCih0dF7T77loD9bEVyYKJPzn/AYNCsbHUMjLR8CqvpFT9cp7J4f6U82d
         bwIQ==
X-Forwarded-Encrypted: i=1; AL+hErHuZLkd94VSB6fc9Idu/zpfO1MjjjOT4ECVHi/xcDZpjf9Hjbs/hmqIWIpp59hKhuniVN2TQJWwdALOUge7NLJp@lists.infradead.org
X-Gm-Message-State: APuU4Z8IfWPpWpnGRptk+zx/gfwnvIHJbYKjAl2Qqwa96raW3CbH460P
	aLnSqvcsLTDFN6SIlbbRtxudXrFH7FfpeDJORxj4s5pv/Bshx7lySfMq
X-Gm-Gg: AZFdTZeA/U3J2ZhOab6rytgJCyBn15pZ3m/zazUHIETCi8nZ15XU+EetcZynDANUvIC
	P7hGftCnn1XoVYuJa82DtcmWO4xrTfU4b/iXH+o8eGS9mz+vw1je2iv/ZSd/lx+50owOdOupOTh
	OIFh7doh2PIDEuw5sEqCqUhCaSp0OU3R3OCFmNIskIyde+l1YYjIcglpnkT4NTLZNHkjf0+Fata
	q3+nPLUEfUZU/BWmWpxpgMPRIZiIeplOgfkRbho1YJN8pN/lKPpoUQc+iKkGd49g8cMKXTqYiTa
	0tVprrYQsrCfpOzq/wfrY1dOn8RR3OG8iFbz9xhI6TilfDl974AwtbQFdIvsTpYOGaBDtqeExO3
	bNO2HXOf0xfv9uVmbBIfTKF9dcMcmj34YSifPDrfT3/9pNiA5hgnUFPVvcZImpAgFVBizNI9ql1
	lPJvCsnp/qNRAB59Wm6DBW6W0yDC0flx/g0u2/4zMmyHJHzxYsf0Xfvk4cJMo3BiNxoB4iCZf60
	XHlgVICXfLpS7QAtce/23RqyL0X4f81LOygZ+2vfV1e4+WYo0x3py+VS6Hnga4HFhyoFWwk2bwy
	4eT2lA5iumeR9mPa09qR6GHcIxvCncMeRb2gLg3pw6qhjY824Y4IYofeyVP14OZDDECH/nu5USZ
	QK2cCmiSr0AcpzMdvoULUcaxfz2l4gxNJ+G3KvABix8vJcqY9VMu3RfAg3nU8rTM3oIu7CeYHCS
	jTc/lqA7tZA80XY7ldm3FunIpmGcY=
X-Received: by 2002:a05:6000:46cb:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-4abb42ea14emr442175f8f.24.1795114235494;
        Thu, 19 Nov 2026 10:50:35 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm1147674f8f.47.2026.11.19.10.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:50:35 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next] net: stmmac: Advertise TX checksum offload only when supported
Date: Thu, 19 Nov 2026 18:50:16 +0000
Message-ID: <20261119185016.1789843-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_105038_081174_3B5568D6 
X-CRM114-Status: GOOD (  12.07  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The driver unconditionally advertises TX checksum offload, even when
the hardware capability check disables it, such as when threshold DMA
mode is selected. This can cause DSA user ports to inherit checksum
offload through vlan_features despite the conduit not supporting it.

Advertise IPv4 and IPv6 TX checksum offload only when tx_coe is enabled.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4afe09d8fbe4..23d83b8376e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8222,8 +8222,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->xdp_metadata_ops = &stmmac_xdp_metadata_ops;
 	ndev->xsk_tx_metadata_ops = &stmmac_xsk_tx_metadata_ops;
 
-	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
-			    NETIF_F_RXCSUM;
+	ndev->hw_features = NETIF_F_SG | NETIF_F_RXCSUM;
+	if (priv->plat->tx_coe)
+		ndev->hw_features |= NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_XSK_ZEROCOPY;
 
-- 
2.56.1


