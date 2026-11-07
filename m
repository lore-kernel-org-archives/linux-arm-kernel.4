Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08967606EE84
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 10:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IpGpQT9U;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cr2JZ2tH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HCjMw7xN3kplE/4dlVgyFipVAftXB4BLlPm/oty0758=; b=IpGpQT9Unn5q7TCSnOxFT+Cpw0
	8c6lJe+DWXtpDECFVciVqLwnw4M3IpeVkuhH7ENzOXPqTzgX8RkMmL2xF10mc/CMddPnVjM3XTA9b
	tyPw8i9Ik3fxoYvQoUpgGbkteXjUNe8jSw1C4UjGhF8Q3j5AgMK3LeyRpP9oIP6v92TJd1rJ7I/CT
	j/RffEqAM4VIo85xobbpQkc4cRAuHiIMJFvzcFaGcdVQx0CEZzlWwrefRbplPlP0Xg6Tm/0d71LYf
	fH2b7trF7OGoVK0hy9pxKYQUj0KlhXSJG/edLhwHDIoouNmr6BeoVy9U8tWzph++LdCkBuD8ZC2iz
	ZLwzsL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdz5-0000000EYBz-1KwF;
	Sat, 07 Nov 2026 10:49:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdyt-0000000EY5L-41ff
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:49:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6917260DD9;
	Sat,  7 Nov 2026 10:49:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794048547;
	b=Lw37ywYv6b1AJrxoIsdt9DWJyXMz003tebsJtPo6oDyEcHZumUCeESpX0nB6iKBGMYQq
	 2TRQLTVFds5mQOw71kqzbq1gU/zKuIQ8Wodj+BdewBzg68/vT5Bba58K9sai6lVZYRzeV
	 b+Bn0XG6bopomfJZ/yW6nu+JNotbprtQjWyZX4ytuyz++R1TXp+G2KGa0GGX2bjEeQmpr
	 7Epe+7m7791r2hycPfK9YrPTep0MNlOqAqwD6impaiNZABTiP2H4dfbyh9J1IvRktUId6
	 h/j20jorPZGzDr7gqEAPLzcvwwQx277i5E/Yq4tRuJFtxi8O7enVNLdLaHyADOmVUxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794048547;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HCjMw7xN3kplE/4dlVgyFipVAftXB4BLlPm/oty0758=;
	b=I52z1cJqsQa7dfBS8m6bpsWZsHXwLZM6e4eTiw158Pv/L+LxnxT9w1Od4T6H9qNa/6zW
	 hSPYmGi4n7VvNBtoqipZYlXWF24Iy+6sSxMdhmLOXrW7g4KDN6rmBxcBzuxUBmseCPOHW
	 YJnwJC+lb0OeL2TnpQX1VedtCy1pa2oqJdmDrPJub1ktUOhr8I98+PGJryQWXEbQIHwTV
	 sfZEs7WtazPtYU8nNXdHaL3vH/tibfgL3TYL3fsWyV0TsS34s/7S7np0cL98Jh+xpm+Og
	 hclQjId5qeOswWYHfdzpcxDa75aF3a1spERAF5ghZ9KoeghtWWaaPHWT+EwoTv42L2A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27AA61F008BE;
	Sat,  7 Nov 2026 10:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794048547;
	bh=HCjMw7xN3kplE/4dlVgyFipVAftXB4BLlPm/oty0758=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cr2JZ2tHfHr84MPZkEGO1gCsDBaBkQfcwvwB4c4KLlR8cczxrmhdMVjX5zsnOc+jb
	 G1sG4MAWeWOcUMqUurpcabkehxnaW5wicmX3jWcStbfumwIAEFFAru59/pxz58BHK2
	 9toiyX2YST3AvxOwtAeVqp/XuXXpgeAUMm8s19mojnyWXxNBi+K9OxZXbTNv1g/qPw
	 u48JZm61qPBBZEv+bgrOb1PDxVj5iwkoz22FOg0UoIPPTYgS/JVUmX10A9cujtx0N5
	 PJywHjeXQvJzt4bVVMejztj4MEePC4d9GYRsyiALxweg+HUkNZbIA8PYTvq+rATe4l
	 exa8vsIm3PY1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B689147B82;
	Sat,  7 Nov 2026 10:49:04 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 21:48:52 +1100
Subject: [PATCH v2 05/15] drivers/perf: apple_m1: Use macros for
 per-implementation init functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-m3-plus-pmu-events-v2-5-acf1e78da039@gmail.com>
