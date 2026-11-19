Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69213606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nwhdRhTW;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=fCrb/VIV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mjnwJhgivOtcVF1fvsobspXXgbNjrXo23hOqgODgs+4=; b=nwhdRhTWAn8dqHiwLnGcWoB8fJ
	eGI6CsxAxx0LNDq+Bsoub8emmqdblPZW0e5tzcFunb6DraMHx/X1EsAJQJRfKLZ954MHEDkJpw4Hr
	14cCYNxfIpByqmkHYPpOYkF5Eb0vVS4A1mKR/E6VjXcd2XbQsia9g0y4pqK2pLTjv1lO/HsLi/TbX
	pR2RbgHy9FplXBHxrbEnfcEhmoZ5jr9lJddjIEv+gaDXDXoQA1xVP+WNvOFZIO7BKVEw2LTk8bems
	fvb2ERjVBAA3Nzpg4OtIGXvi5KB2LemJIOtUy5KXVVbomOz1rekbFBt7P9YEFB/w7Tr4dysLBoUXz
	DAH/V1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3P8-0000000CGhu-36Xj;
	Thu, 19 Nov 2026 14:46:26 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3P3-0000000CGg5-3s0M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:46:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B9BE1483638;
	Thu, 19 Nov 2026 15:46:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1795099583; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=mjnwJhgivOtcVF1fvsobspXXgbNjrXo23hOqgODgs+4=;
	b=fCrb/VIVTWaNGQl9fgtlyLOU+Rq2w+qEzTSqxh3/njn+IeyBA56fMqPkY0CCZgzMtECFQm
	1OiPLwIArYkxsrYrlRHzI+aUH9wK2QQYxlCu3aKInZ8/jBSeBxX6YjwNqjUJ2OHCVW59hY
	icri4rUwWpQUiAIupc/KOYpsK6RNnKNARTk3m/UO1pXqJVmmNMwbW50V9sOBrM2eecic6i
	oWKIMzcjzQRuF+CW50waJWV09jBdt3uxnuCFgt9GtnRjW5pmYDisr9jKCNwvdXbk8t6toe
	722kOloQYJSoWe/wEC5ootIzoIOp+fcg0ug5xASQiSUwa4TCxqDtPxgwe36F8A==
Date: Thu, 19 Nov 2026 15:46:12 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: Alexander Dahl <ada@thorsis.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4 02/16] dt-bindings: clock: at91: Split up per SoC
 partially
Message-ID: <20261119-bruising-peroxide-4f2c3211155a@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-3-ada@thorsis.com>
 <0f0cc1da-46dc-431e-a10d-dcbbf7419960@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f0cc1da-46dc-431e-a10d-dcbbf7419960@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_064622_765313_6F09D175 
