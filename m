Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1228606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 01:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wrll3SQG;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YJGAUZGw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3rjAI+sJDwgrDrNdAFFa1hcjaCbxcDShwUBEuorOLOg=; b=wrll3SQGZVTcQlBmQ2T2BCtOlM
	nR2Ci/pzJuBpkyqSNToXb2y+Py3CW1galOqYmkZXh7kBJwlwvFy/xnrz8sywpnHa1ZQmFVIQbjFU+
	AwRldofHQ/kFDi9DUZML8QeSEl4+HjW9/q/FJFVfEdU8HHwy8sm0sIxVPxj+4xlB+aMdUIFMN5Kx8
	zY10dTWJeupXagy7jSL/b6aAImeUTW/QEBawjZw5lnSeD/NzudZB29uc1YpfQhKBDkkkXbwOMbqc3
	w6D0+bpWvN55GlNut2doWiMZfc92ieAgoTN74085mCvxb72e3wWzeJYt1vZzvJNubpknWIKxqcAkZ
	SXuPmCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfsN-0000000BQ1W-1WnN;
	Fri, 13 Nov 2026 01:14:47 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfsJ-0000000BQ13-3wb8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 01:14:45 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-15ea896ddc8so491067c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 17:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794532482; x=1795137282; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3rjAI+sJDwgrDrNdAFFa1hcjaCbxcDShwUBEuorOLOg=;
        b=YJGAUZGwTcuD+3daoA5Gx4FvWqS6J5xMHQ54p8iD78MjFYCkUiKMolVAgvM/iTqfBh
         8J2pqlepIMdz39KhmfMWPSCWupjJimqTlspQFcD4LCpzA4QrMmKgey9+yb5qhZzcsvH5
         zVbFi1jAIpEE1BgyN5ecpRf1njvCOIq4Vg52w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532482; x=1795137282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rjAI+sJDwgrDrNdAFFa1hcjaCbxcDShwUBEuorOLOg=;
        b=H/2yYUHBrGpvWJlteoL18W2tY1E6EcJwZ6DIEgceo9qkU5MU1KhOuI1QNhty/ISq9u
         og4i5a9MI35mdANDzNH5lIeUNdjMdUfr22GTwMp7P1N/SoAyhhnKuJY8laz2/ZfHTYr8
         pEE2uRjCucZxnpKgHlsBAN1eDlM2Q7QZs1Ca8i/YO+llbrilkUHh9owUHPUC9uWkfxc/
         lQiFAIatgi5vcSHWRLzHMUGAfE5Mjwhu1YOut5hA9KKcKNnaRwzJhSPT6EIwBdvVSMTo
         U5zHY4BoXaoT82tWK+YtuPjec1Nr9qwE28nO4gfr3zkLOBnQY24/oq+cetokxFdZrO+i
         EDpg==
X-Forwarded-Encrypted: i=1; AL+hErHug+lbg+bkkYB5VHyvnfAOww3X7Il7eFbO9tiLJH0Vn/EwsRuOQx076dgAor3DYVCpJD8IheGYgpy0ktQOOVjm@lists.infradead.org
X-Gm-Message-State: APuU4Z8S6KklZoPUIq0wcCtIQsrrEMvZj6VPZ5Xn39Xk3Y7ox4mPWhic
	iTHUVmmaAPd92Xodx/h9+Fp18NAVvGMzN1Vfnl+UUOsYEI7z8uAurRE5eF2cw2LRNg==
X-Gm-Gg: AYBFou2XvLXt4dFerOhX76gk0T7TMd6HirWjXoEA4vNW4z5TQNM0Q7s9JQcW16toMvK
	B31U1BTf5yyJ32mI44pJj2G0spetUKuDj05U1+AnIisxjrO9wFrYrT/54W38+fnmkSthlpDdbp/
	9S6gdjcTxaSt9RGEOgrkPeEhltVXeTCSL+h5qOJGjXeatCqSTZgKi7nvgo0E7Gm0s7T5kO2d1Sz
	Wo4bLdUX9iPEUP056/2B7Jkn9yitx71QUh/UP1PX28g9OXGAnEwBXVqRmsjf71S6rgBe67H/QpY
	BBG9BhT3tPXlcwoJqv+C9pbA4Wj6m1lm9Rb/bPyS8NcgabptCSzn8UnjPWXnaTNSTiFWsgPDoKB
	fFQKfStMv9ucQG8S58RSPlqTxb7vJrNMkYkiEV6+ORemQ4SGld8/56dMT5Ne32HSXU7TU+9epUE
	aYBaaVh3yxgcIuXxb5CXtm1XSG/OTMdr4Gr3P7Pto8Onh4Ab2HM4/Q1MEejL6Mj+MG2QtRrkoL0
	cESpOUyYVufj+YB/6uJa2q6zAQLbmcvLARgVXFXVTF3UWWYREUFHeq8sINzbiMmiPeWzZnZp4l6
	Lt/uoaGR9XE3ctTPf9RvmGLpXZyT6+LLv7MRJxAIuOjvuuUCVFFlULfnrfmf+KygLE6K2EFVY92
	iBbzF7R1RWETcQQ==
X-Received: by 2002:a05:7023:a41:b0:183:e993:7901 with SMTP id a92af1059eb24-1b5030abd48mr1019806c88.17.1794532482087;
        Thu, 12 Nov 2026 17:14:42 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:616b:3e06:cec4:c2f9])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b50309b2b5sm2265698c88.1.2026.11.12.17.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 17:14:41 -0800 (PST)
Date: Thu, 12 Nov 2026 17:14:38 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM
 binding
