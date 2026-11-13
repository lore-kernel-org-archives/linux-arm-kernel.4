Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258D060A383F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1sJLvyqe;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KXa36K2Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u944IAtfnOCVpzrFJZKPf5NOsSOytbibAZKSMderHlQ=; b=1sJLvyqeK8MV2oVqS2yToH4dnC
	ekquFsT4Q/u/oYENn4hJTjZd8IHhen1KdB0Ifb7asEemDIqXkJRBJJgV+fu1LedY1v/R8rXX6M5Ew
	4BRGiRWbOXcn7X4CZFj9zsdTVsT0nkWaB08mnib8WVqLmWyCKlT+E/Mq3NX7L7iwJmIIN/Fbd+PRo
	ZIJkucpEn14hzgCsLe5v5TaLo2qcPOdB/CvurPeyb7WWWMEhSH1hrFLT2T7tQoNXyVp4YP5gQ2X/b
	3cPe7sK3eWhJXHT3Kc/GqciuGjCqr1BKVgidr5fNgG+27vDeiXWBXLtEeHc8P58xadXhgiZr7iHuA
	24sd9Wvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuIe-0000000DZAv-1E6m;
	Fri, 13 Nov 2026 16:38:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuIc-0000000DZ9n-2SoU;
	Fri, 13 Nov 2026 16:38:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 366AF46662;
	Fri, 13 Nov 2026 16:38:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587930;
	b=JE35D8kFdS7Z53m4Sj+dyVczwVzTagUb86aMS4ZDpH5Brl/67PYfYD9owFleWHR20FIb
	 j/pDMNdyD9+2srzAb7tKHNV1H0gXu8Z8b6dr7LebeDKMUTcoLBIN945dxonCC7QGtWAFS
	 RL7pPAhZUA0QOSYJ1jofi0XPKodWVqNxNkxAE49tpxMEM5KtOg7tz4AIKZxeFIMaomGg1
	 eBAzpLCXiajF3RUWg1ft5/8T6Kgc9Pk3SyiLQFh4iQ/kApw6C8eid4dr6MJCyWlcp7dow
	 WujkmHv7v1zu6JnOsYUnYe3F9S3Nn/wUXUMM5AU2TLxybejDsqvs+7pgwXje/AC6UTg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587930;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=u944IAtfnOCVpzrFJZKPf5NOsSOytbibAZKSMderHlQ=;
	b=1xxLPSUha0R3NIlWIDhV0tkzl8o8eRLuPGkkUtXrWQNcV+Lt07/0Ua7JIlCjwcG7IDZa
	 by2lPWueRx5EUyjJxMAHww2+AwsvTC9jNnTDGelRmlThiDC4buKvbjuyrcTN4wG8+pWPA
	 JqtKSuhzX5N1T8Vad+2eXvwGVMXw+UGH+NTsbrMECJO6QZsTEn8o9yT15cmr6fQlvOqzH
	 Vxb1vGlmiUVNI6oB07fUGc/SGYEADnJ++nmj4Af1+0f1sYwqg5FBZ3mf9KWbTHPOHAExO
	 /QFOEYq4zLIm66QvDIcMSEvCeMbFfwPQqQ32cVSDGishSGFEHlgeQ5K61E2d9ddEKHg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28B791F000C8;
	Fri, 13 Nov 2026 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587930;
	bh=u944IAtfnOCVpzrFJZKPf5NOsSOytbibAZKSMderHlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KXa36K2Z7fZENTlTBim7i1xWkLjZabe0eCNhCTK04orfW4ZkqJ574E2u+h73fQiNK
	 a3F7OohjRwKYFckRcUPGPS23DSq/t7M3iUl0eqJMGJpNpvLoyjsFTfQFPc85XH1vzF
	 kEodQgvr/Az/ZBYjOJWPQWuEsHXGvixtc5gd2mlCXMv8E/cwPIgtH1Mypdj6Wqia3s
	 c7LjYsJYS6gHvzvewkyj5EWSF9wcErfocjVzGTFsri4N6X5dmj0sgbyKjtEQojc/af
	 Lt36wPUCGNU8+uBA0KFKDbE4u1U+LWEG4UjzQXWKIezQk5crga71NO8sTG3RdauqXh
	 vKhgUle6H6qoQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A81394999E;
	Fri, 13 Nov 2026 16:38:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:38:50 +0000
