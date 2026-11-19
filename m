Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D207C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zgIlsr0X;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=jxPXT3Io
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k1TemjZqZzUtb911eFpFTlr9YVP5j33fp7w/pph9qY8=; b=zgIlsr0XBnvVwp8jaCPpBu0yA8
	C/2TVfzHZo06rXCfB02iomyQ0IX09a+wJiTRaxJwnl64AFF3kAxN1eMRBkGIw9orqA4mxKAv0kfdC
	cefEPp94sBA7xg67o90rFKCynBADF5sMr7v6/UZ62Ar9Srpn/geFT01ciKZT2TuOi3IrpnYn2LtYn
	UpkpxU4qOWt7OqzgdkGtQf9A9LgtndL3y+iDtyE+7jkbtdDVIlLhyZSj7+VXdOE91szB1oYvJvJO5
	Mca5HDEKxghgrx/AqWlyQtfdWWzRGU8aErPQXUgAWXX8FjA+tRqTzJzDx7xeRpgUnptsS4dT5Ea7y
	6vWNTvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3Vz-0000000CIL9-148V;
	Thu, 19 Nov 2026 14:53:31 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3Vl-0000000CIGc-4796
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:53:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D3E01483022;
	Thu, 19 Nov 2026 15:53:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1795100002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=k1TemjZqZzUtb911eFpFTlr9YVP5j33fp7w/pph9qY8=;
	b=jxPXT3IoGdPzIrANv/1IsOBMFwrG0fKNZ2kYGvul8pZ3lqJ1iIi1uUIwygxseWnUedBX5r
	pCuASsLWd44+piSPYRDtEFK984UK3DeXNSfymq4rpqEm0tc3uL+JP+VylYDKAEn5KHnYQ4
	iibgQuY3yubiQZRnJrbmRQCgQ+hKi4V/PZSAn0XcCo1TnFZCud0mK33uX+2zTW9iCZMbkO
	Gxmv1vu1GzJJPBRgJdi5jWo9hbj4YqyQo8x2XCCkv543CHe1Vi+i7st0+PncjoLhlgLUT7
	wYczqi14VFFD3TQqFiobiCvpmycHuLH/wZRcAdvOh3DsOjADi+kmiLroe9454A==
Date: Thu, 19 Nov 2026 15:53:12 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: Alexander Dahl <ada@thorsis.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 03/16] dt-bindings: clock: at91: Allow referencing
 main rc oscillator in DT
Message-ID: <20261119-sixfold-tradition-ab9492ca6c2e@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-4-ada@thorsis.com>
 <5273baa7-aae5-4364-bb09-dccee581200b@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5273baa7-aae5-4364-bb09-dccee581200b@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_065318_354525_FB23A4BA 
X-CRM114-Status: GOOD (  24.98  )
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

Am Sun, Nov 15, 2026 at 04:34:30PM +0200 schrieb Claudiu Beznea:
> Hi, Alexander,
> 
> On 11/5/26 13:06, Alexander Dahl wrote:
> > The main rc oscillator will be needed for the OTPC to work properly.
> > 
> > The new index introduced here was not used on the four affected SoC
> > clock drivers before.
> > 
> > Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >      v4:
> >      - change index for sama7g5 and sama7d65 after re-adding unused PLLs in patch 2
> >      v3:
> >      - adapt to different base changes, added lines are the same
> >      v2:
> >      - new patch, not present in v1
> > 
> >   include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
> >   include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
> >   include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
> >   include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
> >   4 files changed, 4 insertions(+)
> > 
> > diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > index 050e5e774b274..830e247ba2532 100644
> > --- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > @@ -10,6 +10,7 @@
> >   #define SAM9X60_PMC_MCK		1
> >   #define SAM9X60_PMC_UPLLCK	2
> >   #define SAM9X60_PMC_MAIN	3
> > +#define SAM9X60_PMC_MAIN_RC	6
> >   #define SAM9X60_PMC_PLLACK	7
> >   #endif
> > diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> > index 292c5873e101e..58d2a08116795 100644
> > --- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> > @@ -10,6 +10,7 @@
> >   #define SAM9X7_PMC_MCK		1
> >   #define SAM9X7_PMC_UPLLCK	2
> >   #define SAM9X7_PMC_MAIN		3
> > +#define SAM9X7_PMC_MAIN_RC	6
> >   #define SAM9X7_PMC_PLLACK	7
> >   #define SAM9X7_PMC_AUDIOPMCPLL	9
> >   #define SAM9X7_PMC_AUDIOIOPLL	10
> > diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> > index 08581418b9115..17105a6bedb54 100644
> > --- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> > @@ -19,6 +19,7 @@
> >   #define SAMA7D65_PMC_AUDIOIOPLL		10
> >   #define SAMA7D65_PMC_ETHPLL		11
> >   #define SAMA7D65_PMC_MCK1		13
> > +#define SAMA7D65_PMC_MAIN_RC		14
> >   #define SAMA7D65_PMC_LVDSPLL		15
> >   #define SAMA7D65_PMC_MCK3		16
> >   #define SAMA7D65_PMC_MCK5		17
> > diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > index 27668634b0a2b..4a1c4af8ecc9a 100644
> > --- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > @@ -19,5 +19,6 @@
> >   #define SAMA7G5_PMC_AUDIOIOPLL	10
> >   #define SAMA7G5_PMC_ETHPLL	11
> >   #define SAMA7G5_PMC_MCK1	13
> > +#define SAMA7G5_PMC_MAIN_RC	14
> 
> I think we can use 12 instead. Correct me if I'm wrong. Otherwise, you
> should change also driver code to allocate space for this clock. See
> pmc_data_allocate() in drivers/clk/at91/sama7g5.c

The old definition had this (with PMC_MAIN = 3):

    #define PMC_CPU                 (PMC_MAIN + 9)

That's the 12 which is missing in the new list.  PMC_CPU was not used
in the current code base.  Personally I'm fine with using 12 here, but
I was not sure if this is again some value Microchip wants to keep for
some reason?

The allocation problem was found by sashiko on patch 5.  I already
fixed that in my working copy for v5 of the series, but will adapt, if
the value here is changed again.

Greets
Alex


