Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB89606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mSwJS2mw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0kXFOjT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/0vlj8biEbEIWWLJtlyy4L8kRDSEsonB5oCN5/5B1Ag=; b=mSwJS2mwr8ayoP
	4PNE/g3BcVdNHoSh7CULAOdVFR0HY1w+KOGAngvUiXkYvT5yvuHfDdVFar3AgmrLV9E/zKO5MuMDc
	B0pJpzSKIBz8pVDPb0dHD6WOQLShNAkwI/QZHLIJOZpVo5pd771LauAfafedtvT4dAei6WXLpBaSn
	PkA2W8A2hMuup9EqlWTab0RTT8NXgDMoiNmXZqDjB+p8Fu7fQTRNuZAY41SesgvMmf9NLZ3CuCAWY
	6yy/Z2Qz25QZ3o2tSxZVmDZCBs80vr0hyJ4yR2AmrWvgm1EKGJzOOPyhVIkDXtOYidJCJ5y9BgU6t
	1kjd/UyxzsujfixZLyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKC7-00000008Tuu-1C3u;
	Thu, 12 Nov 2026 02:05:43 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKC4-00000008TuD-24sR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:05:41 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-91e8938fd01so41386956d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 18:05:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794449139; cv=none;
        d=google.com; s=arc-20260327;
        b=bg/IDPlEke8MRp8DbAn2xXD3FIOX/VT6rV5fu5k+D17HmCeO6GlhZkp+7Q5YEk7cNY
         T1n76/6ZfKPXPU//RpkolEYBFBqkEqzT4RFJr71JZzSEL1qJeqonr4fjSjYeXrkdEQiD
         Vs+2imlZlF0t69p6F/RpnqgkHmMlCzVB67p9cDhDZ5tyZT4cVzrbOH/F/kNtNkDIrX/C
         OxAvMotnjSuKbAWOm9FVU4Qpxzu8Fr0CbKJAdq8r6x4YTUaw5YxcihvdNynIasycegvc
         Mqd/YlBlC/W4fOZH31f0OtUwUMl0smOAGnW2tE2QbK0UpguJKnXmm8umuzZrNgcarSjO
         pW+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/0vlj8biEbEIWWLJtlyy4L8kRDSEsonB5oCN5/5B1Ag=;
        fh=rK93Yl8Qp8aOHJ1FoFVkhdINYssbnrS4CdDbKhnz9Lw=;
        b=g6MpRbZH4E8oDnkqneBE+1qkLZNlvkuVDIhPn9uxOLk9wdWMa9evmTFnxcZioHlPUl
         LB8yERNRbgcybGhkgEdebS/2KtD2MKIAwtrXpGJuK58Gh3c+geVqy9mHXGySTNaKZ/Za
         nZMNdaPxbUHAt8AK+fROQKeoBalRTiOD8Dxhea++Yq1VrBa14Xd8mlksXSTSFKninril
         Fol3vWyjB+JIpRNmjCxMoqvdEKGukJFwSPazS2TNONe3cqSDYl9X4QSjEYZ8+YFZc9/b
         9Ymf1ChdaZ8/ZNIgw2lIXe2g3Dcm1p5BY0J1HnSEOth1AGZegEwZoKNcCM9WLn8THG0L
         Kbvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794449139; x=1795053939; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/0vlj8biEbEIWWLJtlyy4L8kRDSEsonB5oCN5/5B1Ag=;
        b=s0kXFOjTUhw30V4TMDXPlk0ZjhprjpNk3qv7kJFVZVviG/GBdex0MWoNAiAOX8EEOb
         06Dgu5PS/hwFgeu9PZyHB5XXJkRIa1DjUOIyk/I7SV1MTIi3+3B/MHkOSk/ouAkANmy+
         KUEtQgbD/aA/NcqNVzWH+qnoFFAk2RCQD08mPmAxW8mOgv5M1IFIIvFbTG6dNPPPjIvX
         MAet3r+lKVgQKSYNIYRptEectlRN1eDqRuuaMjZh56V7L5AMjUsKJNBzwgueKfBfFRto
         TaJL+uTzbauyqPxQy/9JETBQfCubIpaQRQ4QsUA4ZHjVBEV9swrusPLwbcDccASA9alp
         uo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794449139; x=1795053939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0vlj8biEbEIWWLJtlyy4L8kRDSEsonB5oCN5/5B1Ag=;
        b=nHiIkk2qK3oZcUWH9s61Je3wHY4ncV5nfzUjyeFPRENv6t3k0pbdIE0cP6jBPr0W3c
         AEQvpH3LYQFfgs76Ru9vohiCku4VbDzAc5ot1uSDiM2I9WDvJLW/BR0OTfUcdlqFa8ht
         vEmh+bZoNCnxAna3zONEctq0pJ+Up9bVmPGt2onc5CrEmPYJWe6BNqbBW4zv5rsFW3P2
         9Z+qAOypTn2yX9MPAmpKu+L0aMWyJAelmtOZvkOk2i6Ut7/0VSOmwVk8DluET3bBWtli
         4CFqtgmpOhp7j6qaHaGxlfVMRKcHG1GEJQTouAzv5xlZm9KwY263SAR5ZjCEvLfuTSpn
         QHfw==
