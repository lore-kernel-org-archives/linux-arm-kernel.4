Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D440F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mRH4PKpO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zK1OYXj0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ReptZUc4V2l1GFcHM1MI8g5CyAssfcev0pq0Ob8If/Y=; b=mRH4PKpOw6pzpSU2zpmpAFjSUd
	hwIykYyu2QRJSnnw+Gx8wogp+uFCdYILuy7wyGYcXxOYqQ9Vb6ubwct+mH1j/2VttxuUguK5ew40n
	7APy0wY95Rm4sUnhIROeA2hwQc1b2YtYiWlSvhxMoxbRzLBFuIfm4nOZsl9aEP/LBopzxqZk/fUEm
	h8rmzdSv2mwDNj6GXTEDvrGUHkaKoOjyR5RuuO61FfW2ei3Q1AyPkOcgi/ln7ACUj8PPwednXDUZs
	XeVlubpZFqpCjjifd3pEzNQPVdLmHff5oOTxL1+aEeP7Yr4fkZTtobJc/+nwCMC4uHNyK7RFDB5o0
	o/oOtHBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvAD-0000000G9Of-2XvT;
	Fri, 27 Nov 2026 12:34:53 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvAA-0000000G9Ne-2JP1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:34:51 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-89d6bd67045so3697062b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782889; x=1796387689; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ReptZUc4V2l1GFcHM1MI8g5CyAssfcev0pq0Ob8If/Y=;
        b=zK1OYXj0mvTLZjfiT4N8TcKN8zznvvxcSkMyOVtx23tvT3GLIU8kJgOPh+66XNPHz1
         LPKz4C9HTdgLsRLHN12LaL9mPRDV8z6QiMFYBPFDXtNsygzuXql7t94CNJBufsdlZfh+
         fPub7imp4R3YC3Z6udefh2UzkPRpUFvXx3LlfmBJvVpqJPSbEqD6PA9wh+NvnuhRsPUL
         p9xs/F9RDrjKQZ8zFmD+hA6zlPM7G50wTE3aS0/YgLHoEa2PcpHMD+/WPbenlDLtRX7J
         3j9oAWR8GBYATBh0WW5LpIBca3aSn4atWWsnGgNk/Qz4/jbq1iLANNo0/urr6KmAtH+u
         wt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782889; x=1796387689;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ReptZUc4V2l1GFcHM1MI8g5CyAssfcev0pq0Ob8If/Y=;
        b=Ddxgagg1Rk8oUI9dFdfnVZl3WwjM3Q1JGCCmTmwtzbKIninA4bwjQgi0hWna9/nSBf
         ij85rcDOTw6ztmHdX6OnSmIwhjReqXdsPXNxToQ1xPsK3R2LNzDbvHHZXV92nXw5IlA9
         89KeYuCF0YEyaMnqpETjn1xrPceZwIWPhx9bpyhpkDzSOcfEfedQEz5GWs05mIxoFcCv
         ZPt6ZarGhpp3m5V6Agf7Bq+X5aLt05qaNrv154RldC2BruPpNo33MoeQWt5edaB1n0s1
         2ZColU/N8Bfjr4OMXgphmoEkbn6cJEMFPwNvGqmT+8r6HouVeRCH9KN338k5XhWkdiLU
         m8rQ==
X-Forwarded-Encrypted: i=1; AL+hErGP3MfaA1L4JQhPAmhnpzQuMDGxVOQ5c1glvNZrfSSHtiTxTOimplrR6QpPrynq0vOSozORN/7jHQl/kPdWGRLF@lists.infradead.org
X-Gm-Message-State: APuU4Z+Utbvk2pi5TFXhw0XnPgiMKm6feiLmB6riI4rsNmAWOo5nku++
	f49PjbLpwCOVFx+K9XwWTwHPSdsMM0MN+DHUTrhqdO85zXx2SDOVJGdh
X-Gm-Gg: AZFdTZcU5oFKQqB7igIl7SF77EB8E8FODli4dUR1HXS9IeluNivdKjOSI6s5kurKAPr
	McJlyBdCH+hlbbvJmiDjEmZ0BquOCmoKvBCIm185XkUFNSI39SgYBpJlL0heZny9m/NUYhYj8Ba
	jWKd2M6b1YJ6e+Vv667KWnSmDZ64TKTYZ/w30Gln9T2evYT/MhFbmPcPRllcw+toJFTziay0grl
	YpFYkXG4wUSA5m7/IVBN8ozP6BOc7jYDVBXqxDktIMTVpWe3ZfVydGyuFqjaQagFS28GXAZX19Q
	2+E1wvx6V6TxS0kEldvp68sC1vZqkgP8/9r5UYRAXbt9UO1DUIoUP3tcCEP4J9xFXvPIb6IBDdQ
	3VV+JoPfQITxVaTM9T4eN2Asq67SBC8Z96ZZxpyeu6v1zwWRAGhUmTpVZLw5FZ1+MP6ulK+sUN/
	XxKpCurdmeUGE5LOK1HLbeNvFZsBogm9dx1JgRJF4jN4xLXNOE3MU7FyOrfh82OCyxvMzKSFnVe
	m+aBcNo6F84YikB23DgkfpiYVasLCn/k4fyoLLWKoaWSQi7TPudwSSEFUbMa+21UG5+g4WJ5JK6
	m22TaTuMdYQqWhU02EP7Cr6aogL/D+MZr74nHqwRJ89XspScF1YkWoxToQVdqZCK
