Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208E4606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d/brqrdU;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=QSHrZ3jQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZfR/6lnsUE/pnRQi/PbCLWIsXUsmgZSZZiyw7HHwysA=; b=d/brqrdUvNGjFh
	fOOsuZUFA8MZdN/hZ4rT6eiPlRlUm7JCxx4G8xREgxElAQH9rPxbLbXF7vho22LIDQl04uUMOX41u
	W+Hs8z5cXv+OxxUDYeMGpO+SP67l+gl6363eyZyY80xNZM5h0gyM1GtSf1uQfNvhWG1tX5pwHp5mE
	J0JzF0i7ysoPhzDQSt0vrdod5ebS78wLMw0Mjbe2XqM1ARxrqF+gM4Ey8bdIo//I5H9Sshu71p+aV
	MsmZu9BGg6kBFg7WaXjxHmwAAwdjvCjrt4jrqVdH98+vzLxe3sxs8P53+vgDT8BEQmJtQ7XRL/vbr
	DYHuTY+9aqhC5eSZlBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBLH-00000009f4e-0ILq;
	Wed, 25 Nov 2026 11:39:15 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBLF-00000009f3z-0gpk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=ZfR/6lnsUE/pnRQi/PbCLWIsXUsmgZSZZiyw7HHwysA=; t=1795606753; x=1796816353; 
	b=QSHrZ3jQaJsvUCtUMJyxGi/x5FoXqhg4VsxMWfh2GOsJVRlkzSZcmEyQW2zX2c8SknEpfIU+ecA
	rEXWt3htfQVw15RndMh2knLOPplDqY9lGJ3YIh2UmHx3d1gPp0RP+wS0FMsLx3vB2W+D4cEingdXa
	Smieyjpj3EqxTggExifYgn1R7uRX4dUIiU+d0O04UoMK4Pxlj934mVSigSuKm5nOOQmHOWjDrV5Ek
	h+1kGm6xgdAaA0qA++9ozjBNoxEqvmIgSxSijn3xMXA9mxeDs0aXVh9Qlutd1M8dutCZAQs4s/E2j
	Q3E0DRFXGS9OADNZJO/+ryW9LvxoYcBrD2rQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Wed, 25 Nov 2026 12:37:21 +0100
Subject: [PATCH v2 2/2] ARM: dts: st: stm32mp15xx-dhsom: fix bridge reset
 polarity
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-tc3-reset-v2-2-32eefcaf1460@kemnade.info>
References: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
In-Reply-To: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@nabladev.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=GLBUHsrqFLUlRWZt8GXXwr1nDsTd3sjuIa8AxQT8QUI=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBsicxJ39BdQawPVS1vsqyb5pVVpsEPBznjhCy
 lM2FgQvhcKJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawbInAAKCRCEYUX6QCjc
 8X6uD/9Scm2vnKjdVnjiK5Wq/OAU/DMB13MUnnPQJBPhn+RvKcdBp1h/Bl4EO4jPp4H4/GoiKve
 vD0lq7mk5bkSwVuIs2Prj/GRLhLE6+689XkMZeMnn/4EMC5KojJKgllX4fsxY/bm3hD7Opy0nI3
 iIh3JeJisk29PvsHfXFjBhMmZyZg4r32CRZ05Mobm4JXdbEuVkk5pKW+r6n7XcGbdJdr6IDaw0c
 cOVlrOPiJ3+MdZmXv/o3Is+prFMav19unYmeqVgHmb6DF1WbxCAMI2dSP+hkHviyqyYWYaiykSG
 HWEEhIABxryHExQPvnGtLaN0qiJbLAg6aAm4B4iLe1Mb1M1TmnR2HNYMBPzPBlvPR11vxPfllYx
 qvzn+vIyJ/T83NAGMyHxx+KGqun/XBG33sH19RzTmV77MfBfOT9JB53BfWpXY+EPdUFbM4grLfx
 fnrNweEdrr/aOIaI5Bi4HVGpU3ADxNV4VvY7YVN56SGRm4TOE0SD6yIHb1vDRVN1XBtpu9gqrsu
 xt/l6fQD9/9o4SAlFtWM879aOj4U4r6GG406AalpbLhdTAz5AyLJEqr0YZ2JVFm8JAqQfK5w/bm
 Q780iaMF1ec4FyGszAoWNk/IyRfXKRqVxumnvmUtkBitCLKy1DqlZP3ZZNGZ8YcORRNI7ImFDSW
 v41YspPCfrD4cCw==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_033913_228689_3F3D7023 
X-CRM114-Status: GOOD (  11.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reset is active low. It is apparently set to active high to work around
a driver bug but not to indicate an additional inverter in the signal
path. Correcly describe the hardware.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi
index 518c269a1dba1..6342a6e757c12 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi
@@ -35,7 +35,7 @@ &dsi {
 	bridge@0 {
 		compatible = "toshiba,tc358762";
 		reg = <0>;
-		reset-gpios = <&attiny 0 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&attiny 0 GPIO_ACTIVE_LOW>;
 		vddc-supply = <&attiny>;
 		status = "okay";
 

-- 
2.47.3


