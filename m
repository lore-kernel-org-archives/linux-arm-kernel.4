Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C360960A261B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M4FMjQ6w;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AQHA1030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=; b=M4FMjQ6w4bjQrxHMnLhzGDOk0t
	cDYOaVJjwzJCTpm3mA8ti4XYuNotJ8Sy/QWk8VkYJiFt3XOThWoLg3GfBps8mYBC7FCDpEj5kH+mb
	jb61XAgMtRPC0EgXQjtsp8i637jyNT9eWyAWCsrc4bkbPy37urI1OUese01m5FzUnS0giNECk0CAe
	V8LVKZldYXTlAG7MjKI+TBTzIMvHVzf4bL3z7+s+8RpJhKG6d85iGMOVglTFwh/r+uNagB0mL4nHg
	Wbu0lMzOI13REw9jYwHQTElx1UnnOZbeHRjC7KwHQIMJZHkGrR8Nx40kkhGV1bdBfWzdIG/OH44sx
	RcoiE/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMT3-0000000EiDn-0DFa;
	Fri, 20 Nov 2026 11:07:45 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMSp-0000000Ei3T-43TY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:07:34 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so893095a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:07:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795172848; cv=none;
        d=google.com; s=arc-20260327;
        b=Q7PvlGUCnxWtdGcXbxfnQdLGlKgKRiZbKQr0dimTWtQxcQsO593PvR5KPm096yQ3kr
         H2cycK31jREcr2nGT4GSrqniHOi+LLE5CpaySRZyk6IJvrEWBca1OQU/lkdcWvwQXhA5
         oG8H3bOWcxDbYER69rNdniq7uGUjh2XwT7hcCijxbrNis1ipaPmrfBwL0JwMn95iHwYA
         Hy7lHAtObAGgTEW6nYlGe6G/O5SQrq/D53VP0ICxyiIKw4cOG1ZLbTdDzBoJkEDa+e8q
         4sUx5DCFzd9LxT+P3CxdjxEAHJ3K6sLQsXk+GD7MjCZXH9RcnsFcGgscxPNFtfWKm42F
         9Sxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
        fh=kmj6lMuln0OG1UIzyAN/HCqOfObdwMThsTBblG0rJvY=;
        b=e25zIIqAUzz05NXKNzNKRAZObZZkp+/DBrHAeIFruZFx1mSe7HSJWWGH20lP3h6GJs
         F4F/MhkZvjWrVXo86KvpjAFG//lFEh0jID5OsAlvuT3BHt8VaGKGika+G/dj077VRSbE
         QvME7FnGACqr3eCZRjByVRJTgnWp2G9Gv7KOgCYKPrB3qWDXfiT28YEO01TMQEhMGBT3
         O6y4aQ3r0w16japhfWFkffKUJkIXfwisNtVmvcDdQxNNcggulPK9s9haa4QTSoYXhYFa
         ZVC2uf1Onl9LOk7qC22H8+EG6b+rT8gDSrP7rSFf5tgUQpYic7SqXTcj4OBRKU74zvE5
         g0NQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795172848; x=1795777648; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
        b=AQHA1030GRm3zsizlXw7XdwafwP2niBn5hu40t2bCobQKoSa6cTPRnmQ5Bw7kFsU77
         biqP1em1vsBnbhJuIDUegzZ5t4+shVtApntBMN+pNM9eAxr27WL8pWLWHLNean0h9vMG
         mu7rASRl2h9KNrQLjdg+KWCRLM3yWDGccbHfHiZiMaK9rgpDb/G8xcsenfcSeuO/td8p
         nIhE63T/unSiCew7xs006aAzlb7jJzG1AZYICp65rL1kgKnQtHrGDIiRc0ch30dze2hF
         oMGkg/VMrj8us8X3uHnTJb0umEZljoiKnGoY08v4DrVXxTArcxnKXBiU1anXXIsud8u9
         zvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172848; x=1795777648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
        b=yMfjOcJcq82SkuLC1RbWfBPHXebG3Mz8LANSAsQEWAC87DnPClWcM7HQoJQlGLOl0c
         pWEt0jicPG+mpWnzC6UZpe8VtIAxsgxJdC5DWMJd/WBYFzEgylnPycqZR3FirW+0p48R
         4vArjATaNhyFJtYknxJ6CgTR1SFzM2N+M7YOPi6mYoqIcixOabNmWZfCLnOIYwX+VoEX
         Vff/VeX7f7m/MdOIwX5VMkyTJdDWKEPpLdtRTu73L5e78+y+E78Nj6We45+Moo0U2jj7
         Q8ZMhnLuwNsRMzuZGCBBWde4De8YS6lSMGk4mlSi3UfeLZsc2PqTKs0SkQlMcWguu6wI
         KRLw==
X-Forwarded-Encrypted: i=1; AL+hErFaZ+QamlkWZiK1uz1jvTORMha5zoQAxWSeOx0d/n6+zftmTmnvRjsyl7P426IWGhaSkBYamN16tKprG/UrSaw2@lists.infradead.org
X-Gm-Message-State: APuU4Z+r4TRUEykxMKBs5BFjpp3sdxi+TJV3WFpy/nAn4HRRkkbTd37l
	nPcZzNauDf/tklOg6nHQBKs/V7G3cXfyyLy9l316sZwqnGjhrT6eW4B+804JopCmqg5smuCDj3E
	+Hk8IohsNLF1ZQsgt8IipR1MRVezgyKZtqc84SaPjJQ==
