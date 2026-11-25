Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8417F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TkgrVf/h;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEZ8Tw0E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=huaeUnA8VNpUuIejnx/kUAs+Y2K0T8LOpxzNwKLu1uU=; b=TkgrVf/htU42gY
	tmNoOlsIeUXL8GlDcHsUyw9N0uhQI9ELJq5K4R6XRvFM5yLb6Xx3C2FyT3LXq9v6E2E0RGTAYh/H0
	ic1s6+QWCsp/qfliiTyA2DdNf1CwgQDErgwAwzwjvW8xe53PJKxh+qoJicpzH03O1gSDiI0d/L4Vu
	CblH0ZVgq0r2ElhdVDt3iZw5W0iwuj0Tqf9o6eEDd9Q4V448/UtonPJq9dkzDTZVncdsTtYr6u0kz
	UWgws/VXIvyr4hL/BMHWgB1H0WwHASOwdXjIeHZWRaPwNoUvUkGrwtRYGM01GRDwQQ7ZyIEVzP3el
	BcKtT7OV3l1vLexnehFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8hm-00000009AXD-1yFx;
	Wed, 25 Nov 2026 08:50:18 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8hf-00000009AVl-2g13
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:50:16 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-92134c4592dso49109666d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 00:50:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795596610; cv=none;
        d=google.com; s=arc-20260327;
        b=DZpujxPm9j0dL+tpxT7x15wZxO73Iabr1tDwisaCticizyE+cj/SAOtNUTvo5S9x3O
         Io1UpViO1DwOcFQZfDy8MW0j2rscRGaQfVYfp2rz+RGwGpSyuCHLGQQ4+Jr6mw1GY+Xz
         IPuV84KAh/7XA/RaTw4FI3W8su4FWZzHs8g5QLzhWl+ote7sHJIemErWFIuNj1J7Djvl
         Sf26/8NG6bwoQPJhKDHYQ7T39SYPFsPGH3cLZpsa9zxVTKFB5UlaoGyOi2TE6yIcUZT/
         E+iXuZxYUuYBPjQVV/EjDcwHutHWpTZKRg0mzgj5WYg/Mu726f+e2PVQ2cuKcVfGsrig
         7Olw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=huaeUnA8VNpUuIejnx/kUAs+Y2K0T8LOpxzNwKLu1uU=;
        fh=HTZoC8FiiYAdA8lhDdvC7d/KOC0ZoAFhpcIrzVK2tRc=;
        b=sBFNi+TxJomUKw4uEhiIKHlyzmCQdryWfeuOzH+p0igfpFhJmJRfWjiVe/az0rT/T+
         i1yA/1P4e4gBb0VUllqyytH3Ifhi0assU57b3pLqrEr5bSfuSZK1r9II62zTv+/VDxg7
         mWfcXBTTvgRhZ3O7MICnJAD1uEu2Hnz7OQU910d1fsy1ryxj+XxPHNXIze+hheunSmHb
         fsQPvSyf7P7ubM+mPsqMqDoCbzB/OkccahAdyX1r72q95Z717mlq9nD3fRPWmkBqbGGT
         UmvD1nfzpGyVrxBxSUgPgAOfJCgj3fckGbudg8kQlAjypgnOhpxiYZjJSz/YWrYUZD0j
         il7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596610; x=1796201410; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=huaeUnA8VNpUuIejnx/kUAs+Y2K0T8LOpxzNwKLu1uU=;
        b=eEZ8Tw0EnrX1a9cfXKqP4d07WpZ1keNts5Nlf8Ekh3/hj8cc/yRiyRT1IqhoWnxd8G
         O6WHr7ifpDzfbh4/5qalp2RI4lBOJNvXPGO4o4U+hDROH4wBKKNCq/HcMB7C3tn0FsxL
         b3uBk4m3ZV7FeUExVug6gm9UFH5HY7LbRr8hfI8SzHyOcL39p6slEFgb2xtAaNiEpg12
         nEbvSTE3SPeR6Xht4LVMulkgztW45fLsnUQaAuceMOeAFJRJt+RiD4Akcc3m3HUthFD4
         e3AsS+juvMXsDqxmPo9FjbzPrve4xrRapfzlJUlzuau3OVQ9F7fGfqWWlaRLNEpdTh67
         kugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596610; x=1796201410;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huaeUnA8VNpUuIejnx/kUAs+Y2K0T8LOpxzNwKLu1uU=;
        b=J8tyzc4iC3h6nprzOptme5oRvPA8UoNM/YeEMzwvF8n++9mA8MRgY4y+oPfVrz6Uzi
         WfIH2+vKvL2WDvPB6RjeqZhvHSO39VlT/4UwKlC1ju7o44hCh/GmrW7rQxdnLx3bKkOU
         OdGKm6sANSEYbVhLbyKXIORRa15wY9bMuRBNhqOFYEdSHWwyTY6xQcZH2/ItCe3iUEyW
         iefwWwEzBdbuMc3Or5XhVMBIPv9fuKEyML2L09Wwx6/xBV6RD4SqQC7GHMZbLTt56TZz
         fPlHev+eXY6CtUl8BImQpQr0DT5Uq14kY7gOn7W7goFnBemybJ6NtmHSGfX52f8lmyKO
         dlfw==