Subject: [PATCH 4/9] soc: rockchip: grf: Assign the StreamIDs of the RK3588
 PHP SMMU masters
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-mmu600-php-v1-4-231196049a3b@gmail.com>
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
In-Reply-To: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587927; l=2945;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=dag37i6gDSZWIaoVMOYxt4y005R4Dlb0YjRF9trI+6U=;
 b=49vGgwLh6srLC7rCeOZiRR3OVoJMQYsRvrYhsqpaivjD3acouGe/Nn0e/f0GYUOS9aM3SRTPP
 FuVd8+F7g/nB7Fcqp21LSa4kZV0RLSB5Fg7shF028mEe1uA5poQrzgy
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
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
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The StreamIDs of the six masters behind the RK3588 PHP SMMU come from
PHP GRF registers that reset to 0 and are never programmed, so the SMMU
can not tell the masters apart.

Assign StreamIDs 1-6 on both AXI channels. 0 stays unused, so a master
that loses its ID is aborted instead of using another device's tables.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/soc/rockchip/grf.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
index b459607c118a..3f0f82a2119f 100644
--- a/drivers/soc/rockchip/grf.c
+++ b/drivers/soc/rockchip/grf.c
@@ -168,6 +168,40 @@ static const struct rockchip_grf_info rk3588_sysgrf __initconst = {
 	.num_values = ARRAY_SIZE(rk3588_defaults),
 };
 
+/* PHP SMMU StreamIDs: bits 15:0, no write-enable mask */
+#define RK3588_PHP_GRF_GMAC0_SID_AW	0x0074
+#define RK3588_PHP_GRF_GMAC1_SID_AW	0x007c
+#define RK3588_PHP_GRF_SATA0_SID_AW	0x0084
+#define RK3588_PHP_GRF_SATA1_SID_AW	0x008c
+#define RK3588_PHP_GRF_SATA2_SID_AW	0x0094
+#define RK3588_PHP_GRF_GMAC0_SID_AR	0x009c
+#define RK3588_PHP_GRF_GMAC1_SID_AR	0x00a4
+#define RK3588_PHP_GRF_SATA0_SID_AR	0x00ac
+#define RK3588_PHP_GRF_SATA1_SID_AR	0x00b4
+#define RK3588_PHP_GRF_SATA2_SID_AR	0x00bc
+#define RK3588_PHP_GRF_USB3OTG2_SID_AR	0x00c4
+#define RK3588_PHP_GRF_USB3OTG2_SID_AW	0x00cc
+
+static const struct rockchip_grf_value rk3588_defaults_php_grf[] __initconst = {
+	{ "gmac0 write streamid", RK3588_PHP_GRF_GMAC0_SID_AW, 1 },
+	{ "gmac0 read streamid", RK3588_PHP_GRF_GMAC0_SID_AR, 1 },
+	{ "gmac1 write streamid", RK3588_PHP_GRF_GMAC1_SID_AW, 2 },
+	{ "gmac1 read streamid", RK3588_PHP_GRF_GMAC1_SID_AR, 2 },
+	{ "sata0 write streamid", RK3588_PHP_GRF_SATA0_SID_AW, 3 },
+	{ "sata0 read streamid", RK3588_PHP_GRF_SATA0_SID_AR, 3 },
+	{ "sata1 write streamid", RK3588_PHP_GRF_SATA1_SID_AW, 4 },
+	{ "sata1 read streamid", RK3588_PHP_GRF_SATA1_SID_AR, 4 },
+	{ "sata2 write streamid", RK3588_PHP_GRF_SATA2_SID_AW, 5 },
+	{ "sata2 read streamid", RK3588_PHP_GRF_SATA2_SID_AR, 5 },
+	{ "usb3otg2 write streamid", RK3588_PHP_GRF_USB3OTG2_SID_AW, 6 },
+	{ "usb3otg2 read streamid", RK3588_PHP_GRF_USB3OTG2_SID_AR, 6 },
+};
+
+static const struct rockchip_grf_info rk3588_phpgrf __initconst = {
+	.values = rk3588_defaults_php_grf,
+	.num_values = ARRAY_SIZE(rk3588_defaults_php_grf),
+};
+
 static const struct of_device_id rockchip_grf_dt_match[] __initconst = {
 	{
 		.compatible = "rockchip,rk3036-grf",
@@ -202,6 +236,9 @@ static const struct of_device_id rockchip_grf_dt_match[] __initconst = {
 	}, {
 		.compatible = "rockchip,rk3576-ioc-grf",
 		.data = (void *)&rk3576_iocgrf,
+	}, {
+		.compatible = "rockchip,rk3588-php-grf",
+		.data = (void *)&rk3588_phpgrf,
 	}, {
 		.compatible = "rockchip,rk3588-sys-grf",
 		.data = (void *)&rk3588_sysgrf,

-- 
2.55.0



