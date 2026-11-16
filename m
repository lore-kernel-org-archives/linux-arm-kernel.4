Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7CB606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 03:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YkLvLLEO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPf+Fd89
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dOlZAyE9vs/lqE824HqTB6ln1BIOlH2oNMzzigLgNRA=; b=YkLvLLEO1rF2sN
	IJ1MjM+OMxb22YJyn4IZrPimmX7CQzlm2pAJu2xKVI4nvSUexK8M/k0EqVJOaOdoFx9vC6AUUYVVS
	kKaLxlQ0ybvUM7VyBps0EW2goizmCs2/VfjHJlkVtsHruw01lsIi4LZ3w9EyxeJDLVCsqja4TnwWr
	h+PI+J6RRSrQVrH9Ny/Tpov45ivyJhgClyP/yh8MtV0BiWG15fi3QekjsraOKDSD9j/VLFxtSvoow
	gfbERvmKEBXXOzvZjNk2+9y4+j8bRFEw8BdeHQMHVxa1AybdjQQSff79Y8cYfMdK+UsaPI6r7U28M
	2ngO0pWc3Ix8jTeI9/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSncS-000000013gw-2vL4;
	Mon, 16 Nov 2026 03:43:00 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSncP-000000013gZ-2LnK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 03:42:59 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-91ea16d8072so31741326d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 19:42:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794800576; cv=none;
        d=google.com; s=arc-20260327;
        b=iVxcAqiV3VyxX5TrKzpNqQ2A8WEbdf7nWHe4r+UG9/jBWdFtWnqZvNXgoPOLs8YtMd
         vqlguUWJV5zObrEJCJEGZsZgkGtzBLx4WeY4yWNOl7Xr5ktvIb1owDRAMYi6S9eEdTS8
         8OxuAlGUbuA2Ze9//02MkukrrfVNzzVvjNn9/HHZqo/9zEwcNdcY8KjFi6u6dvXqJrHd
         sVA+++0uvGLlsgGOxv4NQiNlRST5YUl1yoEAeFh28ac/6i7TtrZEinrqeSLjumHDpby9
         JGGtN15Qdu3bkYKXzyiA0EEEPCME5bOxtMkwES2+qBZpw6D2Mg3LUQm2F6fXlMpTg89F
         Sw4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dOlZAyE9vs/lqE824HqTB6ln1BIOlH2oNMzzigLgNRA=;
        fh=MGivAFpNLrRhE75V6AxXZ4wiHhL2OqGKzLIDWBmKX6k=;
        b=bH7AoLux+i1hzjqz1cocizLHa1dIueFnG09U0PfHmE9aaOdzs5MQZsOLUqr6cgOdNk
         tGQw25rsmjZFBY1UBXqxZAywYxVk6v6z1BhScC32lvFTeFGwMBuorRG6e6AZ92fKLd/7
         82wunYOmC44YxB59hiLI+2wrUyzZ4mg4SHbdQRr2RRwOxekUZqZAGOzHT7XWJWQgnYHm
         v3NIlG7XNzUbT/jytj7nCU0pnk+MivVE6SeaBa8nXWSJGIYGFuTavlM4T5E7zkrWJjnZ
         Zy84dBlEyKGaUT1JKuQV4VDdpJXiWhPUohCnoN+NUrNzH0mnH86wYCIYokhc+qIXRH4S
         sZ2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794800576; x=1795405376; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dOlZAyE9vs/lqE824HqTB6ln1BIOlH2oNMzzigLgNRA=;
        b=BPf+Fd89+iiQu1oLGFufVFgFukZZ+d4lD0Q0XwyBKN+jHd7at8H6MOvjXuRdae4qj4
         FFeckSd0mV2J4rxFBQgJhVR05poRqjQIphSgIoSYoYnbSoh6xdcC+8PMbLi7bgE4xOLk
         2zsIXC95qy2MVYSSTAp2krCCRCs/I9oOYp0Y+mpBn9fq/4nG6VMBaiB2PUiZT3vsRBWy
         FAwaIBVG+4PbOHvAPZKnlTJbclp+yJhKx3xPrpCO8wC2UjSJqE1ZVmLd5qI8B3T2fKk6
         QG0Bx7C/8uHQNITonRNgXhy03fmUpjcFayCxOWqaFilQ7j47pRaLYUsJHZt8lIRurfhS
         bZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800576; x=1795405376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOlZAyE9vs/lqE824HqTB6ln1BIOlH2oNMzzigLgNRA=;
        b=qgo47m0i8kjf2PbAiRzhJHsK96Y8eLjR20JXMl3P6B6WdyRIpxsVxliBlrFV3c/wp7
         vo9UhGeCkCz0E2e1+wRZSEGTrWuzhIHIRMzGOWq0r2KsQC92xHjGbm+yIP0ypShGgBvQ
         8n9QiWUUDpaBGbLpXSRq/cmSk4AfpDNlVUt/9vFa2o1y1hMtY97EnMVjYV7551pmY0CE
         RUb1548z3GdBtkQaxhlQ1IVOzHAurKT58stOOkEAPHvZ0qSlGbBfkanP9rifDszLCyk/
         L/aMB8oYJXwsjiiaK7lvxZX2toyzauD0PntGODyC9i5JiFU6OkM92KfX5yY8l22pUiXF
         Gihw==