X-Forwarded-Encrypted: i=1; AL+hErG9ALvUQpRb4wcKy5zomZ6n4+2C4swQaVHAqFOgREPPd2elrTS7Pd+2cluiLF8RS4WWYGGmYLppYFlvBhahjcdo@lists.infradead.org
X-Gm-Message-State: APuU4Z+264zw6rIVuMC8x9Rx9MJBTcS7ER+VuvCs6ZfX/yJri1qAAW9l
	p9Rc+0iertAk7DAMWN/P0ZSOJt6TvhaWyNH+Tz4Wj+Fxx0zWs/7+ZLuhlBUeW/vwBk6DDkQ4GOr
	JeJd3zZhC21bUbTelGsenni0iHeOfJpo=
X-Gm-Gg: AZFdTZcmD3zvTDedw4l2PCV5BjSYjPdAfrigsYVEaEJnTB+Eqy1BmrKFFjaEzaXRovQ
	1v96aod/sAsVab5mnY3j7wdPDZVi5JO2EMkFOEky8N3QX0vBXX4LPGaJkkzgSSp1yjfNnUk5MJu
	7McRt8SPQN2USgDY1gRG4NSIniPqSh75Qm1t8KkQGkueKC2bZjdJkFPRsW7Eq6vHj09okUFp0yN
	GX47gAeUf4q3C2ocYEWB/Rh8UPvrcGtlXHt9i7ORhrL7x6hOL8BEfytvwoPZ+k3PgnlJMQJ5hGQ
	37Y78L7WFQvZsyj9b1PrGbkT+6YNAPCR92QAxve45ZVmL+6hRve5t9jAYlwn1ArVi7XKPHn/46A
	ouG9U7rsPrTuJzFaKXi6PuUHaaQdqX0t/C+cEQv4j1neJPITo/NTi63XFScE=
X-Received: by 2002:a05:6214:124c:b0:921:161a:b17e with SMTP id
 6a1803df08f44-9213498856dmr319005746d6.3.1795596610191; Wed, 25 Nov 2026
 00:50:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <7732873.EvYhyI6sBW@fw-rgant> <20261125075716.2262174-1-zxyan0222@gmail.com>
 <d515df02-0cb7-4641-a6ed-d73f2220f5c5@bootlin.com>
