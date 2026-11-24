Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A2C60A6F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ng04uH5G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SYGpVkah;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EiH3gmjF;
	dkim=neutral header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=mQl7hvDm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kFVKZWJnvTpv0CaRCWkf/scaJhz42VxpUYUALwApW74=; b=ng04uH5GC5uFwvufHRQ0vUEr3G
	xU1Fh8cN12rh25qss2jzujPMp1/OwEEZDmKiW7682uS9/KFXRsjuofGnNHsaBCDBq1XphdTkl4Pbt
	TTb3gOR3er4ahZr+KjwGLcXH4XgGETlyZvEhCpbmVrFc5Wnkrn1EPqdwk4pLCpGH2X2PHs9KyCYvg
	02wKbnvVvpHF8yQS4ohPR+VLjg7aHnw8KX/OD2eYLwTmWWparlBW8sB+abVEV1cW4b0Qv1MMQR7+v
	hQAty7F2mQCAAnE96B0LmW3idLOKLrNXqlfTqcgixOpUB4Xw1cFhifdUsKGdMdraQAcBpAmFq0d7C
	Yy2fEHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvU-00000005jPq-2Cae;
	Tue, 24 Nov 2026 07:26:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvP-00000005jLu-3iJJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 07:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kFVKZWJnvTpv0CaRCWkf/scaJhz42VxpUYUALwApW74=; b=SYGpVkah+Z5gUG7Cq0IlIXAeUT
	ab9br4AA8j2418RXCEPJFaJj/+HweIz1i2NaNLQaCLnDrbXLZHFNiuBL5mGzo1ED2Xx6Xw7dJyrY/
	r4H1br0Ufhg0AzmGFTNEJP0Q0+J0bmEnjkpL1VlGnLvy2OGVVkKHBCf589cbD5av/styaPBLdAUv5
	sWYPtPUQP5v7O34zuUNOH5n1/3t8wus+X8Tr+ZR72isBn2vcb/wVmxQa4AbZnxCSQwTYhReYtZ2cq
	hLJUkTJSerZhr+wpoMAL0CyIzc1ayEDUK1f+GKlddyEEJc3M5zqT2Tn8mre8Braai+zjf/3HhRinu
	5yR5K9mA==;
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.178])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvL-00000003skD-12vI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:26:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795505183; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Z7xiYhSoH/3M3dxzPNQd829mpciJtOxysyasKAgIeGN/0NoMZayD4xO8Px7ueuwXpK
    id4fvevS/hx6O+u8jz3mxUKGLmqp9wmMivQfPdr4ZINlrd3rU+nijIQHZmB0fJ1qd7vv
    627DklFjMNkXSmvShdeDwDHg/naU4sevFcxlFgz7IQ6pjYWv7KHuWXjdkQ+Npv2a1OJP
    lCn5vuyZ84Y7Q2JEnOYxikBgjgMlON2/1ooZRBdJmmkekxoVfdHVNzNRxP6R31eD8QeS
    joLnofLRk4JAVhY1r+7UzV0dOvbb983RBMDOimDER9JySvkoZd4h8p/RxBWZIj4RSXju
    5BkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505183;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=kFVKZWJnvTpv0CaRCWkf/scaJhz42VxpUYUALwApW74=;
    b=Meqqz7QDgIGR03VTCBRmFfkc/OTi2JI15h2Jsk68jL0kbTQgB8V0Bh6vPGIAJoxQ8Q
    efcIBWpN9hBY8B4YFLeEWM1VnL4zMZjFiZC5asgSxvYB6JiXefVr0RNSVSvnF2Oqu19c
    BlUYBmRNR8nDiZyk9CenuuCRpJp209UAoJD1ugrlBWaQ95zgt1B8wVNlLfj6ObbXKX+e
    nmN7PZhTdlB0b50VZ34/m/o8cnbmtaE2E0dzek3EVbQVouHyYDMUPOfZ5CH2JJwkP/y5
    /DplD8MVhKjPC9mzl5uo2tA43O51VSg5x+ENcKHp9LUWiSwZ+0IQvjbUwHo2Awi8fBMh
    JNoA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505183;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=kFVKZWJnvTpv0CaRCWkf/scaJhz42VxpUYUALwApW74=;
    b=EiH3gmjFx9O9zE7ceCRcHfLIrQo4joTC1DAbmIRwKZcJQ1hSrF4zlRlhnxBIlqgFr2
    o8b9eTW43QKFNb59rA5r3feLIrSXEzhKlpruNsvXka1Qx/M8UQN+NHEW/odAkXNKb6ql
    qNFyHouiXXt4bUhpMqlhn9LU/NSwnWCIlblJFCqL2yQfYAGn8kTNyzRPbPa8DsuB4JC+
    GCA0VsqewoIdwfgM8eza8xwKzEz+0zD47dL1azWBjV+8+jVH3ibF4fcqpJuJTTqLutgx
    6V7J36/S2OpddBcdpFLH6rEZ8po+DBCFafKBMHmf2ut5iAQmioDam/y5rcgh3ZsB1cKZ
    2v3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795505183;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=kFVKZWJnvTpv0CaRCWkf/scaJhz42VxpUYUALwApW74=;
    b=mQl7hvDmB5McIZME11BEoDVNqoi0wfRn8QnKlUYBJexRm39G5BkDGqbfVnM2ZUNunR
    /dThEVIVeGg5rkSXSUAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3poLlciNVTQoM6kVxzKyrKzkpjcAwdDfiN49"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AO7QM1HV
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 24 Nov 2026 08:26:22 +0100 (CET)
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
	Stefan Leichter <sle85276@gmx.de>,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 17/20] ARM: dts: omap3pandora: Describe sound card