X-CRM114-Status: GOOD (  31.01  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Claudiu,

Am Sun, Nov 15, 2026 at 04:35:23PM +0200 schrieb Claudiu Beznea:
> Hi, Alexaner,
> 
> On 11/5/26 13:06, Alexander Dahl wrote:
> > Before adding even more new indexes creating more holes in the
> > clk at91 drivers pmc_data->chws arrays, split this up.
> > 
> > This is a partial split up only for some of the old PMC definitions.
> > 
> > Binding splitup was proposed for several reasons:
> > 
> > 1) keep the driver code simple, readable, and efficient
> > 2) avoid accidental array index duplication
> > 3) avoid memory waste by creating more and more unused array members.
> > 
> > Old values are kept to not break dts, and to maintain dt ABI.
> > 
> > Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >      v4:
> >      - "re-added" some definitions present in hardware but not used in dt
> >      - reword header comment (at91 -> Microchip) for newer SoCs
> >      - PMC_UTMI was renamed where appropriate according to datasheets
> >      v3:
> >      - full splitup for all at91 family SoCs instead of just a few
> >      v2:
> >      - new patch, not present in v1
> > 
> >   .../reset/atmel,at91sam9260-reset.yaml        |  3 ++-
> >   .../bindings/usb/atmel,at91sam9rl-udc.yaml    |  3 ++-
> >   .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 16 ++++++++++++
> >   .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 ++++++++++++
> >   .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 16 ++++++++++++
> >   .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 16 ++++++++++++
> >   .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 16 ++++++++++++
> >   .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 16 ++++++++++++
> >   include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 ++++++++++++++
> >   include/dt-bindings/clock/atmel,sama5d3-pmc.h | 16 ++++++++++++
> >   include/dt-bindings/clock/atmel,sama5d4-pmc.h | 17 ++++++++++++
> >   .../dt-bindings/clock/microchip,sam9x60-pmc.h | 15 +++++++++++
> >   .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 19 ++++++++++++++
> >   .../clock/microchip,sama7d65-pmc.h            | 26 +++++++++++++++++++
> >   .../dt-bindings/clock/microchip,sama7g5-pmc.h | 23 ++++++++++++++++
> >   15 files changed, 236 insertions(+), 2 deletions(-)
> >   create mode 100644 include/dt-bindings/clock/atmel,at91rm9200-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,at91sam9260-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,sama5d2-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,sama5d3-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,sama5d4-pmc.h
> >   create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
> >   create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
> >   create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
> >   create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> > index 84c4801df8d9a..8c89ccc3d6393 100644
> > --- a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> > @@ -67,9 +67,10 @@ additionalProperties: false
> >   examples:
> >     - |
> >       #include <dt-bindings/clock/at91.h>
> > +    #include <dt-bindings/clock/atmel,at91sam9260-pmc.h>
> >       reset-controller@fffffd00 {
> >           compatible = "atmel,at91sam9260-rstc";
> >           reg = <0xfffffd00 0x10>;
> > -        clocks = <&pmc PMC_TYPE_CORE PMC_SLOW>;
> > +        clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
> >       };
> > diff --git a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
> > index cdbbd17f80363..15f5bb51fd8a7 100644
> > --- a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
> > +++ b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
> > @@ -61,13 +61,14 @@ examples:
> >     - |
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       #include <dt-bindings/clock/at91.h>
> > +    #include <dt-bindings/clock/atmel,at91sam9rl-pmc.h>
> >       #include <dt-bindings/gpio/gpio.h>
> >       gadget@fff78000 {
> >           compatible = "atmel,at91sam9g45-udc";
> >           reg = <0x00600000 0x80000
> >                  0xfff78000 0x400>;
> >           interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
> > -        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
> > +        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE AT91SAM9RL_PMC_UTMI>;
> >           clock-names = "pclk", "hclk";
> >           atmel,vbus-gpio = <&pioC 15 GPIO_ACTIVE_HIGH>;
> >       };
> > diff --git a/include/dt-bindings/clock/atmel,at91rm9200-pmc.h b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
> > new file mode 100644
> > index 0000000000000..35fce34e00b82
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91rm9200 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
> > +
> > +#define AT91RM9200_PMC_SLOW	0
> 
> This is not used anywhere anywhere accross the current code base. Let's drop it.

Fine.  I added this after your feedback on v3 of the series [1],
probably misinterpreted what you meant.  v5 will be reduced by some
definitions again and keep the PLLs in the sama7 SoCs.