X-Gm-Gg: AZFdTZffscnlc2zW5cqDlQwirCdnGBzfDWUT1Fu/a2KidDTq8ylTzBoLRu+oEFtlQMd
	wtZyHxbxZVKdi4IwwYDJ6B7qi+zlAnBckLfZPem6ofb0HTrdIlJx1i+tmduOT+9kaNsHKj64AXS
	WbGS6NunaIJK1hxqwsukn0JSgTNfwIq1/m45IwxULd+xvRQh+mq8+4W3D+61TpDlvDqtJtvgSn6
	JLGTRzr4ensC3UPoEnltxTH9PG8dh/sjvDGjsf5CjY0lVHHn7gjbUO5D1i0HI4c221+F/cATEyp
	K+0EUJj9nRA7547RgHCHxk6so2Q5HqMJgEOloPq9NrR9+I+2zJd1fjEi2LkOAGc9l6vyydklzBu
	kAhMtkVreACA/kGewaxsqyB9vQ83e9VV2nKEZRWTcEkPKRaCzbb+I3/jxxlX/bqCGDsWGniM=
X-Received: by 2002:a05:6402:3225:b0:6b5:79f4:8d52 with SMTP id
 4fb4d7f45d1cf-6ba37e6f806mr1953110a12.20.1795172848247; Fri, 20 Nov 2026
 03:07:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104847epcas5p1d970255218f1ca78b19690bfd097f303@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-7-raghav.s@samsung.com>
 <CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com> <002901dd77d9$6ddef600$499ce200$@samsung.com>
In-Reply-To: <002901dd77d9$6ddef600$499ce200$@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 20 Nov 2026 11:07:16 +0000
X-Gm-Features: Aa3M54pTNJ_y_R-HLRUhtwnIbiMHdLsAfFF3Abu5bW9vYYJErrbwlv-VYU97Njc
Message-ID: <CADrjBPrO43A6XaVK7_J3-y9=bOsjhNbyf8KA6fmyvLJ0O61gOw@mail.gmail.com>
Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for pll_4313
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Raghav Sharma <raghav.s@samsung.com>, krzk@kernel.org, s.nawrocki@samsung.com, 
	cw00.choi@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030732_225308_53CE90B3 
X-CRM114-Status: GOOD (  27.17  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alim,

On Thu, 19 Nov 2026 at 03:52, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Thanks Peter for review
>
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Friday, November 13, 2026 5:58 PM
> > To: Raghav Sharma <raghav.s@samsung.com>
> > Cc: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> > alim.akhtar@samsung.com; sboyd@kernel.org; bmasney+clk@redhat.com;
> > jbrunet+clk@baylibre.com; robh@kernel.org; conor+dt@kernel.org; linux-
> > samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > kernel@vger.kernel.org; is.gandhi@samsung.com; ts.amit@samsung.com;
> > pokala.reddy@samsung.com
> > Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for
> > pll_4313
> >
> > Hi Raghav,
> >
> > On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com>
> > wrote:
> > >
> > > From: Alim Akhtar <alim.akhtar@samsung.com>
> > >
> > > PLLs 4313 are found in the Exynos8855 SoC and it is similar to
> > > pll_531x except for CON8 offset, so re-using code for
> > > pll_4313
> > >
> > > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > > Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> > > ---
> > >  drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
> > > drivers/clk/samsung/clk-pll.h |  1 +
> > >  2 files changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/samsung/clk-pll.c
> > > b/drivers/clk/samsung/clk-pll.c index 3d837bd74355..7b0756127306
> > > 100644
> > > --- a/drivers/clk/samsung/clk-pll.c
> > > +++ b/drivers/clk/samsung/clk-pll.c
> > > @@ -1306,7 +1306,15 @@ static unsigned long
> > samsung_pll531x_recalc_rate(struct clk_hw *hw,
> > >         u64 mdiv, fout = parent_rate;
> > >
> > >         pll_con0 = readl_relaxed(pll->con_reg);
> > > -       pll_con8 = readl_relaxed(pll->con_reg + 20);
> > > +       if (pll->type == pll_4313) {
> > > +               /* Offset for PLL_CON8 which hold FDIV different for PLL_4313
> > > +                * which is PLL_LOCKTIME_OFFSET - 0x4
> > > +                */
> > > +               pll_con8 = readl_relaxed(pll->lock_reg - 4);
> > > +       } else {
> > > +               pll_con8 = readl_relaxed(pll->con_reg + 20);
> > > +       }
> > > +
> >
> > This starts to feel a bit hacky (pll_con8 register being referenced as an offset
> > from lock_reg). Is the register really called pll_con8 on 8855? Or is it called
> > something else, but happens to contain fdiv?
> >
> Yes, it is named as PLL_CON8_* on 8855, and contain fdiv bit.

If the register is actually called PLL_CON8_ in the TRM then the
current patch makes sense "as is". It just seemed odd at first reading
that con8 wasn't an offset from con_reg on this SoC.

Thanks,

Peter

