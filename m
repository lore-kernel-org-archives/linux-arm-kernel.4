Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36511606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qLxxliIf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MBV9Uy0Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Oho1xmtj65FmYOXL2GEcPL6DfHTszkZM74IxrPJmq7k=; b=qLxxliIfPUN3Jx
	c6HVyVB24XzDriwR9k4M4RPpQvyzA5CSY8QutUkSm1E7NkWJzGQPSvAtCutnWk+2rnSgUTv2v7Cl1
	C4OWBC0d1CAOoax2MxBqXmVT2hoEqh+QBki537zcHEwjtsvjNm0XJG0yMSpcgGBUHAPW7Smp641q+
	/JmUNvolgBTnM2rbqCsLfrqCjDwmzhCC+3nVfH2wT1jyp9TfYZYTpj8X7UO20/gmr0h5hnv1oiiY3
	fpVoOXIvyRq++0gMfkv1d29X/qTJIoOadbIPsSlfCeG+DSKMFb1Uuu0DXkn9uOhm+Esz+0o3MqBiH
	IYHyNvkQN8UhIRGD0jlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8HF-000000093Nv-0DdB;
	Wed, 25 Nov 2026 08:22:53 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8HA-000000093MV-3KYV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:22:50 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-921342fae7eso59187556d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 00:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795594967; cv=none;
        d=google.com; s=arc-20260327;
        b=XTTXxNGWAHH9nSMDlK10DiiTkSQqZnMZGKZdme4KanA3pudpKsnNDPb+rsUZeUArdf
         wYysGAW7UYSO9hzACdN5SV34YWALBgJXKxArBO34U8ecsEOnZCqLwWHXIkv/3ZL74dzr
         qbebW7bTkFmuowLPCDKrKBCKL5dEjuwm9REFC0KSiUrfhz6Mbx+51PitpBqVvhQ8zaP6
         EFkUSlGnGdZRQejKhnV/H4npDsc+wkkpKnSYyVMkqGZ4Xby8hV7GJbiprain3Yl5kp/g
         t6Y6rwPbQduOt7YDBdOF9pPxzHFuoOmuaatp16MGxTr/+rGkVtY36Cg38emgS6NhXPDs
         HZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oho1xmtj65FmYOXL2GEcPL6DfHTszkZM74IxrPJmq7k=;
        fh=VYFgf7iyK/aVGx9Wn+LCZtvSDEPce2Sk4s4cpP3iswA=;
        b=REO701TiXaATiV8X4o8Mai4fGoZ2RvQizRRpzNspzwBWn87SBKs3ITg+JXfg4jTaBr
         9EF4z0rOCfiSyNNDe7jCDsZbgHgHpW+/Prn0J2PGAzt4nBpwVvqP/I025elPiVDylu/l
         Ie5+Ei8E4qrb3NdKZPs3LoY8AiYYB090r9sPg0QQ6hblmZULf6Qlu9ravGRkQNAMR1gu
         6NAEjoVhznCx/kIOJFNmFZfqTL0Lcl42CWvFhoJpGC44KxS3/11VJYNRGYEZCEuDrnep
         JYZtoX0H2kFspbjC+qwoFFNk+qJ2KDyJYEKK3BwQMnPCSB4RuyYKvzmfHlqo4JYPVgHS
         WRrw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594967; x=1796199767; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oho1xmtj65FmYOXL2GEcPL6DfHTszkZM74IxrPJmq7k=;
        b=MBV9Uy0ZbHyO76BoinI03y98JrBXSdl1kftr/w/35XZwnhZfUDZjL9yciw8YK7xHUb
         cFDeMmoAhoI7L0Oz3lajuEk+UJWJep1X5/ovVwHCcTViXKc0JI2UtWzmBptd62Wyri1f
         9fpp4sANwRG7hHCSljdqFDFQ64ttVOm9P7r7j2olaZGAPAyDjckIxYyOk8yL/UfCYsuJ
         B0MFrIWYyUewUMvKWU02vvNg3abZQdUZdDH5T0xUVAqNNdtsOSrBGr+iQVG4NxCEaQCD
         v017z9GqkUT42PRB6GzFFSB/6bTiw633yiIEiqLNiV7dwub6WV2XTHNeA+bafgDuNWMT
         k/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594967; x=1796199767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oho1xmtj65FmYOXL2GEcPL6DfHTszkZM74IxrPJmq7k=;
        b=CL2W1C6ytRwRJxyBriZS2X7vIrzSoK+Gu3qDtHEFzDtCF1z4M36bkFOADVOuDpbrkL
         FpGKzx5SjhARpY1xiGllvwc/zL8YNIC8TWB/A8FzOUWvoA8/qypN0fnba0ajKWbSfLYU
         mIJi93zDABXW+W85GBl2A1sexaD1ZdDD6zZWyGO33vSSVq/1kcflUVAQ35bTiI5XpyjU
         IUgjUchpAgDefDh97bqrcZOg2CR1F4OoQnwOIp7nU1jJyKt9LgyEsHOFZ3e+DsgOuGEr
         q1iukcNq1Ti/LY9LTfoIyy8GP20RqmGB8cM99pHpEctA93KPIi1sEbu6poY9ni2Z4+Sh
         B/SA==
X-Forwarded-Encrypted: i=1; AL+hErE6FfnGtpNNX1rpS486xM6mpkj4L3QzuwaDXoD6U66Nr2zpDdz5TsON13SH7woCE/FHBT4pD/olirW5GDfBAxTi@lists.infradead.org
X-Gm-Message-State: APuU4Z9Fz8irhw/QoFb/M4SKYY05ohv5kMfr5oE3vS+E8AUNDfJpw/cW
	jp4jPfCAU4gBWO7L4Z8YHRq8L/vB4Ffde5EOBk+3Xr+dOwEuRCF471Cvvm7vEmeKy9MMLTN2IDA
	YJ1ma6HEarqGC2q8rro3KixecCgzbkgg=
