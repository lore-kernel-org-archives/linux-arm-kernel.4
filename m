Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A52F606D805
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 11:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MGkihaTx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otrhMECy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6Ye3YRIsT97Mj7VVEQLs8MErXXMktUlYSgMTSWOhF4w=; b=MGkihaTxBqsbD37RK6QK34iI7p
	jwj/4GGqhY4Sq/bX4I3z9nStAz1NO7jUrDjPnAkQi1fafS8dMldgUo6n4sfjuFJ48IveEHCpg8Y+7
	Ct9s6DHrsRQUjWGOBbv0dvKed1xBtU6p0YS7XTU5TeQTHdQTstVgVD97qXLwqax/Gz0DquXd6xhdd
	4VvMVY5oNtyiXrXKMIs0bqBDNtbk2YkroO4NBi63iCScFyBDX7BTvzOinIMtDp4jUxq9ELeYEhIaS
	LR0VFN7ljObaAN0mX6HWWzv+IalcLx+8nAfdyJFBfFin1Lct3aIEoo1E2Xjj6hm/NMz2Z9U8t20jC
	StE04gaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1Ac-0000000G3bG-0i60;
	Sun, 08 Nov 2026 11:34:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1AZ-0000000G3Z8-1dvo;
	Sun, 08 Nov 2026 11:34:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E363244D56;
	Sun,  8 Nov 2026 11:34:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794137682;
	b=QfYVReiec3EULbGuPW3vDW0ICkvM/WHed+oE+RlevzsQy+yfRgLgcdexdErf4MKR2w8i
	 xTgp1rYZWDsFOy0aVAGPLvpCsR+AZW6zb3/xeuOSuJExb2h8MOs4Ba2XhH02PTumqQwka
	 bBBNRgAdJ6dyzcZkFCYTwlM6iuEMGNAoIjuMHLv2TUbPoMwQQ6pX34ym3aU32LbSQHBxC
	 efXB99M9gkuwJRniCiS+WfsHnwVvHKbgJVno+MDorjothHilAWHX4+kFM1fJprcHCCRVr
	 +8fW7UEhe/QIlqV+16d6gt+pMku6dDfLOs3ZL0oRlg1oR06Sr6anf7DK+lz6AndSD8A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794137682;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6Ye3YRIsT97Mj7VVEQLs8MErXXMktUlYSgMTSWOhF4w=;
	b=OUJsFmE5n+mVlP6dXiAwmpx27L/e8dogJebSD/JwY6NQwqlASwQoZGlSV6ZSZqCBPTum
	 fAhw4tQqQ6mPb3l8xqY+MueC3lqhQNuUE+a2QffrBxJVZkS9Z4JeoZE/rSxsUv+P/YN3Y
	 zOzB6jERj1Rt81YqhBDsMcl0Iv2g9090FZxjuCD6QxHONfRWLtVaEe2H24E2QkDS2aS5S
	 qXeXihniUf94X5GEG/QmJCXrVOp7VLd8cRGnmbPyDC5/O9v3SOh+PLhfYZ18oNjvzHNYL
	 4QI6ylVjhNY96ooK+yNQEDLXVBqPDlAXWeEPMk+8mUDCTG0Q57buRMWtb5WvGB7kMAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBBD41F008A5;
	Sun,  8 Nov 2026 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794137682;
	bh=6Ye3YRIsT97Mj7VVEQLs8MErXXMktUlYSgMTSWOhF4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=otrhMECykSAOHeuA9cyDYHupSYlcHcI+mK7Gfgfhkirbxzl4vmR5s2OX0ABkan8IT
	 wbig14/YLgnV6I58XZBztaB0FFv6VYQ7+v/sexlDfr61z76Ft15Zeh6O7/Hd1jgNr5
	 sCsF3cA8QQVrHkA5CJEot8MzeU+4O4BAwuxR9d55VRR1C6s+27Iwoc2tgMd5Q3K9BX
	 yvfwgZMA31obUMYtlSTC+aD22b4rFVo0N3QOI2L7itDjUGxxCq/YZGUQY82xhAvTaJ
	 E7R1m1QvOhgfSy4GDWyvMSYd1R+K1OdnC/f2xTAnrQdAMrXj7GqhNyaPKG45+qqiba
	 O+aFThzpF+fVQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6CD5A47F1D;
	Sun,  8 Nov 2026 11:34:40 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Sun, 08 Nov 2026 19:33:32 +0800
