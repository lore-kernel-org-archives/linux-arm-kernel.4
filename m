Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03C3606EE92
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d8c+46dD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFELdUsJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eq9e5/JVOIYpfaf2X6q2/pV4dCFq8e5rt1cZux4duCo=; b=d8c+46dDNpZoe7WX01Y8UHt8Qq
	Jt6OQ4zu3dOhb4CPfyUZw9PbdW0LNGIs+2RNoJ19GYAWS8nnyLoYwla1hFaPrr6LIEm7DSmocabAF
	oVrZQmVRs7if8/c9Bsut3UsbP0Sb+SPOB9Vm2qpLvmo02sOxJEmp7mRiVVlZQnBSt8zee72ST6K1c
	yBc+EEB4jKPyVqNDnb9rP9VxRBHlBpHZJ/Ech9QpHAtwK85xhsU8e+gLQXmbHRS9qtRX1ILkh1zL9
	7U+Yej6u25Qi27xeNV7jopm5oOLvzy+rZFAYWeb7+w+yo6ozoTRhzXPU7Rim833u6Gd7MLGrkXQIz
	eQIP8gPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1Ah-0000000G3on-1Uc3;
	Sun, 08 Nov 2026 11:34:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1Aa-0000000G3Zd-47yP;
	Sun, 08 Nov 2026 11:34:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CAE1961855;
	Sun,  8 Nov 2026 11:34:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794137684;
	b=ceKg/StLE1FC3Q1io0GPuYNeOfwn0bt41ZKRp7zg+uCJUsbx3p8JQCoXFERWd+L+bCzm
	 vZzr4STuJfSQX5ehIzBzHajlXQu/vpExD9kFDoAhqWlolzZk04UBodFXC01qHYZGWkyoK
	 kliyLGpIcxxIyHtfszwiXlxnfjFH7yI85B+Jw5o6os3MbTjbMfkyGIZTQtdF7cXwZQO+5
	 IFCpsYARSpwOqGCneuEg2hsBYcYHcDz5R0tKsz9leIWb90HEcRhJkOikE92IJ8zz4RMUU
	 ZHXWnCrhuINzGZRg8QDyuqC1O4I+4Rfej7fW24rfVsR+csOFdMWP/b9PNveZZ7dx3hQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794137684;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eq9e5/JVOIYpfaf2X6q2/pV4dCFq8e5rt1cZux4duCo=;
	b=optsaJBQJS0Tdz3FUnmcR08ezPBagNdpUbGJfqqU+bJnfRcZo0hq5lyD8mf3nCQhZRpa
	 egCcurpJtnrhalcJTKjNwdQKqyDAn93DFdRUeSrWwWioUEyu2hereR0Vr0UzHUsRBFM+v
	 Ic4GbVl/kv50ovoLmz9lhZ5EbTjHz+TEc6LI/279zuUN6fkW83EWK32bGFCZTR1Nrfvot
	 /ioU8EoRZXRbALu/v2T4bt81VOTT3/xxqFZDLzf5m7jvc9CFpXWBpRA9rQl63i4SDRSw7
	 nbIXh4dmzhGQJnpvD0pS2fYGNrmKdUG/M0RmliOClM1UxdVs1UUMc2shYE8Il9+wUKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A08A1F008A7;
	Sun,  8 Nov 2026 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794137684;
	bh=eq9e5/JVOIYpfaf2X6q2/pV4dCFq8e5rt1cZux4duCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nFELdUsJzbdPA+5KhzyxL8MfMYoJLlwiD+GB5NKL7flGiVUHBowdi8rQpSKMDvP4/
	 CN8vP2gR5W1kKEFa+xD0bcUsPrChMLtnIVn4oYt7yiXQ2pk7q2N8BXaPqz8kLhDRSV
	 wVm3OtaJ3dkemFd046aKS8/ddUE8OBWFfOIJanPjJPow5386QLlTwXVV2PC4y1pVbn
	 e8CMmwD+iVge9d1Dou0mZVkAB3951cRH+x3r5B1Ouk9ieSKe4IgBMigA8ZPVToNdnp
	 5ZNgUUqxxaoWALQ/+Xzlp0luDaBmOYELbEoTgsnoGltPCxeEug7XN0JoIkQ8GKKyVr
	 LWKi3B6YEDmLA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B565447F2D;
	Sun,  8 Nov 2026 11:34:40 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Sun, 08 Nov 2026 19:33:36 +0800