In-Reply-To: <d515df02-0cb7-4641-a6ed-d73f2220f5c5@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Wed, 25 Nov 2026 16:49:58 +0800
X-Gm-Features: Aa3M54qogCRfGRjMdhXVV7JZ70rq5pMVX6XB8mYHty8P7davZNgqCbSK2atTVWU
Message-ID: <CAP7veTJnJEmqAr4pfzSwLPNHCFc=yuzzAbkeLEvAMjZf71-dcQ@mail.gmail.com>
Subject: Re: [RFC PATCH] net: stmmac: Fix the problem about interrupt storm
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: romain.gantois@bootlin.com, cathycai0714@gmail.com, avifishman70@gmail.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_005015_103501_387BBDA1 
X-CRM114-Status: GOOD (  32.18  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Maxime,

On Wed, Nov 25, 2026 at 4:10=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 11/25/26 08:57, Zxyan Zhu wrote:
> > Hello Romain, Cathy, Avi,
> >
> > We hit exactly the interrupt-storm scenario you discussed, on a local b=
oard
> > running a PREEMPT_RT kernel, and I'd like to ask whether this series is
> > still being worked on.
> >
> > Our setup and trigger:
> > - stmmac with dwxgmac2 (xgmac) and dwmac4 (gmac) MACs, kernel 6.18.34+
> >   with PREEMPT_RT and panic_on_rcu_stall.
> > - Trigger: fault-injection of an uncorrectable MAC safety error, which
> >   makes stmmac_global_err() schedule stmmac_reset_subtask(), i.e.
> >   dev_close()/dev_open().
> >
> > Symptom:
> > About 30 seconds after the injected error the board panics with an RCU
> > stall (rcu_preempt detected stalls, rcuc starved).
> >
> > Root cause (confirmed on-board):
> > - The main level-triggered IRQ storms at roughly 820k irqs/sec during t=
he
> >   reset window (irq count jumps from ~220k to ~23M in ~28s).
> > - stmmac_interrupt() returns IRQ_HANDLED without clearing any status wh=
ile
> >   STMMAC_DOWN is set -- exactly the "unconditionally returning without
> >   clearing any interrupt flags" behaviour you flagged as dangerous.
> > - The level IRQ stays asserted -> infinite storm -> starves rcuc -> RCU
> >   grace period never converges -> panic.
> >
> > This matches Romain's point: the unconditional early-return in the
> > STMMAC_DOWN state is the actual storm source, not the TMOUTEN/safety
> > watchdog.
>
> Taking a step back, I wonder if the right move is not to just get rid
> of STMMAC_DOWN entirely.
>
> It seems to me that it does not protect stuff that much, reading the
> different sites in the code where it's used... It just seems to cause
> more problems than it solves. All of them work without STMMAC_DOWN
> if I'm not mistaken.
>
> It's even misleading, as it's only set during a reset from the service
> reset subtask, while most of the callsites seem to assume this really
> means 'interface is down'.
>
> I think this is the better lead to follow there.


Thanks for the feedback. Agreed -- removing STMMAC_DOWN entirely is indeed
a cleaner fix than the interrupt-masking approach.

We'll try going in that direction, and report back if we make progress or
run into questions.

Best regards,
Zxyan Zhu


>
> Maxime
>
> >
> > Fix we validated:
> > disable_irq(priv->dev->irq) right after set_bit(STMMAC_DOWN, &priv->sta=
te)
> > in stmmac_reset_subtask(), before dev_close(). This masks the level IRQ
> > during the synchronize_net() window.
> >
> > Results: irq count peaks at ~724 instead of ~23M.
> >
> > Questions:
> > 1. Is anyone still working on this series, or should we revive Cathy's =
RFC
> >    with the evidence above?
> > 2. Would a patch along the lines of "disable_irq around the STMMAC_DOWN
> >    window" be acceptable, or do you prefer the more general approach yo=
u
> >    suggested -- wrapping the STMMAC_DOWN set/clear in a handler that al=
so
> >    disables all interrupts?
> >
> > Best regards,
> > Zxyan Zhu
>

