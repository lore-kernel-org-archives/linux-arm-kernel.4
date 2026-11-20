Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0E9606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B4tjjXAD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ofN5+2Rg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zV76d2YESqZWH1Drxbc6WOxz9N8JdPgmkEvh2BgOs8w=; b=B4tjjXADQoNZy2B0rb8KQWoaxf
	TfLFlxJAvdPwbXHg8eeUdlQerJP/PBVFCUhu7HHZV9XfGHEKleD98FJul8qitlSdNkaoGmrJNUiO5
	YVpEexjAMCm8ejr+k7qaeFPgsolQOKLsNvrF6adu8K9yTAaRVp0y0H5iMxuKalgFIAlmxSpC/22tI
	XOxB3AvZCkuuB6GccnoCluFCo7kDzUflGNCzRmTIXYYMwuVPnDbU88dJnZJGgpAIEbWuIDjLgaM1i
	39iyVy3Y7o64ijuUSG/1qZ7CrMvzErM8gH6X07ByhDf934phZRA7d2F1XIhr6xsevmWbENMPC9HWw
	ArE78ehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM83-0000000EdZY-0qkm;
	Fri, 20 Nov 2026 10:46:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM7m-0000000EdUb-0vpM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:45:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F41E045C75;
	Fri, 20 Nov 2026 10:45:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795171545;
	b=erjKfiLbH4VmyWm/vH6eraONIRQFtJGHSZ2rF1w7s/jOzWgQ7xKlOXTLnRVX+LObXTXK
	 f3tol8Vuw/++D2kgKJL/Xjj7SuH2wSH7O3erZ6ECL0ovJVdHeN4qhUGKyVZY7MebartSp
	 XF0fJkqK2c3onyCINEZhXb9sMskTRtBPNuDRwTccofVeO+t1aP4Ypi95PYGaHA1V8e3GU
	 uAbLFHFG/65d6+BXbPNvSi5wh+Cr4+YxYIzN0mjHwdE74oWfQltrWDNn+gEwr0ExypVdv
	 WK8QedC20tt1pxsmE4u8oHByJ+F1FnXaTSi/aLYrT06FQ8rXp3arwHeUi9PJnTK24Cg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795171545;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zV76d2YESqZWH1Drxbc6WOxz9N8JdPgmkEvh2BgOs8w=;
	b=yC1Zr83yXrCPxLUCjeCitboHmpL48k9jMsk5RcUZIn96mEfGARMv+GGlD9ptgqEzoPGS
	 ebj6Vna6T4PDlLv7CvZJ6pvLPiKEzxyr4N22vgOjX4dc9Fp3hdvT1JXq6Zm4XGOy1DEKY
	 HqcGc1j2KNfuxGyCJ3ODZUH3FspjdKokZW4fcTxYI21xAb5ZiFLhMAM6VniOCkFZRoJuY
	 POyswzIOtq8ekoAqaDa0coM6jbqE28kGIdh0f3rZCr5goNlbidEH259BM3c3TiFKAPryT
	 xJeYrzvkzgDVrzNANvJ8dgd+TUfQ4uEN9VLzF7VXlF9qYMvZgKNFNczrEBW5cHUetzA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 540D21F000ED;
	Fri, 20 Nov 2026 10:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795171545;
	bh=zV76d2YESqZWH1Drxbc6WOxz9N8JdPgmkEvh2BgOs8w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ofN5+2RgS1WQyGc8LnWVpkkg071Bdcjc12jiYj2XOCuE8RpY+zlvPYy/ObozTO90l
	 z1QgVs2sy/IaFVgvddVHLjgtLbgltobHGw+M15NMOca8AAOG2rIVt3VeQhinUuDpfg
	 uQ9egm+VLf8aR6anVFCZwwn5UnbNQW3ZKfCP8/cnq2VZTMsN5nh26APqnd5Z+RC7wW
	 JvNaQSe0cjFuGoMoNSNA7zrl43QTyP77AP4O700oqBTFz6dgvx+5wB+uNKQA1p25Xs
	 DU2XNget67QmUQgNE7SHULxNLqlzzhi1P+z8lC6qVIDDEgABA6M9WnhJ8LUpWE8SP7
	 gcpazKyGrdtwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D301249810;
	Fri, 20 Nov 2026 10:45:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 10:45:34 +0000
Subject: [PATCH net-next v4 3/5] net: stmmac: Balance runtime PM when the
 probe fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-sun8i-emac-mux-uaf-v4-3-57eba8915f25@gmail.com>
References: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795171532; l=980;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=97PW5UFQBSB4Dnlh/PFE17fL8cbRuMGnU3dk5Q8efjw=;
 b=syVtZ25ayULnjArOlHLxIBpunZ75gTnHIIXt5gPUQe7+pDpaMqHQdKfqpEUV/1vcpQIO9NpYf
 OnUsSNj0EnoCp2Dj28a93ZUH7bmc+xg4Xi5RzTQLjCRcZG/0jfLPOa3
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

__stmmac_dvr_probe() enables runtime PM and takes a usage count before
it registers the MDIO bus, but its error path undoes neither. After a
failed or deferred probe the device never runtime-suspends.

Undo both, as stmmac_dvr_remove() does.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f256244ce0d1..4ebf4b625374 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8407,6 +8407,8 @@ static int __stmmac_dvr_probe(struct device *device,
 error_pcs_setup:
 	stmmac_mdio_unregister(ndev);
 error_mdio_register:
+	pm_runtime_disable(device);
+	pm_runtime_put_noidle(device);
 	stmmac_napi_del(ndev);
 error_hw_init:
 	destroy_workqueue(priv->wq);

-- 
2.55.0



