Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEA5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JJAV+rck;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MKebHGsW;
	dkim=fail reason="signature verification failed" header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=F0hIcRQX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ICzF0au7+zioXlv3o0PbRF5DUQ/dlcDYCA/hi2iZWyw=; b=JJAV+rck2ehvPBkChqhgR0Cj+D
	ar4ckJsLLcxc2XB5UpA3Q1h8JA/PihZankv8A9jAUEWmRBj0cQwvWrSMjNy5UYY+MfZPP9CBZEKz5
	NJYel0RLD+CtL3c5ccm2vI1VBE/CGn7vCvvbkLiUcKSYyDtc8Utsc9m1fos/+6eJ4vE/zAnwFxPHu
	YOUoeYIu2Vh7u4FHcy95lhbs/o+TG28yT01beBfMCz7uJrVa88sUWhLkerZichaQq3Nme8cHPksYc
	lJo9j83CpAY6rIOcD9GrgwZ2Q8WV9YAGsj9SMfvExykeO5SrHEz1sEuCXiSVx68G60lERcZJlV1o2
	inrY0k6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkwf-00000005jul-1X9L;
	Tue, 24 Nov 2026 07:28:05 +0000
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.178])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvK-00000005jLU-1L5b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:26:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795505187; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rXj33N5EJ4/upzUon20XjUHjbHzTZ3mB6sBsvZ29crnhq+XAfy2Vs3zfQSYIz4wKnt
    aKRXOFKeXasshGdtI6dL1r6kgTYMkzgnAfO4ZbPmvygrBZ6SHafK+2BMn8QfG3l0oMab
    zGGk8ItCc1+OgXgOlQpexihuebvGvpyyfa+kgw/aSFy51k8obYTsN1cyBuio2VbsalW3
    96B+CSNQe1wOIXpASqc3fGtIg42K6cZUm3VpTWTITrPAgSCumCjK3EMiNbp1tCTQN8pF
    CJGTFcS0Zyx3dxobXRGliCrGdHBcLJQHYmvjjblpbaXPSUaeotXcj7ixXVbgL9uB90l+
    +tFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505187;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ICzF0au7+zioXlv3o0PbRF5DUQ/dlcDYCA/hi2iZWyw=;
    b=R1sYPNk2RbpZLsD1g1R/2AmEX+lVCiWOXHvSH3dzhEzQOQoSttK0g/d+8S5GaVsiWg
    PH7QSruXpem6A3hE0yOL98HN02UXSYgg3dwbZZxdfOQfHNd7GJ/syDceCDfIfvU9cfIp
    lTcLqisSWJB2TJBdXxUhg/aWQyC7i6Xx7glfCtor9sck6PB4+fG2SNHaUxa1Jdj2AO82
    +b1SnFMam8geQsQ28kyw4tdVVRg671/i+I5KIJtVDrBnbegbjZLT+W+5N3MVzoh3UWb+
    hjEZweu1YYcLnioRN/vicIgL4ToNy7ph6k76iKUmmGUaUE4rdO2B53OOUQ7vqkzv1zwN
    lEsQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505187;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ICzF0au7+zioXlv3o0PbRF5DUQ/dlcDYCA/hi2iZWyw=;
    b=MKebHGsWd20CynMJtycAL1CWMMQPC3Q5ewZInE+iEP7mTgQQRANqLUPhQ87ysiK/wb
    DWY1sAg3VnGxml//nMgu/4z7YuEvfQaNRh+iVnKUeYckB4jPdENVapR8u4gbgeR6oayk
    87bKBsUtqf+exCs3W7Fg0O+AxrY/4cHYWrowvsYUvA8DD8GYeZcYZaASHAEcpBf2BcNh
    5+guMcwsXHojJyrVe2hgVr7QOZHeGaRN5x1KQQBO6f91CBx6WfA8CsFo6HivbYDs0d9G
    5OFRkQMmq1Tv4Q4J48jIpxn1r0woB7l9RwElIPP5HI7G55SDjf8hRfaARuiHQohbek6i
    EzsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795505187;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ICzF0au7+zioXlv3o0PbRF5DUQ/dlcDYCA/hi2iZWyw=;
    b=F0hIcRQXfQdsW0YptLj7KSz7SCIza97TyYei6EsyAYtpiSSO8ZlJTtukC77omi6Nyk
    GMElw1yx0A6UY5wuXeBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3poLlciNVTQoM6kVxzKyrKzkpjcAwdDfiN49"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AO7QQ1HY
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 24 Nov 2026 08:26:26 +0100 (CET)
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
Subject: [PATCH v2 20/20] ARM: OMAP2+: Remove Pandora platform-data quirks
Date: Tue, 24 Nov 2026 08:26:00 +0100
Message-ID: <1cb5bd7216b334e8c4eff21ff3463deeb6109595.1795505160.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_232650_646311_B293009A 
X-CRM114-Status: GOOD (  14.79  )
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

The Pandora backlight is now described in the device tree and driven by
pwm-backlight. The sound card also uses device-tree descriptions for its
codec and amplifier GPIOs instead of legacy GPIO lookup tables.

Remove omap3_pandora_legacy_init(), its backlight platform device and
audio GPIO lookup table, and the associated board compatibility entries.
These platform-data quirks are no longer needed.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes against V1:
    - Andreas Kemnade raised bisectability and intermediate driver
      availability concerns for the V1 pdata-quirks removal.
    - Correct the legacy backlight name and explain removal of both backlight platform data and audio GPIO lookup tables.
    - Commit-message review assisted by ChatGPT.

 arch/arm/mach-omap2/pdata-quirks.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index b947bacf23a37..aca7097a692ed 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -268,27 +268,6 @@ static void __init omap3_logicpd_torpedo_init(void)
 	omap3_gpio126_127_129();
 }
 
-/* omap3pandora legacy devices */
-
-static struct platform_device pandora_backlight = {
-	.name	= "pandora-backlight",
-	.id	= -1,
-};
-
-static struct gpiod_lookup_table pandora_soc_audio_gpios = {
-	.dev_id = "soc-audio",
-	.table = {
-		GPIO_LOOKUP("gpio-112-127", 6, "dac", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio-0-15", 14, "amp", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
-static void __init omap3_pandora_legacy_init(void)
-{
-	platform_device_register(&pandora_backlight);
-	gpiod_add_lookup_table(&pandora_soc_audio_gpios);
-}
 #endif /* CONFIG_ARCH_OMAP3 */
 
 #ifdef CONFIG_SOC_DRA7XX
@@ -514,8 +493,6 @@ static struct pdata_init pdata_quirks[] __initdata = {
 	{ "ti,omap3-evm-37xx", omap3_evm_legacy_init, },
 	{ "ti,am3517-evm", am3517_evm_legacy_init, },
 	{ "technexion,omap3-tao3530", omap3_tao3530_legacy_init, },
-	{ "openpandora,omap3-pandora-600mhz", omap3_pandora_legacy_init, },
-	{ "openpandora,omap3-pandora-1ghz", omap3_pandora_legacy_init, },
 #endif
 	{ /* sentinel */ },
 };
-- 
2.56.0


