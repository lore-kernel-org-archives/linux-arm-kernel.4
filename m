Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62460606A8AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XsHL2lVQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LDSS8HSJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PQ5rr/hpZSQ/KPxkRa+9ZQKdPBroKd+jKyNTmfxT2cA=; b=XsHL2lVQNROcWh59kePfNWmaXo
	z1KK4Gg9iXFssH2leaRWiOJPWlUgtEf9OVYufECfRZmu5neohxnAsrEIJpqHLdgDa0eYHRJ3nYyvA
	qZ0qNmjq9f591FGVsuP23BS/lKnb6Vz6AILfft2X+fbU0eLRhwEHcvYZKSeT2Q7NrPVi/3g6PHHcn
	HmOt6KQnNDUyPSTfru5NhM7MSuPVH6d9MDchpyGDRICppJMMkNFk/ybAO8uFirBdoMNiO8XencY5u
	RyX2JxTdb7FuARXSFBK8pjOp09gXo1MtfzvWktny2JmcL/9v45XLO4LwxF9+8IjR8ztfDZX+TTMSA
	oUVuHzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuIt-0000000DZKM-3GP7;
	Fri, 13 Nov 2026 16:39:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuId-0000000DZAP-2fE8;
	Fri, 13 Nov 2026 16:38:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5893843262;
	Fri, 13 Nov 2026 16:38:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587931;
	b=Mm/RxHLaKXq/ZyPix7LkIIqcf9IOTlPeVjod1L+vrBKQrAmtQCwyChdK1geuJ/LrcOul
	 2PqvoiHoAjor8HUeorfjObUruCA/fDgfEDpdeZ/hBp7cmrndwIEepw1Uo4gCzAGss2EwL
	 Z4c9k9F+mK0paRb8hNogyLRaM9X5XwthrGgGR8cr2V5PF07wW5iEz8eTeI4cYjVNjirOj
	 gs3Kih0YLquUJy9BR0yq9yjqlRCBaSWb8OWnqvTScmo5mNxY+18j6BccggFExuPF7VJDT
	 jo7r0f80VGpdEM0n4fFNDsLGu5BJg5X/pc8yvWFf6On8eR+1w5tlWRiaEPdpKmugeMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587931;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PQ5rr/hpZSQ/KPxkRa+9ZQKdPBroKd+jKyNTmfxT2cA=;
	b=aDcQDVZRGJ3/6TE8W5OprEy8RusYctwt4ZZU/FhjtzM2kMEVm4pTGlLEF3R8N183XBSZ
	 n2Ttp5cZqiv6lWzQnKDe9jtXJfWhZGPdl1kRfDJPtAmE5Ey4YWW1vpPmfZN/wWL7UM63M
	 KiUq4RcdZwUPw2GUtq3XzcRQ8f7tKQm8SMaTsv4P/ig6CAGZUnvgW+p173aEoTH/k79MI
	 6JPY8AVQmUyHGoQqsTl+WPdbLISN4IJWWPozg8C2Ly12oWgbVUO36LQy6SIKGmTsThQs0
	 lTDgFnAICdiQhs1JtdSv/Ci8v+7ph+4jEkWrtgWZG6+HFtOqHICYRzZdo4eP1nGcK9A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 079E91F000C9;
	Fri, 13 Nov 2026 16:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587931;
	bh=PQ5rr/hpZSQ/KPxkRa+9ZQKdPBroKd+jKyNTmfxT2cA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LDSS8HSJesTmjLCE9b2dIHrwzGhR/1WJNMOznt6TwisRESR59NzY+GOOK7xTLEhuF
	 6Z7ct11xPCgbOmyOo0AUnDvMGY1Vcxo2VHApgxJP5NcXqGQsO6VUcGEiJGeQYEjY9R
	 R7pmn6l+b4+63Z+8HFjJnKtsDSA/YEH/GwKhrmxIuwIeSSkhrSHZg3NixFK5LVqDkF
	 LlFwwQsYcVJ0x4hvXPQsnURTD+CGZw2a7T3ikOqYLcmt7B+kTiybn2y1AoPRfkYTFi
	 osaVy8ydqoimZmfOvy46OSDnVhi7h1BCRPkDvExDbYBiWm18loYLGn6y6OJolfCkGd
	 xtoD3wWSNUjQg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D5F52499A6;
	Fri, 13 Nov 2026 16:38:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:38:52 +0000
Subject: [PATCH 6/9] soc: rockchip: grf: Restore the RK3588 PHP StreamIDs
 after system suspend
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-mmu600-php-v1-6-231196049a3b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587927; l=4304;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=8DHxrdJD0UZC+IKdgFQ4M91V4d4tnm4LzFVvQpurqQ8=;
 b=GzdbBcBqkmweKHxzPMHYCQmzb/0EhrQfQeUy7omA/fOWzOpjrySHDiBSJZ5bKGW+RMYdB5mh4
 sVBH3JfCdxsDg4tUJW2JgSC3e8R+FVlidea/9CWZhPjofvxhrNIe8D/
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