Subject: [PATCH net v8 05/10] can: dev: add
 close_candev_cancel_restart_sync()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-rockchip-canfd-restart-close-v8-5-3e7a23fd9eae@qq.com>
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
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794137678; l=2772;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=v/w3baS7Y/4CSnrJdEt045rABuum9hoKz/eYbLPkCUU=;
 b=b3fWueZPiCxmEK+6grqDu5zrIpvgA7n/YvlaHeR4G9+5+brdmJ92xQykmGoimm7mTHi5zzedz
 Eh1phgIqbOqAEMPwYMHhuGTH9h23g4xGBI4I0ve8VZG8+RBy6qKsY3G
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

Drivers may need to wait for bus-off recovery before tearing down the
IRQ and hardware resources used by their restart callback. Calling
close_candev() at that point also flushes echo skbs, which belongs after
the driver has quiesced the users of those buffers.

Add close_candev_cancel_restart_sync() in linux/can/dev.h so drivers can
cancel the core restart work separately, without accessing can_priv's
work item directly. The helper only cancels restart work; callers must
still stop its producers and call close_candev() for the final cleanup.

Use the helper in close_candev(), preserving its existing cancellation
and echo cleanup order.

The following Rockchip fix uses the helper at the start of rkcanfd_stop()
to wait for recovery before IRQ teardown, leaving echo cleanup to
close_candev().

Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v6:
- Describe the helper's use by the following Rockchip fix.
---
 drivers/net/can/dev/dev.c |  4 +---
 include/linux/can/dev.h   | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/dev/dev.c b/drivers/net/can/dev/dev.c
index a893a49a3381..39271a3ef0fa 100644
--- a/drivers/net/can/dev/dev.c
+++ b/drivers/net/can/dev/dev.c
@@ -537,9 +537,7 @@ EXPORT_SYMBOL_GPL(of_can_transceiver);
  */
 void close_candev(struct net_device *dev)
 {
-	struct can_priv *priv = netdev_priv(dev);
-
-	cancel_delayed_work_sync(&priv->restart_work);
+	close_candev_cancel_restart_sync(dev);
 	can_flush_echo_skb(dev);
 }
 EXPORT_SYMBOL_GPL(close_candev);
diff --git a/include/linux/can/dev.h b/include/linux/can/dev.h
index 346faddee02e..2a286f906394 100644
--- a/include/linux/can/dev.h
+++ b/include/linux/can/dev.h
@@ -22,6 +22,7 @@
 #include <linux/can/skb.h>
 #include <linux/ethtool.h>
 #include <linux/netdevice.h>
+#include <linux/workqueue.h>
 
 /*
  * CAN mode
@@ -115,6 +116,22 @@ struct can_priv *safe_candev_priv(struct net_device *dev);
 
 int open_candev(struct net_device *dev);
 void close_candev(struct net_device *dev);
+
+/**
+ * close_candev_cancel_restart_sync() - cancel bus-off restart synchronously
+ * @dev: CAN network device
+ *
+ * Call before tearing down resources used by the restart callback.
+ * The driver must quiesce restart work producers before calling
+ * close_candev() for the final cleanup.
+ */
+static inline void close_candev_cancel_restart_sync(struct net_device *dev)
+{
+	struct can_priv *priv = netdev_priv(dev);
+
+	cancel_delayed_work_sync(&priv->restart_work);
+}
+
 void can_set_default_mtu(struct net_device *dev);
 void can_set_cap_info(struct net_device *dev);
 int __must_check can_set_static_ctrlmode(struct net_device *dev,

-- 
2.34.1