X-Received: by 2002:a05:6a00:4a89:b0:8bd:5539:5984 with SMTP id d2e1a72fcca58-8c7dd9d6834mr12527922b3a.25.1795782889218;
        Fri, 27 Nov 2026 04:34:49 -0800 (PST)
Received: from [192.168.1.102] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872951febsm12282669b3a.14.2026.11.27.04.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:34:48 -0800 (PST)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 27 Nov 2026 20:34:35 +0800
Subject: [PATCH net v2] net: ethernet: mtk_wed: fix double free in
 mtk_wed_rx_reset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-doublefree-v2-1-c0c6d3da3b52@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOTQ6CMBAF4KuQWVvTKT9GV97DsChlCjVATVuIh
 nB3aXXh1uWbzPtmVvDkDHm4ZCs4Wow3dtqDOGSgejl1xEy7ZxBcVIhYstbOzUDaETFV5LIirjg
 WZ9gLD0faPBN2g4kC1J+hn5s7qRCZuKadHVnoHckfmRdfmSV6QYaMtCxFLqoTF/rajdIMR2XHS
 PTGB+te6esF072/mXrbtjesSyyO/wAAAA==
X-Change-ID: 20261115-doublefree-c43a6e0c0149
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795782889; l=2322;
 i=hujy652@gmail.com; s=20261123; h=from:subject:message-id;
 bh=RN2yLGJnyx5H7no7hudUjpQ4FMkUtmVh8Gq3EY48fGk=;
 b=9t/lmpz6QbAGKctOeVKWPpQPH1bvAJ5wQ4FMZxDbEoDdPv7wfjAmeh/TzUHRRG4+C+FIxuuW/
 AXqZ1kH9OjwDPoXIVJy8IAzDz/DB3X1yxqZZj1aEH1raasz9PmVXmWm
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=MXiVj6rTyQLjK+RN0A0WiriSkqHj/WJPKnbDVaSWdgU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_043450_615232_446C8DBC 
X-CRM114-Status: GOOD (  11.37  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_wed_free_rx_buffer already calls mtk_wed_hwrro_free_buffer but
mtk_wed_rx_reset calls both subsequently. This would cause double free
because dma_free_coherent doesn't set freed desc to NULL.

Fix this by setting dev->rx_buf_ring.desc, dev->hw_rro.page and
dev->hw_rro.desc to NULL after freeing so the NULL check can work.

Also remove the duplicated mtk_wed_hwrro_free_buffer call.

hwrro path is compile tested only because I don't own v3 hardware.

Fixes: 1543b8ff02f0 ("net: ethernet: mtk_wed: add wed 3.0 reset support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/map/216156
Cc: stable@vger.kernel.org
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v2:
- set dev->rx_buf_ring.desc, dev->hw_rro.page and dev->hw_rro.desc
  to NULL after freeing
- update commit message
- link to v1: https://patch.msgid.link/20261104-double-free-v1-1-efa52326702f@gmail.com
---
Hi Lorenzo, sorry I decided to update this patch instead of adding
another patch.
Hope this is okay.
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 0bae25247798..0f215dd3d2d4 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -880,9 +880,11 @@ mtk_wed_hwrro_free_buffer(struct mtk_wed_device *dev)
 
 	dma_free_coherent(dev->hw->dev, dev->hw_rro.size * sizeof(*desc),
 			  desc, dev->hw_rro.desc_phys);
+	dev->hw_rro.desc = NULL;
 
 free_pagelist:
 	kfree(page_list);
+	dev->hw_rro.pages = NULL;
 }
 
 static void
@@ -896,6 +898,7 @@ mtk_wed_free_rx_buffer(struct mtk_wed_device *dev)
 	dev->wlan.release_rx_buf(dev);
 	dma_free_coherent(dev->hw->dev, dev->rx_buf_ring.size * sizeof(*desc),
 			  desc, dev->rx_buf_ring.desc_phys);
+	dev->rx_buf_ring.desc = NULL;
 
 	mtk_wed_hwrro_free_buffer(dev);
 }
@@ -1722,7 +1725,6 @@ mtk_wed_rx_reset(struct mtk_wed_device *dev)
 				   false);
 	}
 	mtk_wed_free_rx_buffer(dev);
-	mtk_wed_hwrro_free_buffer(dev);
 
 	return 0;
 }

---
base-commit: 28a371228d4eb4857cc31eeb1a0d7d01e9c3ea2f
change-id: 20261115-doublefree-c43a6e0c0149

Best regards,
--  
Zhi-Jun You <hujy652@gmail.com>


