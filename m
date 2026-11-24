Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3DE606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=POFuuh7I;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mr0/quqN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JT2uC7qMkTRa47GGYeiS4hj8nXfSMLBZRiQ/uyjcVpY=; b=POFuuh7I8BlMuhL5ZEze94lxj6
	7lBKAAiBoO/TJ3Ed6Zb5XpX+0sZy5KfOS+kdiZ8PQ3Az+oLnWPv85qh0zUZOu6Bqe37J66nWUMwqb
	gGvozKJz9+oYmQ/6DnkcdWoZsN43hOzXfwbp1spwHvwm6awZNS6jH59WdDh7dbkAK6koXlLg2NCjJ
	wemEuY5MjAMouzrsc/uEB5ZXsBugTizcU/5q4WrnlX+9OqDTmX3FvFe2Ge/+mE86Xq0mjGJJHKk1+
	zeI9rePBeSia1niU9pUVbI3BXhTfSpDlfOeJjvzcE4tgdneuqLGzL1uH/I/vkTrnR31DqvPIvoo7z
	w6b26llQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqZJ-00000006dTE-3N1b;
	Tue, 24 Nov 2026 13:28:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqZF-00000006dSA-0r9d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:28:19 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-497614c95f0so2518148f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 05:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526895; x=1796131695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JT2uC7qMkTRa47GGYeiS4hj8nXfSMLBZRiQ/uyjcVpY=;
        b=Mr0/quqNYDoxYW4U91oVYAEtm2t9DWMu27kcb9LXzUbKeZ2ph3ERfCkUlbkVdpnfI/
         JvvLWmP6r3APbo93ObuNpY5S0adTkdoIa8LXts1JKwSdDpbcOL6NaAvWqs7Q3++6xcrf
         xoOcfWAMA5Udcnv0dsDQ9wnWN/2sr6+BVwMDsCxrFlpepLOaUxwTFbOk2pF8+Zs+GPok
         yv1zJtcTNUW4kPkr4viT6Sq03JlnP2RfcMfaj3wdvux74qUZQ467bKKpbY1kPkipyT6Y
         hP5sr5vdWfOERkBx4OuSSFCVxyDSqsXVxoopboxK543SKxVBADSOCd10g3+1C8YoE69I
         Hxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526895; x=1796131695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JT2uC7qMkTRa47GGYeiS4hj8nXfSMLBZRiQ/uyjcVpY=;
        b=u76eAkQsStx3oDJpOxwMkw22j7z7XiyM0yU+tMx19Bv0gueMAd9a6f/IQ005tKy/1t
         yrV/y64Su7tfu6ePGnBu0dBy8+UsEJcLfAQ+R/DPar3t2mIVIDmCCeidd1VdXsb3n8wN
         qtC+cJq0NTMmSCM++dyItXvmWYArJZFszFzGsPcE7+15AlA9CA0ekSY+X86ulnXmVBw5
         cWrD+vtYkBPIQ3ja7zTaSpxu3rZYoOKbyblDlYz0xZrqC83+v/MqFef0/aTJ/Cqq4bbJ
         NDlGr9u8xY0nujxfi2DfWMARyC4ZPSSW792XmLQsmtZdpDTg6DjKUzQyLSQBNUglx/Dr
         Y3Qw==
X-Forwarded-Encrypted: i=1; AL+hErHjmnnyo1QU+MnJb5l5qow5oap7K2e2e26yRhEA1QqrqkxoScDwD7Q9pia02yIyv2di35NQweotYFaSiUmdX+g1@lists.infradead.org
X-Gm-Message-State: APuU4Z8zY0DNyqfsytUjYf2eqiqCi9qv17ruCRDsY8jXLeDfojkLgqyw
	QdnlB9NfOZEccdPJa8cAKVLcmeBWa3qdfxV3z0q/mALAsOQCg0ygdJAqJkFG36Nkn9g=
X-Gm-Gg: AZFdTZf5Bd59qy7XTkR5/RuMGYCw9YQvz8ZRhEoy3pwvMKJJcss/euv8JnyIFEpEuwJ
	ZxsgowoG2Bjf3kZB6g4LYOQfhCrgp0XkTMZjaPEBL1SY7SLlkKdpMfYzybAt5Is4Qwc3nmnSgPv
	q3QoID4ZSm33ATPQskc8ElLU5CrAS2NjILfBJq04G+yRs9afr3lAUvJ6RQSfNp1IIiGT3NlCKC8
	uTN7YLwQM7PLUGVe8pBHjME6AxfQkj3TAbic0V/mQOHjMKpBj2veAqsFv/79tfrS9HO8aB2ERa8
	BqbClefGcmlXZVFT6/iQidARZebCjlsHrBAzyb1swSWd2Xd2edNso///xEpXo/syqrtW5AjIu/y
	1Ti51RBC/626hELQFCKcFkX3GVyZW4jLsLL2Yr6bPL112w5LjOMK02C04ujYYl8JYHsFRyJpj/l
	Ag7Q2+BcWac1JEKUYH7M8I4W08f9XtXZBRV6z74yXGOZtQZZ6l5pazku1BBsfP0XFG4Lnu8cCEW
	nv8W5T2izUR11nfqD3GFZrkzBaS96wqAvy8+YZ9m99rse9/06xA6rbsLRaRWX4ticIYC+8ZNkXq
	XMuIdNrMa5rdOtcjnYZyJatzzPVyjyZrTb9iJnZ4ql3a7AjFen58uzoRyugAaXEwwPcLH5sEHym
	euM/Z2rt7lPMVzUdf/w71/mI5fdImc4jYJvhy11Kv+bitukw1zWCglHPxc5yqDgqdzEQKejIb
X-Received: by 2002:a05:6000:4b1e:b0:48e:7e1f:8cee with SMTP id ffacd0b85a97d-4abb0f3c23bmr28439351f8f.12.1795526895084;
        Tue, 24 Nov 2026 05:28:15 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:99e:712b:4aa0:53aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm29256157f8f.8.2026.11.24.05.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:28:14 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Corinna Vinschen <vinschen@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net v2] net: stmmac: Advertise TX checksum offload only when supported
Date: Tue, 24 Nov 2026 13:28:02 +0000
Message-ID: <20261124132802.2003605-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_052817_259420_605E425B 
X-CRM114-Status: GOOD (  14.93  )
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

stmmac unconditionally adds IPv4 and IPv6 TX checksum offload to
hw_features and copies the resulting features to vlan_features. When
tx_coe is false, for example in threshold DMA mode on hardware with a
capability register, stmmac_fix_features() removes the flags from the
active features at registration, but vlan_features retains them.

DSA user ports inherit vlan_features and can therefore advertise TX
checksum offload even though the conduit cannot perform it.

Only add NETIF_F_IP_CSUM and NETIF_F_IPV6_CSUM to hw_features when
tx_coe is enabled. This prevents the unsupported features from being
propagated to DSA user ports and reports them as fixed off on the
conduit.

The issue was discovered while using stmmac as the DSA CPU port on
RZ/T2H and RZ/N2H EVKs. The fix was tested with ethtool on the switch
ports of both EVKs.

Fixes: 6b2c6e4a938f ("net: stmmac: propagate feature flags to vlan")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2:
  - Added fixes tag
  - Updated commit message
  - Targetted the patch to net instead of net-next
v1: https://lore.kernel.org/all/20261119185016.1789843-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a685ce4638f61..d32d3e7b1b8c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8147,8 +8147,9 @@ static int __stmmac_dvr_probe(struct device *device,
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


