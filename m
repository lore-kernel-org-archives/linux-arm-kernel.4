Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58604606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P4tu8sIH;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=b2XnfQjR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gnvsu0TDZ5slNtZXuUskfju+pk2M78SPgeweXv/OO6g=; b=P4tu8sIHvM36Gv
	J9gg1HJsovpyKbE6gZgmufivehCCSNYIayRPHkQMKBaMa02qLrITgtoVAaS1+JgDpPo/T67b2sxp4
	8WX4fgFA/yzL+8ZChDIMZiawkwTT7Vvn/HZ5RfY+COX1N96saxY4MS3fgDxz3DUyVaI8jPviO2w+G
	RLuxOmyBIo1Ys1D0W/9X/FBXOmc7s3vkkLKs0cON+F9o4Tc8iF4H+DbpyrmhlvYYixYTctlRKMWOo
	44t6BT1yoEC2pgWdUoQNKfjjM3NxnHa2hrDctE2CWPVjPPsnWqG+TYdqgu54ixdC0ZdHJtMvknJCj
	YOJaOVWMYLKEkTmYtUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxtd-00000007qVg-1dkn;
	Tue, 24 Nov 2026 21:17:49 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxta-00000007qRz-2g3a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=gnvsu0TDZ5slNtZXuUskfju+pk2M78SPgeweXv/OO6g=; t=1795555066; x=1796764666; 
	b=b2XnfQjR00rON0XregzHvv79SnD6De4eaOu4S0I4pLtfKuZufIAldmCfzhiRqPPytjLVp5yoUbG
	GNry0is2kamxY7BoKaORmi3FOeJ7fGEWq8DUDvL7VcOhnpmcWW89bLbXn6UeWFk+pF2cB8y8wjeIZ
	jYb4X0tnIA0QsjXaZGdXfkrUnmm+GqW5FsLT63cM9kuov52pdg8Ee0hdA5BBy0mpd9zdaCXAfZJRL
	JeqJIwKKUX2QvT+PvASOs2/4nU+p5XDmXCr/zmnJeqcx3YVahtDkA9BAVUrn0jJqUEMEtUvLtbzvA
	TjHy9cxjS4rRcj2WDPyplwWT7mOeWVXu6ixQ==;
Date: Tue, 24 Nov 2026 22:16:10 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
 <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo Han
 <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Russell King
 <linux@armlinux.org.uk>, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Uwe =?UTF-8?B?S2xl?=
 =?UTF-8?B?aW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Jarkko Nikula
 <jarkko.nikula@bitmer.com>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: Re: [PATCH v2 20/20] ARM: OMAP2+: Remove Pandora platform-data
 quirks
Message-ID: <20261124221610.2938d62f@kemnade.info>
In-Reply-To: <1cb5bd7216b334e8c4eff21ff3463deeb6109595.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
	<1cb5bd7216b334e8c4eff21ff3463deeb6109595.1795505160.git.hns@goldelico.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_131746_686752_E04B5FE9 
X-CRM114-Status: GOOD (  22.54  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 08:26:00 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> The Pandora backlight is now described in the device tree and driven by
> pwm-backlight. The sound card also uses device-tree descriptions for its
> codec and amplifier GPIOs instead of legacy GPIO lookup tables.
> 
> Remove omap3_pandora_legacy_init(), its backlight platform device and
> audio GPIO lookup table, and the associated board compatibility entries.
> These platform-data quirks are no longer needed.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> 
> Notes:
>     Changes against V1:
>     - Andreas Kemnade raised bisectability and intermediate driver
>       availability concerns for the V1 pdata-quirks removal.
>     - Correct the legacy backlight name and explain removal of both backlight platform data and audio GPIO lookup tables.
>     - Commit-message review assisted by ChatGPT.
> 
>  arch/arm/mach-omap2/pdata-quirks.c | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
> index b947bacf23a37..aca7097a692ed 100644
> --- a/arch/arm/mach-omap2/pdata-quirks.c
> +++ b/arch/arm/mach-omap2/pdata-quirks.c
> @@ -268,27 +268,6 @@ static void __init omap3_logicpd_torpedo_init(void)
>  	omap3_gpio126_127_129();
>  }
>  
> -/* omap3pandora legacy devices */
> -
> -static struct platform_device pandora_backlight = {
> -	.name	= "pandora-backlight",
> -	.id	= -1,
> -};
> -
> -static struct gpiod_lookup_table pandora_soc_audio_gpios = {
> -	.dev_id = "soc-audio",
> -	.table = {
> -		GPIO_LOOKUP("gpio-112-127", 6, "dac", GPIO_ACTIVE_HIGH),
> -		GPIO_LOOKUP("gpio-0-15", 14, "amp", GPIO_ACTIVE_HIGH),
> -		{ }
> -	},
> -};
> -
> -static void __init omap3_pandora_legacy_init(void)
> -{

maybe ask here for pwm-backlight node? Then this all can be untangled a bit.
so something like if (of_find_compatible_node(NULL, NULL,"pwm-backlight"))

if that node is available do not register that device.
Such a change can go in as soon as we have consensous that pwm-backlight
is the way to go.

After all is in, in a final cleanup step, remove the pandora_bl and
the quirk.

> -	platform_device_register(&pandora_backlight);
> -	gpiod_add_lookup_table(&pandora_soc_audio_gpios);
> -}
>  #endif /* CONFIG_ARCH_OMAP3 */
>  
>  #ifdef CONFIG_SOC_DRA7XX
> @@ -514,8 +493,6 @@ static struct pdata_init pdata_quirks[] __initdata = {
>  	{ "ti,omap3-evm-37xx", omap3_evm_legacy_init, },
>  	{ "ti,am3517-evm", am3517_evm_legacy_init, },
>  	{ "technexion,omap3-tao3530", omap3_tao3530_legacy_init, },
> -	{ "openpandora,omap3-pandora-600mhz", omap3_pandora_legacy_init, },
> -	{ "openpandora,omap3-pandora-1ghz", omap3_pandora_legacy_init, },
>  #endif
>  	{ /* sentinel */ },
>  };
Regards,
Andreas

