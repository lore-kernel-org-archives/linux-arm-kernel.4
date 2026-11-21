Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14945606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y6ls6v6l;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nh4O/Ojp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BgRa25c2yeRWcTsSfy5rWDhEKsR4WN0Hp2Qr9mr0vew=; b=y6ls6v6lgkCf7W
	wVLV9qX0RaW2neMAEMMUfgZrIsJSVL3yZW03qOYWI4t3Zx32m0evqNnHOGoQMBOpa3IsCFQxsohVi
	mu65/b0PMWV6vmXyX/HXfhA5p+ZDRHXTukgQSiBgnq4z4LU5ckEto55v1u5/cx5Dmk5oskycQX7TO
	DVgYcIRVZH8C7ssaEgI0kc0Uz+vk2APGRhEewapAiNX2RCX5bO3GAZyVPzQsnOtyFaYSpfdK3NHXL
	4trybNtF2rArpPrBum5oobHGiyw7n7pHFsLRFBiOdqQc1ZC8xPAkMWfTYxudKN2j2Jyo5lgKXZce8
	481bgnKON7IG2LZ/iSqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjWZ-0000000H7ET-40om;
	Sat, 21 Nov 2026 11:44:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjWL-0000000H7Al-0MO4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 11:44:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97FAF6141B;
	Sat, 21 Nov 2026 11:44:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795261479;
	b=BoNWniE3k5KkvmijpxHMLNcU+KTD1Z3pzIbiNJXQ1dZ5+EUdO5kQLkwvRgEa+lW/MkF4
	 u7yCi75XWGxx6EJyQKOdHjOYc708hdgsNaO/Cv4AGLC//tmEFuacc+v65VFnvlH+C3Ssh
	 g8fqmIPpHUnMCbWXzQNa7CMsfX2C5J1r9X1jwJ03FCNaIq+hF+s0GcCmnnutF4oPXvv3u
	 CK7wWNUotpD355KzkaUTejIcFhxHOhj/EFvn4lzegBtCsrqYmv+NusTDvDHpfeGCdbk0t
	 JkYlmEvHIR4+CXTE9mj7Md4nNdj0DeE0vdg6loaQbJ1XQxOOOFGIt6G56FIi+1MH9oA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795261479;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=BgRa25c2yeRWcTsSfy5rWDhEKsR4WN0Hp2Qr9mr0vew=;
	b=JSJLGaf/1V+nHG4bCRtPLgAA7Nl8VJGTvWnGiPBYdfSKX7/8NfcqSW0R963ZHic+Wf10
	 R27dZieYAcESb+CQMeOkQD9C1szD4on7am9JIO2HXSZO5NC4TGWCHtceai6V7NWBNYtG2
	 0sy1p/MqcIRe+9xoKThy93iroLcZqyHAbEOZHNdN13Ep0DfvIuZicwqtmiIs8r5g7p07k
	 KmMTp86F7A/ugJxEqrSfA2rxrKDx/LRs5IplE4Dd/yoIFrvNb0v/VEFc2HggLl+5DylIq
	 YoKub8PCCaynaWrUBR9xc2dhgn27Ofip85fDw/UO6E1IQq6zpNo7UXeB3DnMvpjwX4A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 269141F000CA;
	Sat, 21 Nov 2026 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795261479;
	bh=BgRa25c2yeRWcTsSfy5rWDhEKsR4WN0Hp2Qr9mr0vew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nh4O/Ojp2IbSYBMPAdv2h9hjGHSYKHPadJR7Ulukwe2GDR8f5kKI0cHihKO4RnCV5
	 ZB7DuSOoBIFdpxbfpVZ9//UZX8FsjrLXMOP6dxl7sPfvNRDkqb4MfvXIX1j264b1WM
	 l2JsxtTwwK7y1r3DprXXqsTf/WdSa4gTT9W/l+/DA3MIxNj2w8pIHLOOgAfRAaRVzJ
	 vUny+HYPlnkPYxyPnsU4phBlrdbK7NS0N7MBTQxYZqUZQO8UYm3MGBCK63vmPDozsx
	 aOIlfJl0p8bRgCzlO6eojFGC5yNTEeSINDnwFsJASpk86S2r86PBKYEALRUvaYj3g2
	 QFMRmLr7YONWw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A8D4E4BC18;
	Sat, 21 Nov 2026 11:44:37 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 11:42:47 +0000
