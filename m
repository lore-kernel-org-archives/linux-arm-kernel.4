Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F411606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4AVkKbpD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bLcZ8W5S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rQRyos+8rpsshZOWM7GC/VB17dJmJXzE29VCNIThb18=; b=4AVkKbpDPhElLv
	8jlm3+IaI9h4atqOvJ/OCcNjY1KPgRf7y6/GjKlRdnyONLAVHU/K/ZldG1qoMwnhX0+1Pg7MYJmKL
	a9YJcnctcK629roY25a9I/1IdaPIDlb+tGqo7CwFOp+339TxotdxymQjvXiP6bMcPAVi9kVcCPSgt
	kmiFuIPVNE2NCa424mb0QXWNiA1IpaJW6ZqAJjVcyRF3bURo3t04L3fZ6c5hhaTI3BZqdo+5Se3Jn
	wyEM2a2/RD9RK0dtgGVmUBfI5pkcNMlCs/Gbn+D5PARDwImPSgB7FqNwFQnE+GRWVMWyca9YfQo9L
	h2I0BqGqPibDxm3Kl+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ6b-00000005u26-35gZ;
	Tue, 17 Nov 2026 13:20:13 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ6Y-00000005u1E-3bRm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:20:12 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-93f2f2edb19so473922985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 05:20:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794921609; cv=none;
        d=google.com; s=arc-20260327;
        b=ezljhI2C540+T3x8GyYujA16WFMZI8ivpnqQdyZ/C537GZNKoLIlI/BNvtSv60jCoM
         rq5pQJ0Nzq01jG4bqoGgkhyGZokcWxUP5FWqdvRqd0qa4ruLHEOfCXO/iU553q+6wnP5
         lag3sO7PQbKCnwS3kNnA5if5IRiloBAzO/Njopm2uYVLlZFeGR4cObwr82V8lgbUinLW
         M1m/2znFiXNfUBvoULVZ77eohhp1pqArZ5flw+sOc93gtwkOald9GUDhUbIJrykr8K5P
         DU6hGLlm2xEy8qmrf8Dj6YClMWWpxA1jQEPZyxEbmrttBAqSl+5Ca0p1oKJYr5wQBEzO
         zVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rQRyos+8rpsshZOWM7GC/VB17dJmJXzE29VCNIThb18=;
        fh=Dk21dR4R1gwDxhKtSUGmp0gXSygPn4hlkJ1jldg8ltI=;
        b=o2nWPKCD7/5UQqOfxdpMe/WVm9WQR/hogrOZRNrfR/2skg1Kugzlski8aDTpxSzWXk
         4w2pqtIYKOFAoGnsUAnI75m+ucM3n5RbwamhTtJRdtpbMD4sUPYsD7rnz96wDaM+t+0W
         CENTjFnX+MAyYPWNC5OvGW6i2Ot/rAvgj9uDR0RaOiNqCIj/GLVuVWtS9lFANGMExjjK
         hYiNTsnC7ep5xJjRyP9eGcIwNvHG4SvxGjSfS1lPV+scIqPf6sriU7iKzpTSUqNPC/jm
         fWA/SonHEUv6TlBy7r4NN0cFxPUConTQ83URCGW+XeE8cBRUPh+m5AFGHBGXrrhdZ0gH
         aVtQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794921609; x=1795526409; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rQRyos+8rpsshZOWM7GC/VB17dJmJXzE29VCNIThb18=;
        b=bLcZ8W5SUvMzbZiWU2S3nG161gtW9bVjczKYijXiqkQEVmEUDbqIKxQhs3SFo+UPM0
         gjppoppCgIQCk3YNvi0tpLZc4ORNGB9B+kq4hhhbq9oKkh8LuHjlO1PsbQKACXMOBEu3
         ZmNAOtxeITYWQ6xRhUPlfP+1a8BS3SPlVxPoo3+jzADf7nY726r7+heJx6hllC0JOguX
         FxIaWXMDvw+zV4Cyjs1Sni74Dx9XP38OjtXUbes9nvglF5I+qjg9D0S4hPoMxFKH3QuJ
         YvIotOEYW8+ixsWrUjjS9+ebaJrcGGZPPa4LQJ0Rc7CsG4pYwRX+EA+X8EMkOI+rZVco
         Poog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921609; x=1795526409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQRyos+8rpsshZOWM7GC/VB17dJmJXzE29VCNIThb18=;
        b=Z8Qoh9l4PnF4RbpPUaOofoZgdnrhDvFJFw88W6KhCCLnWxa4XAKo7RCoOUXqy/kTD2
         rgQyW4SjTo13FiWqaGRtadjN6LVAHM7dpYBb6ZdfhHE8WCws4fbhuOVB/5uFLpNQet+t
         1RjGdpWLNsTaSJaqFQ83weXdxgZk/IP1STzBslrNEJFayr9dMw+RtU8o1VRz3g5Vnsuv
         bREW2vPtRLMsQmaphkgMRFIKhL0gnA/ShFjMF3w8l9tdQOW5A84IChDDUYWTcKSsx1bh
         f/CSL0JqpytrsseLWcFA59CLleDhBN+fVLTbeyMKYHicx8cABiVmO6vm2/0e70328kvY
         iQ9w==
