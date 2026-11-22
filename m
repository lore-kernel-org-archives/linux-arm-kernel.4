Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF60606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 00:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rc/2s6jZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJJiHnZ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J1ZGJnZQtQZbAjjyMmOw/z71RiFaPkMYBq3NUKY8jPc=; b=rc/2s6jZVLXRxTdQwLXsRpfTF4
	kUCNTP+QU/fQSrde3iuTv8JXSIFj2SgTjIRfpBkMjaJ+MWlZSBpkN5C+cIIdFy7ujFGkfpHxKwqdd
	+8s3dK0lFxDnoMIfH6oVX9jOTN6towg//MEAfmVVuogQQxR+ZLz1BRKDOua/U/x4voaKGSvqmzbRP
	zmweqQev9lGj+NHxXxOsRBBM1xoE76Vp+hGSkw1CUP9md8+dXe8qhbRddOQr8eWflRiQDFcgr82b6
	VaY+UMzqh4lGihyFyqTeY+7bzeaoePpwOBPWsKTQaD6D+r1cmYqiIYQN1qqyxIVLbw5m7UV1BM73o
	Fb1fDdjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvII-00000000ZVj-2Uka;
	Sun, 22 Nov 2026 00:18:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvHx-00000000ZNY-1bFB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 00:18:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2966E45913;
	Sun, 22 Nov 2026 00:18:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795306717;
	b=tKll0OJrXGYv+xfu7b5xCiOhiSlU6HeOPGvf1fZfJftOJEmAeBziYXMbRdw8QW07HYlu
	 IScHnfe/x+vKaCmOX02B2HahCm6SV4JDMGRh3pGjLxMCKu6EPH3icrdkuWRHueHtODIGh
	 h3C4afc5yggrFP3mbUjrIKMKwHze2vIXbTKabHpBcmyrVaVPtunQJrQfVknF5dXZ6DNVP
	 JHJbe14Tvb80NlMYikBO9QdVK+7uKzKT0IeFRQJrp00uHId+n1Q/viLJQwyAkrJPOvCF+
	 ST4lH7J0XSq8SqLHFMa5gIUUPgTas4FzyluLm9LozKLPzjqdm6liJafuAuegR5igpaQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795306717;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=J1ZGJnZQtQZbAjjyMmOw/z71RiFaPkMYBq3NUKY8jPc=;
	b=w0VdUknpyxmFNjFIp+aUwpHikxxj28WBsYRgsY6XnuzJ4j0NB25ARqO7nwk4D6vA3YPM
	 A5/BztHA6K0m4KmulF+MDVfgN1OJE32lOGs4bH9hqlUwOs6MfTRGj2q/1wmEOwR82Td/W
	 TwwX95u9aZhQla38YkJr/S6I4EWjqC/LomyV4gz/NfDOTA6IikwIdsxDp+p185AdqK0HL
	 1mXMlVQc7Zwees7Fz5w857mrxJOltXsJzprqpRyltmYSNiauFgiYZZKyqnHVfNg4BDHRJ
	 h8CV5A/6WWCQDR/wYZAlVKBO7lPikW3ycyIALuasJ5Jpr+fqDrhrpDrGWvoZ8SCG2jw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C16361F000D1;
	Sun, 22 Nov 2026 00:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795306717;
	bh=J1ZGJnZQtQZbAjjyMmOw/z71RiFaPkMYBq3NUKY8jPc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AJJiHnZ7EVp2XkZo3i/YAemvbaGfspPvFd4IEBmQ1ORop0xmlpqwOwDtqdUGUcOYa
	 6H8PJt4GQq1kgum+OVwSSSDdsBQhw8yvDn8rZzZat+6YeogboFFcShFGGG0vKONYQJ
	 9i9v4QknzzCQlt24LXQXds5YBHEE34ZKZ/13mc9GGQ9EU5mO62g4k3wrL0lK5LR5nm
	 mnrSRviVflJ/wnDa4A1sD99frxSj8X6qLd2xF9wTXQN7EFoYDok3ELI5R1mhwi11+m
	 O5md8UaNSvOvv/IWmPWI6xZEKklJKlhK9op4+BRthuut8g9jX433TgSjx3MHTu/qCi
	 JGRp0eC8tunZg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7D3774BE96;
	Sun, 22 Nov 2026 00:18:34 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:18:26 +0000
Subject: [PATCH v2 5/5] arm64: dts: apple: t6032: Add CPU frequency scaling
 and OPPs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-m3-cpufreq-opp-v2-5-3c19963f55ee@gmail.com>