X-Forwarded-Encrypted: i=1; AL+hErHeRUWtRieNZasY9fLbUVglOzVtv7ZkBO6R8ODen5C0f5Z3sr1YYH6Ivtx6WEIRKMm1GNAeRu6ng55oLetPVsOK@lists.infradead.org
X-Gm-Message-State: APuU4Z/IDF4WB2kMaYBt4gcm/rg1dJofkcrKTtgnbqHKUit/9gcOYz0a
	XAQO/ooBNDLfTZCYCMHSHA4WoUcqL47i4I4trE1Pd5oVJwVdCYn6aAYUMebke9f5bRX6E5Bw01u
	j9pSp5bQB/C9bQ538CShaJanIOi91Muk=
X-Gm-Gg: AYBFou1eF/43o7l4EOaWBUknj1Axhad3gZ8noWDsbMt0cL9KH1hx8kNskNN+R8wvaA5
	95BxYa+FiTVuX3pqnTsQAEIapfwV/mB0l+M/UmvKnTiHxhherJQgNLDeb/Gl8mQN8jg62W2ShL1
	0m+EXtScORqgsU/j6UZBTOTabS27yglaFYrJrHlSVQk+Oe3i72xygMpPgvaMSladVKikdQtNQ8k
	0lVFWGkRKCm0jArfqO45jQj0V8bjAaA7GigPtzH1SuUxMzR0AI9cbgXw3BbaHMfEv/Zwnru7sQa
	Zn8pSUUfygcwboebkaxMhiwBOsnTsD4lGUvylvY1z5IS43fIeeoLdeSh/UKWL1rFE2RJKDCV9If
	n8CbVQFDawIzi1ckj+CNKgnvzVuiIUTfHuzow
X-Received: by 2002:a05:6214:43c4:b0:91e:a16b:7f59 with SMTP id
 6a1803df08f44-91f041a3015mr70947606d6.32.1794449139052; Wed, 11 Nov 2026
 18:05:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111143322.2234321-1-zxyan0222@gmail.com> <8cecf0d6-d04a-4bb6-91fb-b5c9b091ae8e@bootlin.com>
