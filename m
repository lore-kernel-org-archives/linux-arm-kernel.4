Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334DA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vEoLlZ4s;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ecdl/MeD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=; b=vEoLlZ4svh6kmr2qmW4/ouMNdl
	lF2+faYNhZmLhVJmBTi9/jXqEaW154vtL3uftlumlFdT1h/2GNGkxrsEr7LLaQgYOnV7EGWrIkYti
	UxH0uo4oXsIiq2Jagg8OsbWj6CF1DWKlmJEEt1CSkx3N0L4kOvdB0OF8dRA+gDjxrgEMJZTxIv6uF
	xiFk2w+6X07/3HDjv19oZqKGtRddo8aOiSDYIDco4pre+EIs5G1T/ibW3aZGBWsnmPVzxAs6nsdQm
	mvdjjde4AvQOKoFIFiyOF+u64Qvpv+EJZSwyK90mVAN8PW8VywFAScau1wcXJL99J7eqA3EXhySEz
	dymU3WcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Nf-00000005gtV-2mT3;
	Wed, 11 Nov 2026 06:00:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1NV-00000005gqJ-0WKa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D446C472C9;
	Wed, 11 Nov 2026 06:00:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376812;
	b=yglmpTgXW2JjoA734GLaWmIJWwpQf+WjP8bMzfbkSQssh2gnRn3wIVhPTNJiX8Fz6Rcd
	 /O7M2IgxQ/EUPOquN+HKGNgdLasxmYQlxfd1zcQsUjGHO8D0PUHpfDOBNGyoSYJnp87rE
	 ebcx/wfLgMBuF0R4jMkO78zyrKququpR0kT26XoMPPGD9Ulmd8WQ9uqmM7w/yMQl8iAT7
	 GbzEcEd7StF3htCDyaoFmYJ02L4tIBqlVqZ0/veR118IEBukuq21h4qTRTP4BsBsl8JPT
	 gR5yO0NfgDaSWZNN1+IMp9HqGDc6VcntFSD8eIFa7D9+hB5ZprAUyKhSKNCjUknIVgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376812;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=;
	b=vHzXR+sNoBC2/UHTlBNlBjtGrP7N9CoHl9YikhfsmnlbUkzpu1Bqw3q3z4FGIlfe3fF3
	 14rXPo7gjqhVoMH2368cQzobsfBFKc/5xUrTVZL+PRYOg7saV7d81UHPSPK9AWMygFgbV
	 PsGlqh/C7AePEmV2oFABLYxVUP+eupAhZdRGj5vF5WeDESfF9Kmc4vVc/GaKuq3DsGzCL
	 od7MS8k+S62+gt5HpZTPx3ZklvIBIOq0O3y7MnvFA17XeCkaiD2Nx+RL4t9GZv9RSiamP
	 irXrzn+W0TnUGexVUDnpxseWhCug3eH+JHe5IfMtVa3nRgyFDaATdZGYgjGAnH4g77w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72FB81F00A11;
	Wed, 11 Nov 2026 06:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376812;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ecdl/MeDRxmI3lZxfEq3nNRcbWthtKp0isfMvPOoN3DBF3yIQH/FwIP+a/RiEaL0i
	 ye5OFFx90sBqxVTPdZPHgWkvBU9OCA5fmrSmFFBtuJgIjsZAGEnR170W/khIiwgSoo
	 1hf85p4jRLkMzbs+QKOxT3RMyKKo5wxYJw5bAhF4cO14905cnqvUeQt8rehozZl3zA
	 Gva9J6a/wmT+EV4X7/beIm/l7/3H26KmtMiWuyaGdydqIzSjK9zN2r+IGhNFYSXvlM
	 hbRO/E7nFZe87mNwPXCnIFGjFHQE1BAlKu6YVf+ghRozFfKbW3x5JFHRU656jP+V7s
	 CNEFW6Z5Lh0kQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D991C48DE6;
	Wed, 11 Nov 2026 06:00:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:10 +0000
Subject: [PATCH v2 4/8] arm64: dts: allwinner: h616: Throttle the GPU from
 the GPU thermal zone
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-h616-zero2-dt-v2-4-88d8030fc975@gmail.com>
References: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
In-Reply-To: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=1929;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=teKOTEf4Ehrd6NI/Dk5AeKkHXxd5JXaOLzoyVTpHUvU=;
 b=yLFaEEpDYwt79KRRJlMNs77BbAvA+Grb6wuXB1bpgzTknfwSRX7R7k2NrV9OPxRVVmj+4GjOV
 YQAEUhYQFk/B9ziyWUJ5X2FmVKg5IMjlBU/FfcSV7WSMg3MK6v7HKah
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



