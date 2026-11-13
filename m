Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F971606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UZZGvoxy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FnYhmhZI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HMtANjk4GU012+eLIq+hnR6uBCK3SXj0H4p5cRjiXZI=; b=UZZGvoxyXykB+eS9wgT9wIjQ2p
	G1Z+D4sG7xSRoj9AtbvQyOWvRv3mBilOgsTjMDIqfdWXWaiGT9W9/J91KLtyvB+P86iVGyy7IQ4SS
	EcTU51mgVoAscHIwYIo4ZUKjMN/GOAx+GP+O15b1yRE2XB6+Q7+3zF+ytvVZW4KFTQA+6aNzUuqx+
	obgZ7wZOJ5PJEMl1BgTLHZa1va482qIZE+R3CD4TW2YmoRigEBJ5Auhy7hJz5rZ4vzAkT7Ao6HsdZ
	FtbQ9SbD0Zan1ATavS7rDQfG7yUnc4ho3UhueW1Von36Fdwxzv9c0G0LA0NIwCpnUJsphoGVryfYJ
	U8pEfGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRm7j-0000000BxLg-3QIY;
	Fri, 13 Nov 2026 07:55:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRm7i-0000000BxLK-2ZeM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:55:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F92A62592;
	Fri, 13 Nov 2026 07:55:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794556501;
	b=wu1EBmDfNJntdmbaAhlRidR0Rubp4j2G2dfQmebacOgIikOpjg9pPM5prGmpv/hxdRpY
	 yX1f9ciylo5GH5j4bH8IhPPyMNa9ywKD1aaXU43+2H+UFYUqgGJt5HBaOt4wOij1eMh7F
	 v/BFRjELgKXsbzlzwGm4My4U8Lyw61YiJM20qjryCDBkMOjaVa3sY9kK5739CrTNKqkqO
	 WN4VMB7wqnEZP/OAQWLQgX/7QkwEQq4657Jk5qeVhIdaGN/7YIG73G2bhizk6fL1BQev1
	 BbD1Dl/wCRD4xfhhkpAjqxWobOK1FwpOwiwtQPpMBSga5fEfxL38F/uB+gdiffWBgZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794556501;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HMtANjk4GU012+eLIq+hnR6uBCK3SXj0H4p5cRjiXZI=;
	b=sah2kNwA/vVr2GDEyS9ZP/xkaL1H2nKrbTCC7GkHmaRBeXVjmgf3VPAHliTY1tlPgdRc
	 uEpnyxoXsb8/6iqKw0gZnF52Q6yMCqPv8wsR+4UkjSl7K2j0KTut8urXX4kdy5fFjXCEl
	 2C5lH9Dx68yOk//wvGzIf2utdi5PSfUnSI/IUsxTHKayMQb+7cF3cS2PpyntEpj1NsbZZ
	 svus0hjvKrJiVGjf9DUFIlnwODe74QhIH2VUJhSZnz0IA3sgppEFCX3DXBZvyYfkae2gK
	 ZbEESrB4MdHmq7RZoUbWqa/+bSwPTFVM98htGZVPQiKAbU5XlTISfpXrBQCpkQl003A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCD681F000C4;
	Fri, 13 Nov 2026 07:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794556501;
	bh=HMtANjk4GU012+eLIq+hnR6uBCK3SXj0H4p5cRjiXZI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=FnYhmhZIWrZPDd1UGKM/uG4l+uXZeRENKiRvEfbpqkU/o3wOegHcJmPvm5OIG8tdR
	 b/rQy8sMnc14akWUVQeR7MnC3wtxlWJwu5Bgleq9Ty7FbXfWEdrdTFruCeQdEqI/P3
	 MsrBzLC8m1DL3hT3iwDNmKJ3FvOsSB8lE5dkDd69lAnD8sTqUXFMZ2bShmELXqpzQ4
	 Ju3e8uMsWWNSpJ+ASB94u6UA6r/5n3x3N4J39HzMcM6wy7MYxjJpamdLlz4OmuQJk0
	 u8DjTnLLPj+ECTNuIeAERu/XjQyv5O8xtAeMC+xH0lbn+AFHKNEV4rH0yD/M2c5ti4
	 vZsLmkVqSHpPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2BF804764E;
	Fri, 13 Nov 2026 07:55:00 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 07:55:00 +0000
Subject: [PATCH net-next v2] net: stmmac: dwmac-sun8i: Fix use-after-free
 in the MDIO mux error path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-sun8i-emac-mux-uaf-v2-1-6203666b2687@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBCEX8Xs2TVsjVg9+R6GQ6lbWCPF9IdgC
 O8u4N3jl5n5ZoLIQTjCdTdB4EGi9H4Btd+BbY1vGOWxMKhClUSkMGavBbkzFrs8YjYOqTZanxR
 dHDMsw3dgJ+MmvYPnhJ7HBNUvibl+sk2rc+22ElMfPtv/QNvi39VASHgstOEzl846dWs6I6+D7
 Tuo5nn+AhTscW/QAAAA
X-Change-ID: 20261112-sun8i-emac-mux-uaf-1ba885219fee
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794556499; l=1964;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=NA8bN4vdYnbD8Ubperq81cDG9VH7nmrLZlmkjA0DuNI=;
 b=cDtf6HyIYs9kKxz/DU3DMnuaFJxtsme6r42uIwnosHwItkgWxmYMNmK9McP7j2AbGcDRnYa0A
 4s93602poFgAD/01apDkyX9WWqsTaJZysHRMbkXRbXj9Qq7pdJwWsoE
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

If mdio_mux_init() fails after the scan of the internal bus has powered
the internal PHY (the external bus returns -EPROBE_DEFER, or an
allocation fails), the dwmac_mux error path puts rst_ephy and ephy_clk
and then calls stmmac_pltfr_remove(). sun8i_dwmac_exit() then unpowers
the PHY through the clock and reset control that were just released.

Unpower the internal PHY before releasing them, as sun8i_dwmac_remove()
does.

Fixes: 529254216773 ("net: stmmac: dwmac-sun8i: Balance internal PHY resource references")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Sashiko's review of another dwmac-sun8i series of mine pointed this
out. Build-tested only (arm64 and arm, W=1): I have no board with the
internal PHY (H3, H5 or V3s), so the error path was not exercised.

This patch was developed with Claude (Anthropic), which checked the
report against the code and wrote the fix and the commit message. I
reviewed it.
---
Changes in v2:
- Target net-next instead of net, drop Cc: stable (Andrew Lunn)
- Shorter commit message
- Rebased onto net-next
- Link to v1: https://patch.msgid.link/20261112-sun8i-emac-mux-uaf-v1-1-308ae7e6fcf2@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..898560e8e95c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1245,6 +1245,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	return 0;
 
 dwmac_mux:
+	sun8i_dwmac_unpower_internal_phy(gmac);
 	reset_control_put(gmac->rst_ephy);
 	clk_put(gmac->ephy_clk);
 dwmac_remove:

---
base-commit: 573af801552999954caa8347e4490b04cf4763f0
change-id: 20261112-sun8i-emac-mux-uaf-1ba885219fee

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



