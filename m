Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2515460A2601
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IKaS52e+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Drd0BjnY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0inTc72tNtgjCZaCWeW8u0+OSffO1GI14ZtqPEL3d8g=; b=IKaS52e+QR29bmmGCuYwKjzd0O
	qw8SYaCZ8UeLHt0uO7UkFM8hPE4nYX6UVhGoyHCE68o7OknQxXi35akoQVkKne803DYEM8HKlCMz2
	JrvokoYGsTcXTa2XgAyOZuWEqeUJTBi+hllHPD+wj6mlHFTetL0U+3WgCvg10Yjpu1HdCvGi4pSus
	GEZtYwxHKA44OK0lHteVUvAPfuoUK3ZbGtCqALFC8F/CNdKupmYDYqKY+orTzr5m8U2mKQreZOD7i
	/+YKqkCSTVlzP1QKwbromMYaBNHTSKfnrkPP/+zj+IVlv2twBWEO6jtQiW19d/8Hwq5aDMi1+A0VW
	JpxmZ2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR57j-00000006H0X-0gHi;
	Wed, 11 Nov 2026 10:00:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR57h-00000006Gzv-4A5y;
	Wed, 11 Nov 2026 10:00:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB04E458EE;
	Wed, 11 Nov 2026 10:00:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794391209;
	b=CND2mgUa4lC8QTmyxQB2T+ogvDAPnJ2BUDno4Zr7nzJKfiN0e8uVGJ9IXZ62QIGxccEF
	 RNW2d/hmbHuUEVdq9MlbkZC75zKsNZjAhtMX1YFf8Hr6E0xt1rTmYXYom1wDZZMjZYEgV
	 Gr3B7k1E4I3h16KLRn6tfPVVS/ldquCUXHRthcfyanPu6FP7GTYYvGMwKsSrrJg+YRT2w
	 4UGNQMSA44hGi3fyn9ryM45av91GIP6x1/fuBD8kLyAUqV1VIHoMUvGah2/wVQUFzk9Hq
	 MybW+SD/jJlEes+PuWMGyRbOEPPFTJQ+HEqelt6lqhgzDYxkJliIniKLyDYL7E3B0aw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794391209;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0inTc72tNtgjCZaCWeW8u0+OSffO1GI14ZtqPEL3d8g=;
	b=LCnzQ+3df6b9gb0/J99qSlyXFt4cKfGffebcvXzmL4969bZEw4gjvD9jJuAco0x3FRTp
	 TpiOi9sGeiNZczPkVuJ1QsBUR6UWpcvQWE2JFwfCJpL/oaa49l9JlgxUiIARjeDVlslLs
	 rVN3/ifOVUVy8gmlkCbKX9h2JjJLZRrZsp/BWyjVN6l98YYQDp7S8dBB0FXzb8B8etS4o
	 SgGl3cfe9zD2UUBL/FZT0lNRWxM19cLQcqrFw7wzU9RlTOVKOcXv8ZkLSzL+/texOG3n9
	 cXUGiIcBzj93Nl0OM+ZXvW/I47cek0nJ46vehEND/Ip3MRmXOicnYMwH54J2w9dsW4Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 910611F00A08;
	Wed, 11 Nov 2026 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391209;
	bh=0inTc72tNtgjCZaCWeW8u0+OSffO1GI14ZtqPEL3d8g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Drd0BjnYiSrO4SK7ZAE6NfOVa2EjNChOu1CpWL44/USqgngfq6L9dChZCDkbAanFt
	 uGB86e46mXAxR7bfY9sIxRAa1o6OvLm2HjMMvOcXaD8rOLXELlQ8CsY1I5FB5B3st0
	 LqfCdz/e7Y7dtdLhDGCuVo0b6VTqjw++FGWTy4d4SHQk+PMa2tHAXc7XhJAcI6BZxR
	 ou8RZfYXQQKjH+Ftn2E6Ig4goREPv7DW2qed1qS8fqKtrNUDoW0RW1dCrZdMrc4bg0
	 hOdQMkU7nlNzy+GpFexsJMTXV4VfSUTbcDOZiQcAtqaE4ZISjkXMkP0VW8ms5kv4H2
	 pXqt4rt1G4NKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 17B8048F25;
	Wed, 11 Nov 2026 10:00:08 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Wed, 11 Nov 2026 17:56:29 +0800
