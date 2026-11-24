Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCF3606CED8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pw8e5nUt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=JynnR6l+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=sjoeRwWy;
	dkim=neutral header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ARc606Vv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=adbm0DzSO3mJYHLc7cJuWzX3GDM1m8RObj3Et4x+Weo=; b=Pw8e5nUtdNBaIVow4HGn0mDZ/K
	Bq1BKGjr/uzXP42Cgg6xWKOuzNmhCE8bhzPmNJ7LJ3FHlhyxqsiLGjtT1L0+SqQPTDKVFl7IDpx8X
	E2oxRrB2TDZ2aZ9vHlaiP1Ws9EWz4Ywq5OcejpoZvJrQBH426Ameub0uIlFiJZK/Za1Sp2hkEc0aG
	OtOzRGBoNDRFQg8x2OiESjHYn8ZxPxX/bIWgPcXDrVm+j54BNT+uKgVS2lLwuUJsJSfLfLumdH5i1
	KedCXp/0UctRJROuelKLpx1ix3V+IgLm9ERyBgX7jEkyslnKy4QRVSPcGqfSzK7f3OZgl+7tFzVek
	Ydcaz8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvX-00000005jR0-1Q4Y;
	Tue, 24 Nov 2026 07:26:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvP-00000005jLt-3d6U
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 07:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=adbm0DzSO3mJYHLc7cJuWzX3GDM1m8RObj3Et4x+Weo=; b=JynnR6l+fNn63W7PCKA2HCF7Rv
	gCyl0v61tf9bR2RYWPBGRA2G/BQ6rE7SCXFteXu5HbFNubGiGDDca/HLIQZuKa2LJIARIczdtZgIj
	jrgHdxpNhkMaKl9DKBVF8sY2BjabAOyVl0I4624gLHgHPy2t6LrUx9qhVnrzz1z9DIewkTioijOGx
	kF5kHQJ5HRIIx0SIdsNBnn4oAjcMNKfT7b28U/OqwigT+FT/4rAsorMg0yqglYRWshi1ELmF158rR
	itlmc2UJv2xqWbMDqQG6LO4YpPOOOPKokMS1HEpIhU0Nthlh4DjqaWWzid8lzmfgNafRsQcI7B7dg
	uLrugSKA==;
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.179])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvL-00000003skF-0hpP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:26:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795505182; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=DucnJM3AhZn6SkPAKsBpAX/bZCQstTVhXrdEvPqOwpS9ZRbh3Asw/scuKJGQjQXJuH
    2rPil4Z2fSYZOI4WqrEijyipqAcsBjKxWmEQaUb7wQbt+j2II4z/LxfnLAyyIOikDDFm
    5knubW7nL99GXTD1wUztNm8bTWBnA9wlEXTSjJBHz1OuWQDhU9lyCeqchYggGYsiNQlH
    xVycQ94hs1JEcGFku7l7JT5yNc5T+58EXKJXLevQFKXOIiXUJ5roT3kesdCvMif8YvPu
    EMl663kbocbzH0BDL6jS71HKIxh6I0bFYMGiyEtcZx2RhjM/TCAc2hasdmYlkFfpuATY
    PHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505182;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=adbm0DzSO3mJYHLc7cJuWzX3GDM1m8RObj3Et4x+Weo=;
    b=XLQmyxQZsnUAqqRpeSuYpwVbaEf64X5pXFVaRiss2CULJpGSBoXU8qSMPRmJegY54n
    jonOh9PyL31mWIv65ljH2Sfn+pXIMdBjmwAstqTGrdaYJ24sqjMMPM6q0ZN4hyWkiKU2
    yX7qPJLM+l2j60cXesRVda9ZPB3T10yZ5QDdqhfy7OO6kr5nvOektqQZTOun6s8CmYPs
    q+03hOkIiVMJUCV06N/xrJMni7v+Pa8UM0RW715XZwcbsoXl6Oly4B+Nl/VPp7vIVslA
    AfpYlFPdgz0hA5I3FrherlNYWbN3T07vk8rayzhaLganKYwN5E4DX7Qf1FkHyh0cDiqV
    uYdQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505182;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=adbm0DzSO3mJYHLc7cJuWzX3GDM1m8RObj3Et4x+Weo=;
    b=sjoeRwWy32ESLe/xZiz6JbxIHsZoP/Aae7i5NH+rygVjLYpOSOjHofkXLNTcD5NvNr
    i87/Ddf5vp+8IO0rq+XPx/vkBqC7cBenAxJh7ZTxuIYsbZBj1BMbz84Wy0LUNmZIUzWr
    b8fsNHQFLSzm6aRT42UIwjG9IT1TyvJ0PDlnjVGPCkqtUGhXVTQBF2H8r/yok6flZQJQ
    TshtUeiB59W3A9C0hTLXBx+h5QJLUre2diVjl6PgpiCg/1y6qDyC+WKUOzASrn/Tg3S+
    nu7HPSuwzIYDVpERe0CPiFdtDtkCQuK4m9YwPRzmQ2MFWIHqxa0d8Rp3wdT6n461DoOW
    hCig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795505182;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=adbm0DzSO3mJYHLc7cJuWzX3GDM1m8RObj3Et4x+Weo=;
    b=ARc606VvAJi/E1vAOJ//WCiLmxlauC8TnSvthekUEYyNZNIdEuFvL/I1iU8Kalv1It
    3bIsatUM5Xm7yF8wYFCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3poLlciNVTQoM6kVxzKyrKzkpjcAwdDfiN49"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AO7QL1HU
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 24 Nov 2026 08:26:21 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Grond <grond66@riseup.net>
Subject: [PATCH v2 16/20] ARM: dts: omap3pandora: Describe PCM1773
Date: Tue, 24 Nov 2026 08:25:56 +0100
Message-ID: <770a015f333c1927fccee2663eb76a7de923dffb.1795505160.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_072643_211891_BF3500C1 
X-CRM114-Status: GOOD (  12.92  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the PCM1773 playback DAC in the common OpenPandora device tree.
The DAC is supplied by VSIM and enabled through GPIO118. This allows
the PCM1773 codec driver to bind without platform-data registration.

Suggested-by: Grond <grond66@riseup.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes against V1:
    - Historical origin: 13b32c8cd102 (Grond, 2021-12-15).
    - The current DTS node has been reviewed for the PCM1773 binding and GPIO/supply properties.
    - Code and commit-message review assisted by ChatGPT.

 arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
index 2a5e8ba5714da..6e349f7ae6936 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
@@ -64,6 +64,13 @@ tv_connector_in: endpoint {
 		};
 	};
 
+	dac: pcm1773-codec {
+		compatible = "ti,pcm1773";
+		vcc-supply = <&vsim>;
+		enable-gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>; /* GPIO 118 */
+		status = "okay";
+	};
+
 	gpio-leds {
 
 		compatible = "gpio-leds";
-- 
2.56.0