X-Forwarded-Encrypted: i=1; AL+hErH6emoXz3W21RZyZHMkdgkJ6dl6zHPvVhdp9rPR9iuZKwur6WO6GMHdK16li0RI2/4QYTRQv4hkj/Kk86E2sTHq@lists.infradead.org
X-Gm-Message-State: APuU4Z9p9Vk0DHVeiZblX7N1lSjQSwwmqg1SsUTyZ7Cd2ZOvJeAiFvRA
	rC4opglQ8rOzmffCuplZPFNSQsVrPS2WSv8lnySDcKN0y4c0mUejM7FWip7+W1qmlv9roxjEhrm
	lLY6R9MM3gu/nefaJQXgCgIlcgz8bnoY=
X-Gm-Gg: AYBFou0f0t6pBTe4he08exnYXe5g7gNpzi6kVCUcbZYHKIkmCTkhVweV9AB5zszRvwO
	dyB/To5zlG2avqeNCbZjGbi0yu/Vc/81kvJVpiOpyP80FRXdRKVedQ247NBBQXOTZ6Q4shQzxJE
	BjbVxZifgk+E4PWY0jMs6hK0G32BegOcPJvYUjucEzchr3vJBaR89oq1ZP1RLaMCepUsXVDKj54
	P2IelHaqylfETDEgeiK26FHYGY0zjNLjHuSUVvehsS7QIBYAa+xGEw3lHSWwyVFqYgMAn8oy0R8
	bSRnMAzXucL8OCRy3anlTgb1ttxFZc8OUxHpRMsLDaBQO+NwgCNWDnpvwPDAuHJjdR5pVi/m3iC
	NXq2yDRShO4cOTwYb1ojXZurJZP9CCCpxx4DRN5RSDHSC5mTHarEGKtc96g==
X-Received: by 2002:a05:6214:19ef:b0:91e:8ed6:896d with SMTP id
 6a1803df08f44-91f241c378dmr151744126d6.41.1794800575849; Sun, 15 Nov 2026
 19:42:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111143322.2234321-1-zxyan0222@gmail.com> <179475432482.2199510.1145189790252763539@kernel.org>
