Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15996606D81E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 11:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3HqHCm/K;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aVcIjb6U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vy2qrURO3C2NVUk5rtQtWRK30u4eytr719WYCKwsdRg=; b=3HqHCm/KhOQThPJAePlLkP5utB
	1qIoFC4MMiUnUxMMF0TtGJLrFmVhmnqewV05L06cBFiC1lN4CvecqdAE8mBAjGcGcv2idkrMTxfKX
	Z5CxbbeKAsP3s67xOeFn/mkuK6XwUHtJkDIbeY6UzyVLsfHVzNlgUJ5j/9gjo9hRpG6vNwK0XrTNQ
	ecN0KKWZyRXrYWFF2D20h1eaWTSPj8JJet4vIJ2kSSZvEiVS9F8xGADleoM9Mw76AoryJ+WpfUKZU
	N6aWIA1TFttCWhswN7yR/Pqc6yyVN8JpM0WeVV+3hdJWS6/KXNNq2HL6QAwDXVQk+WF23lgFOWrRC
	rS+i+MBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1Af-0000000G3lQ-3yVq;
	Sun, 08 Nov 2026 11:34:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1Aa-0000000G3Zy-17DY;
	Sun, 08 Nov 2026 11:34:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F31E14469E;
	Sun,  8 Nov 2026 11:34:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794137683;
	b=MMXqi+MtnhgaYnjB5qdpSJst63pOD4z0O10WIygr6qUFRoX/PYc4NxfUhM/RZb4giiAb
	 4Ah9QetNLpk55yhFcxCPZpP94Ho1oiQMdi2fJ8BBFoS5UI63/iaEIz1hOJF+abmvb/vDW
	 PdEl02nfaHS9aHDeAOVwilODhnn2ZYcxZb7NOP68cr+BB0IqOxNW8LBEZ4Dhru5wIjXss
	 ay9UxLrTHca/bBSIiCTU8NsFKM/Ozeu6Df6OEIw4NWpOnPEVJzMafQEqLYDUDrYPZvafE
	 uyn0IdfnLQyVGTZU6ZCoQiJzTZhQ580osCAq7QL/HCluoemfPHyHMJkNH78X0DyDTEw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794137683;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Vy2qrURO3C2NVUk5rtQtWRK30u4eytr719WYCKwsdRg=;
	b=JY+y3kcslN8yP0iQ4/r4Ngo5+DmwBd5uI0OjbdB2urF+8lnydNCjApQqp7pBp5ZXXY4Y
	 2nYN6HZhOVQtp0lspmtNGzdEhPscEzlFmwro0DhG0aoBANdBYqob3ngC7PJ5qCNWj6QwG
	 zMmfaqciLIknzJlkkunEJtozs2alZgz5zjmcXhGAXOGIZmjDeZJssUT9dMOddvD3AlT3h
	 LXwLJIHfK73z4sGAmujv5J2CGtrRX5t9PqXDbk53SU3IsFWqY7GANL7CGBtr8dwONs7wF
	 KBDU5bF2wyRP9geGlqXOw4E/ZqlJ0TJUSSItJtm85jeZtKtB0BW7dbYJAnUV/71P0zQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26D2C1F008A2;
	Sun,  8 Nov 2026 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794137683;
	bh=Vy2qrURO3C2NVUk5rtQtWRK30u4eytr719WYCKwsdRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aVcIjb6UEbem2us9ESPX/c6uyptQmM8AzsFuGlx1qiJVnMuhNFq3WD9PGncZMXLJx
	 0xxuMYs1zWZWIOUuEWl3yc7B8MKoA1otyXpXS3UDnL5XeQ8ce79G3OzGtb7n4XnvfD
	 zqW+f8ptG5G6NtptMdGgnk0QlHb2CJY4AjrIqMjchFTla2KtUgIf83m6HUdtzxoP2m
	 Sv1Ni7U/HTB6QmK5tFetQzWbJDUQ0A/uhtmgUL9d3gmtBs6GMDFlT9CKsb+CtbEukI
	 8Xv2657SUXRmkVaTt9GM6PTrxTukaIp0u4226JK5/6Z9GMU8Vi52m5zI06PaZoSPRo
	 ggEN99QHnnFRg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C747747F31;
	Sun,  8 Nov 2026 11:34:40 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Sun, 08 Nov 2026 19:33:37 +0800
