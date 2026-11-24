Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A9E606B3CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0nSosaQX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mkKCS5Po;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Q/GgECb/;
	dkim=neutral header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=CFkLt1iY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ot92D5MoHTIRkYUwhd3d4KUBwDJQHCkfAJL/CWKuxWM=; b=0nSosaQXEi7KIuin4Bn68UFMFV
	fsfnTLYv2kN2FIutEkTlVDw6SFwEkPfEN+Lu4zvWCHF7vcEY8XUpqHcKm0FRgF8kgfVj87AcD3Z3a
	WZSGAhtFH2o/mnYG7EQF9XTUUa/1TiO5xRqZgA7+c4OmM91T/MKg1H72hLmCPQs+qiWrJcIX51uz9
	ICN/HP9p4wC4YLV9esx+KXXhTD36fKMo/OYqQGXIvJ4NjPqx78iDLf36G3MIzhz8WRhpX/If0iul3
	/vlKwB7L+AYUxjtcNK4TS9OYzILJLWQ0nuLgI/h2+dVQdJxyhj0VapgvOnsoeZU3keZ0Cx8nWhjrO
	MoBinbJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvW-00000005jQI-30K0;
	Tue, 24 Nov 2026 07:26:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvP-00000005jLs-3Wqr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 07:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ot92D5MoHTIRkYUwhd3d4KUBwDJQHCkfAJL/CWKuxWM=; b=mkKCS5PoOaGCiEpTSESFMyR9eZ
	2JG9Ff+tsao25b/4+4SrT1euJe7Dcu2rIiD8cah9E5pd2lDSaORJMBdNEwMoSgb1xsIzjyGlny8cl
	msl2kwe7gSGaU/gJqa5r8LmK9rEaIFzLvvJwdyN0t4+kRKgb/GAJGVSbdlI/XwtNnJtUBhA4urvRp
	jCU45kPDAXx+8/G/lZVOuFinshX10Li5c5zZBKedWBkzwMQs4gn1+vesxhZlisVmRtySPBPjrifUE
	pqCD1viulXoZB0Jum2A78gIpG1NtTPjoUAwLzTQIfY8IPzEHLx3Fh71SM0oLfgkPkSzWhMTA/rJGG
	E6PVmvZQ==;
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.123])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvL-00000003skH-1NxN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:26:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795505184; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=CJIxscNam66olrJ/AaAQZ1O8YhFitO9TT2ljpy/sXfZPTch1cD3AfFf0WxYSUCqZnU
    FwN+sHXQOQ51N4RGNsycAYnvcdAogg1jJhZE7gvCk8AIYRhJLFLA06llegG9glbElZFU
    kA4kLU9Bp/f2DXo0GqV+NezWyx4AX+/mQpYUYbphFshKjKzsPP0COsHi2zzcIJmyXvrm
    J64SGwFyzpfUSzElQ4xVxcT7KlCVQrTbVxxd+TIoydCFYx53bG7T+5hWQfPXRLdQaSkK
    c1c0mLX4yBrJK4gmQBV7XT/UZzAFVRK+s17ELnNQyTOQRpuuY6xrLfB4M3XwZoCJZXEO
    7UUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505184;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Ot92D5MoHTIRkYUwhd3d4KUBwDJQHCkfAJL/CWKuxWM=;
    b=TWyW/tNPVK7vlrSnoxT9nHuoDx3GcJqgrFSGaRG4JiDqaEElUPUgeTiYWWNTfSzwq0
    LB5NFY2KBpXB3UPF4KFsNgplrfM3MvwrR9Va+zLQCsRTQeOS8lFhJY9gv+/zkJjZfmJp
    7xwKAXwLMpUcLCrt/HD232+H85GEnAVLn0t7qWAZkJD0Gjbn4C1QQjh4iQp7p64FP0eX
    ZfvnOfl8amPyseK/7XOZB6rI2w4/9Eg/G60M3Smg84HMdwbrhRoPcYLNDi3si3m/niFl
    EFrv4iK9XU9OuB4ASeZj3ECo/HYuzjytgW0ZURUOEL6MiCywB/JHGAf2cM67OkTAdOIw
    zoLw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505184;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Ot92D5MoHTIRkYUwhd3d4KUBwDJQHCkfAJL/CWKuxWM=;
    b=Q/GgECb/Jt9opnm8iAGQaiyDog/+KIMozneFyCYr8WoHhAf/+AZIeyMV80fa54u9oq
    FJDrTOMKu2NXfHHnrMAhhIw4JEGIbqgMlC9+MW018vtupk/D0LQrGMytl999FODByxmB
    hP7T6jMGgOgB1UwGA1DS3UkVBEgKG9FPARVCzdDvJZx43KGKT4gQVDiDS3bHrA3cyvzf
    ChKZYvQucBpupLmoxLuU9zROQlXF01Fm7Q5ewjeQZJBv/yF4L1lvVen0a7wtFrBkmHEh
    6uuz9lV80o4S5loxyJGtklOFSHOs89u81AKJ0P/sHLr3uGNQzRnLmfSVT1aPD/j0kbjq
    LMSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795505184;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Ot92D5MoHTIRkYUwhd3d4KUBwDJQHCkfAJL/CWKuxWM=;
    b=CFkLt1iYWD0LCR2302eGIJe2rOj81bNZlfQjh7vrmBTgCorrItqEi3AM0UfGsUqDNi
    YNcEW0Lvuy0Z3qgW/kAQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3poLlciNVTQoM6kVxzKyrKzkpjcAwdDfiN49"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AO7QN1HW
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 24 Nov 2026 08:26:23 +0100 (CET)
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
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 18/20] ARM: dts: omap3pandora: Switch backlight to PWM
Date: Tue, 24 Nov 2026 08:25:58 +0100
Message-ID: <40321eb9223453f39536092d7095d3eff9901188.1795505160.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_072643_296784_563F243C 
X-CRM114-Status: GOOD (  14.46  )
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

