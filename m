Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D43B606EEB0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 10:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KV7eQQgW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cL+LqMbd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fe2UqeHpGqlMKmL5k4DQgnxWZcqFnKx7CUFv7Fibzbs=; b=KV7eQQgWF9sKCx/3Uomq20c7qw
	Sr4JumKtwNdwruEPpoZGXPoYSOdOCK9fe35MQr8+fk3mt6z2Dv11exSzvxDfBQgg9Ztr6WQqWUexO
	xd+pGU+VppzEErqgU6x98aNbTZNwd3OEicAlcFV26AzXcbnZbdfqEDEK7D+P2vyxC3J0UTaPNO+SO
	ZN/Oqi7YwgvghNcZd481+TtYwZ/D0gDThH0j27M5xTUO9fKJCwgpMf0rsCGzrY7bMMOMgnJ8kFuPU
	UkEWyxDJaTHk7gdfHD3Xj367YepttxfIWhfZlNC7zBxJnI6b0wxe6Fb3avleyK0HTSEMkQo2nMan9
	yM1/UREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdzA-0000000EYHt-0Ttt;
	Sat, 07 Nov 2026 10:49:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdyv-0000000EY5N-01lp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:49:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D662A60F2D;
	Sat,  7 Nov 2026 10:49:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794048547;
	b=GSn9XGv6mS33v7Q56QvMwxZyCU3KEKRf3bXd/6VJ3fyg/M7ckW8Uu/5eGvaiTvT6tWUi
	 /c6WOkY6N4x46ks18YBt9/ir/VLkSBGU65E3e02qE6gQ0W0H3lN48lnCkgfYRFDKdzUKt
	 G2XmSD7rKyqc9hPULD5uU8tR0R8uizSIzPOOFGwkVk4JX8+qAoZzADXIqX+wPFf10yJRO
	 hv8sLCdEV5sQaQo+SYCTVLFDo5Gtxa83/5vubvV3oxuAYFNl6sd6dKl/0l9hG4MWZSOWn
	 Ty3x7ethtF2vBAQZobynUvKyyZ/mZZ5IYstVxZNV+MUzokRPkQJEUj7D5/GaL6xDCkA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794048547;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fe2UqeHpGqlMKmL5k4DQgnxWZcqFnKx7CUFv7Fibzbs=;
	b=Z5YsNnX61cH7Q4uYgbKNBJo8tzT2Tgb4P0+TRkUlxu2sLXQjhJij0eqZMJtEwC5MBYdX
	 395NnXCCsy8dSisOT3eubCsBTxm8FZoU1N76DtYpCeMCTMBlYhaasFISDMdDtVi5y7jcl
	 TegalllqYOYyqZCipV+l1TNLb1DJK/7Ljh9HtpyNq5BXOhgOQdUgdwXpSGY46pf80zsl7
	 ccop28cMOF7C7ZxskC11Nr4Lu/VncWerx8oc5crBOaNfKmwFH0yBXlnklGNV13VKU4hdq
	 nFrjc1vTNn7thJGR8QdXlUG3UzNjNenWuF4ZhW/7s5NWU5ooTsYDDmO++sIhs/dXMQA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20E0E1F008A4;
	Sat,  7 Nov 2026 10:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794048547;
	bh=fe2UqeHpGqlMKmL5k4DQgnxWZcqFnKx7CUFv7Fibzbs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cL+LqMbdNH2oDPDIbFctrEpfmxTOm9SqURucpp73K/uT6gUa97WeK5Q5vZq1vgbZa
	 zyyRbSS1fxMpJzHZpTSBhqNYjVgs2DwYrBVSZeYjROQc0CAxBQja6jo5oNvUn+TOXO
	 TmJtkzMi30oSOgn/z9pzJdv4719Sf3zhCq/YT8Zy+vZnSNWV5+Pa/p/8BmPWkh9Puq
	 MkWBiNsbORe0RJLYd/6ly1XGKjbAROZeQ34eWxQjSJbMjpMxOwwrV0vh0f/DjqSG1h
	 MPVy2aPSDv1usgIu1FHxtYQI4z6Qkhze0JsO6qo+PuSgx+NzwjunB5aulYahOrRpyO
	 k61d8c+AxG1jA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A6F8B47B7E;
	Sat,  7 Nov 2026 10:49:04 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 21:48:51 +1100