References: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
In-Reply-To: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Yuvan Shen <yuvanshen09@gmail.com>, 
 Myria Sarvay <myrialsarvay@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4705;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=+oyn16wM+36gsNpdH9vUHTkMSmunTbMEAqC/n8xt5wY=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYst4zyeQ8z46P9dwhd6OgSej9CqnX8o9DvOsK04/uC
 LPbIxR6tKWjlIVBjItBVkyRRd80TXsyW8Ol0mWuW2DmsDKBDGHg4hSAiYS3MTK8NnVcet786drZ
 iao1QRqVlmd8f1z4xRM/NXbhIhUGwcLrDP/0NAIWb7nkx/GAt7dOWj2qJky8LuhFotwJHQ9N/oe
 vktgAMiNFWw==
X-Developer-Key: i=myrialsarvay@gmail.com; a=openpgp;
 fpr=2F35662B930680D275A645B452444118A8ADFEE9
X-Endpoint-Received: by B4 Relay for myrialsarvay@gmail.com/default with
 auth_id=1027
X-Original-From: Myria Sarvay <myrialsarvay@gmail.com>
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
Reply-To: myrialsarvay@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Myria Sarvay <myrialsarvay@gmail.com>

6 generations of apple silicon, with at least 2 init functions for each
lead to at least 12 init functions. Template them with macros to save
boilterplate code.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 90 +++++++++++++----------------------------
 1 file changed, 29 insertions(+), 61 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index a14864263bf1..a47605b159d6 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -653,71 +653,39 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 }
 
 /* Device driver gunk */
-static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
-{
-	cpu_pmu->name = "apple_icestorm_pmu";
-	cpu_pmu->enable		  = m1_pmu_enable_event;
-	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
-	cpu_pmu->map_event	  = m1_pmu_map_event;
-	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
-
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
-	return apple_pmu_init(cpu_pmu);
-}
-
-static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
-{
-	cpu_pmu->name = "apple_firestorm_pmu";
-	cpu_pmu->enable		  = m1_pmu_enable_event;
-	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
-	cpu_pmu->map_event	  = m1_pmu_map_event;
-	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
-
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
-	return apple_pmu_init(cpu_pmu);
-}
-
-static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
-{
-	cpu_pmu->name = "apple_avalanche_pmu";
-	cpu_pmu->enable		  = m1_pmu_enable_event;
-	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
-	cpu_pmu->map_event	  = m2_pmu_map_event;
-	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
-
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
-	return apple_pmu_init(cpu_pmu);
-}
-
-static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
-{
-	cpu_pmu->name = "apple_blizzard_pmu";
-	cpu_pmu->enable		  = m1_pmu_enable_event;
-	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
-	cpu_pmu->map_event	  = m2_pmu_map_event;
-	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
-
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
-	return apple_pmu_init(cpu_pmu);
-}
+#define APPLE_PMU_INIT(gen, family)								\
+static int gen ## _pmu_ ## family ## _init(struct arm_pmu *cpu_pmu)				\
+{												\
+	cpu_pmu->name			= "apple_" #family "_pmu";				\
+	cpu_pmu->enable			= gen ## _pmu_enable_event;				\
+	cpu_pmu->get_event_idx		= gen ## _pmu_get_event_idx;				\
+	cpu_pmu->map_event		= gen ## _pmu_map_event;				\
+	cpu_pmu->set_event_filter	= gen ## _pmu_set_event_filter;				\
+												\
+	cpu_pmu->map_pmuv3_event	= gen ## _pmu_map_pmuv3_event;				\
+												\
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &gen ## _pmu_events_attr_group;	\
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &gen ## _pmu_format_attr_group;	\
+	return apple_pmu_init(cpu_pmu);								\
+}
+
+#define m2_pmu_enable_event		m1_pmu_enable_event
+#define m2_pmu_get_event_idx		m1_pmu_get_event_idx
+#define m2_pmu_set_event_filter		m1_pmu_set_event_filter
+#define m2_pmu_map_pmuv3_event		m1_pmu_map_pmuv3_event
+#define m2_pmu_events_attr_group	m1_pmu_events_attr_group
+#define m2_pmu_format_attr_group	m1_pmu_format_attr_group
+
+APPLE_PMU_INIT(m1, icestorm)
+APPLE_PMU_INIT(m1, firestorm)
+APPLE_PMU_INIT(m2, avalanche)
+APPLE_PMU_INIT(m2, blizzard)
 
 static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,avalanche-pmu",	.data = m2_pmu_avalanche_init, },
 	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
-	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
-	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
+	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_icestorm_init, },
+	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_firestorm_init, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, m1_pmu_of_device_ids);

-- 
2.55.0



