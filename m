Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16C8606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d5C0ss8G;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gfb5y9FZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mBroFHfazcg5eGLlVC9fvXgMR1jwltSXyMFmzJhoSRA=; b=d5C0ss8GkE9Ov7ks+uvWXfGbNh
	C+IwWAOjBr64j2MKmf/g7QB4h0B6cGZ9mIIIVnimP49Zb5U5kcvvaAB+TWkUYoiq+Ah+kqnjTYF23
	tSQ+0Yt4VGU6UCYOBo4DAG8H9yBGOCdj5+9GtlJVa1h7t87+PEUAjvTubChB9F/EhnpEIFeBqoFRA
	LC5a1j+tOtL79nr3m8hQnyVQnycXZa/hp9y6IZUkyYdRLKsYsjhIu1skTMmrrXo+9PyEq14h7NWzW
	gApVash7LZBpDpKE2ozJFbYUeroFrZwgFxsp+d9zIjDiQZIF8oGD8nmmxDncIoY2mi0TpelkxFVUi
	WuGrdWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1fo-00000005k9T-37A7;
	Wed, 11 Nov 2026 06:19:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1fW-00000005jnK-3Dxy;
	Wed, 11 Nov 2026 06:18:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BA934740B;
	Wed, 11 Nov 2026 06:18:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794377930;
	b=NwnGhUZhrn78o+FE6nuDMwwrAHKPICxX+5h1p0de24hI7h9oPCNjYOpzgl3V8re8GBy0
	 h7z6zikDTL/XWAXadL7jgD3eVe0WOM/mEHaz+/4JJql7d1DJWjJ4hgwDSB1BWVIW3b1rA
	 5Pa7Tshs6EpbnHKYciJ1y4t5r3My17Zpgqnyp7Q7qZO9BMfb95IraPQNLv7JM56bLR83K
	 S2qlWJ5CjFC3lkkklmu8mjgzvf19Z3oA3HL/dg5euHczpBXa1mZZnBv2R7VikUSm4/yGl
	 73Xydx5IQ3B7j3kTc3tlN4j/2DZHTtF95nf033X+i8Co8oNgHJgrj3pYUT3YA30bShA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794377930;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mBroFHfazcg5eGLlVC9fvXgMR1jwltSXyMFmzJhoSRA=;
	b=gMiQam/OHZOps1COdAHR4yNnT5jKInBeOBGTl4jhHH81fvyoegLtfTWZLit9z6QyjTHP
	 hDyRvx3ISIcqV3hGDBGToxiRvkKjkYDNf5iwB/VWqfI3yKAvqOCGecox9KYSsFEU6B9Ox
	 W69X95Vno0TijVPXKQMEGFJ/IDPhgLi8ma9a+DNDzPUTTzHm5Xoeb+UIJnh3g5tH3dWet
	 sr5X696aJKR1jux+Bmw+qjiZaiU921RLYp0/0zFK9rsxkR7NCbDOzq8525UWz3lsBkjsc
	 lfBAyZKGw2FVFwk+PVEijMlhaVmNv2vreJ3D5rPExRnKvQ+ck/1Y7aOhkUKEdTZm/NQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D40E1F00A0D;
	Wed, 11 Nov 2026 06:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794377930;
	bh=mBroFHfazcg5eGLlVC9fvXgMR1jwltSXyMFmzJhoSRA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gfb5y9FZNeSWjQ9Itw9v8HXrMUrpkMCGUjDYpTE2lZVszdvSlmDrQA6KS7ApMgFUu
	 A6Orzaj1I1YIhQ8Rn11Qd82MySU9E+uEriom2tD1cV+gmRpsH57miWTJsOX0JgS3KU
	 2WGXQJ3Xr1vITT7ppa+w7I+t9O265SLV3MmEFFebRE5R6uxj5MwkpbSsnJvFner13g
	 rC6tRo1kSgOH5m2LPUsAoaVU+9A4IPWUEOnVfgWhPPgShvsyNkGtw91L6UH5j0axu3
	 kJUs4heKBpFfgPNA9NrTFQhMWhXX4f8A1Fo1+Nqb/sY0P9uWk/mcgM7oSxxDld7sjz
	 ra07LDyrJ7WKA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6A01448E1E;
	Wed, 11 Nov 2026 06:18:47 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Wed, 11 Nov 2026 14:18:03 +0800
Subject: [PATCH net v9 09/10] can: rockchip_canfd: prevent timestamp work
 from rearming after bus-off
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-rockchip-canfd-restart-close-v9-9-6643f3825ba3@qq.com>
References: <20261111-rockchip-canfd-restart-close-v9-0-6643f3825ba3@qq.com>
In-Reply-To: <20261111-rockchip-canfd-restart-close-v9-0-6643f3825ba3@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Wolfgang Grandegger <wg@grandegger.com>
Cc: linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Cunhao Lu <1579567540@qq.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794377925; l=4546;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=z5MuF2TQ0+5PNXm0tzVl2YQVcjJOMQeedOJLqUjpuaU=;
 b=kz2cLZ+hQGR2CiStWVQPY1rcMUHrrNA8sQuQbczFVOCK9kNV2moNhZesjmYl6WQc2MN1CHc1j
 WwflmKbSv3DDh5IkKH8fupTQacbmN2B2JXqpfNpBO2+555+jD9jukvx
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
polling during bus-off, causing unnecessary wakeups and counter reads.