Subject: [PATCH net-next v2 2/2] net: stmmac: dwmac-rk: Add RK3572 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-add-board-ok3572-c-net-v2-2-304466394970@qq.com>
References: <20261111-add-board-ok3572-c-net-v2-0-304466394970@qq.com>
In-Reply-To: <20261111-add-board-ok3572-c-net-v2-0-304466394970@qq.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Wu <david.wu@rock-chips.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794391206; l=3142;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=bJZr2jTjg4023AjgAd/Zj2CWJraJeUFEaOgI88A3Cbk=;
 b=jEQpmIjRN58KDsmIItARMWGBR9/tQFG9sLJdgCnv3tiEkLj98mJUEUUC9c0t/JiC7ZJXHDEJN
 se60OOE7HDgBwGvEfdETUlLxU6Ep4JJ/F8R1aNpxxWA3irkjAbFxbXR
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

The RK3572 has two GMAC controllers with separate mode and clock control
registers in the PHP and NVM0 GRFs. RGMII delay lines are configured
through the IOC.

Add the register layout and delay callback for both controllers so the
Rockchip glue driver can configure their RGMII and RMII interfaces and
select the appropriate clocks for each link speed.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index a37df5767d84..c9d8d8bf51f7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -900,6 +900,58 @@ static const struct rk_gmac_ops rk3568_ops = {
 	},
 };
 
+#define RK3572_VCCIO0_3_VO_IOC_CON1		0x10608
+#define RK3572_VCCIO1_2_4_VI_IOC_CON1		0x12604
+#define RK3572_VCCIO5_6_IOC_MISC0		0x14630
+#define RK3572_PHP_GRF_GMAC0_CON		0x0070
+#define RK3572_NVM0_GRF_GMAC1_CON		0x0020
+
+static int rk3572_init(struct rk_priv_data *bsp_priv)
+{
+	switch (bsp_priv->id) {
+	case 0:
+		bsp_priv->gmac_grf_reg = RK3572_PHP_GRF_GMAC0_CON;
+		break;
+	case 1:
+		bsp_priv->gmac_grf_reg = RK3572_NVM0_GRF_GMAC1_CON;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	bsp_priv->clock_grf_reg = bsp_priv->gmac_grf_reg;
+	return 0;
+}
+
+static void rk3572_set_to_rgmii(struct rk_priv_data *bsp_priv,
+				int tx_delay, int rx_delay)
+{
+	u32 val = GRF_FIELD(14, 8, rx_delay) | GRF_FIELD(6, 0, tx_delay) |
+		  GRF_FIELD(15, 15, !!rx_delay) | GRF_FIELD(7, 7, !!tx_delay);
+
+	if (bsp_priv->id == 1) {
+		regmap_write(bsp_priv->php_grf, RK3572_VCCIO0_3_VO_IOC_CON1, val);
+		regmap_write(bsp_priv->php_grf, RK3572_VCCIO5_6_IOC_MISC0, val);
+	} else {
+		regmap_write(bsp_priv->php_grf, RK3572_VCCIO1_2_4_VI_IOC_CON1, val);
+	}
+}
+
+static const struct rk_gmac_ops rk3572_ops = {
+	.init = rk3572_init,
+	.set_to_rgmii = rk3572_set_to_rgmii,
+	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
+	.gmac_rmii_mode_mask = BIT_U16(3),
+	.clock.io_clksel_io_mask = BIT_U16(7),
+	.clock.gmii_clk_sel_mask = GENMASK_U16(6, 5),
+	.clock.rmii_clk_sel_mask = BIT_U16(5),
+	.clock.rmii_gate_en_mask = BIT_U16(4),
+	.supports_rmii = true,
+	.php_grf_required = true,
+	.regs_valid = true,
+	.regs = { 0x29d20000, 0x2a040000, 0 },
+};
+
 /* VCCIO0_1_3_IOC */
 #define RK3576_VCCIO0_1_3_IOC_CON2		0X6408
 #define RK3576_VCCIO0_1_3_IOC_CON3		0X640c
@@ -1720,6 +1772,7 @@ static const struct of_device_id rk_gmac_dwmac_match[] = {
 	{ .compatible = "rockchip,rk3506-gmac", .data = &rk3506_ops },
 	{ .compatible = "rockchip,rk3528-gmac", .data = &rk3528_ops },
 	{ .compatible = "rockchip,rk3568-gmac", .data = &rk3568_ops },
+	{ .compatible = "rockchip,rk3572-gmac", .data = &rk3572_ops },
 	{ .compatible = "rockchip,rk3576-gmac", .data = &rk3576_ops },
 	{ .compatible = "rockchip,rk3588-gmac", .data = &rk3588_ops },
 	{ .compatible = "rockchip,rv1108-gmac", .data = &rv1108_ops },

-- 
2.34.1