Message-ID: <avZkfg6WMlMzOxpn@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll>
 <aulIoq2oVjJ3DVzL@google.com>
 <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_171444_030458_A14196F8 
X-CRM114-Status: GOOD (  46.77  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

On Thu, Nov 05, 2026 at 07:54:22PM +0100, Krzysztof Kozlowski wrote:
> On 03/11/2026 03:36, Brian Norris wrote:
> > On Wed, Oct 28, 2026 at 02:19:23PM +0100, Krzysztof Kozlowski wrote:
> >> On Mon, Oct 26, 2026 at 02:43:40PM -0700, Brian Norris wrote:
> > 
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/interrupt-controller/irq-cpm-google.h
> >>> @@ -0,0 +1,16 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +/*
> >>> + * This header provides constants for CPM IRQ.
> >>> + *
> >>> + * Copyright 2025-2026 Google LLC
> >>> + *
> >>> + */
> >>> +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> >>> +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H
> >>> +
> >>> +#define CPM_IRQ_RTC_ALARM_NO			0
> >>
> >> Keep naming consistent. Clocks has _CLK suffix, so this should not use
> >> prefix.
> >>
> >>
> >>> +#define CPM_IRQ_AOC_MIN				7
> >>
> >> Anyway, ABI constants should be indexed from 0 and incremented by 1.
> > 
> > What do you mean by this? Do I need to make up names for the
> > unused IDs between 0 and 7? On an initial search, I don't believe they
> > have any meaning at all. Does that mean I should make up some kind of
> > "RESERVED_<N>" naming here?
> 
> No, I meant CPM_IRQ_AOC_MIN is 1.
> 
> > 
> > Between 7 and 156, these are just ... 150 different "service numbers"
> > within the AOC (Always On Connectivity) subsystem. I can name them
> > AOC_0, AOC_1, ... AOC_149 if that helps.
> > 
> > Or are you suggesting that I pack the actual use cases (so, 0 and 7-157)
> > into 0-151? I thought it was valuable to directly use the firmware
> > indexing where possible; if I change those, then the indexing loses its
> > inherent meaning, and we also have to add another layer of translation.
> 
> We do not use hardware numbers as bindings and ABI, because that's
> pointless - no benefits, only risks. Similarly you do not define GIC
> interrupt numbers, pinctrl pin numbers, MMIO addresses as bindings. None
> of these bind anything between DTS and software, so not a binding.

OK, I see your point about the distinction between hardware numbers and
bindings. So are firmware-protocol-defined numbers more like hardware
numbers or bindings?

> There are some exceptions like SCMI firmware, but that's not the case here.

It's funny you mention that, because that's exactly what Jerome compared
this to in the clk, reset, and pmdomain portions.

These values are used literally in the firmware interface, so I'd
consider them very similar to SCMI firmware protocol IDs (and, not that
different to hardware IDs, if you consider the "firmware" as essentially
unchangeable). And if I change this to *not* be literal firmware IDs,
then Jerome's suggestions on patch 5 (to imitate SCMI, and to defer more
control to the firmware) become more difficult.

If I do keep these as literal firmware IDs: does that mean you'd prefer
these not be in dt-bindings/? Many of them (especially the IRQ IDs
you're pointing at) are not needed at all in the kernel side; they serve
more as naming documentation than anything else. I can just inline them
into the DTS. But I'd prefer having macro names for LPCM IDs and
similar, as it vastly helps DTS readability.

> > 
> >>> +#define CPM_IRQ_AOC_MAX				156
> >>> +#define CPM_IRQ_AP_GDMC_WAKE			157
> >>> +
> >>> +#endif  /* _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_CPM_H */
> > 
> > 
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/soc/google,lga-lpcm.h
> >>> @@ -0,0 +1,54 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +
> >>> +#ifndef __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> >>> +#define __DT_BINDINGS_SOC_GOOGLE_LGA_LPCM_H
> >>> +
> >>> +/*
> >>> + * LPCM IDs of each SSWRP.
> >>> + */
> >>> +#define LGA_LPCM_CPM			0
> >>
> >> What are all these?
> > 
> > The binding doc says:
> > 
> >       Each reset is specified by an LPCM ID (cell 1) and a reset ID (cell 2).
> >       See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
> >       <dt-bindings/reset/google,lga-cpm-reset.h> for reset IDs.
> > 
> > and
> > 
> >       Each clock is specified by an LPCM ID (cell 1) and a clock ID (cell
> >       2). See <dt-bindings/soc/google,lga-lpcm.h> for LPCM IDs and
> >       <dt-bindings/clock/google,lga-cpm.h> for clock IDs.
> > 
> > These are the IDs used in the firmware interface to talk about these
> > things, as many of the SoC resources involved (clocks, resets, power
> > domains) are grouped in this way (by subsystem (SSWRP / LPCM), and then
> > with indexing within each subsystem).
> > 
> > In reading again, I see that the definitions and explanation of these
> > terms and the SoC organization are split a bit between the pmdomain
> > commit message and the binding doc. Where would you prefer I elaborate
> > more? In the binding doc, the comments here, or both?
> 
> I just try to understand their placement. Bindings should not be in the
> soc directory, except a few things without clear subsystem owner. If
> this applies for both clocks and resets, maybe this could be firmware,

Maybe firmware, maybe power? LPCM is "Local Power and Clock Manager",
and I believe there's essentially 1 LPCM (microcontroller) within each
top-level power domain.

Brian

> but another point is that you should not need these in DTS. Somehow you
> split one clock/reset ID into two - LPCM ID and clock/reset ID. Just
> don't, unless you want to say that for example LSION_CLI16_UART_CLK is
> in multiple LPCM places?