Replace the legacy Pandora backlight platform device with a
pwm-backlight device-tree node using TWL4030 PWM0.

Use the 64-cycle PWM frame and retain the experimentally determined
brightness table. Request full duty for a 10 ms startup guard before
normal PWM dimming begins. The TWL4030 64-cycle encoding limits the
actual duty to approximately 62/64, retaining short low intervals
during the TPS61161 mode-detection window.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes against V1:
    - Describe the 10 ms full-duty request and the actual TWL4030 output.
    - Brightness levels remain unchanged; duty is capped by the TWL4030
      PWM provider in 64-cycle mode (patch 09), not by patch 11.
    - Code and commit-message review assisted by ChatGPT.

 .../dts/ti/omap/omap3-pandora-common.dtsi     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
index a5633d93547a3..6bdfbd80b9fcd 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
@@ -53,6 +53,25 @@ lcd_5v: fixed-regulator-lcd-5v {
 		vin-supply = <&aux_5v>; /* logical enable dependency */
 	};
 
+	backlight: pwm-backlight {
+		compatible = "pwm-backlight";
+		pwms = <&twl_pwm 0 1922710>;
+		/*
+		 * TPS61161 analog dimming window: duty must stay above
+		 * ~20-25 % (below that the regulator drops out, LED off)
+		 * and the startup waveform must avoid long low intervals
+		 * that could trigger EasyScale detection. The enable guard
+		 * requests full duty; TWL4030 limits it to about 62/64.
+		 * These levels were determined experimentally.
+		 */
+		brightness-levels = <
+			  0 24 30 36 42 49 58 68 80 94 110 129 255
+		>;
+		default-brightness-level = <11>;
+		/* TPS61161: cover startup mode-detection window (10 ms) */
+		pwm-enable-guard-period-us = <10000>;
+	};
+
 	tv: connector {
 		compatible = "connector-analog-tv";
 		label = "tv";
@@ -505,6 +524,10 @@ MATRIX_KEY(7, 4, KEY_LEFTBRACE )
 	 >;
 };
 
+&twl_pwm {
+	ti,twl4030-pwm-frame-64;
+};
+
 /* backup battery charger */
 &charger {
 	ti,bb-uvolt = <3200000>;
@@ -737,6 +760,8 @@ lcd: lcd@1 {
 		reset-gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;	/* GPIO_157 */
 		vcc-supply = <&lcd_5v>;
 
+		backlight = <&backlight>;
+
 		port {
 			lcd_in: endpoint {
 				remote-endpoint = <&dpi_out>;
-- 
2.56.0


