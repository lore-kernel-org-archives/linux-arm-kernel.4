Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8728606A8A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zTayFOkU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KyXNeQvs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=; b=zTayFOkUaJrO3G46DyeHO0yB4V
	Ld0nisM/9Rg6URUyuQO7d5bprCj6YDkmqA8bR14a2MDgf1Hjl5MDDU6zbdVz3iFAimmQfOhnfg3M6
	+4OYy+Y4LEzCI8JwdiLGE780Ja8HsDMkIhhUHf4HVIblMQjBjgR2HUIi4Z2KQ3brmcpXopW6F51NA
	nR1jlAGu6iLMjAFEz/piJiQDNjeoKSDMwK0HHliWTrB7WJ5t+zfRl9hcvWfxJjOa6nTvhAb+rghEp
	2Ls+kPfs6SzTXhhuqqYv8holEFf6sjgjxkbb5rZspEsrjjvlsLigNCGZF0SPVA66OGWXam9IriZRr
	TF4eOXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR17-00000009LPr-1d7k;
	Thu, 12 Nov 2026 09:22:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR0s-00000009LHS-1BAj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:22:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18026479A2;
	Thu, 12 Nov 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794475354;
	b=LyNZ9op1c5KYk9xM25LpnA99F3RwtO4E+gZvmUGRRSu9bB7aguCQqggWMQSWg1Q7leHP
	 RhaJxzPWFbgOZtYVXWBZmX7oGveoan2ry9A/o91tjrKe/kfUR2wIUTZ1jQI8yIWQIKsfO
	 LroCAVQ2OJqHhQizYOK0pFw8YkpPe4UjXZRFUSJaxN9P43PtVWTuEumTXFl5j6j2q7+IJ
	 YiE1NiKMHZeY1kWR5duIKDxhqidJEKkMruFEPHmwPhubf3T4GbpVjBhBN//BYtWXqifkd
	 np39dcFKPc9mi6/ufOLWavVMxjQRyYhtSnwLtkdI9ZKXpXnt/ykULSh3f/OTjg++AqA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794475354;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=;
	b=2JzHPD6fw3nvrLeYMYKXSyIIu3hwoIDuXiaTSWiGY6uABx1fVXxmsQ4b4I1zpvTuPSCA
	 NoTm1ekgkHpiLeGq5PvL2/zUpaMdgDBsXkWReQ/SEgMkr8MH+offWp0GugAfrPOMSlwYc
	 Q5a55pj9IZfBZI4Hm+Qvt3aCWXFE8focl6x0a/2QTlGcuBIvLyav39MShD+Upbw/+gSy1
	 0E9ZtLJAQctV8kDDJsDQdZafxGyghbpohFvUo9WxTtPJ+jluxYm55p3AxYHu3V3e9ZNHs
	 l6EB6giP/jFefgbaT8JJRdEuuv+Q9Z/COcXrHnMHcu/yfBwCbIHQSoj2mBDA070OeMA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32A3C1F00A09;
	Thu, 12 Nov 2026 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475353;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KyXNeQvsZakgxoPD3Dq2z4CD0q19/soPgVwSEnt9AMvm9Cem9FN3pPNxi46ywpz6z
	 444ou63psGpc3C7UD4wSmTa0jBzbfymLHqZ8E7MlWZkfX9gs29YMDC3uiqAYO7u45N
	 ixY2RzHNVZ24pNP8LTKgI8NA/QeocdsLnWPFAOGFnMlTW2QprrKwL5/vznjfntLcbO
	 Wy5vZGxDo/hP8uz5ccWvahx4F4vOEFvdrEtdmsCMN6kGqdBG7zdLmOW979I/v9L/wu
	 bp8Hd2gW0QtS+Kae8Ru1LiJW5tNWPdB3usZA1b95Yxp0M7Gyu+CiRmdLTpHbXd6NfZ
	 r3vFxETgEydRQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B1EC249438;
	Thu, 12 Nov 2026 09:22:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 09:22:34 +0000
Subject: [PATCH v3 4/7] arm64: dts: allwinner: h616: Throttle the GPU from
 the GPU thermal zone
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-h616-zero2-dt-v3-4-1cd2664230c8@gmail.com>
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794475350; l=1929;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=teKOTEf4Ehrd6NI/Dk5AeKkHXxd5JXaOLzoyVTpHUvU=;
 b=JBr93kA1oG4JitFGW184ouUFCxghNk+USgl3FzROcYvTllJd5XDtvNlH/6P/bErKNBm1n82qc
 v0uIyQJqNzbAcERbs+e6cuMCq8aWUprp0daEkJT4xR6thVHNpE5OrBl
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