Subject: [PATCH net v8 09/10] can: rockchip_canfd: prevent timestamp work
 from rearming after bus-off
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-rockchip-canfd-restart-close-v8-9-3e7a23fd9eae@qq.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794137678; l=4333;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=SOO163gzYNYZNP6n4OTUiW0fL5Doo8hMgGkDjKR3yOc=;
 b=WztUDbOQL5HOouUAirhh/+HMX/+mQpa1lDUnioP8ldrNJgA3jE6q3OLWG9kYf2wjxf44UzU1v
 6E3Sl7cl9GBCD7PO9AWZsTYOTCndh/8XR8UhOiMf2B01BMBIn5iGjaT
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Cunhao Lu <1579567540@qq.com>

The bus-off IRQ cancels timestamp work asynchronously. If the worker
is already running, it can requeue itself after cancellation and keep
polling while the controller remains bus-off.

Add a dedicated lock and an active flag, initialized once at probe.
Serialize the worker's active check, counter read and self-requeue with
start and stop. Clear the flag under the lock before cancelling work
so no worker can read the counter or rearm after deactivation. Enable
the flag and schedule the initial work under the same lock at start.

Keep both cancellation calls outside the lock so synchronous stop can
wait for the worker to finish.

Fixes: 4e1a18bab124 ("can: rockchip_canfd: add hardware timestamping support")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 .../net/can/rockchip/rockchip_canfd-timestamp.c    | 34 +++++++++++++++++++---
 drivers/net/can/rockchip/rockchip_canfd.h          |  3 ++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
index ad582afbbd68..1d2a122770dc 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
@@ -30,18 +30,27 @@ static void rkcanfd_timestamp_work(struct work_struct *work)
 {
 	const struct delayed_work *delayed_work = to_delayed_work(work);
 	struct rkcanfd_priv *priv;
+	unsigned long flags;
 
 	priv = container_of(delayed_work, struct rkcanfd_priv, timestamp);
-	timecounter_read(&priv->tc);
-
-	schedule_delayed_work(&priv->timestamp, priv->work_delay_jiffies);
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
+	if (priv->timestamp_active) {
+		timecounter_read(&priv->tc);
+
+		/* Serialize requeueing with timestamp deactivation. */
+		schedule_delayed_work(&priv->timestamp, priv->work_delay_jiffies);
+	}
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
 }
 
 void rkcanfd_timestamp_work_init(struct rkcanfd_priv *priv)
 {
+	spin_lock_init(&priv->timestamp_lock);
+	priv->timestamp_active = false;
 	INIT_DELAYED_WORK(&priv->timestamp, rkcanfd_timestamp_work);
 }
 
+/* The caller must quiesce IRQs and timestamp work before reconfiguration. */
 void rkcanfd_timestamp_init(struct rkcanfd_priv *priv)
 {
 	const struct can_bittiming *dbt = &priv->can.fd.data_bittiming;
@@ -93,17 +102,34 @@ void rkcanfd_timestamp_init(struct rkcanfd_priv *priv)
 
 void rkcanfd_timestamp_start(struct rkcanfd_priv *priv)
 {
-	timecounter_init(&priv->tc, &priv->cc, ktime_get_real_ns());
+	unsigned long flags;
 
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
+	timecounter_init(&priv->tc, &priv->cc, ktime_get_real_ns());
+	priv->timestamp_active = true;
 	schedule_delayed_work(&priv->timestamp, priv->work_delay_jiffies);
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
 }
 
 void rkcanfd_timestamp_stop(struct rkcanfd_priv *priv)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
+	priv->timestamp_active = false;
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
+
 	cancel_delayed_work(&priv->timestamp);
 }
 
 void rkcanfd_timestamp_stop_sync(struct rkcanfd_priv *priv)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
+	priv->timestamp_active = false;
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
+
+	/* The worker needs timestamp_lock to finish. */
 	cancel_delayed_work_sync(&priv->timestamp);
 }
diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/rockchip/rockchip_canfd.h
index 3664124a8da2..078876769a05 100644
--- a/drivers/net/can/rockchip/rockchip_canfd.h
+++ b/drivers/net/can/rockchip/rockchip_canfd.h
@@ -477,6 +477,8 @@ struct rkcanfd_priv {
 
 	/* Serialize TX submission/completion with bus-off and restart. */
 	spinlock_t tx_lock;
+	/* Protects timestamp_active and worker reads/requeueing. */
+	spinlock_t timestamp_lock;
 	void __iomem *regs;
 	unsigned int tx_head;
 	unsigned int tx_tail;
@@ -485,6 +487,7 @@ struct rkcanfd_priv {
 	u32 reg_int_mask_default;
 	bool tx_enabled;
 	bool irq_suspended;
+	bool timestamp_active;
 	struct rkcanfd_devtype_data devtype_data;
 
 	struct cyclecounter cc;

-- 
2.34.1