The PHP GRF is in PD_PHP, which firmware may power off in system
suspend. The SMMU aborts a master whose StreamID was lost.

Write the StreamIDs again from a syscore resume op, before devices
resume. Register it only when the node has a clock, as the access hangs
without it.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/soc/rockchip/grf.c | 70 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
index 3f0f82a2119f..8f318ebc14e9 100644
--- a/drivers/soc/rockchip/grf.c
+++ b/drivers/soc/rockchip/grf.c
@@ -11,6 +11,8 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/syscore_ops.h>
 
 
 struct rockchip_grf_value {
@@ -22,6 +24,14 @@ struct rockchip_grf_value {
 struct rockchip_grf_info {
 	const struct rockchip_grf_value *values;
 	int num_values;
+	/* Rewrite the values on resume; such tables must not be __initconst */
+	bool restore_on_resume;
+};
+
+struct rockchip_grf_restore {
+	struct syscore syscore;
+	struct regmap *grf;
+	const struct rockchip_grf_info *info;
 };
 
 #define RK3036_GRF_SOC_CON0		0x140
@@ -182,7 +192,7 @@ static const struct rockchip_grf_info rk3588_sysgrf __initconst = {
 #define RK3588_PHP_GRF_USB3OTG2_SID_AR	0x00c4
 #define RK3588_PHP_GRF_USB3OTG2_SID_AW	0x00cc
 
-static const struct rockchip_grf_value rk3588_defaults_php_grf[] __initconst = {
+static const struct rockchip_grf_value rk3588_defaults_php_grf[] = {
 	{ "gmac0 write streamid", RK3588_PHP_GRF_GMAC0_SID_AW, 1 },
 	{ "gmac0 read streamid", RK3588_PHP_GRF_GMAC0_SID_AR, 1 },
 	{ "gmac1 write streamid", RK3588_PHP_GRF_GMAC1_SID_AW, 2 },
@@ -197,9 +207,10 @@ static const struct rockchip_grf_value rk3588_defaults_php_grf[] __initconst = {
 	{ "usb3otg2 read streamid", RK3588_PHP_GRF_USB3OTG2_SID_AR, 6 },
 };
 
-static const struct rockchip_grf_info rk3588_phpgrf __initconst = {
+static const struct rockchip_grf_info rk3588_phpgrf = {
 	.values = rk3588_defaults_php_grf,
 	.num_values = ARRAY_SIZE(rk3588_defaults_php_grf),
+	.restore_on_resume = true,
 };
 
 static const struct of_device_id rockchip_grf_dt_match[] __initconst = {
@@ -246,6 +257,59 @@ static const struct of_device_id rockchip_grf_dt_match[] __initconst = {
 	{ /* sentinel */ },
 };
 
+/* Syscore op: runs before the SMMU and its masters resume */
+static void rockchip_grf_resume(void *data)
+{
+	struct rockchip_grf_restore *restore = data;
+	const struct rockchip_grf_info *info = restore->info;
+	unsigned int cur;
+	int i, lost = 0;
+
+	for (i = 0; i < info->num_values; i++) {
+		const struct rockchip_grf_value *val = &info->values[i];
+
+		if (!regmap_read(restore->grf, val->reg, &cur) && cur == val->val)
+			continue;
+
+		lost++;
+		if (regmap_write(restore->grf, val->reg, val->val))
+			pr_err("%s: restoring %s in %#6x failed\n", __func__,
+			       val->desc, val->reg);
+	}
+
+	if (lost)
+		pr_info("%s: restored %d of %d values lost in suspend\n",
+			__func__, lost, info->num_values);
+}
+
+static const struct syscore_ops rockchip_grf_syscore_ops = {
+	.resume = rockchip_grf_resume,
+};
+
+static void __init rockchip_grf_register_restore(struct device_node *np,
+						 struct regmap *grf,
+						 const struct rockchip_grf_info *info)
+{
+	struct rockchip_grf_restore *restore;
+
+	if (!IS_ENABLED(CONFIG_PM_SLEEP) || !info->restore_on_resume)
+		return;
+
+	/* Without its bus clock the GRF is not accessible in syscore resume */
+	if (!of_property_present(np, "clocks"))
+		return;
+
+	restore = kzalloc_obj(*restore);
+	if (!restore)
+		return;
+
+	restore->grf = grf;
+	restore->info = info;
+	restore->syscore.ops = &rockchip_grf_syscore_ops;
+	restore->syscore.data = restore;
+	register_syscore(&restore->syscore);
+}
+
 static int __init rockchip_grf_init(void)
 {
 	const struct rockchip_grf_info *grf_info;
@@ -282,6 +346,8 @@ static int __init rockchip_grf_init(void)
 				pr_err("%s: write to %#6x failed with %d\n",
 					__func__, val->reg, ret);
 		}
+
+		rockchip_grf_register_restore(np, grf, grf_info);
 	}
 
 	return 0;

-- 
2.55.0