Subject: [PATCH 2/4] arm64: dts: apple: t8122: Add CPU frequency scaling
 and OPPs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-m3-cpufreq-opp-v1-2-42a0c07c48a4@gmail.com>
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>
In-Reply-To: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795261476; l=8104;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=7RgM/pZr6piF1+dFtELmpZINHsFgJk4k3LRIKe7+/VE=;
 b=xLKKcOwH35mGmXJSR+/e95VIwYvD/a+rvEyNSixiW2lqLpUKaIJ/GC5+M7sSAh0MNCPcXX+Ic
 cE43iqsTFrdCAHr4gWxqyWQ31JxOskaxiufdRm7M/DMmo/M1GMBzA4G
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Janne Grunau <j@jannau.net>

Add the cluster cpufreq controller nodes, operating performance point
tables, and CPU capacity values for the Apple T8122 (M3) Sawtooth
efficiency and Everest performance clusters.

The capacity-dmips-mhz values were determined by measuring single-core
CoreMark [1] Iterations/Sec/MHz at fixed frequencies under the
performance governor.

[1] https://github.com/eembc/coremark

Signed-off-by: Janne Grunau <j@jannau.net>
Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 210 +++++++++++++++++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 959ddf36efa1..3d41d32331a8 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -76,9 +76,12 @@ cpu_e0: cpu@0 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <804>;
 			d-cache-size = <0x10000>;
 			i-cache-size = <0x20000>;
 			next-level-cache = <&l2_cache_0>;