X-Forwarded-Encrypted: i=1; AL+hErFZzdbw8SMGmKYMsxL7ls5t7D/+Llv9JsJ5tlG0Zo2tgPY5YiP5pS+DtBvHlx/EBksygnB4ll3Yx8zvMC8YFpUE@lists.infradead.org
X-Gm-Message-State: APuU4Z80bsiopu39LETy+cMy6leWAjV1dkFuxXk7X4P+lbqvplDjijod
	Y/SH3knBtvcpHDEyAwFWxMIv/hHgY8b7270W8NqndGanrj/xXewPu/7W662LcCS+RmQS8BJRBXE
	2/EbZmfYz9eKef8wk0VYSpyTcvthyecA=
X-Gm-Gg: AYBFou1AQ2PSJaydqihccfWX0ai5Tu4IYAZczkctBLF//2vJ2dvNBO2MXBpTyZZgQtt
	2wDnpuUZJ6Qw+QFpb3y/dBJp8OYdpAOm69V4+RBhw4ofRLNrf4rN95NZGRDIiEgovcHRcPjwtL3
	uYTapjxd4uJBZ+QV1Xeb7WYEUgGP+PSQOLBV5wOgyIrTXMHMJhW3ucRNB9rRn8xwz/a6DZq1zfE
	xO16FcAgRY4oCgjuOG+5GcxTdwv9CbX3+Z/8nqS0bqOhrDHlknaOFA+EZ4w7mbpWGZEBiTsr2Ei
	Wp9Duk5jQUILlFeSePDsWP76di3pG5Jlzvy6RsaJu4yeQe+EGJzaaeykHGh6tnm35Jsw+flmoI+
	7Mgk5XrY78nm7gWIWbwFNlZnmfgKFKtOu3VH8vYREKalNo8xVQ3kIIT3nUQ==
X-Received: by 2002:a05:620a:6290:b0:93b:d79a:c45f with SMTP id
 af79cd13be357-9494bc2f497mr2165071085a.55.1794921608734; Tue, 17 Nov 2026
 05:20:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116114923.1157920-1-zxyan0222@gmail.com> <6c323fca-5d38-40f4-a923-26bdf43cea7c@bootlin.com>
In-Reply-To: <6c323fca-5d38-40f4-a923-26bdf43cea7c@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Tue, 17 Nov 2026 21:19:57 +0800
X-Gm-Features: AclHuK_1Q0pkQCEzadIleCMZEaVMj74iy9pgAWyfWX8GfF-z1IJNpNrRlfthzWA
Message-ID: <CAP7veT+3eNY82uka0-x5MzburF_x7tyvvSdGnhQP9_EYs-Os2w@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: stmmac: program the FSM timeout timer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_052010_971546_239D0201 
X-CRM114-Status: GOOD (  32.16  )
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

