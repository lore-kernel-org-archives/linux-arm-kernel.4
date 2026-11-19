Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20885606B129
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0vsHEOMQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJZSv4kr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nb33FLiwRdggqM+tRgldLojfC3XMycjwBpBhzpwRiSU=; b=0vsHEOMQjYSHYQd4fuWusPJRci
	hT/AqjTzPy3jqNbwVFzYoqdNX+QbVH0+qhDtaeRVzP3kervVEYPRJBfZ7JWWHuNjcGnomgRbKq5S3
	C6Ga25YOiscxIY29p0dpOD5kGrx5Y0aCXVM7w+MFU8V3SyP7CNQQtXz/ydl3eXN9mXynedFhyjwjh
	SGjqbmjcQ8tuMjIBY241OCwl+/+gJ+tHaYR9Ck9OUEDO27rzvQnvv/afJc6rm/12H5P/Gz1KTkGIe
	Ss6N24DaOtT8XZEv5/0AMsG1dAF6EDUYULCdJH3BdIfnCJmvK8xVigcc0QCONw/+kjL5CNescGYlh
	MTNMaoTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxh2-0000000BDGV-2JUs;
	Thu, 19 Nov 2026 08:40:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxgS-0000000BCh4-1w5w;
	Thu, 19 Nov 2026 08:39:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B3A648BFD;
	Thu, 19 Nov 2026 08:39:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795077596;
	b=Pb3fMXXPap2+6U3cegj+6oo2uNzQTvwC+4uTQ/gMSa7tVJJbaLUxFT5HAj/+2XhPMrwO
	 6zXu+gS0hyhzuWvKcsB8gtFcdNYgoV5OfXfgKCh9kbSHszPNrAMYcuN6dZtoIACW1XU3k
	 1V4MEQyQcGkPUxvOpPW+IdnhNEGQkNi9XnXxgndn3LnP9DP9u3WjpSvrzq3Etj5SKNz6F
	 xFNINMmsVop29SqLhVGPtNQc6RhfYcIiB7l8cH8eUZ1O1B8hCVwtgCijLZW7kVumC8eTi
	 1VtI6h+UExI5KgCAgnM3/0kU6oL8v7LZlgqcxZAxwRwOGUoJlnWFrQ31oJqFuq4G15w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795077596;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nb33FLiwRdggqM+tRgldLojfC3XMycjwBpBhzpwRiSU=;
	b=3A8kM9ZIJV92280H/AeRg265T8NhJVQef9bRHP4PQ9ycIAciE35g75P1C7Z5GywktyvK
	 7eEX6sn6JGan154CQkIzlnIVnk5qwal4Zt/FfWPfh5GAGzKfqwmI+rcMNyKusJd9wDg/+
	 Gn6oAiA1iVsjSTP/TUOmPlrLEn2OZ50XG1LFfVU6/xY2fU2MtbcUB4bXE0yLHnzG6eGq8
	 vOzK10pIS07MQ9PCaM3w7DO8xGBSHGUaywn/dxG6oJmodcbnEVwitpnyrp3PqoSYM+R3+
	 OiA/ptWMUvWtUUD+a8OVYljVQOeLEqMLAVSSYWRJjuqspXQ3BvHBu6QPXcxbSHYnHNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3FB41F0092A;
	Thu, 19 Nov 2026 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795077596;
	bh=nb33FLiwRdggqM+tRgldLojfC3XMycjwBpBhzpwRiSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aJZSv4krsStYFoWhOK9y6LONPayuJ6pO6YMc/vfa+hZCqF20WS1L1Zd0x5G/sn5Dm
	 DjiXRdyJNsNlC3isv9T1CfPtx9yTX51m1+yiPikcDV1vArai1PH8efpdQsfqzymGT2
	 hPsRfitYAfZSX3Q4Vxg9/vh+UG+NM2KcyUFcdTxtelD58MwDMGtrstLIkGFxO7X8Jv
	 YiZGs0eAiqNpTjWgzH93Ta0nJd2Ct+VwGj5ETRMTvSYZWqypoeiej90Hj+Y+WHMA5P
	 8M32GyCVTZAV4sJi91tLNa0nIjFS6jtAg8jro3qPMJrC/KZZ/5qp5DoVXWJn3dsaiH
	 38mwL0KgA5TcQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 262664B1C6;
	Thu, 19 Nov 2026 08:39:50 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Thu, 19 Nov 2026 16:39:50 +0800
Subject: [PATCH net v10 09/10] can: rockchip_canfd: prevent timestamp work
 from rearming after bus-off
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-rockchip-canfd-restart-close-v10-9-df23913aa33a@qq.com>
References: <20261119-rockchip-canfd-restart-close-v10-0-df23913aa33a@qq.com>
In-Reply-To: <20261119-rockchip-canfd-restart-close-v10-0-df23913aa33a@qq.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795077587; l=4527;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=fMicjRoi9porUx2jYrhugbQCU5FEXS7CEYjjEugBLtQ=;
 b=Y2QPBO/LHPCXCMOEjyWwvUcrVNB2PH7ZZ2+2Ywd7fxfc/ekF/3s2Ryx6cwiHiMTsJCR+GQz6q
 v183FYoSvodBcRTHJzC0G8wOHZbagHc1pJvyG0awd7bVTCV+QnIsYzO
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

Use disable_delayed_work() to block requeueing on bus-off. Initialize
the work disabled and enable it after initializing the timecounter.

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
index 07fc5bc605df..9fa0327b3e74 100644
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
 	bool tx_retry_enabled;
 	bool tx_retry_pending;
 

-- 
2.34.1



