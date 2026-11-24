Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C19606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fWfbcw1J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=L3Niw39x;
	dkim=fail reason="signature verification failed" header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=+hiMkp7w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i8cGKfwirIdnWIRedml65mOcQqDHKaJXaOcj56+0XVs=; b=fWfbcw1J8VQSlv+iaIB3jSlt9K
	XInekW487kih8MS/HbJGohj42yq7a8FBNJQdZbtAhe0k/swhVnq/MIUXFVxMGwZHmWN5uPSWfmRAo
	NbURFq6smchLiy2mjZeBgj95L0oZ4YUuLLZ9CZjdnqQbmarUENYAb7gXw7hR8UUH5XIou9/YzbjNk
	s2KtHs8FCrmENuVE10iDjdQh1IieAtf3weguc9W92fwAds/RdVVdDrnpm0+ZdMhogJ0benHbld0HB
	VuE25gpuHpTa7Lk5ABjmwQiQ80WRhAQMzS5V2ZGrGJjZBSGI0xQ4Ie83A5/6t3mLyrnHwaI19AuDJ
	JafoN4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkwg-00000005jws-1zmZ;
	Tue, 24 Nov 2026 07:28:06 +0000
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.121])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvK-00000005jKt-3T4Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:26:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795505176; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=B63WbdFNGCmMJ5fYDIKq4qliWQMpsYyvtu5yuJjR/4bKsyO2CxLncFaEsehECM38on
    fDKossw+8Twl1iOf6e4Bv+iDGCL5pa3g/UDfGFskNeF85A9vDTVozzw3ByfmsAxctM/y
    U7XrE8geitJEfY4kjSAgK4XqyU42Gphhk87EOVysT+O7+RUC3fw4orcfwz+56d6UMRSW
    7IgI1zKwbIIEhpl/GGt3rSjBqP0Km1pL1IE/YrrGYv1ioAJL7GvTJpMw4DYyA3TktcGF
    4tI74GmwPwqOtlS5jVaGg895zt4V+AycadOqaH3UWIFHfmKmdf0E7sQIPlOFRVAWCu7U
    JBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505176;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=i8cGKfwirIdnWIRedml65mOcQqDHKaJXaOcj56+0XVs=;
    b=kDlL9Ci3SozMRDpsS1YdbRkyz9AJkqyOKi0XnLxcP/nnUWCYuKrHNXv71/BGDKX9Fc
    BASCDdmk+pF2cfjNNSIT0Vq5Zu/G4VNkXBn9K6OL8FMisElM4uzKzO5wt5nuUjENW6OL
    G2df8pCLe0MxiHt+lxRXLC1fm7lCY9QFKdqszDE1Jc+sH2Y7Y7n/Zsg3AK5AcZZg5Q1g
    K+yabSsSrUjB2CXmioP1ckGJnlKJ0bpTz8+T1CLOLOgb/Fl9S2bzcbFh7fAg7gkqAV5X
    goh6HkydDA60J8IYW5JrbAPXwUeE5ZuUaA0Pxf/QFfRaLupsTr8cYjFNfVPg1ICPVUgV
    pEaQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505176;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=i8cGKfwirIdnWIRedml65mOcQqDHKaJXaOcj56+0XVs=;
    b=L3Niw39x7Hs+bBaEq67DxNoePKZ+gmp8oE//dLuWEpXD3a7+mO/IzBJybpSimE/0AA
    dHPHZH4kZGsy0OWerw/PEaz0M3oH1S3DTTpcXLbvE1RQMbA87sgG9N90+Q6KiGIiZBzT
    rXeg6lrfpwldN5a3ze6YwHUSfqnoqT+55SAtl+1FFZeoko3c6WtQHyJgEaDr94JEn07C
    TJ+T8l02VgpGzHfLyoa81zGf0IshdTXI5DROAcJ2xB7psWfjCHPpzpuuTaRsFQCzRvTN
    4xj07ZJ1n0z9co9ajwlufo6x9ueGLALmXQN+xlkWNB62z2Tfi9JKhgppvm5vYo47R+8Z
    QuGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795505176;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=i8cGKfwirIdnWIRedml65mOcQqDHKaJXaOcj56+0XVs=;
    b=+hiMkp7wubEabCTvcsLKLCOYaH2Cak+kIHtjH9k93zcQKYGvyW/kKAIQOAzxPmbm8W
    f/WrhVZ9g1ZQfjj2BzDA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3poLlciNVTQoM6kVxzKyrKzkpjcAwdDfiN49"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AO7QF1HM
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 24 Nov 2026 08:26:15 +0100 (CET)
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
Subject: [PATCH v2 10/20] dt-bindings: backlight: pwm: Document enable guard
Date: Tue, 24 Nov 2026 08:25:50 +0100
Message-ID: <9279d3995ae4f81c19afeaa07b32204f16611ac8.1795505160.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_232650_705857_C982B9F6 
X-CRM114-Status: GOOD (  14.29  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for a new device tree property
"pwm-enable-guard-period-us". If set, the driver applies a full
duty cycle (duty_cycle == period) for the given duration whenever
the PWM was disabled or had zero duty cycle (e.g. power-up, resume,
brightness 0). This covers the
requirements of such devices generically, without introducing a
chip specific backlight driver.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes against V1:
    - Describe the guard trigger using the PWM state actually tested
      by the implementation (disabled or zero duty cycle).
    - Remove the requirement that a disabled provider report zero duty-cycle.
    - Remove the redundant uint32 $ref for the standard -us suffix
      after dt_binding_check reported a schema error.
    - Binding semantics and code-consistency review assisted by ChatGPT;
      clarify that full duty is requested, not guaranteed at the output.

 .../leds/backlight/pwm-backlight.yaml         | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
index b71f6454a4ac2..9172f14bfb76f 100644
--- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
@@ -49,6 +49,26 @@ properties:
       having to list out every possible value in the brightness-level array.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  pwm-enable-guard-period-us:
+    description: >
+      Duration in microseconds for which the PWM consumer requests
+      full duty (duty_cycle == period) before applying the requested
+      brightness. The guard is issued if the previous PWM state was
+      disabled or had zero duty cycle, e.g. after power-up or resume.
+
+      This can allow LED drivers with startup mode detection to settle
+      before normal PWM dimming begins. For example, TI TPS61160/61
+      distinguish PWM dimming from EasyScale by the duration of low
+      intervals on CTRL during an initial detection window. The guard
+      duration must cover that window according to the LED driver
+      datasheet.
+
+      The PWM provider may approximate full duty if the hardware
+      cannot represent it exactly. The board must ensure that the
+      resulting waveform meets the LED driver startup requirements
+      and that the input has a defined inactive state while off.
+    default: 0
+
 dependencies:
   default-brightness-level: [brightness-levels]
   num-interpolated-steps: [brightness-levels]
-- 
2.56.0