On Tue, Nov 17, 2026 at 6:23=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 11/16/26 12:49, Zxyan Zhu wrote:
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
> > The NTMRMD field holds a power-of-two microsecond timeout per the
> > databook: 0x0 disables it, and 0x1..0xa encode 1us, 1.024ms (~1ms),
> > 16.384ms (~16ms), 65.536ms (~64ms), 262.144ms (~256ms), 1.048s (~1s),
> > 4.194s (~4s), 16.777s (~16s), 33.554s (~32s), 67.108s (~64s).
> >
> > The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM w=
as
> > not reported through the safety interrupt despite TMOUTEN being set.
> >
> > Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
> > ---
> > v3:
> > - Make the MAC_FSM_ACT_Timer write a read-modify-write so the other
> >   fields (e.g. LTMRMD) are preserved.
> > - Warn when a valid CSR clock rate cannot be obtained.
> > - Document the NTMRMD encodings and fix 0x2 to 1ms (was 4ms).
> >
> > v2: https://lore.kernel.org/netdev/20261112053321.1103678-1-zxyan0222@g=
mail.com/
> > v1: https://lore.kernel.org/netdev/20261111143322.2234321-1-zxyan0222@g=
mail.com/
> >
> >  drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 22 +++++++++++++++++-
> >  drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  6 ++++-
> >  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +++
> >  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 23 ++++++++++++++++++-
> >  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  3 ++-
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 11 ++++++++-
> >  include/linux/stmmac.h                        | 17 ++++++++++++++
> >  7 files changed, 80 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac5.c
> > index f1bb981cab7c..c1e3d634f153 100644
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
> > @@ -245,6 +247,24 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr=
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
> > +             value =3D readl(ioaddr + MAC_FSM_ACT_TIMER);
> > +             value &=3D ~(MAC_FSM_ACT_TIMER_NTMRMD | MAC_FSM_ACT_TIMER=
_TMR);
> > +             value |=3D FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
> > +                      FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
> > +             writel(value, ioaddr + MAC_FSM_ACT_TIMER);
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
> > index 7ad08651675e..b3f99a6dfcd7 100644
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
> > @@ -837,7 +838,8 @@ static void dwxgmac3_handle_dma_err(struct net_devi=
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
> > @@ -873,6 +875,25 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, =
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
> > +             value =3D readl(ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
> > +             value &=3D ~(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD |
> > +                        XGMAC_MAC_FSM_ACT_TIMER_TMR);
> > +             value |=3D FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD, ntm=
rmd) |
> > +                      FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_TMR, csr_clk_=
mhz);
> > +             writel(value, ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
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
> > index 552840d29668..949ed3e5bb05 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3691,10 +3691,19 @@ static void stmmac_mtl_configuration(struct stm=
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
> > +             if (!csr_clk_mhz)
> > +                     netdev_warn(priv->dev,
> > +                                 "unable to get a valid CSR clock rate=
\n");
>
> I know it's the bot who asked for that, but I don't agree with this log h=
ere.
>
> FWIU it's legit to have ASP but no CSR clock (e.g. stmmac PCI)

Agreed, I'll drop the warning.

>
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
> > index 00be2df63d22..35c39cd6b630 100644
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
>
> I'd rather this comment to be with the register value definitions :)
>
> > +     u32 ntmrmd;
>
> I don't see any user for ntmrmd. If this is prep work for upcoming glue
> drivers, then this should come with the driver in question. If really
> needed, can't we just program a reasonable hardcoded default for the
> time being ?

Right, ntmrmd was indeed added for upcoming glue drivers and has no
in-tree user yet. I'll drop the field and just program a hardcoded default
for now.

What default would you prefer? The databook doesn't suggest a particular
value for NTMRMD. 1s (NTMRMD =3D 0x6) is my choice because FSM
transactions complete in microseconds, so 1s is comfortably above that
to avoid false timeouts, and it sits in the middle of the supported
range. I'm happy to use whatever you deem appropriate.

>
> Maxime

Thanks,
Zxyan

