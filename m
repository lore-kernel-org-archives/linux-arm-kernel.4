Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3799B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P68Wf5/o;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MbrwP3+D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HaNmPdUYqf2uOT1nrrfv60pp6/8ycrTLUOW0Lh2Yw1o=; b=P68Wf5/o4hCOKCP3FPEWFQi5yo
	pXyWEPfmu1EC921TEZjEgsu639GxrJZpsBFREJIT0QJKw4v42Xk4Q3nIsUYy9pcVWgi31KjiEUGK6
	Wm+qkJbiD3lwXitPFzVovifbN/OEgAurI3lcdpWDRpADNy626ZLpFIJC3PGpYOtvTX6/WU4BaW+zT
	6aRq3yP1Ru3O/44C+BIdwoK1vqQWZdIaHCjhFfgg3iIRhT4OFWT3hZtzf1zlC9ASaO+dZSAVHzixh
	1tPqEcVHVIxN9tYtqukAFWcNPOExjOWiVhmaHlLwj6ZqS/r8chIpOtnQeI7006GYRnMmiWlXm8UB4
	2um1Io/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQpe-00000002rNe-0wB4;
	Mon, 23 Nov 2026 09:59:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQpP-00000002rDH-1MJN;
	Mon, 23 Nov 2026 09:59:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 177E24570C;
	Mon, 23 Nov 2026 09:59:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795427954;
	b=3MWy+m0ccvOs8D556QK+H5ank3uGNj7LM4KWYdlShs0f6RN9ARd/3EYPjuY+QEGsSgei
	 VOlHmyxkEjhkVkWgFyZTlrlsDRdhWr8yZJmHfS/vdpQB65BytH7w+FaHEmj8EIsXwggZn
	 KVLWqgEfqGqsia+qb+4C6bFyB3XYZrSKGzU7tFuj1i34sWCHsLtBlpYkYM+WSP+4NxGga
	 YEDl+Q39TH7OK4u3cBQD9wYl6NmFf8+gP1W0sytcHZ2eIkKDN9vjR+KEtaQuQpCdIRpMu
	 m9b+FTUAkOK0Yesz/cn3wquiEtneouRXAwTjNF5bPAQMkmpdgVMO0vTjV/whYL5u0KA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427954;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HaNmPdUYqf2uOT1nrrfv60pp6/8ycrTLUOW0Lh2Yw1o=;
	b=edA4tBLPmf2F2mo3OXlhOzi9ymVlyON/doWvXpqI2KSnRp9356BUsPox298Wk7V1qWMD
	 VkSq1+2WNpyfH8j7TpuUrGIvJFXZjFpWtSYIY+0XdIMk2xX0ggi7f2S/ZRbugQPim895E
	 ljI4yeSKWyj2wBTxBJY5oYdiLo9yragyKXOrSR42oVC+eV9Os51gByD1S5dzMRzGoNMdQ
	 qD/FHM6NsgYTW7UapkY8HXTouJ+YAahDIozPQtCnT6xxtfW5WCpcZqivnKVamoDP25BKj
	 RF498TG0ycZsRmF1OkeHTYrcqRHkQdaWfgSDHUM4wraVB03C7rUb1XraG344wql3PTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 854E71F000E1;
	Mon, 23 Nov 2026 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427954;
	bh=HaNmPdUYqf2uOT1nrrfv60pp6/8ycrTLUOW0Lh2Yw1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MbrwP3+DxyipqOMY9hhw4xIamuaxgfc1XWAap+HaUkYi32X8/0OyQ5Xr04BilECsQ
	 kx9SQKmNYNBHXihlpu8g7aM0nsladd2WKTGXiQckEK/MPcAUtYiytQyUEZnOcBBu9K
	 OvRJhYBGPDzjnhza8l9uRrBgFKcnkwAELGv1o5a/WvM2aI2Lqn4Z1dl922hivWaT/g
	 obdtvQSYEGol55V+x+Iw9aLbTVfM5zoOzYpAQIDzplT9MjrZYXzHBIspY8xsClHB9X
	 Z/2NAqJ+TroJBqK9M9/I3RqCbYYwGObomWBNTcFBioS/KOc5/U51h39CytlHEJb9sM
	 XdXoH/NK+niwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 123224C407;
	Mon, 23 Nov 2026 09:59:03 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Mon, 23 Nov 2026 17:59:03 +0800
Subject: [PATCH v7 4/5] clk: rockchip: Return errors from
 rockchip_clk_of_add_provider()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-add-board-ok3572-c-clk-v7-4-16f6860191a9@qq.com>
References: <20261123-add-board-ok3572-c-clk-v7-0-16f6860191a9@qq.com>
In-Reply-To: <20261123-add-board-ok3572-c-clk-v7-0-16f6860191a9@qq.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Elaine Zhang <zhangqing@rock-chips.com>
Cc: Cunhao Lu <1579567540@qq.com>, Jonas Karlman <jonas@kwiboo.se>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795427940; l=2105;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=KzKhwQsNNbIws0UUJ9FPBVs8oMjRaBZLFgFz/fZdYoI=;
 b=HFB7NnDB8rPefSg8tt8zKk/NjvwmZqMsFFY3rd8vjxVT35SJbPvWEKCrjSWqXC3wDoHA/evN1
 ww9SYQ9+g54AvPkJL0DqtcqYOvI585gggM2QGBUGtECUkSHcdlp+uPI
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

rockchip_clk_of_add_provider() discards the OF registration status
after logging an error. Return the status so a caller can release its
lookup data if the OF provider fails to register.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/clk/rockchip/clk.c | 14 +++++++++-----
 drivers/clk/rockchip/clk.h |  4 ++--
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 2053e0d67a1b..7c52406d4925 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -420,12 +420,16 @@ void rockchip_clk_finalize(struct rockchip_clk_provider *ctx)
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_finalize);
 
-void rockchip_clk_of_add_provider(struct device_node *np,
-				  struct rockchip_clk_provider *ctx)
+int rockchip_clk_of_add_provider(struct device_node *np,
+				 struct rockchip_clk_provider *ctx)
 {
-	if (of_clk_add_provider(np, of_clk_src_onecell_get,
-				&ctx->clk_data))
-		pr_err("%s: could not register clk provider\n", __func__);
+	int ret;
+
+	ret = of_clk_add_provider(np, of_clk_src_onecell_get, &ctx->clk_data);
+	if (ret)
+		pr_err("%pOF: could not register clk provider: %d\n", np, ret);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(rockchip_clk_of_add_provider);
 
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index d84e42533266..a1d4fd3b1248 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -1374,8 +1374,8 @@ struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
 struct rockchip_clk_provider *rockchip_clk_init_early(struct device_node *np,
 			void __iomem *base, unsigned long nr_clks);
 void rockchip_clk_finalize(struct rockchip_clk_provider *ctx);
-void rockchip_clk_of_add_provider(struct device_node *np,
-				struct rockchip_clk_provider *ctx);
+int rockchip_clk_of_add_provider(struct device_node *np,
+				 struct rockchip_clk_provider *ctx);
 int rockchip_clk_add_grf(struct rockchip_clk_provider *ctx,
 			 struct regmap *grf,
 			 enum rockchip_grf_type type);

-- 
2.34.1