X-Gm-Gg: AZFdTZcWldQCmJ9loZdmSX2E29zvmGooU095xzG+s0+PDOQUyAP97dNA0IZ+cQiRIP4
	5VgRgtzAGlqG6+tEzKG2Wysrq5esD644e2oUcYQvRE/svvlcSDbO0qDSlVAY72koOiLZ+HB2ooQ
	fGI8/Desa9zR0OtK0l3cxVeYWX3rhHFagKGXP2PlBI2cYM6hgU9M9taSeCE47I0lNaPM9T2/CNE
	Tn3ZOLTEiWQkfidVQ1cfx6Jfb13MOU4zi9+DL3350TFozeSWB7i21zie8BxrK4s1mDIdY6ujO+A
	MMyuXG66G0uaHVR47qO6VqGRbCVIVFIZfANz44oLXoitpMViJGukWKjBnCPd5/7FKvQb43HA84f
	iIM++nwFgHARvErav4DKT0plzaVCZkHJBQ0yo
X-Received: by 2002:a05:6214:4902:b0:921:4095:deae with SMTP id
 6a1803df08f44-9214095e374mr275869476d6.42.1795594967356; Wed, 25 Nov 2026
 00:22:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118025528.2703790-1-zxyan0222@gmail.com> <179520945915.3135.14304625182301747705@kernel.org>
 <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com>
In-Reply-To: <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Wed, 25 Nov 2026 16:22:36 +0800
X-Gm-Features: Aa3M54p_SsKnYA1fkhhch1lh4sekLQ8FDtnE0xjVxJSelF4g56LC_eSsC56YYio
Message-ID: <CAP7veT+EjJabWrvczNwcZQ16P_SyH_rAQkTz+nf1G+FjxMvgNw@mail.gmail.com>
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_002248_850657_06D864FB 
X-CRM114-Status: GOOD (  29.72  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Maxime,

On Wed, Nov 25, 2026 at 12:13=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
>
>
> On 11/20/26 22:17, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 6 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 2 =C2=B7 Low: 3
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [High] On every in-tree XGMAC platform, the XGMAC half of the fix nev=
er
> >   runs.
> > - [Medium] csr_clk_mhz is only computed when priv->plat->stmmac_clk is
> >   non-NULL.
> > - [Medium] The patch turns on an FSM timeout check that resets the
> >   interface, with a hardcoded NTMRMD =3D 0x6 (about 1 s) for every=E2=
=80=A6
> > - [Low] The commit is written as a bug fix: the protection is
> >   'ineffective' and a stuck FSM 'was not reported through the safety=E2=
=80=A6
> > - [Low] The patch adds ten STMMAC_NTMRMD_* register-encoding macros (1U=
S
> >   .. 64SEC) to include/linux/stmmac.h, the platform-data header shared=
=E2=80=A6
> > - [Low] The same clock (stmmac_clk) is converted into a 'CSR clocks per
> >   1us tic' register value in two places that use different conventions.
> >
> > --
> >
> > net: stmmac: program the FSM timeout timer
> >
> > This patch programs MAC_FSM_ACT_Timer on dwmac5 and dwxgmac3 cores afte=
r
> > TMOUTEN is enabled. TMR is set from the CSR clock rate in MHz, and NTMR=
MD
> > is set to a fixed 1s timeout. A csr_clk_mhz argument is added to the
> > safety_feat_config callback, and NTMRMD encoding macros are added to
> > include/linux/stmmac.h.
> >
> >> The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM =
was
> >> not reported through the safety interrupt despite TMOUTEN being set.
> >>
> >> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
>
> [...]
>
> > [Severity: High]
> > XGMAC_TMOUTEN is set just above without looking at safety_cfg, but the
> > timer is only programmed when safety_cfg is non-NULL. Does any XGMAC
> > platform set plat->safety_feat_cfg?
>
> This looks valid, on what xgmac platform did you test that ?

Agreed, it's a real gap. The dwxgmac path was tested on a downstream
platform whose glue does allocate safety_feat_cfg; none of the in-tree
XGMAC platforms (dwmac-tegra, dwmac-socfpga) set it, so the timer write
never runs there.

In the next revision I'll make the timer write unconditional, matching
the unconditional XGMAC_TMOUTEN set just above, so NULL-config platforms
program it too. Adding an all_safety_feats fallback (like dwmac5 has)
and gating PRTYEN/TMOUTEN on the config is better done as a separate
patch.

>
> Maxime

> [Severity: Medium]
> Is a fixed 1s timeout long enough at every link speed? A link partner can
> send PAUSE frames with a quanta of 0xffff. At 10Mb/s that holds off the
> transmitter for:
>
>     65535 * 512 / 10e6 ~=3D 3.36s
>
> That is longer than the ~1.048s selected here. At 100Mb/s it is around
> 335ms.

Separately, I'd like your take on the hardcoded 1s timeout. At 10 Mb/s a
PAUSE frame with the maximum 0xffff quanta stalls the transmitter for
about 3.36s, longer than the ~1.048s NTMRMD programmed here. If the Tx
FSM is still timed during a flow-control stall, that would raise a
spurious FSM timeout and reset the interface. I don't have a 10 Mb/s
link locally to verify it, and the databook only hints at a large-mode
(LTMRMD) without being explicit. Would you prefer bumping the default to
4s to be safe, or is 1s acceptable?

Best regards,
Zxyan Zhu

