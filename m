Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9492606EE8E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 11:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HRKZlVDK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GplFLt4T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x5X8EYURuKn/7X627usknV/yyXb+kYv1CRAi9eXfVxQ=; b=HRKZlVDK8cPeCB9xzldrDxMRo/
	Qs1bLetgwvUDqD8usrdKjlQueO//kFN6TtN5Lo/iabjM9GbxrXDAHGSzWZJujzUkw64SoS/MqmOu0
	+NpbUP9a0ee2L2l37RkwCyHW+tZhIa4zFp5sTIcoi2dW0yYQZSn+QsmaD9ZlEwsBkvj65xsM80VCx
	Pe11Rpfe0r/2/keChans+N6ZCjgkQT8y/qYprXkxqWdAXU6qo+nbxNgDbkPI/cxNmaM3X0A48wq/5
	VXgNJwm7/2BoZRahXC985+hJ9npwbWqejkVysCwDR0xfscVqMb7IsUn7CZgf+BJ8IRl0O8cLcgv4Z
	f+MrNChg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1Ac-0000000G3cs-3MVT;
	Sun, 08 Nov 2026 11:34:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1AZ-0000000G3Z7-1dOl;
	Sun, 08 Nov 2026 11:34:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A1918447E0;
	Sun,  8 Nov 2026 11:34:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794137682;
	b=3b7UfbU40jtiP8FDNm8Yhn6bjssXb2BAGaGhDED+wY01qGTKRU+ZCK5upLZmi5rFNMoG
	 dELXDI0RSMyt8FWCuJLnFEbypHzvv4rXoeGnoI7u8fNERq1w8YYB98Alc1o18chFQ0rl5
	 pR6CrHMb4jMFCdBsq157SpRbyhkoKc2ELokgaiKEsHN0/OhZeRQGaD9ocwMvJxjpJrGTX
	 0BU9WnZVUimDAFVlUcuZEEUUKPbZaVd+e0u63ArC6ePZn0myPgE+6jAikgERecxCObmt0
	 e9NMAzQGF6v3xbomen1OpvOmuStvlzgu5Yq0YoxuYIiQuxgnmaNGvHbbYAFximgrDAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794137682;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=x5X8EYURuKn/7X627usknV/yyXb+kYv1CRAi9eXfVxQ=;
	b=XMTl/sVKT9Tko2UiNdsFq/Rf853+kAyZTt54LN2eeNy91/14nXDB3OTfF5/gLoKOa9yC
	 n1uuXB92vd4oS1GchGzB54D9vhihF0OMzx2FXL/1ydZgDFOa8TlMXFDTttqkipSvu14MN
	 V4bGYQ/AWGYAJHT2WR4acGpqEKjx4bTSEruiZNL5kmmkjMs3p5QDmieSF5zAZTO+wWK+L
	 qPGyWW4FN8Fpn55MFGO26KTOqpm1gEg/Xo5FLSxWlUE0YwgScJwVeajczSUyuuzFN99KL
	 Tuzimih+koATvlK2cGj7byOQV03N1kP+ff9FpdRX2gEq3665WGR0abdmAwd327RMTQQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6A821F008A4;
	Sun,  8 Nov 2026 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794137682;
	bh=x5X8EYURuKn/7X627usknV/yyXb+kYv1CRAi9eXfVxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GplFLt4T/LSso7NiZ4qwQjGkN6bjNpE6NV8pFU6kWQNG32KQqyEAYdxuBBK95T6LF
	 WXKZDLuNIBAXLKAQ5c/lTKCZfhGAvBHmlPYW5OQj9OcvsQYycHW8d3r7ZYDr+jQNb7
	 Rg/njDixArTFtlo15LaDtnXPnYOTkAo+BTCQx1o6DBxAreuyUz9rUtwH30aB6VDNTp
	 m8xJHFJMcSSJy3VWZwACnWnJoC+06cNxygjbBmKknAYFNIAosaDiqGx6atQ7KVZPWe
	 RwyJouiQug4jSKsx93SVyvk7FpJVFJaG7XOSm/d6A7PlMXmJ5W1Lk+f5wtT2iWquuH
	 5J7Y+ekHWlWkg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5C2DD47F19;
	Sun,  8 Nov 2026 11:34:40 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Sun, 08 Nov 2026 19:33:31 +0800
Subject: [PATCH net v8 04/10] can: dev: check netif_running() before
 bus-off recovery
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-rockchip-canfd-restart-close-v8-4-3e7a23fd9eae@qq.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794137678; l=5740;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=lSfO05WxZKbUGYfufnG16jV7I5aalY2A58BbhwHwTvU=;
 b=2i0CTBAL4teuxYtvroFdG50tld6eW5MujOfI6anCPjNtrdcaHYlLhLLQ57x4MGlgkjcGbnUfh
 Eh7oxXn8uDJBo3x+x3qUYJF/oD78Gm2qfyYTI9KlBs58V8fdSdG/cWE
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

The networking core clears __LINK_STATE_START before calling ndo_stop(),
but CAN bus-off recovery neither checks this state before queuing work
nor before calling the driver's restart callback. Recovery can therefore
be queued or started after the interface has begun closing, potentially
re-enabling hardware while the driver is tearing it down.

