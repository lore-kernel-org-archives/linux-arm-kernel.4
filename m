Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727F4606AED8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o5gGoNze;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EI9Gqbdy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hoOu0Vyn1UsqFVigZaJGQ7Rr3+ALT0LUzsBJsVYCYy4=; b=o5gGoNze2+UA5kO/N3Z6KMHPBi
	XJYFQyRuSo9J1HAMsPuFk6LvuYC9QGkWlbGahWKXT/Ae0PDKLZw/gprTm+pLVeq4zKYilWu+rsI+k
	5NddMYudAzirL/Pf/5/uZ9LJrl0X1ccSRoA3CsywumhnoiVCgMCH4IGcopHytBX+kD6U1aH63Rcz9
	ndumeZDJ52m3Cj8Xwn6LZ/weccu6sS76PTzRGugcbqZ7Jl63Z9SjxruHMu0DEKUmGb/aNM2pDlWgJ
	pg+cwks1hHlwYFrI5DuNGcGM+oktEbHUCkdJTqCky7dj+8dXozETeZ2V9/Fj1lUTF8+KtrK+dcqhj
	RkGSKxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxhT-0000000BDln-1wEg;
	Thu, 19 Nov 2026 08:40:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxgQ-0000000BCeL-1lWt;
	Thu, 19 Nov 2026 08:39:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C371F626B3;
	Thu, 19 Nov 2026 08:39:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795077592;
	b=cZU8HJQ/c26s6I++r2VtvR/JxhG7b9w/gfJZQVUZf8DDeUkmA4j+k6kdJI5hT5g1B0wv
	 aBIMdWUIe7OUrULmDYVgHMk+W2KxIi4HRkt1zElwwz6GGJ1u/uLTkoOuNdnX3eNmM69Fg
	 ZMllygMN/hYG8LNuV66Hy3Gnq2xj2eujc5wNLCri0QFCIfVT+J75SbgFGsnCr4frrl95b
	 UqvEKGRcVSS4H6+VcHZrhUEarTtV1YIavVBlZuXt/ermvlU2a9LfAD1zbpIR5ybYtJ2Jc
	 Q9WaDr5PG8TCJma3jHkYAcnhz62ICWIeQ7r1LJspj1PLHyOxiyY6+2CaCzpm4Np1Edg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795077592;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hoOu0Vyn1UsqFVigZaJGQ7Rr3+ALT0LUzsBJsVYCYy4=;
	b=ZN5LrSWwSljUlKJGnRkERWtcy30UuFEaY9elTPSNLt35HW/miRTCweOzAsvUdvBnGOk/
	 1yJRLsLtge9B9N33SM447B+hOSQNfX9Nk79ikh34X9cVQFqdF/M1lhljooKlXi4jyEZvJ
	 YwqXeFVGLd+EJ8t1/G6cgM8jLW2hRnw/qxWpW+MvYQO4jRdlbgmPFzduBgx6PLpFN5mvX
	 xwrx9ZscwlyHgF8z4JT65c9DOEScHUyWpCzt4mBT61xKmi9JvujYiMXsEywl9GHidaiIu
	 8JPd3j+g+oy7kQOij8IWA8fQzpLkS0XBCG8mN6DxpG2Y4eHn1pQQ86Rf2LcVN7FIpRg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 744C41F00925;
	Thu, 19 Nov 2026 08:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795077592;
	bh=hoOu0Vyn1UsqFVigZaJGQ7Rr3+ALT0LUzsBJsVYCYy4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EI9GqbdywzJOt9vLA8fWcc5ykYG1HcvslHycTeHAh44iV2SNafSSDK94P9DfupspN
	 WuIyg4Ycw5XFLnnmE8jFem5aHPJsMhD6tpEgYXWO+XNoZxvAOTmw6hnLAZKh9R6msi
	 UkX5tvDsTPbfyBSeuvBTs7bLDPo0O8Hzj0CaK4S+/sJv+wxPSxBKaRy7OZdEi9CnTA
	 IsU/6EKld7pUftJY9tXUbcHmQOeKYz3lcd0kfprT/8JjUzb7tN/l/DmwrMOU2O0Ury
	 8zrDHuKSLi3aHTbZvymZNwlYQk56oyYMnfgO31Vo3lNb2o1Rg4j6blIQ/DGuc6S6gU
	 REzRsB3dZTOsg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D50774B1BA;
	Thu, 19 Nov 2026 08:39:49 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Thu, 19 Nov 2026 16:39:47 +0800
Subject: [PATCH net v10 06/10] can: rockchip_canfd: disable RX offload on
 open failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-rockchip-canfd-restart-close-v10-6-df23913aa33a@qq.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795077587; l=1266;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=cT3cBscQt29TWUgsPQ2sU0B4DpllcnyjvFZowBvWmU4=;
 b=vEHsYfkz94acrhPXzORPXYuoevt0zK5JcYslhBE6bVxjYVj21Yx9OWfShGTzboi9T+TCHBwBl
 x+re7aFXhenCHSUrwPskCrO4kLMSEDvM8Vpel56d4iK1vsSBBAEOKCb
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