Subject: [PATCH v2 04/15] drivers/perf: apple_m1: Support
 per-implementation event size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-m3-plus-pmu-events-v2-4-acf1e78da039@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7619;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=JhSnErAvV8k8B/pR0xbZ9CAqGWkNZJsjGAvcOAujYmo=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYst4zSZ888Sw16pbzgdfffjNf6tnywmCze5HT/q8Tv
 lUuy9knnjezo5SFQYyLQVZMkUXfNE17MlvDpdJlrltg5rAygQxh4OIUgInMbWZkeBxQ3+sVFLhc
 8rLK4WKRZ9euvy3UlSv2Zvq4Ren1dwPD8wz/wx8EbmN11lklLxx2+JP8b9nVq2dsK9jSEiS37eX
 VrI46XgCa/k0j
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

On M3 and later silicon, events are 16-bits instead of the 8-bits of
earlier implementations.

Co-developed-by: Yuvan Shen <yuvanshen09@gmail.com>
Signed-off-by: Yuvan Shen <yuvanshen09@gmail.com>
Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 54 ++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 2ff0c2e0b737..a14864263bf1 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -209,10 +209,13 @@ static const struct attribute_group m1_pmu_events_attr_group = {
 	.attrs = m1_pmu_event_attrs,
 };
 
-PMU_FORMAT_ATTR(event, "config:0-7");
+PMU_FORMAT_ATTR_SHOW(event_8b, "config:0-7");
+
+static struct device_attribute format_attr_event_8b =
+	__ATTR(event, 0444, event_8b_show, NULL);
 
 static struct attribute *m1_pmu_format_attrs[] = {
-	&format_attr_event.attr,
+	&format_attr_event_8b.attr,
 	NULL,
 };
 
@@ -373,7 +376,8 @@ static void __m1_pmu_configure_event_filter(unsigned int index, bool user,
 		sysreg_clear_set_s(SYS_IMP_APL_PMCR1_EL12, clear, set);
 }
 