Use disable_delayed_work() to block requeueing until startup re-enables
the work. Initialize it disabled and enable it after initializing the
timecounter.

Keep the active check and counter read under timestamp_lock so stop
waits for an in-flight read before the controller is reset. Use the
active flag to avoid disabling work twice when restart or close follows
bus-off.

Keep workqueue operations outside timestamp_lock; the IRQ and restart
paths already serialize start and stop. Synchronous stop waits for the
callback before reinitialization or clock shutdown.

Fixes: 4e1a18bab124 ("can: rockchip_canfd: add hardware timestamping support")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v9:
- Use disable_delayed_work() to block self-requeueing, with balanced
  enable/disable calls across repeated stops.
- Move worker requeueing and initial scheduling outside timestamp_lock.
---
 .../net/can/rockchip/rockchip_canfd-timestamp.c    | 30 ++++++++++++++++++++--
 drivers/net/can/rockchip/rockchip_canfd.h          |  3 +++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
index ad582afbbd68..7c7b95343aa8 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-timestamp.c
@@ -30,18 +30,26 @@ static void rkcanfd_timestamp_work(struct work_struct *work)
 {
 	const struct delayed_work *delayed_work = to_delayed_work(work);
 	struct rkcanfd_priv *priv;
+	unsigned long flags;
 
 	priv = container_of(delayed_work, struct rkcanfd_priv, timestamp);
-	timecounter_read(&priv->tc);
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
+	if (priv->timestamp_active)
+		timecounter_read(&priv->tc);
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
 
 	schedule_delayed_work(&priv->timestamp, priv->work_delay_jiffies);
 }
 
 void rkcanfd_timestamp_work_init(struct rkcanfd_priv *priv)
 {
+	spin_lock_init(&priv->timestamp_lock);
+	priv->timestamp_active = false;
 	INIT_DELAYED_WORK(&priv->timestamp, rkcanfd_timestamp_work);
+	disable_delayed_work(&priv->timestamp);
 }
 
+/* The caller must quiesce IRQs and timestamp work before reconfiguration. */
 void rkcanfd_timestamp_init(struct rkcanfd_priv *priv)
 {
 	const struct can_bittiming *dbt = &priv->can.fd.data_bittiming;
@@ -93,17 +101,35 @@ void rkcanfd_timestamp_init(struct rkcanfd_priv *priv)
 
 void rkcanfd_timestamp_start(struct rkcanfd_priv *priv)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
 	timecounter_init(&priv->tc, &priv->cc, ktime_get_real_ns());
+	priv->timestamp_active = true;
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
 
+	enable_delayed_work(&priv->timestamp);
 	schedule_delayed_work(&priv->timestamp, priv->work_delay_jiffies);
 }
 
 void rkcanfd_timestamp_stop(struct rkcanfd_priv *priv)
 {
-	cancel_delayed_work(&priv->timestamp);
+	unsigned long flags;
+
+	/* Stop counter reads before the caller resets the controller. */
+	spin_lock_irqsave(&priv->timestamp_lock, flags);
+	if (!priv->timestamp_active) {
+		spin_unlock_irqrestore(&priv->timestamp_lock, flags);
+		return;
+	}
+	priv->timestamp_active = false;
+	spin_unlock_irqrestore(&priv->timestamp_lock, flags);
+
+	disable_delayed_work(&priv->timestamp);
 }
 
 void rkcanfd_timestamp_stop_sync(struct rkcanfd_priv *priv)
 {
+	rkcanfd_timestamp_stop(priv);
 	cancel_delayed_work_sync(&priv->timestamp);
 }
diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/rockchip/rockchip_canfd.h
index 8fdb59025bfa..3ce996f52e45 100644
--- a/drivers/net/can/rockchip/rockchip_canfd.h
+++ b/drivers/net/can/rockchip/rockchip_canfd.h
@@ -477,6 +477,8 @@ struct rkcanfd_priv {
 
 	/* Serialize TX submission/completion with bus-off and restart. */
 	spinlock_t tx_lock;
+	/* Serialize timestamp work with start/stop. */
+	spinlock_t timestamp_lock;
 	void __iomem *regs;
 	unsigned int tx_head;
 	unsigned int tx_tail;
@@ -487,6 +489,7 @@ struct rkcanfd_priv {
 
 	bool tx_enabled;
 	bool irq_suspended;
+	bool timestamp_active;
 
 	struct cyclecounter cc;
 	struct timecounter tc;

-- 
2.34.1



