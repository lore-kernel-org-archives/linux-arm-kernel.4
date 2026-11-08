Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B58606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EqJMTs5h;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IEE9/9H6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hoOu0Vyn1UsqFVigZaJGQ7Rr3+ALT0LUzsBJsVYCYy4=; b=EqJMTs5hfyvdG1veufjeTY+i3J
	AzaJxdbC0nodv+UEaP+zFUDWNrWMDxqqQppxO+1oJkeRaUPKBpizC7qVKcRDWAsaX18Gyfx2u4FLx
	kIL16DsDXAatJrDPXSnl2dU9ooPnJ2DcN7OiDmq4e6KiU5zi2MrxQyJpcNSu7yjzRP0+RGdFtj+xv
	4j1obpYfEUOFHqIxlGy9smQvg9SGJhwCXK8qeWNaIN1WkMTvq5dPzY17fJo2nL5CMSJAXbalfub/E
	2FHr3WgDDQ+aEnGW6mPm9KpvVS3HrSYj7CVQwe4wtfKV0VTyzec/dGlkuIrIrp6qAi/tnYiemWTQk
	uvp3BuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1Ae-0000000G3iE-3BYh;
	Sun, 08 Nov 2026 11:34:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ1Aa-0000000G3Zd-0o51;
	Sun, 08 Nov 2026 11:34:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 731AB6185C;
	Sun,  8 Nov 2026 11:34:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794137683;
	b=pfB3WnInxVz4qNINoe8IKrtKO++ZTnQQJ3PTVX/72+zqJ0R95vs0u0Yes6i1/bKHP86e
	 S0f8Lwa1w2cpg35jA6x67vpkLLEhIVRwox4vycrRZNr8S2lYuOyIBbtzbRncR2XoziJef
	 wTC4qHdXHR6BzvWY2I1q2PwvE+ufnib6d9DUBkuace87j1IvSmkOB9ylwBfbk4LudBO6k
	 CDSzpHZE0k6I2ghVS8pDjT9IbEkXQMRMF0vmNBvwGjt5k0n/0MZKIlNY6cG9epJxPNo7L
	 NlyNWtmICmRLQo1ol6QRU8pSB/cpFrNn6hCN9YxxmlJlKXJz6EB7p/vlbfpkrQIeE4g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794137683;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hoOu0Vyn1UsqFVigZaJGQ7Rr3+ALT0LUzsBJsVYCYy4=;
	b=Hj2oG2ftjdrGQDth2c4FJUgPaTFfRTZ/xD/E9bMgmMBQ8apqNOUGH2y1a0/18ttN4s7b
	 2Oj5OJy2W1XeI/HexyxrKTvf+E8FSGiVyPvRzWa7KkCEIboXpMBg/TZhFPFwu9qvX5v6I
	 FqWVrQeojiwcnQ+07WShBeQv/c720awBpLvIiiFNy2EKxlEMqKxLCYNQochdQ5U8NgyJj
	 d/rMvfLAinMvPHwtcXvdb/0WbNrEE79FQD5VBMLpGjoqw2C+nXu4om76pMR8Ud98ToP+3
	 KhKcyzfsFR6ABcZu/dIN6ocsRXMcrflV7vNxFIgGl/a1dTiV0ZEJ4pJ6KdHpOViqymQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FA201F008BD;
	Sun,  8 Nov 2026 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794137683;
	bh=hoOu0Vyn1UsqFVigZaJGQ7Rr3+ALT0LUzsBJsVYCYy4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IEE9/9H6UAOyw2YQw4PGJ4Zzm9dMnGBivmCmaK5JNG1PU4f/QY7JksqJqHNRVJNVu
	 eLX3ISDgnegNLpZYIWRMX9HMAdf0FvXupwnWjcqE3W6ElMCpHnIAGVzazl/41gGpEl
	 V6vltkIdNRvJPR1oVLSYZHoXMGUgh01a3NgYYr/fYQ4pk2oVPCdP9f7ZkGCHaWL4NJ
	 m5NFnAg1oaMKHa0M7JXjN/spbrId7AxSnXwSGbL8YGkA2swsdvmi/SB57r8n5AKNDb
	 BXCrj96dgpT1FfzPOBevl2uu1RL/7lIAYsX6EvEQ12qIatFv0K3MdFd9pOaDFvYDaA
	 p1TunOHY/cUEg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9140747F25;
	Sun,  8 Nov 2026 11:34:40 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Sun, 08 Nov 2026 19:33:34 +0800
Subject: [PATCH net v8 07/10] can: rockchip_canfd: disable RX offload on
 open failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-rockchip-canfd-restart-close-v8-7-3e7a23fd9eae@qq.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794137678; l=1266;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=cT3cBscQt29TWUgsPQ2sU0B4DpllcnyjvFZowBvWmU4=;
 b=dhLHV7rlkebwzAATJwM8J4svxDcUflj7QK25eIun213cPz2nEgDdvcNLyoIsLYbP5RkxORQOl
 YW5bwGCNcM2CS1ILiQu0LI2XM7x+OhVmfCWHwQ1VrIsuBfAVlGSv7n9
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

rkcanfd_open() enables RX offload before requesting the IRQ. If
request_irq() fails, the error path leaves the offload enabled. A later
open calls napi_enable() on an already enabled NAPI instance.

Disable RX offload on that error path before stopping the controller and
releasing the runtime PM reference.

Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD controller")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v7:
- Split the open error cleanup into a separate patch.

Changes in v3:
- Disable RX offload when request_irq() fails during open.
---
 drivers/net/can/rockchip/rockchip_canfd-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index 59a79fe057e6..d05264605efc 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -747,6 +747,7 @@ static int rkcanfd_open(struct net_device *ndev)
 	return 0;
 
 out_rkcanfd_chip_stop:
+	can_rx_offload_disable(&priv->offload);
 	rkcanfd_chip_stop_sync(priv, CAN_STATE_STOPPED);
 	pm_runtime_put(ndev->dev.parent);
 out_close_candev:

-- 
2.34.1