-static void __m1_pmu_configure_eventsel(unsigned int index, u8 event)
+static void __apple_pmu_configure_eventsel(unsigned int index, u16 event,
+					   unsigned int size, u64 mask)
 {
 	u64 clear = 0, set = 0;
 	int shift;
@@ -388,14 +392,14 @@ static void __m1_pmu_configure_eventsel(unsigned int index, u8 event)
 	case 0 ... 1:
 		break;
 	case 2 ... 5:
-		shift = (index - 2) * 8;
-		clear |= (u64)0xff << shift;
+		shift = (index - 2) * size;
+		clear |= mask << shift;
 		set |= (u64)event << shift;
 		sysreg_clear_set_s(SYS_IMP_APL_PMESR0_EL1, clear, set);
 		break;
 	case 6 ... 9:
-		shift = (index - 6) * 8;
-		clear |= (u64)0xff << shift;
+		shift = (index - 6) * size;
+		clear |= mask << shift;
 		set |= (u64)event << shift;
 		sysreg_clear_set_s(SYS_IMP_APL_PMESR1_EL1, clear, set);
 		break;
@@ -412,7 +416,7 @@ static void m1_pmu_configure_counter(unsigned int index, unsigned long config_ba
 
 	__m1_pmu_configure_event_filter(index, user && host, kernel && host, true);
 	__m1_pmu_configure_event_filter(index, user && guest, kernel && guest, false);
-	__m1_pmu_configure_eventsel(index, evt);
+	__apple_pmu_configure_eventsel(index, evt, 8, M1_PMU_CFG_EVENT);
 }
 
 /* arm_pmu backend */
@@ -485,10 +489,8 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
 
 static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				   struct perf_event *event,
-				   const u16 event_affinities[])
+				   unsigned long affinity)
 {
-	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
-	unsigned long affinity = event_affinities[evtype];
 	int idx;
 
 	/*
@@ -510,7 +512,10 @@ static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
 				struct perf_event *event)
 {
-	return apple_pmu_get_event_idx(cpuc, event, m1_pmu_event_affinity);
+	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
+	unsigned long affinity = m1_pmu_event_affinity[evtype];
+
+	return apple_pmu_get_event_idx(cpuc, event, affinity);
 }
 
 static void m1_pmu_clear_event_idx(struct pmu_hw_events *cpuc,
@@ -542,10 +547,10 @@ static void m1_pmu_stop(struct arm_pmu *cpu_pmu)
 
 static int apple_pmu_map_event(struct perf_event *event,
 			       const unsigned int (*perf_map)[],
-			       unsigned int flags)
+			       unsigned int flags, u32 mask)
 {
 	event->hw.flags |= flags;
-	return armpmu_map_event(event, perf_map, NULL, M1_PMU_CFG_EVENT);
+	return armpmu_map_event(event, perf_map, NULL, mask);
 }
 
 /*
@@ -557,12 +562,14 @@ static int apple_pmu_map_event(struct perf_event *event,
  */
 static int m1_pmu_map_event(struct perf_event *event)
 {
-	return apple_pmu_map_event(event, &m1_pmu_perf_map, ARMPMU_EVT_47BIT);
+	return apple_pmu_map_event(event, &m1_pmu_perf_map, ARMPMU_EVT_47BIT,
+				   M1_PMU_CFG_EVENT);
 }
 
 static int m2_pmu_map_event(struct perf_event *event)
 {
-	return apple_pmu_map_event(event, &m1_pmu_perf_map, ARMPMU_EVT_63BIT);
+	return apple_pmu_map_event(event, &m1_pmu_perf_map, ARMPMU_EVT_63BIT,
+				   M1_PMU_CFG_EVENT);
 }
 
 static int apple_pmu_map_pmuv3_event(unsigned int eventsel, const u16 pmceid_map[])
@@ -631,7 +638,6 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
 static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
-	cpu_pmu->enable		  = m1_pmu_enable_event;
 	cpu_pmu->disable	  = m1_pmu_disable_event;
 	cpu_pmu->read_counter	  = m1_pmu_read_counter;
 	cpu_pmu->write_counter	  = m1_pmu_write_counter;
@@ -639,12 +645,10 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 	cpu_pmu->start		  = m1_pmu_start;
 	cpu_pmu->stop		  = m1_pmu_stop;
 	cpu_pmu->reset		  = m1_pmu_reset;
-	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	apple_pmu_init_pmceid(cpu_pmu);
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
-	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return 0;
 }
 
@@ -652,48 +656,60 @@ static int apple_pmu_init(struct arm_pmu *cpu_pmu)
 static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_icestorm_pmu";
+	cpu_pmu->enable		  = m1_pmu_enable_event;
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
+	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
 
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return apple_pmu_init(cpu_pmu);
 }
 
 static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_firestorm_pmu";
+	cpu_pmu->enable		  = m1_pmu_enable_event;
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m1_pmu_map_event;
+	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
 
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return apple_pmu_init(cpu_pmu);
 }
 
 static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_avalanche_pmu";
+	cpu_pmu->enable		  = m1_pmu_enable_event;
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
+	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
 
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return apple_pmu_init(cpu_pmu);
 }
 
 static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
 {
 	cpu_pmu->name = "apple_blizzard_pmu";
+	cpu_pmu->enable		  = m1_pmu_enable_event;
 	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
 	cpu_pmu->map_event	  = m2_pmu_map_event;
+	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
 	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
 
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
+	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
 	return apple_pmu_init(cpu_pmu);
 }
 

-- 
2.55.0