In-Reply-To: <179475432482.2199510.1145189790252763539@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Mon, 16 Nov 2026 11:42:44 +0800
X-Gm-Features: AclHuK8RWI64vYnkTEZed0w7lAVf5eQomaFuYuPxLHChMWyGtIZq8zcHC45Yt3w
Message-ID: <CAP7veT+DRYGQ79r+_1-i8bMjM1wuoNsVTDjQPLYJyAwHtxHPCw@mail.gmail.com>
Subject: Re: [PATCH] net: stmmac: program the FSM timeout timer
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk, Jose.Abreu@synopsys.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_194257_631312_D305D562 
X-CRM114-Status: GOOD (  44.53  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Thanks for the review. Responses below.

On Sun, Nov 15, 2026 at 10:52=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] On every in-tree XGMAC platform, the XGMAC half of this fix
>   never runs.
> - [High] The new code takes the CSR clock rate only from
>   priv->plat->stmmac_clk (stmmac_safety_feat_configuration(),=E2=80=A6
> - [Medium] dwmac5_safety_feat_config() (dwmac5.c:261-263) and
>   dwxgmac3_safety_feat_config() (dwxgmac2_core.c, around lines 887-889)=
=E2=80=A6
>
> --
>
> net: stmmac: program the FSM timeout timer
>
> This commit programs MAC_FSM_ACT_Timer right after TMOUTEN is enabled, in
> both dwmac5_safety_feat_config() and dwxgmac3_safety_feat_config(). TMR i=
s
> derived from the CSR clock rate and NTMRMD defaults to a 1s timeout. A ne=
w
> ntmrmd field in stmmac_safety_feature_cfg lets a platform override that
> default, and csr_clk_mhz is passed through the safety_feat_config callbac=
k.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac5.c
> > index f1bb981cab7cd..4ab7a3df98c6d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
>
> [ ... ]
>
> > @@ -245,6 +247,22 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr=
, unsigned int asp,
> >               value |=3D TMOUTEN; /* FSM Timeout Feature */
> >       writel(value, ioaddr + MAC_FSM_CONTROL);
> >
> > +     /* Program the FSM active timer so the timeout checker actually f=
ires.
> > +      * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in M=
Hz.
> > +      * Default to a 1s timeout when the platform did not select one.
> > +      */
> > +     if (safety_feat_cfg->tmouten && csr_clk_mhz) {
> > +             u32 ntmrmd =3D safety_feat_cfg->ntmrmd;
> > +
> > +             ntmrmd =3D (ntmrmd >=3D STMMAC_NTMRMD_1US &&
> > +                       ntmrmd <=3D STMMAC_NTMRMD_64SEC) ?
> > +                      ntmrmd : STMMAC_NTMRMD_1SEC;
> > +
> > +             writel(FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
> > +                    FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz),
> > +                    ioaddr + MAC_FSM_ACT_TIMER);
>
> [Severity: Medium]
> This writel() replaces the whole MAC_FSM_ACT_Timer register with only the
> NTMRMD and TMR fields set. Every other bit becomes zero. Is that intended=
?
>
> In the Synopsys EQoS/XGMAC layout, this register also has a large-mode
> timeout field (LTMRMD, bits 23:20) for FSMs that need longer timeouts. Th=
e
> patch doesn't define or program it.
>
> The commit message says a zero mode field disables the timer. If that als=
o
> applies to LTMRMD, would the large-mode FSMs stay unmonitored after this
> write? And if reset or boot firmware had set LTMRMD, would this write tur=
n
> that monitoring off?
>
> Should this be a read-modify-write, or should LTMRMD be programmed too? T=
he
> same whole-register write is in dwxgmac3_safety_feat_config().
>
> > +     }
> > +
>
Agreed, I'll make the MAC_FSM_ACT_Timer write a read-modify-write.

