Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7839606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 11:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jT3vpp/9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bAHsVhJX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F6jX/+Nqs2fcYN6TvsVCxH9Qlb1iwQl+YtobY55zdXo=; b=jT3vpp/9rf3nl4vYFFg3m0e3xR
	+XCOJN6mkwFGJW9GsTFb/dYR+XJHUwOwR6UnU/YCoHrWrWj1LfHioYTaxsI2rTsLAreXiLTbsB0hg
	gsZO34coM3zLCw1ZNrkpZaroCIwXW89UGIjxGOe0n93Kwf0uNznU3S3VAGSpBrTnAca6dfjv0vh45
	EEdFUn5Y9Y4vyOHXcdsUwSWScC/1b8c5RkbQDVFZRQkXNC0yMHWYg380eRlen7J4jjmXNpzXxdGUp
	fAsCf8H5H6OX8XwWbgDGugu6evspxLBGunGGjzVKj0BibZYEyjDyXIhgAueiexrENYpMf1xOP973G
	GMoWy/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdzA-0000000EYJs-2vo0;
	Sat, 07 Nov 2026 10:49:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdyv-0000000EY6C-1eTC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:49:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A6E343AE4;
	Sat,  7 Nov 2026 10:49:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794048549;
	b=LLL8Kx5NMHYg/xqYcEEJFq90VNrzWtLH3XAie0DwG6tnRuS0tAnEpnfGjzTUZl7O8iMq
	 Pyt2mHTqlQG6RrQGH9+ZQZwmEitAq7JBgdLikY/FHqW3XuRjyDh2MS+ID7Nr/Slo4eN6H
	 rIej/HD7BiCCixMf7RfxNiIecB1/0BdV9VDq0D1oVkLlGiEJhQI7NSMCAjHcS2tjmO0EA
	 VbSlb28KPny/TMYUSpQ7esilj0+yYz2kU5TiF+fKN7z5vg1kBHT47ocmYcsYUNMVbmKTM
	 wUVMK/4iI3J8Xg8Y3hDarARgnoaF728QeW6XrJ6A0brxLyzLiHvG7XKw88ubCPyMfNQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794048549;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=F6jX/+Nqs2fcYN6TvsVCxH9Qlb1iwQl+YtobY55zdXo=;
	b=RGuvcc44dWkatSHh8ZyMjiuq4m/lU9DqpLCnn5fsfcparQX4ckjPp4u3lb9EOAVafk4Q
	 LtSBhbIYdBB6Y6VGVmg+bQmtNwYAFVImfKKOsKbvH2ynbAH6yXAeK6nX5uEETcmFo84DL
	 iKtelE6Rb608n2wcbSKhKNZfhcSQiATxmuJ3iIpblbu+MiEcas9RSzF7vjztU3XgEwui/
	 vKWP4DSXFgT5k16FWecL/oHRLLbRw+vYCqqtz61nB3Bg3re/jpwFVqYszJGVMcv5zWfUX
	 t0p8oTEs0jfNPan9rl6vYhzn1f8+BC9MQ2O4WBb8SWiIPhkQFK+AURrGshoqVdYDg1w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93FDB1F008A6;
	Sat,  7 Nov 2026 10:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794048549;
	bh=F6jX/+Nqs2fcYN6TvsVCxH9Qlb1iwQl+YtobY55zdXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bAHsVhJXVqRRyDXnhqz/CXoQYhokavqGoRqGv0G9bUsgcdrw+DSGinmJ2niDhESoL
	 oCevq1WnjTw9xGo3GHCXaWMB3gvKHZcSHfnYfbI/C19X54Ca8dlwfdDYkjmIXaA5r3
	 1quYdGH9zHdurGS4Qt4A6kUj1B70/bxtUPLiMOipJN5nxgJ5WsXei3JcZSfHUUUEoL
	 ClFKU3FbFHrvTz/p7lzXkNLhrZs3tnDt7lrV6K1iCt56mGiwTZcijMy5dzsE4h3aA0
	 Ohx96eVKQnqAFTydfCjeI0FsgFoI23p5Rew8HoWsAdXk2uUuUpt3n0wXbhyalfDmEI
	 TdpKNUVPXkbaA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E5A1B47B8E;
	Sat,  7 Nov 2026 10:49:04 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 21:48:55 +1100
Subject: [PATCH v2 08/15] drivers/perf: apple_m1: Add Apple A18 Support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-m3-plus-pmu-events-v2-8-acf1e78da039@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=s/45yDdB8ys2vFBvaE4TXv63SSRkLqDeAYlpyd8V2AY=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYst4zyUyM93DXiI9rWnfb4LvHynVG57bEuTsyN5SkL
 Sr2+3D4g39HKQuDGBeDrJgii75pmvZktoZLpctct8DMYWUCGcLAxSkAE5H2Zvgr5714Rpeyioqf
 w7GnS1Sb25oNN0358UDwwo1TJz7MMno7k5Fhtq/Vx5YCt4c6mzxDbBYlWJloHOFy0TbrZNtpvGD
 fkUBmAFLcRuQ=
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

The A18 has events and affinities identical to the M4, so use it.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index d6fa58aee886..318baf1a75c4 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -1154,6 +1154,8 @@ APPLE_PMU_INIT(m2, avalanche)
 APPLE_PMU_INIT(m2, blizzard)
 APPLE_PMU_INIT(m3, sawtooth)
 APPLE_PMU_INIT(m3, everest)
+APPLE_PMU_INIT(m4, tahiti_e)
+APPLE_PMU_INIT(m4, tahiti_p)
 APPLE_PMU_INIT(m4, donan_e)
 APPLE_PMU_INIT(m4, donan_p)
 APPLE_PMU_INIT(m4, brava_e)
@@ -1164,6 +1166,8 @@ static const struct of_device_id m1_pmu_of_device_ids[] = {
 	{ .compatible = "apple,brava-p-pmu",	.data = m4_pmu_brava_p_init, },
 	{ .compatible = "apple,donan-e-pmu",	.data = m4_pmu_donan_e_init, },
 	{ .compatible = "apple,donan-p-pmu",	.data = m4_pmu_donan_p_init, },
+	{ .compatible = "apple,tahiti-e-pmu",	.data = m4_pmu_tahiti_e_init, },
+	{ .compatible = "apple,tahiti-p-pmu",	.data = m4_pmu_tahiti_p_init, },
 	{ .compatible = "apple,sawtooth-pmu",	.data = m3_pmu_sawtooth_init, },
 	{ .compatible = "apple,everest-pmu",	.data = m3_pmu_everest_init, },
 	{ .compatible = "apple,avalanche-pmu",	.data = m2_pmu_avalanche_init, },

-- 
2.55.0



