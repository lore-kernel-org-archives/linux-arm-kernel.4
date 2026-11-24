Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50E606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mxm9Zq8+;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=6a5hrVZ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EfGE9YBTewiWSglRdGN58o65rErT0L06vLupgEMSkpg=; b=mxm9Zq8+WSia6x
	LvWFKNNh952HufLLdHlClsB1KJyUOmbZJJmJLaNY/8Nysw8+Xwal1GZU0IYIQRVFbY0lFWbCShICF
	6S0+InqIEnsIyAmn89EWyu7TfQ7svAoP/cco0zwtMsPeIsjeqq0vlK1PsImrTnla5qccLFn15BqI2
	qOWnquPbcd5/TlexubbFOQ20nA0aQ/GshbO2lUzQVkaQRV6Fi02utwsEv8XTuenAlMGeWCErHibNw
	RfazmBq3UvZKa2tyRypmbQVHKPm5L/euW79MfdXWAltsK+R2zFeHGdWpfgcA6R0PCqhMktQHOEgSI
	zdMvsrZsHPEbFNEU+atQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyIH-00000007u2g-2a1p;
	Tue, 24 Nov 2026 21:43:17 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyIE-00000007u2G-32fV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=EfGE9YBTewiWSglRdGN58o65rErT0L06vLupgEMSkpg=; t=1795556594; x=1796766194; 
	b=6a5hrVZ798tJFiKabPQxRRqyarJdLRnKWuRsi0Gw5dE9HYj9Z5sFwxuXW/7sCTstbC3tngPBonU
	47vKoAGFI405e7psqhCKVFqxI8tJcdOwjDzMU3s/Bh6WNzGRLaImblZj660GNZD8om9G3K7YvmQup
	dqfhOcjxjCPi3RYdkVGTBuYcmmhY81IWOkBSi3uE+0ipsXjCcqv446UiIol6sa7Mfeq0XXCJ3c14u
	rn89NU1+VyvngAYgLDLUGxNwCsgu0M/oHMDxsULGWTBdnIWArI6+oaAQ1wiqzEqq0XPj7xcLBvV75
	Fi3Ts3tdM6aB17SOuNJztDTTZOPUuIE/Q8dA==;
Date: Tue, 24 Nov 2026 22:43:00 +0100
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
Subject: Re: [PATCH v2 06/20] dt-bindings: sound: Document OpenPandora sound
 card
Message-ID: <20261124224300.519d8686@kemnade.info>
In-Reply-To: <5c6f7deca16f70f1f19cb40c57d70e30068d6000.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
	<5c6f7deca16f70f1f19cb40c57d70e30068d6000.1795505160.git.hns@goldelico.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_134314_772881_4B4C12F4 
X-CRM114-Status: GOOD (  22.78  )
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

On Tue, 24 Nov 2026 08:25:46 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> The OpenPandora audio subsystem describes the routing links between the
> OMAP3 McBSP interface, the external PCM1773 DAC, and the TWL4030 audio
> codec, alongside amplifiers and power supplies.
> 
I think at least in some commit message should be commented why such
an interface is needed and the generic sound cards are not sufficient,
also as a starting point to recheck that later if these reasons are still
valid.

Regards,
Andreas

> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> 
> Notes:
>     Changes against V1:
>     - Address Krzysztof Kozlowski's V1 request to run the documented
>       DT schema checks and fix the errors reported by Rob Herring's
>       automated DT validation.
>     - Update the binding example and schema during DT consistency review.
>     - Binding and commit-message review assisted by ChatGPT.
> 
>  .../sound/openpandora,omap3pandora-sound.yaml | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml b/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml
> new file mode 100644
> index 0000000000000..6c4d69ffc1c50
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/openpandora,omap3pandora-sound.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OpenPandora OMAP3 Audio Complex
> +
> +maintainers:
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +description:
> +  The OpenPandora audio subsystem describes the routing links between the
> +  OMAP3 McBSP interface, the external PCM1773 DAC, and the TWL4030 audio codec,
> +  alongside amplifiers and power supplies.
> +
> +properties:
> +  compatible:
> +    const: openpandora,omap3pandora-sound
> +
> +  label:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User-visible name for this sound card.
> +
> +  amp-gpios:
> +    maxItems: 1
> +    description: GPIO pin controlling the amplifier power state.
> +
> +  amp-supply:
> +    description: Regulator supplying power to the amplifier.
> +
> +  sound-dai:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 2
> +    maxItems: 2
> +    description:
> +      Phandles to the audio CPU DAI (OMAP3 McBSP) and the codec DAI.
> +
> +  routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the connection's sink,
> +      the second being the connection's source.
> +
> +  widgets:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      User-specified audio sound widgets.
> +      Each entry is a pair of strings, the first being the widget type
> +      (e.g., "Speaker", "Headphone", "Microphone", "Line") and the second being its name.
> +
> +required:
> +  - compatible
> +  - sound-dai
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    sound {
> +        compatible = "openpandora,omap3pandora-sound";
> +        status = "okay";
> +
> +        label = "OpenPandora";
> +
> +        amp-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
> +        amp-supply = <&aux_5v>;
> +
> +        widgets =
> +            "Line", "Line Out",
> +            "Line", "Line In",
> +            "Headphone", "Headphone Jack",
> +            "Microphone", "Mic (internal)",
> +            "Microphone", "Mic (external)";
> +
> +        routing =
> +            "DAC1", "APLL Enable",
> +            "DAC2", "APLL Enable",
> +            "Headphone Amplifier", "VOUTL",
> +            "Headphone Amplifier", "VOUTR",
> +            "Line Out", "VOUTL",
> +            "Line Out", "VOUTR",
> +            "Headphone Jack", "Headphone Amplifier",
> +            "AUXL", "Line In",
> +            "AUXR", "Line In",
> +            "MAINMIC", "Mic (internal)",
> +            "Mic (internal)", "Mic Bias 1",
> +            "SUBMIC", "Mic (external)",
> +            "Mic (external)", "Mic Bias 2";
> +
> +        sound-dai = <&mcbsp2>, <&dac>;
> +    };


