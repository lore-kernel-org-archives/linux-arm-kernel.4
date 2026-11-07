Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED03606EE87
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vqct0QAS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DTVJ+wuX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VHTLybPzMLGIsfTFpFBqEVoyacMyVYOjjlRuTV7oaXk=; b=vqct0QASse74FHpZfB7CKkY8T8
	mjFSUSiHHno7CS5CgYTVwQVvXJjNr7Z0bRDdSg1gdEUIXD0hjfWg/FnPjV0Qj0g0FCO0g7YOcVqsy
	oJPlfhmrWiWjbhW53VW20CKZ7oK5nmqgIagwzyfblGBU0wgnNgo09ViMcR4C/wvq6SIyw4BbW1eJM
	YxM7ZHGxMrqBSJD7HZgSwOZRP+FZYTsqWYUIfFIuH0KZQt5gbntil/0xXxbTltZBgPjJgt41j0Sqg
	UkjAZNN2LPjE0PLWL48BUYcyD+xOQcjFiNcfh6uZU3IiY/PwSvVncr+aXoWf1mwXztbrWcnCcpzl4
	hG8L9mvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdz9-0000000EYGI-2qNy;
	Sat, 07 Nov 2026 10:49:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdyu-0000000EY5Z-2sbp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:49:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 665D543FDC;
	Sat,  7 Nov 2026 10:49:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794048548;
	b=JNr/nFJ9fYzF9uBhD4gRWhHgCGYBzt3WhgwjzvkL/imXRXwP/wPguBsfkztZiTmGf1MP
	 WpjMrQPYS3ta8LVpkXByD0KtWNRuHLuzM/NIZICmXapEXlzjIvecNpN77ANZalX1IzxOT
	 ztVbOnl6rx5bgtl1TIzkLZKPvNiHO5KhKrsBmcym7IHqtgiOCuX6UcM2t5ZWdntb0yern
	 e9tLwmMNb8W//ztAvN5hEOQa4ESu+833mi92HDFxZZqBqXZwd03dJtryZP7ekgGNM5iPQ
	 NoTlWa4dP36l1wvcIUQoOWj9yJtMeHIH1QbvJNfqJBoSsM7WchRX+NGyOBZ8Q4RXdog==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794048548;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VHTLybPzMLGIsfTFpFBqEVoyacMyVYOjjlRuTV7oaXk=;
	b=rsAD+s4JUawhuzLGvKm1y4/AXNyMWnMjfmOdgBp+bpeP7lLKfIAmypApB/H+W1xKs2AU
	 ldaCsYrEYb1teSve9UiMJ1A9fSzF0460mzRp+wFV183uGkpX7LR9Xyajys582tw4wtLs+
	 1Vj4lP6d8gc9wIhyE2nEmEXyTodMXeDwNIdcZIEeoeMH56MfTnSUWjCENZM2i7MoQNz3T
	 0HCNrt3AKdRjKPWeUsB77VC4RVpuvm7CBkF+XKhhUv58VUSPlOwRcexuSw1+grXAAM0OJ
	 dvx0KB548oqGIb41Hvg6Xv52AbbDuKxj8JFIPTbs3LsiOO19M73Xd4t90wukZi4G3pg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 391F91F00923;
	Sat,  7 Nov 2026 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794048548;
	bh=VHTLybPzMLGIsfTFpFBqEVoyacMyVYOjjlRuTV7oaXk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DTVJ+wuXfxTPd5WBdWvAfpYQFQTHMYc8j/VhwLdodallkPLf245+tfvkDj+ImOlGx
	 TbwcoWGJymoKvplZ0isE+le80CLlmAWlYSxbLZqy/2vkVOJ3DgNRe4qoHJg6n5dvYy
	 ud8FRCy9tpl8BvuNqopGpeSC30T+qx0KZDsu10c3lfIb8xOauhlpkNydtFrOdBSxoL
	 0fff8Sn0Ky+ue2t+3T0qs8mDIGsaT17DaHh1cDRFGjIAvj0oAMnGPuRyFfkKHG2DYW
	 H9XC+J8rjfQdi1k8EMWraHPC6jHO+ILw5kBS8ZRITTZIq+ffLRjD61+9c+2xqW1ppe
	 vShttRG9ZVjwQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 20CB847B9A;
	Sat,  7 Nov 2026 10:49:05 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 21:48:58 +1100
Subject: [PATCH v2 11/15] arm64: dts: apple: t603x: Add PMU Device Nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-m3-plus-pmu-events-v2-11-acf1e78da039@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=Wg6EmXC9czH93hJw3fvp5wMAuJEXQ1vql4D/hklHhyg=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYst4zyVpue2KyvvjAVgWtrOLqoKk2i+4+q/Jn3m0jt
 XRnqv/kn24dpSwMYlwMsmKKLPqmadqT2RoulS5z3QIzh5UJZAgDF6cATOS2NCPDgyPzn/1+Yr1q
 gvbDdV97WjKeZYqrHretl7e8J3FKr3xuLSPDrzN8yX8edLyPeOL3dmXRFucn958lHNZ0ckxqF6x
 96yDEBwAYoEt2
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

Adds the PMU nodes to all t603x devices.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 arch/arm64/boot/dts/apple/t6030.dtsi      | 12 ++++++++++++
 arch/arm64/boot/dts/apple/t6031-base.dtsi | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index d49210572e19..4525d50fe647 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -239,6 +239,18 @@ l2_cache_1: l2-cache-1 {
 		};
 	};
 
+	pmu-e {
+		compatible = "apple,sawtooth-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,everest-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	reserved-memory {
 		ranges;
 		#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/apple/t6031-base.dtsi b/arch/arm64/boot/dts/apple/t6031-base.dtsi
index f62ce0690182..3b97c1240934 100644
--- a/arch/arm64/boot/dts/apple/t6031-base.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-base.dtsi
@@ -308,6 +308,18 @@ l2_cache_2: l2-cache-2 {
 		};
 	};
 
+	pmu-e {
+		compatible = "apple,sawtooth-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ 0 AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,everest-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ 0 AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	reserved-memory {
 		ranges;
 		#address-cells = <2>;

-- 
2.55.0