> [ ... ]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index 1a88cbaed70ca..76c850ea13a5c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
>
> [ ... ]
>
> > @@ -871,6 +873,22 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, =
unsigned int asp,
> >       value |=3D XGMAC_TMOUTEN; /* FSM Timeout Feature */
> >       writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);
> >
> > +     /* Program the FSM active timer so the timeout checker actually f=
ires.
> > +      * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in M=
Hz.
> > +      * Default to a 1s timeout when the platform did not select one.
> > +      */
> > +     if (safety_cfg && safety_cfg->tmouten && csr_clk_mhz) {
>
> [Severity: High]
> Can this block run on any in-tree XGMAC platform?
>
> When safety_cfg is NULL, dwmac5_safety_feat_config() substitutes a defaul=
t
> config, but dwxgmac3_safety_feat_config() does not:
>
> dwmac5_safety_feat_config() {
>     ...
>         if (!safety_feat_cfg)
>                 safety_feat_cfg =3D &all_safety_feats;
>     ...
> }
>
> stmmac_safety_feat_configuration() passes priv->plat->safety_feat_cfg
> through unchanged. The only in-tree platforms that allocate it appear to =
be
> dwmac-intel.c, dwmac-mediatek.c and stmmac_pci.c, and all of them are
> GMAC/GMAC4 cores.
>
> The XGMAC users leave it NULL: dwmac-socfpga.c, dwmac-tegra.c and generic
> "snps,dwxgmac" DT through stmmac_platform.c. Both dwxgmac210_ops and
> dwxlgmac2_ops use this function.
>
> On those platforms, XGMAC_TMOUTEN is still set unconditionally above, but
> the timer write is skipped. The hardware stays in the state the commit
> message describes as the bug, even though the patch carries:
>
>     Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC=
 core")
>
> This also contradicts the new comment "Default to a 1s timeout when the
> platform did not select one".
>
> There is a related mismatch when a cfg is passed with tmouten =3D 0: TMOU=
TEN
> is still set, but the timer is not programmed.
>
> Should TMOUTEN and the timer write be gated on the same condition? And
> should a NULL cfg be handled the same way dwmac5 handles it?
>
This is due to dwxgmac3_safety_feat_config() not having the
all_safety_feats fallback that dwmac5_safety_feat_config() has -- a
pre-existing difference, not introduced by this patch. Fixing it
(adding the fallback and gating XGMAC_PRTYEN/XGMAC_TMOUTEN on the
config, matching dwmac5) changes the existing unconditional behavior.
Perhaps it would be more appropriate to address this part as a separate
optimization later on.

> [ ... ]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index f8dceafdda2d2..52f63f624d67c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3639,10 +3639,16 @@ static void stmmac_mtl_configuration(struct stm=
mac_priv *priv)
> >
> >  static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
> >  {
> > +     unsigned int csr_clk_mhz =3D 0;
> > +
> >       if (priv->dma_cap.asp) {
> >               netdev_info(priv->dev, "Enabling Safety Features\n");
> > +             if (priv->plat->stmmac_clk)
> > +                     csr_clk_mhz =3D clk_get_rate(priv->plat->stmmac_c=
lk) /
> > +                                   1000000;
>
> [Severity: High]
> What happens when priv->plat->stmmac_clk is NULL here? csr_clk_mhz stays =
0.
> By the time dwmac5_safety_feat_config() reaches the timer block it has
> already set TMOUTEN, and it then skips the MAC_FSM_ACT_Timer write withou=
t
> any message:
>
>         if (safety_feat_cfg->tmouten && csr_clk_mhz) {
>
> Both in-tree platforms that explicitly set safety_feat_cfg->tmouten =3D 1
> appear to have no stmmac_clk.
>
> In stmmac_pci.c, stmmac_pci_probe() sets tmouten =3D 1 for snps_gmac5. Th=
e
> only CSR clock information is plat->clk_csr =3D STMMAC_CSR_250_300M in
> snps_gmac5_default_data(), and nothing in stmmac_pci.c assigns stmmac_clk=
.
>
> In dwmac-mediatek.c, mediatek_dwmac_common_data() sets tmouten =3D 1. The
> mediatek binding and dtsi files have no "stmmaceth" clock-name. As a resu=
lt,
> devm_clk_get() fails in stmmac_probe_config_dt(), which prints "Cannot ge=
t
> CSR clock" and sets plat->stmmac_clk =3D NULL.
>
> On both platforms the timer is never programmed and nothing is logged. Th=
at
> doesn't match the new comment on stmmac_safety_feature_cfg.ntmrmd, which
> says TMR "is derived from the CSR clock by stmmac" and that "0 selects th=
e
> default 1s timeout".
>
> Could this fall back to plat->clk_csr, use a different clock source, or a=
t
> least warn when the timer can't be programmed?
>
> >               stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_c=
ap.asp,
> > -                                       priv->plat->safety_feat_cfg);
> > +                                       priv->plat->safety_feat_cfg,
> > +                                       csr_clk_mhz);
>
Agreed, I'll add a netdev_warn() when the CSR clock is unavailable so
the skipped timer programming is not silent. I deliberately did not
fall back to plat->clk_csr: clk_csr selects the MDC divider (a
frequency band, e.g. 250-300M), it does not hold the exact CSR clock
rate, so it cannot derive TMR accurately.

> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261111143322.2234321-1-zxyan0222%40gmail.com

pw-bot: cr

