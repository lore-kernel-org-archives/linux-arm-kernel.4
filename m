Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C8E60A261D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LzL1U1EG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QoOpr5vV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P8OVAdFrpiHpa2Y5YjbvLphez/MlgFPtGIr9JlXAz3I=; b=LzL1U1EG80cijCa5Ye+rM8IVc2
	Itnt8zf0vc0slzgSR1dPouSN9SZkxI1tQGvrj7RQrdwWt9ZComk52ckhRzRCwSMUSnr7elRVKyV0O
	67oz0oVKM38uZwwkZr9aLEMgJ47a2ZvIX6JHp+ve9s16v+8pdM3US56aFRpi8TKYTYLqRODj1cVRK
	a1x96hOQ2pdtOvUqyRCDC2OvRyOGHQEm9lcQHgiMSBbvpijhpj/dEqyviZqym1NB8jnVVZ2KESvMA
	DsAeu+5IXY3Pd3OxGV/JBGRXURqm7Eah2C3uPAw/ZcKgFHUsrjvvXS36rg6JsGVD1icmxzAT1wX6F
	fAcLYWsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Nf-00000005gt3-2DQD;
	Wed, 11 Nov 2026 06:00:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1NU-00000005gqE-3bPC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:00:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B1C347227;
	Wed, 11 Nov 2026 06:00:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376812;
	b=xSdjiR7PdRiWny2b490xG8gIzHw604qh6kvNMEHwfW6JmvTecrp7aHbaSE9NyAw1vfbg
	 +7+DneCfACEW0jS4IROtLPMnaeAzVMvSvDRQMQkLnReA3OWG637P4acoFtvL70dBjFyrI
	 mY3xuxbu9gZQyE6PHop0LlR00pG+PBiHPW3yBiNY0wAwBKckvVDWQ9vrukk0Zt2TiTyK6
	 Sfyf5dgliEKFoc5+Eo1A/7Lz/RZo7FRIbUaZTdOUC7uacXOMj+cZc7sNBJmQB/NoyWFFd
	 5HgXZn7sXUD+GhoJ+2txzc+ZRYWoHAMiXuyCAbHs7jcpFevTvbVhk79nFrUyV1rQbLg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376812;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=P8OVAdFrpiHpa2Y5YjbvLphez/MlgFPtGIr9JlXAz3I=;
	b=SJIG3Mqh9DIhAYn6Hp5xUzq71C5DnnqPBydRlyw2c6xIaSYWdJNvB/qn+fgE49dBRRyS
	 pGV4+e9RTUsDS8XbHqFzSs3L8JlVSI5lzKin2It62SRo3eJg6OYP8g2oBOIc2Q27fe2li
	 gdkeXHPkqr2JiA0k14qsOK60hVUHI0raczDgusQwGuRInMR2iOoIWwNzQEgMybjxTSeZd
	 67k1odsVIstNz92WbDvIapDf+5+HQHfFBt3RNlvx4uf4BgNfz4vlfCm6wQgtoNE1p6/Q9
	 DS/zwO/ryQ/aP1L/fiflwLwYrf8eirjHg1uOkzbP2OI6pf5XPetaKnLjoKPwQ9HL8JA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 763731F00A0F;
	Wed, 11 Nov 2026 06:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376812;
	bh=P8OVAdFrpiHpa2Y5YjbvLphez/MlgFPtGIr9JlXAz3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QoOpr5vVOi5J2lEVwqeWQHmJ5T1yHKQF/3uCgUTusr+EFd+ysjApRQrRpkonu9uw/
	 2un/UJzkECWYwmTv4b2JsFVr0cdkGeyE8R8I2yJd5gMeQJu9XfGfIbwuHjvg6SG1nA
	 8++WjZLhjLxt+i35yll/fRalOnbm3C9i5hoKG1bZyNMhlP2H416VJjx+JMYBpXiOEK
	 rWXVpVbZyeOA6veiRTiKa1eTz6m/T8KaABOJSGMdGOPxVmebcZht+aBgt6JiEpSKw6
	 c0skCbMv6R09HUgb9yimItlwbgAH3z0MUgFAWYpK5mHnXr0gmmxbXmd0ZvU0akzB5O
	 d2Z41OzNXhgdg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0E79C48DEA;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:11 +0000
Subject: [PATCH v2 5/8] arm64: dts: allwinner: orangepi-zero2: Keep VDD-SYS
 at or above 900 mV
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-h616-zero2-dt-v2-5-88d8030fc975@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=1740;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=7dRmuEnXweiSK3ig6SjcXECMwYZqvp9fut5LB8gZugM=;
 b=hY+KOq6luqxLRdLmdChUvRel0o0EzwvWoP1PFOXHMKZi8Q2seKhI3U3A//ubeLw0X2zftgor3
 eIDcUKPTHHpBUiX6cl2udnWxHNrSjwOgiXRjcaC+ZcH10ryAhZ7oJVu
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

On the Orange Pi Zero2 the AXP305 DCDCC "vdd-gpu-sys" rail feeds both
the Mali-G31 and the SoC's VDD-SYS domain, which includes the video
engine. Its regulator range starts at 810 mV, the lowest GPU operating
point, so once GPU DVFS is enabled the rail drops to 810 mV whenever
the GPU is idle. The video engine does not tolerate that: with the VE
at 600 MHz, 4K H.265 decodes intermittently produce a few corrupted
CTBs, without any kernel message. Only 6 of 13 runs were bit-exact at
810 mV, against 3 of 3 at 890 mV, 3 of 3 at 950 mV, and 3 of 3 at
810 mV with the VE clocked down to 432 MHz. The vendor BSP runs every
GPU operating point at 950 mV, so it never lowers this rail.

Raise the regulator minimum to 900 mV before GPU DVFS is enabled. The
H616 GPU operating points use <target min max> triplets with a 990 mV
maximum, so the regulator core clamps the low-frequency requests into
[900, 990] mV and devfreq still scales the GPU clock.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 1fdf2d3c1a87..719d6dadf7bf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -114,7 +114,7 @@ reg_dcdca: dcdca {
 
 			reg_dcdcc: dcdcc {
 				regulator-always-on;
-				regulator-min-microvolt = <810000>;
+				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <990000>;
 				regulator-name = "vdd-gpu-sys";
 			};

-- 
2.55.0