Check netif_running() in can_restart() before flushing echo skbs, sending
the restart notification or enabling the carrier. Keep the existing
unsupported-operation check first. In can_bus_off(), schedule recovery
only when the check observes the interface running, and make the log
message reflect that decision. Keep reporting bus-off and disabling the
carrier.

These checks do not wait for recovery that has already passed the check,
nor serialize the check with work submission. Drivers still need to
cancel restart work before tearing down resources and quiesce its
producers before their final cleanup.

Fixes: 39549eef3587 ("can: CAN Network device driver and Netlink interface")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v7:
- Clarify the running checks' limits and configure restart-ms while down.

Changes in v6:
- Update the can_bus_off() comment and document the running-interface
  requirement for automatic recovery.

---

Q: Do the running checks serialize recovery with device close?

A: No. With automatic recovery enabled, a worker can pass the check
before close clears the running bit. Drivers such as FlexCAN still
cancel it after hardware teardown, so their restart callback can run
after shutdown. The Rockchip patches in this series wait for an active
restart before teardown and cancel again after draining the IRQ.
Other drivers need separate lifetime fixes; these checks only reject
recovery that observes down.

Q: Can HI3110 queue restart work after close and outlive the device?

A: Yes. With restart-ms nonzero, its IRQ thread can sample running
before close, then queue work after close_candev() returns. The later
free_irq() drains the producer but does not cancel the queued core
work. A quick reopen can execute stale recovery; removal can leave
work referring to a freed can_priv. The driver's private workqueue
does not own this work. A separate fix must quiesce producers before
final cancellation and protect teardown from an active restart. The
running checks narrow this window but cannot protect freed memory.

Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261017-rockchip-canfd-restart-close-v6-0-ed605feb4b6e%40qq.com
---
 Documentation/networking/can.rst | 10 ++++++++--
 drivers/net/can/dev/dev.c        | 13 ++++++++++---
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/can.rst b/Documentation/networking/can.rst
index 51bc70748f753..9debef8702d5f 100644
--- a/Documentation/networking/can.rst
+++ b/Documentation/networking/can.rst
@@ -1302,7 +1302,8 @@ More info to the above output:
 	Automatic restart delay time. If set to a non-zero value, a
 	restart of the CAN controller will be triggered automatically
 	in case of a bus-off condition after the specified delay time
-	in milliseconds. By default it's off.
+	in milliseconds. Recovery is skipped if the interface is found
+	to be down. By default it's off.
 
 "bitrate 125000 sample-point 0.875"
 	Shows the real bit-rate in bits/sec and the sample-point in the
@@ -1376,9 +1377,14 @@ before you can start it to avoid error-prone default settings::
 A device may enter the "bus-off" state if too many errors occurred on
 the CAN bus. Then no more messages are received or sent. An automatic
 bus-off recovery can be enabled by setting the "restart-ms" to a
-non-zero value, e.g.::
+non-zero value while the interface is down, e.g.::
 
+    $ ip link set canX down
     $ ip link set canX type can restart-ms 100
+    $ ip link set canX up
+
+Before scheduling or starting recovery, the kernel checks whether the
+interface is running and skips recovery if it is down.
 
 Alternatively, the application may realize the "bus-off" condition
 by monitoring CAN error message frames and do a restart when
diff --git a/drivers/net/can/dev/dev.c b/drivers/net/can/dev/dev.c
index 769745e22a3c7..a893a49a33813 100644
--- a/drivers/net/can/dev/dev.c
+++ b/drivers/net/can/dev/dev.c
@@ -198,6 +198,9 @@ static int can_restart(struct net_device *dev)
 	if (!priv->do_set_mode)
 		return -EOPNOTSUPP;
 
+	if (!netif_running(dev))
+		return -ENETDOWN;
+
 	if (netif_carrier_ok(dev))
 		netdev_err(dev, "Attempt to restart for bus-off recovery, but carrier is OK?\n");
 
@@ -259,13 +262,17 @@ int can_restart_now(struct net_device *dev)
  *
  * This functions should be called when the device goes bus-off to
  * tell the netif layer that no more packets can be sent or received.
- * If enabled, a timer is started to trigger bus-off recovery.
+ * If automatic recovery is enabled, schedule delayed work unless the
+ * running check observes the interface down. Drivers must still synchronize
+ * recovery with device close.
  */
 void can_bus_off(struct net_device *dev)
 {
 	struct can_priv *priv = netdev_priv(dev);
+	bool restart;
 
-	if (priv->restart_ms)
+	restart = priv->restart_ms && netif_running(dev);
+	if (restart)
 		netdev_info(dev, "bus-off, scheduling restart in %d ms\n",
 			    priv->restart_ms);
 	else
@@ -273,7 +280,7 @@ void can_bus_off(struct net_device *dev)
 
 	netif_carrier_off(dev);
 
-	if (priv->restart_ms)
+	if (restart)
 		schedule_delayed_work(&priv->restart_work,
 				      msecs_to_jiffies(priv->restart_ms));
 }

-- 
2.34.1