+			operating-points-v2 = <&sawtooth_opp>;
+			performance-domains = <&cpufreq_e>;
 		};
 
 		cpu_e1: cpu@1 {
@@ -88,9 +91,12 @@ cpu_e1: cpu@1 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <804>;
 			d-cache-size = <0x10000>;
 			i-cache-size = <0x20000>;
 			next-level-cache = <&l2_cache_0>;
+			operating-points-v2 = <&sawtooth_opp>;
+			performance-domains = <&cpufreq_e>;
 		};
 
 		cpu_e2: cpu@2 {
@@ -100,9 +106,12 @@ cpu_e2: cpu@2 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <804>;
 			d-cache-size = <0x10000>;
 			i-cache-size = <0x20000>;
 			next-level-cache = <&l2_cache_0>;
+			operating-points-v2 = <&sawtooth_opp>;
+			performance-domains = <&cpufreq_e>;
 		};
 
 		cpu_e3: cpu@3 {
@@ -112,9 +121,12 @@ cpu_e3: cpu@3 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <804>;
 			d-cache-size = <0x10000>;
 			i-cache-size = <0x20000>;
 			next-level-cache = <&l2_cache_0>;
+			operating-points-v2 = <&sawtooth_opp>;
+			performance-domains = <&cpufreq_e>;
 		};
 
 		cpu_p0: cpu@10100 {
@@ -124,9 +136,12 @@ cpu_p0: cpu@10100 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_1>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p>;
 		};
 
 		cpu_p1: cpu@10101 {
@@ -136,9 +151,12 @@ cpu_p1: cpu@10101 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_1>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p>;
 		};
 
 		cpu_p2: cpu@10102 {
@@ -148,9 +166,12 @@ cpu_p2: cpu@10102 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_1>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p>;
 		};
 
 		cpu_p3: cpu@10103 {
@@ -160,9 +181,12 @@ cpu_p3: cpu@10103 {
 			cpu-release-addr = <0 0>; /* To be filled by loader */
 			enable-method = "spin-table";
 
+			capacity-dmips-mhz = <1024>;
 			d-cache-size = <0x20000>;
 			i-cache-size = <0x30000>;
 			next-level-cache = <&l2_cache_1>;
+			operating-points-v2 = <&everest_opp>;
+			performance-domains = <&cpufreq_p>;
 		};
 
 		l2_cache_0: l2-cache-0 {
@@ -180,6 +204,178 @@ l2_cache_1: l2-cache-1 {
 		};
 	};
 
+	sawtooth_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp01 {
+			opp-hz = /bits/ 64 <744000000>;
+			opp-level = <1>;
+			clock-latency-ns = <7800>;
+		};
+
+		opp02 {
+			opp-hz = /bits/ 64 <1044000000>;
+			opp-level = <2>;
+			clock-latency-ns = <19400>;
+		};
+
+		opp03 {
+			opp-hz = /bits/ 64 <1476000000>;
+			opp-level = <3>;
+			clock-latency-ns = <24800>;
+		};
+
+		opp04 {
+			opp-hz = /bits/ 64 <2004000000>;
+			opp-level = <4>;
+			clock-latency-ns = <43600>;
+		};
+
+		opp05 {
+			opp-hz = /bits/ 64 <2268000000>;
+			opp-level = <5>;
+			clock-latency-ns = <49200>;
+		};
+
+		opp06 {
+			opp-hz = /bits/ 64 <2556000000>;
+			opp-level = <6>;
+			clock-latency-ns = <53400>;
+		};
+
+		opp07 {
+			opp-hz = /bits/ 64 <2748000000>;
+			opp-level = <7>;
+			clock-latency-ns = <56800>;
+		};
+	};
+
+	everest_opp: opp-table-1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp01 {
+			opp-hz = /bits/ 64 <696000000>;
+			opp-level = <1>;
+			clock-latency-ns = <9400>;
+		};
+
+		opp02 {
+			opp-hz = /bits/ 64 <1092000000>;
+			opp-level = <2>;
+			clock-latency-ns = <19800>;
+		};
+
+		opp03 {
+			opp-hz = /bits/ 64 <1356000000>;
+			opp-level = <3>;
+			clock-latency-ns = <23700>;
+		};
+
+		opp04 {
+			opp-hz = /bits/ 64 <1596000000>;
+			opp-level = <4>;
+			clock-latency-ns = <25000>;
+		};
+
+		opp05 {
+			opp-hz = /bits/ 64 <1884000000>;
+			opp-level = <5>;
+			clock-latency-ns = <28200>;
+		};
+
+		opp06 {
+			opp-hz = /bits/ 64 <2172000000>;
+			opp-level = <6>;
+			clock-latency-ns = <32300>;
+		};
+
+		opp07 {
+			opp-hz = /bits/ 64 <2424000000>;
+			opp-level = <7>;
+			clock-latency-ns = <35600>;
+		};
+
+		opp08 {
+			opp-hz = /bits/ 64 <2616000000>;
+			opp-level = <8>;
+			clock-latency-ns = <38200>;
+		};
+
+		opp09 {
+			opp-hz = /bits/ 64 <2808000000>;
+			opp-level = <9>;
+			clock-latency-ns = <39700>;
+		};
+
+		opp10 {
+			opp-hz = /bits/ 64 <2988000000>;
+			opp-level = <10>;
+			clock-latency-ns = <41700>;
+		};
+
+		opp11 {
+			opp-hz = /bits/ 64 <3144000000>;
+			opp-level = <11>;
+			clock-latency-ns = <43700>;
+		};
+
+		opp12 {
+			opp-hz = /bits/ 64 <3288000000>;
+			opp-level = <12>;
+			clock-latency-ns = <45000>;
+		};
+
+		opp13 {
+			opp-hz = /bits/ 64 <3420000000>;
+			opp-level = <13>;
+			clock-latency-ns = <48700>;
+		};
+
+		opp14 {
+			opp-hz = /bits/ 64 <3540000000>;
+			opp-level = <14>;
+			clock-latency-ns = <55700>;
+		};
+
+		opp15 {
+			opp-hz = /bits/ 64 <3636000000>;
+			opp-level = <15>;
+			clock-latency-ns = <55900>;
+		};
+
+		opp16 {
+			opp-hz = /bits/ 64 <3720000000>;
+			opp-level = <16>;
+			clock-latency-ns = <55900>;
+		};
+
+		opp17 {
+			opp-hz = /bits/ 64 <3780000000>;
+			opp-level = <17>;
+			clock-latency-ns = <56000>;
+		};
+
+		opp18 {
+			opp-hz = /bits/ 64 <3864000000>;
+			opp-level = <18>;
+			clock-latency-ns = <56000>;
+		};
+
+		opp19 {
+			opp-hz = /bits/ 64 <3960000000>;
+			opp-level = <19>;
+			clock-latency-ns = <61800>;
+		};
+
+		opp20 {
+			opp-hz = /bits/ 64 <4056000000>;
+			opp-level = <20>;
+			clock-latency-ns = <61900>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;
@@ -190,6 +386,20 @@ soc {
 		nonposted-mmio;
 		#size-cells = <2>;
 
+		cpufreq_e: performance-controller@210e20000 {
+			compatible = "apple,t8122-cluster-cpufreq",
+				     "apple,t8112-cluster-cpufreq";
+			reg = <0x2 0x10e20000 0x0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
+		cpufreq_p: performance-controller@211e20000 {
+			compatible = "apple,t8122-cluster-cpufreq",
+				     "apple,t8112-cluster-cpufreq";
+			reg = <0x2 0x11e20000 0x0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		i2c0: i2c@2a1010000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
 			reg = <0x2 0xa1010000 0x0 0x4000>;

-- 
2.56.0



