Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AADE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BpLCoiVX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O98P9cla
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QD+sr8aUmRfY6oLhN7xLP6zroJAErZxqzb7M7kEzdCI=; b=BpLCoiVXIqjxlhUtwlm5eVxCZ2
	I28nU0febijsOGg7WtV+x5qNyknqWeMl0EUkESc9RQnr6LQturUHHvZDcGf+R5+aVZHr7dCg8tDmm
	NzvhKddzc0k6gWn22o/l0KrdhKKFYdA+xwuAvfPFUG5nYp2tTdw/kqxHXrtzrYggGDm5VNUu9prHS
	PVOpSmasryPY/UV0f6CuuINy6eKPsr/fcZt3/Mihqk2eCNUPmr6pqgqUJZGcWbjStoN3KmcGK8rEY
	IB0j6ZvoUxzfsmZGgQeW9bc222lUIw6H3vPKl0WFB/IVnMaKRV8NIEoxe8NLx3cz8cbFavIfBypb/
	BeaWJjcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxgt-0000000BD7m-0OBG;
	Thu, 19 Nov 2026 08:40:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxgQ-0000000BCfO-2Zbb;
	Thu, 19 Nov 2026 08:39:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA7A54799B;
	Thu, 19 Nov 2026 08:39:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795077593;
	b=ATwnajx9zlUWvrBfxtOY5dwEdCrdHs5YhDkNAyfXK1Dh60BNMUJHlcPpSVw3n1tKkG4b
	 E+f/Gp3oN1RU5uWRAeQq5NjGbWgCZox6uysvXUgszAxljwtldzM92rqdD5zTd3AUbK4/p
	 tf16ZGUmF+YPqr4YHiqgepx/7uTeJsB389z+nEqlgWYNXVRLjXCoGH4XaVEaDyBNbV99r
	 fbhyZVTEp6uQwSUK9S768OgU0FC4p3IfvOyieOFbEKMjVtgBoa7IEgZvvssjqibRPTSPa
	 50VyF1D60cpkBtrIebmErIEesn6B51taGOF9Vd5o/1CtEH36g/bUoy5d1fITdyq0qBw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795077593;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QD+sr8aUmRfY6oLhN7xLP6zroJAErZxqzb7M7kEzdCI=;
	b=kPMng5qzapdcfNPNgE2TMTh8xRw3Zca1lRXVNiqxywGpBXp2o5nnjbmlrsKkjRlshtgd
	 WiA2+UugiN3ORedYJFjikZDvtFimFs+hGQIS3O/KAclUBFRrAAzutpw6tW88/JKbK4yLG
	 SJn2S7Chg7n9O4jFm49TUVGe6/uQ6QfDnwLL2kp8KhYFK/Qfz8WclyajJbVe5cU8W0uL/
	 rICiFl698r7IT+KwWxnHAQpEOHgcfM1V1NCU6kTNnsO/2CDfXVnta4dIQAM99nMDzd6im
	 lPe7+CMz+3QIu9XhN0avRfQ4+QzWok54fK35HNCbduQvZCT8ysI+ftcty6Zk3PeRkOw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FBCB1F000C7;
	Thu, 19 Nov 2026 08:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795077593;
	bh=QD+sr8aUmRfY6oLhN7xLP6zroJAErZxqzb7M7kEzdCI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=O98P9claXatysJjwj5SP3SmknWU0f9FxGP/13RYwdY3T0A3jYm0sf2K5FDdEWMR6o
	 B4k9oRI5dLBptQmQuPwszpp1hyU+nNyIvcds1zQF5NhZjt09oqisC/VQskpyrcuazS
	 2V7EvJVfgb7U6hitoxg4fB63RoLUbaVkRwRHSM0LQPcBm3aOwBUXH1NPk0WBNgp7Js
	 osWFayvDrWt3hz6JLp5JqbIRyePGrUikv1XclYMUoudVNLMq8DlBzty0X997KGGY/D
	 F5yZMUtxO5bartbb1yBiK+MLf+SsLrCAvF8yFWmX3eh1lLLKz86RLwDm5p/6XzsFGi
	 ZuStasYlgoTPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BE75F4B1B6;
	Thu, 19 Nov 2026 08:39:49 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Thu, 19 Nov 2026 16:39:46 +0800
Subject: [PATCH net v10 05/10] can: rockchip_canfd: cancel bus-off restart
 before closing the device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-rockchip-canfd-restart-close-v10-5-df23913aa33a@qq.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795077587; l=1589;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=I72HUC2ujKjaadGUhXTkD9nz9XMWR5jwCKsKJZRMdaE=;
 b=6dA4bo0IuR1E3f3nKoAs80AapPZiMp/AOzmkvdFO+DewwPOosyPtDhU36qD/uLoipyS/UIxcS
 /ddTnXYTLeyCmWhQuQ7oacLb7ScRtXfPpQaGu7hcNWbb7nsiluPNTOC
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

The close path cancels restart_work in close_candev() only after freeing
the IRQ, disabling RX offload and stopping the controller. A concurrent
restart can re-enable the controller and interrupts after IRQ teardown,
or requeue timestamp work that accesses registers after runtime suspend
has disabled the controller clocks.

Call close_candev_cancel_restart_sync() at the start of ndo_stop(), while
the resources needed by a running restart are still available. Leave
echo cleanup in close_candev().

A bus-off IRQ can pass the scheduling check before close, then queue
restart work after the early cancellation. The final cancellation after
free_irq() drains that late work so it cannot survive close.

Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD controller")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>

---
Changes in v7:
- Keep close cancellation separate from restart and open error handling.
---
 drivers/net/can/rockchip/rockchip_canfd-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index 1cae86973da5..59a79fe057e6 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -758,6 +758,7 @@ static int rkcanfd_stop(struct net_device *ndev)
 {
 	struct rkcanfd_priv *priv = netdev_priv(ndev);
 
+	close_candev_cancel_restart_sync(ndev);
 	netif_stop_queue(ndev);
 
 	rkcanfd_chip_interrupts_disable(priv);

-- 
2.34.1