Date: Tue, 24 Nov 2026 08:25:57 +0100
Message-ID: <0269f30c3f766431c0c20a36fd6e2b2dce1b3f2f.1795505160.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_072643_241785_7D79652E 
X-CRM114-Status: GOOD (  14.26  )
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

From: Stefan Leichter <sle85276@gmx.de>

Describe the OpenPandora sound card and its connections to the external
PCM1773 playback DAC and TWL4030 capture codec in the device tree.

Provide the amplifier GPIO and power supply, the DAPM widgets and
routing, and the McBSP audio links needed by the DT-based sound card
driver.

Signed-off-by: Stefan Leichter <sle85276@gmx.de>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes against V1:
    - Historical origin: 570cb6f3073f (Stefan Leichter, 2020-06-29).
    - The original history also contains a Signed-off-by from Grond; this has not been carried forward without renewed confirmation.
    - The sound-card routing, codec phandles and amplifier supply have been reviewed in the V2 series.
    - Code and commit-message review assisted by ChatGPT.

 .../dts/ti/omap/omap3-pandora-common.dtsi     | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
index 6e349f7ae6936..a5633d93547a3 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
@@ -69,6 +69,41 @@ dac: pcm1773-codec {
 		vcc-supply = <&vsim>;
 		enable-gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>; /* GPIO 118 */
 		status = "okay";
+		#sound-dai-cells = <0>;
+	};
+
+	sound: sound {
+		compatible = "openpandora,omap3pandora-sound";
+		status = "okay";
+
+		label = "OpenPandora";
+
+		amp-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		amp-supply = <&aux_5v>;
+
+		widgets =
+			"Line", "Line Out",
+			"Line", "Line In",
+			"Headphone", "Headphone Jack",
+			"Microphone", "Mic (internal)",
+			"Microphone", "Mic (external)";
+
+		routing =
+			"DAC1", "APLL Enable",
+			"DAC2", "APLL Enable",
+			"Headphone Amplifier", "VOUTL",
+			"Headphone Amplifier", "VOUTR",
+			"Line Out", "VOUTL",
+			"Line Out", "VOUTR",
+			"Headphone Jack", "Headphone Amplifier",
+			"AUXL", "Line In",
+			"AUXR", "Line In",
+			"MAINMIC", "Mic (internal)",
+			"Mic (internal)", "Mic Bias 1",
+			"SUBMIC", "Mic (external)",
+			"Mic (external)", "Mic Bias 2";
+
+		sound-dai = <&mcbsp2>, <&dac>;
 	};
 
 	gpio-leds {
@@ -736,6 +771,9 @@ &mcbsp1 {
 /* audio DAC */
 &mcbsp2 {
 	status = "okay";
+	#sound-dai-cells = <0>;
+	clocks = <&mcbsp2_fck>, <&mcbsp2_ick>;
+	clock-names = "fck", "ick";
 };
 
 /* bluetooth */
-- 
2.56.0