Subject: [PATCH net v8 10/10] can: rockchip_canfd: serialize timecounter
 timestamp conversion
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-rockchip-canfd-restart-close-v8-10-3e7a23fd9eae@qq.com>
References: <20261108-rockchip-canfd-restart-close-v8-0-3e7a23fd9eae@qq.com>
In-Reply-To: <20261108-rockchip-canfd-restart-close-v8-0-3e7a23fd9eae@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Wolfgang Grandegger <wg@grandegger.com>
Cc: Cunhao Lu <1579567540@qq.com>, linux-can@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794137679; l=2957;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=9VhCsHzQVgwKjVIZpuLTsjW3kBG025wPmIX2/tRYdvQ=;
 b=h+37yVex9KuC9pcGTXb3sYEez/gyJOACzqtpKUPAcVH9OPPoB+RvL9FOxd5jPxhnjx9X1p2Rm
 biQ+iWgKOeZBozIDHs5AJKfkJBOjgtf0mEDmU8BMmylAUsRgdd4Uh13
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
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
Reply-To: 1579567540@qq.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	T_SPF_TEMPERROR,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Cunhao Lu <1579567540@qq.com>

The timestamp worker advances the timecounter with timecounter_read()
while RX, TX completion and error-frame paths use timecounter_cyc2time()
to convert hardware timestamps without holding timestamp_lock.

timecounter_read() updates frac, cycle_last and nsec in separate steps.
A concurrent conversion can observe the new cycle_last with the old
nsec and produce an incorrect timestamp.

Hold timestamp_lock across timecounter_cyc2time(), using the same lock
as timecounter_read() and timecounter_init(). Keep the SKB timestamp
assignment outside the critical section.

TX completion nests timestamp_lock inside tx_lock; no timestamp-lock
holder acquires tx_lock.

Fixes: 4e1a18bab124 ("can: rockchip_canfd: add hardware timestamping support")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/net/can/rockchip/rockchip_canfd-timestamp.c | 5 ++++-
 drivers/net/can/rockchip/rockchip_canfd.h           | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
index 1d2a122770dc..e255bb33a20d 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
@@ -15,13 +15,16 @@ static u64 rkcanfd_timestamp_read(struct cyclecounter *cc)
 	return rkcanfd_get_timestamp(priv);
 }
 
-void rkcanfd_skb_set_timestamp(const struct rkcanfd_priv *priv,
+void rkcanfd_skb_set_timestamp(struct rkcanfd_priv *priv,
 			       struct sk_buff *skb, const u32 timestamp)
 {
 	struct skb_shared_hwtstamps *hwtstamps = skb_hwtstamps(skb);
+	unsigned long flags;
 	u64 ns;
 
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
 	ns = timecounter_cyc2time(&priv->tc, timestamp);
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
 
 	hwtstamps->hwtstamp = ns_to_ktime(ns);
 }
diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/rockchip/rockchip_canfd.h
index 078876769a05..ecb9e2d6aa19 100644
--- a/drivers/net/can/rockchip/rockchip_canfd.h
+++ b/drivers/net/can/rockchip/rockchip_canfd.h
@@ -477,7 +477,7 @@ struct rkcanfd_priv {
 
 	/* Serialize TX submission/completion with bus-off and restart. */
 	spinlock_t tx_lock;
-	/* Protects timestamp_active and worker reads/requeueing. */
+	/* Protects tc, timestamp_active and worker requeueing. */
 	spinlock_t timestamp_lock;
 	void __iomem *regs;
 	unsigned int tx_head;
@@ -557,7 +557,7 @@ void rkcanfd_ethtool_init(struct rkcanfd_priv *priv);
 
 int rkcanfd_handle_rx_int(struct rkcanfd_priv *priv);
 
-void rkcanfd_skb_set_timestamp(const struct rkcanfd_priv *priv,
+void rkcanfd_skb_set_timestamp(struct rkcanfd_priv *priv,
 			       struct sk_buff *skb, const u32 timestamp);
 void rkcanfd_timestamp_work_init(struct rkcanfd_priv *priv);
 void rkcanfd_timestamp_init(struct rkcanfd_priv *priv);

-- 
2.34.1