References: <20261122-m3-cpufreq-opp-v2-0-3c19963f55ee@gmail.com>
In-Reply-To: <20261122-m3-cpufreq-opp-v2-0-3c19963f55ee@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795306712; l=7260;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=RP3Tl98EGSTZRq8axcgQ4fI3CuPhgZyAKwc+j8gARmE=;
 b=svqXsQ9xqKQ2cDML9fwZcFlM4sEp5BZ7n1lI8uJa5YfcewBelutV99aoPDkUvqFXERil2zByZ
 pN47QATtRGlA3AdBsj4IwqFCodmEtcTHZ9Jqkbzmi8p6oZ+fMlMO1Gr
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michael Reeves <michael.reeves077@gmail.com>

Add operating performance point references, performance domain bindings,
and CPU capacity values for the second die's Sawtooth efficiency and
Everest performance clusters on Apple T6032 (M3 Ultra).

The die1 cores use the same OPP tables and capacity-dmips-mhz values as
die0 (inherited from T6031), paired with the die1 cluster cpufreq
controller nodes instantiated via t6031-dieX.dtsi.

Suggested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 arch/arm64/boot/dts/apple/t6032.dtsi | 48 ++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6032.dtsi b/arch/arm64/boot/dts/apple/t6032.dtsi
index 6115ab8db5ef..b5ddaa00a7e0 100644
--- a/arch/arm64/boot/dts/apple/t6032.dtsi
+++ b/arch/arm64/boot/dts/apple/t6032.dtsi
@@ -107,9 +107,12 @@ cpu_e10: cpu@800 {
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <870>;
 			d-cache-size = <0x10000>;
 			i-cache-size = <0x20000>;
 			next-level-cache = <&l2_cache_3>;
+			operating-points-v2 = <&sawtooth_opp>;
+			performance-domains = <&cpufreq_e_die1>;
 		};
 
 		cpu_e11: cpu@801 {
@@ -119,9 +122,12 @@ cpu_e11: cpu@801 {
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <870>;
 			d-cache-size = <0x10000>;
 			i-cache-size = <0x20000>;
 			next-level-cache = <&l2_cache_3>;
+			operating-points-v2 = <&sawtooth_opp>;
+			performance-domains = <&cpufreq_e_die1>;
 		};
 
 		cpu_e12: cpu@802 {
@@ -131,9 +137,12 @@ cpu_e12: cpu@802 {
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <870>;
 			d-cache-size = <0x10000>;
 			i-cache-size = <0x20000>;
 			next-level-cache = <&l2_cache_3>;
+			operating-points-v2 = <&sawtooth_opp>;
+			performance-domains = <&cpufreq_e_die1>;
 		};
 
 		cpu_e13: cpu@803 {
@@ -143,9 +152,12 @@ cpu_e13: cpu@803 {
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <870>;
 			d-cache-size = <0x10000>;
 			i-cache-size = <0x20000>;
 			next-level-cache = <&l2_cache_3>;
+			operating-points-v2 = <&sawtooth_opp>;
+			performance-domains = <&cpufreq_e_die1>;
 		};
 
 		cpu_p20: cpu@10900 {
@@ -155,9 +167,12 @@ cpu_p20: cpu@10900 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_4>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p0_die1>;
 		};
 
 		cpu_p21: cpu@10901 {
@@ -167,9 +182,12 @@ cpu_p21: cpu@10901 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_4>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p0_die1>;
 		};
 
 		cpu_p22: cpu@10902 {
@@ -179,9 +197,12 @@ cpu_p22: cpu@10902 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_4>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p0_die1>;
 		};
 
 		cpu_p23: cpu@10903 {
@@ -191,9 +212,12 @@ cpu_p23: cpu@10903 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_4>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p0_die1>;
 		};
 
 		cpu_p24: cpu@10904 {
@@ -203,9 +227,12 @@ cpu_p24: cpu@10904 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_4>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p0_die1>;
 		};
 
 		cpu_p25: cpu@10905 {
@@ -215,9 +242,12 @@ cpu_p25: cpu@10905 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_4>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p0_die1>;
 		};
 
 		cpu_p30: cpu@10a00 {
@@ -227,9 +257,12 @@ cpu_p30: cpu@10a00 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_5>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p1_die1>;
 		};
 
 		cpu_p31: cpu@10a01 {
@@ -239,9 +272,12 @@ cpu_p31: cpu@10a01 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_5>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p1_die1>;
 		};
 
 		cpu_p32: cpu@10a02 {
@@ -251,9 +287,12 @@ cpu_p32: cpu@10a02 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_5>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p1_die1>;
 		};
 
 		cpu_p33: cpu@10a03 {
@@ -263,9 +302,12 @@ cpu_p33: cpu@10a03 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_5>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p1_die1>;
 		};
 
 		cpu_p34: cpu@10a04 {
@@ -275,9 +317,12 @@ cpu_p34: cpu@10a04 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_5>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p1_die1>;
 		};
 
 		cpu_p35: cpu@10a05 {
@@ -287,9 +332,12 @@ cpu_p35: cpu@10a05 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_5>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p1_die1>;
 		};
 
 		l2_cache_3: l2-cache-3 {

-- 
2.56.0