In-Reply-To: <8cecf0d6-d04a-4bb6-91fb-b5c9b091ae8e@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Thu, 12 Nov 2026 10:05:27 +0800
X-Gm-Features: AclHuK_JBKbEg5YNVMjlOYXo-dms9mDeiUQevOueQJI8T7Konue-phx2WH1WrNg
Message-ID: <CAP7veTJVEs9rU66+1PXZt-BvfwGPUiXEwkO2nR6ftVYytTbvAw@mail.gmail.com>
Subject: Re: [PATCH] net: stmmac: program the FSM timeout timer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk, Jose.Abreu@synopsys.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_180540_599607_E0EBA973 
X-CRM114-Status: GOOD (  33.27  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Maxime,

On Thu, Nov 12, 2026 at 12:19=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 11/11/26 15:33, Zxyan Zhu wrote:
> > stmmac enables the FSM timeout checker (TMOUTEN) but never programs the
> > MAC_FSM_ACT_Timer register.  Per the databook the checker only fires on=
ce
> > NTMRMD is programmed with a non-zero duration; NTMRMD =3D=3D 0 disables=
 the
> > timer, so with TMOUTEN set but the timer left at reset a stuck FSM is
> > never reported and the advertised timeout protection is ineffective.
> >
> > Program MAC_FSM_ACT_Timer right after TMOUTEN is enabled, deriving the
> > TMR field (CSR clocks per 1us tic) from the CSR clock rate and defaulti=
ng
> > to a 1s timeout.  A platform can override the default through the new
> > ntmrmd field in stmmac_safety_feature_cfg.
> >
> > The issue was hit in testing on a downstream platform, where a stuck FS=
M
> > was not reported through the safety interrupt despite TMOUTEN being set=
.
> >
> > Fixes: 8bf993a5877e ("net: stmmac: Add support for DWMAC5 and implement=
 Safety Features")
> > Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC c=
ore")
> > Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
>
> IMO this should go to net-next, this seems to just never have worked.

OK, I'll resend this as a net-next patch.

>
> Out of curiosity, did you test on dwmac4 or on dwxgmac ?

Both. The timer programming was tested on dwmac4 and on dwxgmac.

>
> Maxime
>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 20 ++++++++++++++++++-
> >  drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  6 +++++-
> >  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +++
> >  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 20 ++++++++++++++++++-
> >  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  3 ++-
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  8 +++++++-
> >  include/linux/stmmac.h                        | 17 ++++++++++++++++
> >  7 files changed, 72 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac5.c
> > index f1bb981cab7c..4ab7a3df98c6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > @@ -2,6 +2,7 @@
> >  // Copyright (c) 2017 Synopsys, Inc. and/or its affiliates.
> >  // stmmac Support for 5.xx Ethernet QoS cores
> >
> > +#include <linux/bitfield.h>
> >  #include <linux/bitops.h>
> >  #include <linux/iopoll.h>
> >  #include "common.h"
> > @@ -184,7 +185,8 @@ static void dwmac5_handle_dma_err(struct net_device=
 *ndev,
> >  }
> >
> >  int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
> > -                           struct stmmac_safety_feature_cfg *safety_fe=
at_cfg)
> > +                           struct stmmac_safety_feature_cfg *safety_fe=
at_cfg,
> > +                           unsigned int csr_clk_mhz)
> >  {
> >       struct stmmac_safety_feature_cfg all_safety_feats =3D {
> >               .tsoee =3D 1,
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
> > +     }
> > +
> >       /* 4. Enable Data Parity Protection */
> >       value =3D readl(ioaddr + MTL_DPP_CONTROL);
> >       if (safety_feat_cfg->edpp)
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net=
/ethernet/stmicro/stmmac/dwmac5.h
> > index 00b151b3b688..734e7630f28d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> > @@ -8,8 +8,11 @@
> >  #define MAC_DPP_FSM_INT_STATUS               0x00000140
> >  #define MAC_AXI_SLV_DPE_ADDR_STATUS  0x00000144
> >  #define MAC_FSM_CONTROL                      0x00000148
> > +#define MAC_FSM_ACT_TIMER            0x0000014C
> >  #define PRTYEN                               BIT(1)
> >  #define TMOUTEN                              BIT(0)
> > +#define MAC_FSM_ACT_TIMER_TMR                GENMASK(9, 0)
> > +#define MAC_FSM_ACT_TIMER_NTMRMD     GENMASK(19, 16)
> >
> >  #define MAC_PPS_CONTROL                      0x00000b70
> >  #define PPS_MAXIDX(x)                        ((((x) + 1) * 8) - 1)
> > @@ -82,7 +85,8 @@
> >  #define GMAC_INT_FPE_EN                      BIT(17)
> >
> >  int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
> > -                           struct stmmac_safety_feature_cfg *safety_cf=
g);
> > +                           struct stmmac_safety_feature_cfg *safety_cf=
g,
> > +                           unsigned int csr_clk_mhz);
> >  int dwmac5_safety_feat_irq_status(struct net_device *ndev,
> >               void __iomem *ioaddr, unsigned int asp,
> >               struct stmmac_safety_stats *stats);
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/n=
et/ethernet/stmicro/stmmac/dwxgmac2.h
> > index f8ab347f7b5b..1fd501728b18 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > @@ -169,8 +169,11 @@
> >  #define XGMAC_HWFEAT_PCSEL           GENMASK(1, 0)
> >  #define XGMAC_MAC_DPP_FSM_INT_STATUS 0x00000150
> >  #define XGMAC_MAC_FSM_CONTROL                0x00000158
> > +#define XGMAC_MAC_FSM_ACT_TIMER              0x0000015C
> >  #define XGMAC_PRTYEN                 BIT(1)
> >  #define XGMAC_TMOUTEN                        BIT(0)
> > +#define XGMAC_MAC_FSM_ACT_TIMER_TMR          GENMASK(9, 0)
> > +#define XGMAC_MAC_FSM_ACT_TIMER_NTMRMD               GENMASK(19, 16)
> >  #define XGMAC_MDIO_ADDR                      0x00000200
> >  #define XGMAC_MDIO_DATA                      0x00000204
> >  #define XGMAC_MDIO_C22P                      0x00000220
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index 1a88cbaed70c..76c850ea13a5 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > @@ -4,6 +4,7 @@
> >   * stmmac XGMAC support.
> >   */
> >
> > +#include <linux/bitfield.h>
> >  #include <linux/bitrev.h>
> >  #include <linux/crc32.h>
> >  #include <linux/iopoll.h>
> > @@ -835,7 +836,8 @@ static void dwxgmac3_handle_dma_err(struct net_devi=
ce *ndev,
> >
> >  static int
> >  dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
> > -                         struct stmmac_safety_feature_cfg *safety_cfg)
> > +                         struct stmmac_safety_feature_cfg *safety_cfg,
> > +                         unsigned int csr_clk_mhz)
> >  {
> >       u32 value;
> >
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
> > +             u32 ntmrmd =3D safety_cfg->ntmrmd;
> > +
> > +             ntmrmd =3D (ntmrmd >=3D STMMAC_NTMRMD_1US &&
> > +                       ntmrmd <=3D STMMAC_NTMRMD_64SEC) ?
> > +                      ntmrmd : STMMAC_NTMRMD_1SEC;
> > +
> > +             writel(FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd)=
 |
> > +                    FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_TMR, csr_clk_mh=
z),
> > +                    ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
> > +     }
> > +
> >       /* 5. Enable Data Path Parity Protection */
> >       value =3D readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
> >       /* already enabled by default, explicit enable it again */
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/e=
thernet/stmicro/stmmac/hwif.h
> > index 8ae95e91a36a..395655b01ea8 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > @@ -378,7 +378,8 @@ struct stmmac_ops {
> >                            bool srgmi_ral);
> >       /* Safety Features */
> >       int (*safety_feat_config)(void __iomem *ioaddr, unsigned int asp,
> > -                               struct stmmac_safety_feature_cfg *safet=
y_cfg);
> > +                               struct stmmac_safety_feature_cfg *safet=
y_cfg,
> > +                               unsigned int csr_clk_mhz);
> >       int (*safety_feat_irq_status)(struct net_device *ndev,
> >                       void __iomem *ioaddr, unsigned int asp,
> >                       struct stmmac_safety_stats *stats);
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index f8dceafdda2d..52f63f624d67 100644
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
> >               stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_c=
ap.asp,
> > -                                       priv->plat->safety_feat_cfg);
> > +                                       priv->plat->safety_feat_cfg,
> > +                                       csr_clk_mhz);
> >       } else {
> >               netdev_info(priv->dev, "No Safety Features support found\=
n");
> >       }
> > diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> > index 00be2df63d22..cb470a153bf8 100644
> > --- a/include/linux/stmmac.h
> > +++ b/include/linux/stmmac.h
> > @@ -168,8 +168,25 @@ struct stmmac_safety_feature_cfg {
> >       u32 edpp;
> >       u32 prtyen;
> >       u32 tmouten;
> > +     /* FSM normal-mode timeout value (MAC_FSM_ACT_Timer.NTMRMD). The =
TMR
> > +      * field (CSR clocks per 1us) is derived from the CSR clock by st=
mmac.
> > +      * 0 selects the default 1s timeout.
> > +      */
> > +     u32 ntmrmd;
> >  };
> >
> > +/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
> > +#define STMMAC_NTMRMD_1US            0x1
> > +#define STMMAC_NTMRMD_4MS            0x2
> > +#define STMMAC_NTMRMD_16MS           0x3
> > +#define STMMAC_NTMRMD_64MS           0x4
> > +#define STMMAC_NTMRMD_256MS          0x5
> > +#define STMMAC_NTMRMD_1SEC           0x6
> > +#define STMMAC_NTMRMD_4SEC           0x7
> > +#define STMMAC_NTMRMD_16SEC          0x8
> > +#define STMMAC_NTMRMD_32SEC          0x9
> > +#define STMMAC_NTMRMD_64SEC          0xa
> > +
> >  /* Addresses that may be customized by a platform */
> >  struct dwmac4_addrs {
> >       u32 dma_chan;
>

