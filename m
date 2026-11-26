Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BE9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WWlEcDJv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJ+4o03t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tiV6I1JiX5+frkJIFjtgyZXuAnFwqRw24mF7Pa1M3oU=; b=WWlEcDJv20h4XzUdIpj4kR51oA
	tQLC+yDLqMx6nGpV3LyqV0PTTUe7h8TiyJvKzHNq0uERHhOye9reeArS2WUsyDvGnolw2ad6LR5eW
	yqAUa0L/svdyW4NWsv62ju8B6I9WQT1JQYUCRFrmtKJ6kfDl93R65GW+jZMuQkRPxaI+aNiq+Ap3N
	P0dSOCT0jg2gSCs1MjEUiOpiePPN1pPGEKpbShd6mwKOatgc9zodOwV/3Yy1D6yUv2X87Ehx3K8Pa
	NmCYkuVnMU9O37peLb/f5aiCd43GAtZ9q8XBVTjFNt8TjIzZ8Tq0gmOY5hjvhuS1WdkdBnF/7dWrU
	vziMrQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWIR-0000000Ch1C-007L;
	Thu, 26 Nov 2026 10:01:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWIH-0000000CgtM-0xUy;
	Thu, 26 Nov 2026 10:01:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A842A6339D;
	Thu, 26 Nov 2026 10:01:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795687292;
	b=h2mCYSF1fTg7YUGSAn0f+v/RHxuThcYkwrXNCN6a7cEeIh2e449vLvt1Au8/M7ec1H32
	 9jz2BCJcUm8p5wpJvrKGBLM1AQvbLgri+cHu26WlPQ2IzTrmQvbdgxJf5REup9MvVHXPV
	 3mzDwPD8FSTectj+efD8S4Lv4p+hcS587P9MggIxLwf1t/ZkWQbuyEM7KoOOOKX4na1dz
	 m3zYx/WjRhHk7chOfFpihr5+sDl8SJnSQR7Ik7P9hT7DpesoL4qqrnKHJKp0y/YUPbes5
	 /rwxfh7w+BgM+J8UxdKBt43uHovD2rCEP0Jti0ReSQPTaoMSGA7Le5j1DRMIqAiY4LA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795687292;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tiV6I1JiX5+frkJIFjtgyZXuAnFwqRw24mF7Pa1M3oU=;
	b=DzWECX3/Epk4ueojTecp7dzinVvi8n9K4fz2nkcaFLMem6dEnQao6i/sC4JJgBN1m7fF
	 LOUyM7qZ/kWWTVYPJ7ZrlNFpVzqnE9KojeOxLJTAAjrnzlvUZ+wo2q9WM8trd/QxblbWi
	 aKEqw2i8bJ7gW9fgK4Svebp986fCDIE9yvwfrwuIv0fZRlSwegql0xsrJNj4xKw/dC7FR
	 aJuh5bn/MM16rhSZJW9VrIbdLRRCiLAc5pm5r+u2dWHKX0lRXKljgxAaN5NzKUMsjAurk
	 5K8U7wIlFCP4MRZ2R7XJ8Bxm9pGN/S/Q2g/XZtoo6mHfp6pPcoxzT7BtIke8hY5dQwg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A77F11F000F2;
	Thu, 26 Nov 2026 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687292;
	bh=tiV6I1JiX5+frkJIFjtgyZXuAnFwqRw24mF7Pa1M3oU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EJ+4o03tGDPDhINVMy50R9iYnWYDXTIPBpAFPSHVLHEeQHZGde5pLK2pRdWW3LIOO
	 mP7xHfAFWHEsZ8IJCm8O5z6VA4zB3KnlccVaRfH1NBOkXlX/AhnOzaxrt2gSkQP9Z0
	 NESkxgZhoNdWIqw79h3iCkM+K2ooZmxDRxWHb84RD0OrUnz5Cclcq8PXJ0QqHNd02R
	 44VXrbrT3r3a/md1ha03SZ/lg6yG5GiZ/PgQYcaPgH/PfSqLuXSj2CHFflpoDJ64RL
	 QXmICKDlz+lO0YM5IkB1WKIr78H/RHgR6RLnQrT9/D4uGO1gPUJDu+LAbr34cOqvJS
	 wwapvFdOPOI4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2E3724D3F2;
	Thu, 26 Nov 2026 10:01:24 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 10:01:26 +0000
