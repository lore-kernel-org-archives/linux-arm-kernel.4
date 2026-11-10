Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CDF60A380A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FRTt8HLU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IReWKkhQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=; b=FRTt8HLUdxUplrrkelIoNfdY5V
	UcNXIaQ1GR4blbbzzsnvp4lMy/+8aTf3MmKudStMRe7vAcgoNNtLMqjVN5rOtuiizvnizDH77CASi
	WueEgm4XB5PNX7kyg62P5o1fktDzxu4S7Yvk46pRWN1IkMeC/FGeHN5D37pz0rB6vva5xhlLrUajw
	LMnnM9Qi0bL57cy0cr/l5rGnRLDkhRjk8a+3YEi/sCM0JFuBXSNJPJZag67Ai51hRIqlrYKGCLRMK
	3PpV9HjE6EA2cmqnduBdvXRGCFOqUNQIlU1Pr9ssZ+x83fLHr0dfzwbTrc0waKAFE6ZPSnCFiyiNe
	rifqZnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeXa-00000002Xii-1yoA;
	Tue, 10 Nov 2026 05:37:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeXT-00000002XeK-2kke
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:36:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20E5A636B3;
	Tue, 10 Nov 2026 05:36:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794289018;
	b=Na2wMfpKXhzrFGK74WPaAKTpe+xcg7gBdDVmoCbt2tDGxZV1qMJjV8ERYypi26IjtTq9
	 3wPOkMJSjjngAf2oI4vfOLfM9cTQAX5zBc9nGqchEAbVbEabvZ6wes9CtRFqQPtXQkoWB
	 GuJPIPXqHNihwLMgLkZeZMYHUzuuEgQl3qfphAG2dyTr+uSc/b5SYRRKgC+pPdNWVLfX3
	 fWRMegq42uUVmDXhwT1vUhplkmXIYiA39rXD8IstCPtBwMii96ydeMzVhmBGFkVllsPVX
	 aAOSR1L8UrL3CeVnnz/YxfXMJMW7zeE0Rrti/lwcOmQI4lM2GRig4ZUfFm4Rl0K6oCw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794289018;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=;
	b=d9FR42Vx9cGQuZuDxa6hP+gpnkdjLquTgcJT7vnDTt4/j3DBWj93/riGW+0TJ7KXQ1q0
	 ZSpLzThs8HpmSF/eeVBw30VYSZVacxPfQ6QNtiTt5MsVqIUlz1FjjYgM2b3amSbjjH+Vf
	 ZBnv7hePY4dXY3QgHPFvRD3m9QnNtvbN5vwZ1hWKoAas2xEhUE5dZhewp4p1BNc6M2HaH
	 +KUAU91gewELszaeGzlR2Kp6yIfDVx3TbLUL5YywKAOeGAAUF0u55yUttq5H2ose2akKI
	 LUNh7qk0vTL7Tptj5OXbVmdOGKmi6VlIrGXX6lkroXmpr9BsLvsVNjiZ4Fb1xWpXckw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 458C01F008A4;
	Tue, 10 Nov 2026 05:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289018;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IReWKkhQKF6NSu7COjWiNE5qqRwZa//FZ5wN9Spk+81YpPWq5Ij5tzVy/q0xjNyld
	 R7xQcS6AINJwX6jrdO5l6Gy49X02oEOSpIyk9fcKQ/7MjgeZP1rzYld0R8wnQYbrG/
	 5hEI+dNmgjJR9XcW1J6h2IypitTDdWh1/lbk9D7sW6BeNwZZW6i2ydn14f+VYZjWzE
	 84YU1Y/vneIebR40rFX6KMFG/iCPx2TjVGonb9vNJ3wNYCqTBwbBytuUUN0UnSf/5a
	 RuO9psNIfUXEScKlFbwKCLShcpyjlOInaM2qCDMpAMavjyvbLU+qaAaz6v3WSLddeQ
	 lTDeNyO+sOAog==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C64FC488AB;
	Tue, 10 Nov 2026 05:36:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 05:36:58 +0000
Subject: [PATCH 4/8] arm64: dts: allwinner: h616: Throttle the GPU from the
 GPU thermal zone
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-h616-zero2-dt-v1-4-05506d760f21@gmail.com>
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
In-Reply-To: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794289015; l=1929;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=teKOTEf4Ehrd6NI/Dk5AeKkHXxd5JXaOLzoyVTpHUvU=;
 b=+C62sstufF9DUcspTyYWdroKBtE0YbldKzOadENtR0M9QPURkJPdKa5dDR8JEWNjIBFmbSYpf
 znoWxcN6w7lAFZhzlaAu+zyYgU6/yLlfr3tVr/jBbGQqT1aprfFClur
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

The gpu-thermal zone only has the 110 C critical trip point, and the
GPU node is not a cooling device. Once a board describes GPU operating
points (panfrost devfreq), the only reaction to a hot Mali-G31 is
therefore a shutdown.

Make the GPU a cooling device and add a passive trip point at 85 C
(2 C hysteresis) that lets the thermal core lower the GPU OPP. 85 C is
the CPU alert level mainline uses on the H6 (same thermal sensor
generation), and is below the 90 C at which the vendor BSP for the
H616 throttles the GPU (it maps the GPU to its CPU "target" trip).

Boards without a GPU OPP table are not affected: panfrost then
registers no devfreq cooling device and the map stays unbound.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 68bd6137c316..93c3b8279241 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -162,6 +162,7 @@ gpu: gpu@1800000 {
 			clock-names = "core", "bus";
 			power-domains = <&prcm_ppu 2>;
 			resets = <&ccu RST_BUS_GPU>;
+			#cooling-cells = <2>;
 			status = "disabled";
 		};
 
@@ -1124,12 +1125,24 @@ gpu-thermal {
 			sustainable-power = <1100>;
 
 			trips {
-				gpu_temp_critical: gpu-trip-0 {
+				gpu_alert: gpu-trip-0 {
+					temperature = <85000>;
+					type = "passive";
+					hysteresis = <2000>;
+				};
+				gpu_temp_critical: gpu-trip-1 {
 					temperature = <110000>;
 					type = "critical";
 					hysteresis = <0>;
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ve-thermal {

-- 
2.55.0