> > +#define AT91RM9200_PMC_MCK	1
> > +#define AT91RM9200_PMC_MAIN	3
> > +#define AT91RM9200_PMC_PLLACK	7
> > +#define AT91RM9200_PMC_PLLBCK	8
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,at91sam9260-pmc.h b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
> > new file mode 100644
> > index 0000000000000..6a5453cf70954
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91sam9260 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
> > +
> > +#define AT91SAM9260_PMC_SLOW	0
> > +#define AT91SAM9260_PMC_MCK	1
> > +#define AT91SAM9260_PMC_MAIN	3
> > +#define AT91SAM9260_PMC_PLLACK	7
> > +#define AT91SAM9260_PMC_PLLBCK	8
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
> > new file mode 100644
> > index 0000000000000..44a804ff96fff
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91sam9g45 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
> > +
> > +#define AT91SAM9G45_PMC_SLOW	0
> 
> This is not used. Lets introduce it when needed
> 
> > +#define AT91SAM9G45_PMC_MCK	1
> > +#define AT91SAM9G45_PMC_UPLLCK	2
> > +#define AT91SAM9G45_PMC_MAIN	3
> > +#define AT91SAM9G45_PMC_PLLACK	7
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
> > new file mode 100644
> > index 0000000000000..6eaef69242ee8
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91sam9n12 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
> > +
> > +#define AT91SAM9N12_PMC_SLOW	0
> 
> Not used.
> 
> > +#define AT91SAM9N12_PMC_MCK	1
> > +#define AT91SAM9N12_PMC_MAIN	3
> > +#define AT91SAM9N12_PMC_PLLACK	7
> > +#define AT91SAM9N12_PMC_PLLBCK	8
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
> > new file mode 100644
> > index 0000000000000..0bb195712f785
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91sam9rl clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
> > +
> > +#define AT91SAM9RL_PMC_SLOW	0
> 
> Not used.
> 
> > +#define AT91SAM9RL_PMC_MCK	1
> > +#define AT91SAM9RL_PMC_UTMI	2
> 
> Manual also refers to this as UPLL (UTMI PLL). E.g.
> 
> "26.5 Main Oscillator
> The Main Oscillator is designed for a 12 MHz fundamental crystal. The 12 MHz
> is also used to
> generate the 480 MHz USB High Speed Clock (HSCK) thanks to the UTMI PLL (UPLL)."
> 
> [1] https://ww1.microchip.com/downloads/en/DeviceDoc/doc6289.pdf

Well, that old datasheet is full of variants for this, we have UPLL,
HSCK, UTMI PLL, USBHSCK, and UTMI Clock.  I rename it to
AT91SAM9RL_PMC_UPLLCK so it is in line with the other old SoCs.

> 
> > +#define AT91SAM9RL_PMC_MAIN	3
> > +#define AT91SAM9RL_PMC_PLLACK	7
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
> > new file mode 100644
> > index 0000000000000..d095dcc9b29ff
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91sam9x5 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
> > +
> > +#define AT91SAM9X5_PMC_SLOW	0
> 
> Not used.
> 
> > +#define AT91SAM9X5_PMC_MCK	1
> > +#define AT91SAM9X5_PMC_UPLLCK	2
> > +#define AT91SAM9X5_PMC_MAIN	3
> > +#define AT91SAM9X5_PMC_PLLACK	7
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,sama5d2-pmc.h b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
> > new file mode 100644
> > index 0000000000000..51bb410c699e2
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91 sama5d2 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
> > +
> > +#define SAMA5D2_PMC_MCK		1
> > +#define SAMA5D2_PMC_UPLLCK	2
> > +#define SAMA5D2_PMC_MAIN	3
> > +#define SAMA5D2_PMC_MCK2	4
> > +#define SAMA5D2_PMC_I2S0_MUX	5
> > +#define SAMA5D2_PMC_I2S1_MUX	6
> > +#define SAMA5D2_PMC_PLLACK	7
> > +#define SAMA5D2_PMC_AUDIOPLLCK	9
> > +#define SAMA5D2_PMC_AUDIOPINCK	10
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,sama5d3-pmc.h b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
> > new file mode 100644
> > index 0000000000000..92210969104d6
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91 sama5d3 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
> > +
> > +#define SAMA5D3_PMC_SLOW	0
> 
> Not used.
> 
> > +#define SAMA5D3_PMC_MCK		1
> > +#define SAMA5D3_PMC_UPLLCK	2
> > +#define SAMA5D3_PMC_MAIN	3
> 
> Not used.
> 
> > +#define SAMA5D3_PMC_PLLACK	7
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,sama5d4-pmc.h b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
> > new file mode 100644
> > index 0000000000000..53870448d6a1d
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91 sama5d4 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
> > +
> > +#define SAMA5D4_PMC_SLOW	0
> 
> Not used.
> 
> > +#define SAMA5D4_PMC_MCK		1
> > +#define SAMA5D4_PMC_UPLLCK	2
> > +#define SAMA5D4_PMC_MAIN	3
> 
> Not used.
> 
> Thank you,
> Claudiu

Thanks for your review.

Greets
Alex

[1] https://lore.kernel.org/linux-devicetree/1f25e668-ff04-4fa7-a7fd-3ed3286edbe6@tuxon.dev/