Subject: [PATCH 3/3] pmdomain: rockchip: report domain errors where they
 happen
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-pmdomain-rockchip-cleanup-v1-3-a19f5ea7d555@gmail.com>
References: <20261126-pmdomain-rockchip-cleanup-v1-0-a19f5ea7d555@gmail.com>
In-Reply-To: <20261126-pmdomain-rockchip-cleanup-v1-0-a19f5ea7d555@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yao Zi <me@ziyao.cc>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795687283; l=3430;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=3AtAbt0gF5z4t2/yujfDXZ8Drlb6obYk/ZkMiiGPe04=;
 b=j+aLrJix27Oqfi1XC8nUFAK/8l0MqREaHGMArIJ+AoRbOnYDN/6wIpgqSGW7t7ylhckA+sm7l
 ipCOyxDq/MlB4wbav21x1xx2dYDoIlwQTlTtDuW8lyrdmaFRAmyIEdS
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

Print the clock prepare and pm_qos failures with dev_err_probe() and
drop the callers' "failed to handle node" messages. Each error is now
reported once, and -ENOMEM stays quiet.

Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/pmdomain/rockchip/pm-domains.c | 40 +++++++++++++++-------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 9d5a79c6d4f9..c3df32934120 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -881,17 +881,19 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 	for (i = 0; i < pd->num_clks; i++) {
 		pd->clks[i].clk = of_clk_get(node, i);
 		if (IS_ERR(pd->clks[i].clk)) {
-			error = PTR_ERR(pd->clks[i].clk);
-			dev_err_probe(pmu->dev, error,
-				      "%pOFn: failed to get clk at index %d: %d\n",
-				      node, i, error);
+			error = dev_err_probe(pmu->dev, PTR_ERR(pd->clks[i].clk),
+					      "%pOFn: failed to get clk at index %d\n",
+					      node, i);
 			goto err_put_clocks;
 		}
 	}
 
 	error = clk_bulk_prepare(pd->num_clks, pd->clks);
-	if (error)
+	if (error) {
+		dev_err_probe(pmu->dev, error,
+			      "%pOFn: failed to prepare clocks\n", node);
 		goto err_put_clocks;
+	}
 
 	pd->num_qos = of_count_phandle_with_args(node, "pm_qos",
 						 NULL);
@@ -916,13 +918,18 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 		for (j = 0; j < pd->num_qos; j++) {
 			qos_node = of_parse_phandle(node, "pm_qos", j);
 			if (!qos_node) {
-				error = -ENODEV;
+				error = dev_err_probe(pmu->dev, -ENODEV,
+						      "%pOFn: failed to get pm_qos %d\n",
+						      node, j);
 				goto err_unprepare_clocks;
 			}
 			pd->qos_regmap[j] = syscon_node_to_regmap(qos_node);
 			of_node_put(qos_node);
 			if (IS_ERR(pd->qos_regmap[j])) {
-				error = PTR_ERR(pd->qos_regmap[j]);
+				error = dev_err_probe(pmu->dev,
+						      PTR_ERR(pd->qos_regmap[j]),
+						      "%pOFn: failed to get pm_qos %d regmap\n",
+						      node, j);
 				goto err_unprepare_clocks;
 			}
 		}
@@ -1074,13 +1081,8 @@ static int rockchip_pm_add_subdomain(struct rockchip_pmu *pmu,
 
 		error = rockchip_pm_add_one_domain(pmu, np,
 						   to_rockchip_pd(parent_domain));
-		if (error) {
-			if (error != -EPROBE_DEFER)
-				dev_err(pmu->dev,
-					"failed to handle node %pOFn: %d\n",
-					np, error);
+		if (error)
 			return error;
-		}
 
 		error = of_property_read_u32(np, "reg", &idx);
 		if (error)
@@ -1162,20 +1164,12 @@ static int rockchip_pm_domain_probe(struct platform_device *pdev)
 
 	for_each_available_child_of_node_scoped(np, node) {
 		error = rockchip_pm_add_one_domain(pmu, node, NULL);
-		if (error) {
-			if (error != -EPROBE_DEFER)
-				dev_err(dev, "failed to handle node %pOFn: %d\n",
-					node, error);
+		if (error)
 			goto err_out;
-		}
 
 		error = rockchip_pm_add_subdomain(pmu, node);
-		if (error < 0) {
-			if (error != -EPROBE_DEFER)
-				dev_err(dev, "failed to handle subdomain node %pOFn: %d\n",
-					node, error);
+		if (error < 0)
 			goto err_out;
-		}
 
 		/* A domain left on is not fatal; carry on with the others. */
 		rockchip_pm_power_off_subtree(pmu, node);

-- 
2.55.0



