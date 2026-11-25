Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6E8606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MY1MHPRF;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=XZX31Aky
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1cMat0V7s4bMA1eHCHDEhCYo/kbvJy8/bkwjnbPTmUs=; b=MY1MHPRFzdDjPN
	yYKGhdLg0ADTeyGN0hKI13tARaqPtMGRQ2xjbq9LCsW6ozBxqQM9aSaekjMoHtrWieM7sH/M0bXdC
	oGH4mV1t/6yYWjjoj7lWkVXjI7sp7QTYCtpLHRETbk+iSAb+14pNEzE0Y7ydNh7lScVqk8G+EjR8I
	4F0waJbABGc15suv/H/v2Die8pAZ9apKX/vPah6lgis9rpIEO2Xg3VfDlLQaE3tTTSEwlgNDJITnB
	YJdezZUAzKMtDirP4G+wunpTMlxY8ROFRatVpB1inFdrrl9pzJB/hayweCjGat1ZMibCVcZ0ejpBB
	iQwqlvLzOZ5BODuVlvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGWh-0000000AfZM-0fAZ;
	Wed, 25 Nov 2026 17:11:23 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGWa-0000000AfUa-09P8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:11:17 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8b4b9ba815bso35176717b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 09:11:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795626674; cv=none;
        d=google.com; s=arc-20260327;
        b=LI5+5lsIVzJa1tJ4VnsT8v9Mye6tYlfuKiBYP4y7K77OrE1UiBu2RT17CbN31OHk9m
         But7dZD3XfbO7cMEC3In2E5zuufJxm154OiuRfUVPhMsDaVDYD1xHczSsAkym9IGeAh/
         L9LViL27B8KW9WVPBSaGVr++LsaL21MTz3tKBxpXceLVbYbHtzel/u4PCYJQbntI/89C
         hS7VihUjK7WAQmlD+R7SW7+LprdiyZ2b78LtC0Pu+ywWDr++M+BA5VrGv/CT0J8ifVA8
         34iLvF+QuiPCwVRYRCwuil5Adg1dj06202WMVgkZDYE/5mDpKDQS4+AYe4y3zmbO01mH
         z/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1cMat0V7s4bMA1eHCHDEhCYo/kbvJy8/bkwjnbPTmUs=;
        fh=R4nqg3WBFCmP9t43tmCEmkIYpuCMbwYlyqgQ32/+0O4=;
        b=RGFuOep9rkqpcURR0idjWJ9C6HKyMYdif0pNu+x9iVO81jh5vdeV7sKoCqtcTBAa0e
         CL6etHd9G6gQx8wHrtA0BzhZG8lzx82hJYVjbzWod3Hte1WpI0pBZsaqTxcDJUPhjx0z
         yhp9hT3P2D9j9uTG/BPeZmSp19wLIoOJJECYe37KFloDSSeqLBzKchnzUaSlwkbsS+9B
         itBATbLpWV9X+ZHv3/kFvwidAro3yHZ+TOy9utdBRn9ypchdQ8dUJuAsgkZehm0FTgKj
         C14+0+18PmHcnB+kX+8t1E6dOeGxKpFPDD2UlFtKRHVRocYa8JaMDN4V+mPI3BapsflW
         NqlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795626674; x=1796231474; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1cMat0V7s4bMA1eHCHDEhCYo/kbvJy8/bkwjnbPTmUs=;
        b=XZX31Aky74Unx2dEjR2BahbSBqWOfbHf9WU6kMwpVTuDcB65C4ABJoDq2wMN2j1V1F
         5JqIBpQMBny8nnfhdZdgejK45S7LJCcmdkYsXUxbzD4LdhgW4NwSy6tu0Vd/2qQ93l6s
         o/ZQVlTBMQEXApODzm+bUgwixxl6WTryqX9Rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626674; x=1796231474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cMat0V7s4bMA1eHCHDEhCYo/kbvJy8/bkwjnbPTmUs=;
        b=R1NuiqGXg+9nwx6j/oZxBBB+QmuHl6eIfRWAUAhtw+tTTfu9C6nhAWpiPz11NsHTKk
         hROThjRk1IrQQO8gyMaRtpoRJF2ot567CqJ5yvG1Mm/NXZFdCIbN6AwiHiJYwVKp36Dp
         CIo+Up0cFR7cF7pJe9tbaM0dJ9pUVfq4LKfZteM6fLHGsnAt3Anl0k1jYe98ZAwkz5aI
         x7EpClYhRUdUJRUP4QI6ZkRNRJgdqc0rsLgKnXKlPgHhtZ3FoLIVGEhrYE4TqCaIv9rx
         Mcxrlyeq08bJeW1/Z3erGPaPWl2YE+p8xQLa5KQdPH8trZHlFxVwYvoMOnRmOrFxmSpF
         HCQA==
X-Forwarded-Encrypted: i=1; AL+hErEACI2p4ElhIzQjNusG9ONuOOWQsyp5et8YKurlIQTPL2oVYaN7jYOyIZRkA+d2GcklRHYHctYNcDLqyNTgdfqs@lists.infradead.org
X-Gm-Message-State: APuU4Z8HzJ7SbuSuhm7roGE1OUc0/8LrA+JZaE2ec0MEtms7GlxWPdVX
	pPe9YeNhZ+oJ8FebVJNhE8Q7nKBN/2eMRMb0SbxseEeyILNA4dqcSUdW5wY8uRROdkdxJB3M1vb
	QV4d2XEoGaDLLswRNGrgyOYG10rjV++2FefaI3CVQEw==
X-Gm-Gg: AZFdTZdsLmGzp7Cuc1HNzYDufmBO3IspOXjZZHOuO93BS14xVE1nkYNeAOsy8Qty0gU
	MLBz4qBv9znGirfyL0yw+cIIa9uZIJoas3VpAqw6h34CFCFGtsak45r9nqn2jYyIELRGKX0JqxE
	BrcMkPeKd+Z6jOsBa+5/zBfrm/ZfGUS5QFrr6fh50edT0ohh3Bkr7HD7SDgSc44pKkbLGJxMxlM
	dYh9lnchHfl/+7q/uz+06DweBoUAVPRHX40VogVwGuhny5P8hKDWcAuHnLmDf6aqAuGW/C44mg+
	O+Ykgb7bFBTM8HcmzBmPrd0e2+J+lC8DFUaDPzxUTLjmfeG12N9GgzRoi/GTIXY4Rh+AKgVrolY
	ylZWLFHNveFXGjv++ajA1dY4mWTT78+neliQtYH6zDqkG11pZiaVX3ARRVruXF+sc3GwazipCtk
	RchN/IQh2+OK2R
X-Received: by 2002:a05:690c:9a8f:b0:8b0:9def:97ff with SMTP id
 00721157ae682-8b5205179b6mr94741297b3.46.1795626674340; Wed, 25 Nov 2026
 09:11:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122205136.138173-4-dario.binacchi@amarulasolutions.com> <20261125121141.29455-1-peng.fan@oss.nxp.com>
In-Reply-To: <20261125121141.29455-1-peng.fan@oss.nxp.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 18:11:02 +0100
X-Gm-Features: Aa3M54o7M2qWU98Y-q7cgiD5rd9wubyIgOpZDjq-azHVQE3KFYTCT_fyLZF_Vi4
Message-ID: <CABGWkvqTi_x3Q=D4RCZjkec+_2RUcZyqa_yYxQJSh3PmUxA1VA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pmdomain: imx8m-blk-ctrl: Keep the domains left on
 by the bootloader
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
	linux-amarula@amarulasolutions.com, michael@amarulasolutions.com, 
	Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Kees Cook <kees+treewide@kernel.org>, Ming Qian <ming.qian@oss.nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Xu Yang <xu.yang_2@nxp.com>, bui duc phuc <phucduc.bui@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_091116_163476_41705CBE 
X-CRM114-Status: GOOD (  47.36  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 1:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> On Sun, 22 Nov 2026 21:51:12 +0100 Dario Binacchi <dario.binacchi@amarula=
solutions.com> wrote:
>
> > The blk-ctrl domains are all registered as off, so a domain left on by
> > the bootloader is powered up again by its first consumer. On the
> > i.MX8MN this resets the display pipeline set up by U-Boot to show a
> > splash screen.
>
> Linux will finally take over display. so is there any issue here that
> resets the display pipeline here? Any I think U-Boot has driver_remove
> to make it in the initial safe state.

The bootloader leaves the display on to show a splash screen and hands
it over as a simple-framebuffer, so its drivers are not removed on purpose.

With patch 2 the DISPMIX domain is kept on, but the blk-ctrl domains
are still registered as off. Their first consumer runs
imx8m_blk_ctrl_power_on(),
which puts the LCDIF and the DSIM into reset, so the image of the bootloade=
r
is lost before Linux has anything to show.

Keeping the pipeline running is also what the DRM state readout [1] needs t=
o
take it over without a modeset. I have an RFC for the i.MX8MN on top of it =
[2].

Thanks and regards,
Dario

[1] https://lore.kernel.org/r/20261120-drm-state-readout-v9-0-a67c2b45b8ec@=
kernel.org
[2] https://lore.kernel.org/r/20261122153032.2782768-1-dario.binacchi@amaru=
lasolutions.com

>
> Regards
> Peng
>
> >
> > Read the state of the domains from the blk-ctrl registers and register
> > as on the ones left on by the bootloader.
> >
> > Enable this only for the i.MX8MN DISP blk-ctrl, as on other blk-ctrls
> > (e.g. the i.MX8MP VPUMIX) the registers do not reset to 0.
> >
> > Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > Changes in v4:
> > - Register the power notifier before powering up the bus domain
> >
> > Changes in v3:
> > - Keep the bus domain on while the state of the domains is read
> > - Remove the domains before releasing their boot-on references
> >
> > Changes in v2:
> > - Take the references once the probe can no longer be deferred
> > - Clear the boot-on state when the domain is powered off
> > - Release the references when the driver is removed
> >
> >  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 128 +++++++++++++++++++++++---
> >  1 file changed, 117 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/i=
mx/imx8m-blk-ctrl.c
> > index 7d6735728d8c..04383d7e40cb 100644
> > --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> > +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> > @@ -83,10 +83,13 @@ struct imx8m_blk_ctrl_domain {
> >       struct device *power_dev;
> >       struct imx8m_blk_ctrl *bc;
> >       int num_paths;
> > +     bool boot_on;   /* Left on by the bootloader */
> >  };
> >
> >  struct imx8m_blk_ctrl_data {
> >       int max_reg;
> > +     /* SFT_RSTN and CLK_EN reset to 0, so a domain left on can be det=
ected */
> > +     bool boot_state_readable;
> >       notifier_fn_t power_notifier_fn;
> >       const struct imx8m_blk_ctrl_domain_data *domains;
> >       int num_domains;
> > @@ -187,18 +190,87 @@ static int imx8m_blk_ctrl_power_off(struct generi=
c_pm_domain *genpd)
> >       /* allow bus domain to suspend */
> >       pm_runtime_put(bc->bus_power_dev);
> >
> > +     domain->boot_on =3D false;
> > +
> >       return 0;
> >  }
> >
> >  static struct lock_class_key blk_ctrl_genpd_lock_class;
> >
> > +/*
> > + * A domain left on by the bootloader has its resets deasserted and it=
s
> > + * clocks enabled. The registers can only be read if the bus domain is
> > + * on, so a domain is considered off whenever the bus domain is off.
> > + */
> > +static bool imx8m_blk_ctrl_is_off(struct imx8m_blk_ctrl *bc,
> > +                               const struct imx8m_blk_ctrl_data *bc_da=
ta,
> > +                               const struct imx8m_blk_ctrl_domain_data=
 *data)
> > +{
> > +     u32 rst, clk, mipi =3D 0;
> > +
> > +     if (!bc_data->boot_state_readable)
> > +             return true;
> > +
> > +     if (regmap_read(bc->regmap, BLK_SFT_RSTN, &rst) ||
> > +         regmap_read(bc->regmap, BLK_CLK_EN, &clk))
> > +             return true;
> > +
> > +     if (data->mipi_phy_rst_mask &&
> > +         regmap_read(bc->regmap, BLK_MIPI_RESET_DIV, &mipi))
> > +             return true;
> > +
> > +     return (rst & data->rst_mask) !=3D data->rst_mask ||
> > +            (clk & data->clk_mask) !=3D data->clk_mask ||
> > +            (mipi & data->mipi_phy_rst_mask) !=3D data->mipi_phy_rst_m=
ask;
> > +}
> > +
> > +/* Take the references of imx8m_blk_ctrl_power_on() for a domain left =
on */
> > +static int imx8m_blk_ctrl_get_boot_on(struct imx8m_blk_ctrl_domain *do=
main)
> > +{
> > +     struct imx8m_blk_ctrl *bc =3D domain->bc;
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_resume_and_get(bc->bus_power_dev);
> > +     if (ret < 0) {
> > +             dev_err(bc->dev, "failed to power up bus domain\n");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D pm_runtime_resume_and_get(domain->power_dev);
> > +     if (ret < 0) {
> > +             dev_err(bc->dev, "failed to power up peripheral domain\n"=
);
> > +             pm_runtime_put(bc->bus_power_dev);
> > +             return ret;
> > +     }
> > +
> > +     if (icc_bulk_set_bw(domain->num_paths, domain->paths))
> > +             dev_err(bc->dev, "failed to set icc bw\n");
> > +
> > +     domain->boot_on =3D true;
> > +
> > +     return 0;
> > +}
> > +
> > +static void imx8m_blk_ctrl_put_boot_on(struct imx8m_blk_ctrl_domain *d=
omain)
> > +{
> > +     if (!domain->boot_on)
> > +             return;
> > +
> > +     /* Sync, to power down the bus domain before its notifier is remo=
ved */
> > +     pm_runtime_put_sync(domain->power_dev);
> > +     pm_runtime_put_sync(domain->bc->bus_power_dev);
> > +     domain->boot_on =3D false;
> > +}
> > +
> >  static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
> >  {
> >       const struct imx8m_blk_ctrl_data *bc_data;
> >       struct device *dev =3D &pdev->dev;
> >       struct imx8m_blk_ctrl *bc;
> >       void __iomem *base;
> > +     unsigned long boot_on =3D 0, bit;
> >       int i, ret;
> > +     bool init_off;
> >
> >       struct regmap_config regmap_config =3D {
> >               .reg_bits       =3D 32,
> > @@ -250,6 +322,23 @@ static int imx8m_blk_ctrl_probe(struct platform_de=
vice *pdev)
> >                                            "failed to attach power doma=
in \"bus\"\n");
> >       }
> >
> > +     bc->power_nb.notifier_call =3D bc_data->power_notifier_fn;
> > +     ret =3D dev_pm_genpd_add_notifier(bc->bus_power_dev, &bc->power_n=
b);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "failed to add power notifier\n")=
;
> > +             goto cleanup_bus;
> > +     }
> > +
> > +     if (bc_data->boot_state_readable) {
> > +             /* Keep the bus domain on while the state is read */
> > +             ret =3D pm_runtime_resume_and_get(bc->bus_power_dev);
> > +             if (ret < 0) {
> > +                     dev_err_probe(dev, ret,
> > +                                   "failed to power up bus domain\n");
> > +                     goto cleanup_notifier;
> > +             }
> > +     }
> > +
> >       for (i =3D 0; i < bc_data->num_domains; i++) {
> >               const struct imx8m_blk_ctrl_domain_data *data =3D &bc_dat=
a->domains[i];
> >               struct imx8m_blk_ctrl_domain *domain =3D &bc->domains[i];
> > @@ -303,7 +392,8 @@ static int imx8m_blk_ctrl_probe(struct platform_dev=
ice *pdev)
> >               domain->genpd.power_off =3D imx8m_blk_ctrl_power_off;
> >               domain->bc =3D bc;
> >
> > -             ret =3D pm_genpd_init(&domain->genpd, NULL, true);
> > +             init_off =3D imx8m_blk_ctrl_is_off(bc, bc_data, data);
> > +             ret =3D pm_genpd_init(&domain->genpd, NULL, init_off);
> >               if (ret) {
> >                       dev_err_probe(dev, ret,
> >                                     "failed to init power domain \"%s\"=
\n",
> > @@ -312,6 +402,9 @@ static int imx8m_blk_ctrl_probe(struct platform_dev=
ice *pdev)
> >                       goto cleanup_pds;
> >               }
> >
> > +             if (!init_off)
> > +                     boot_on |=3D BIT(i);
> > +
> >               /*
> >                * We use runtime PM to trigger power on/off of the upstr=
eam GPC
> >                * domain, as a strict hierarchical parent/child power do=
main
> > @@ -328,37 +421,48 @@ static int imx8m_blk_ctrl_probe(struct platform_d=
evice *pdev)
> >               bc->onecell_data.domains[i] =3D &domain->genpd;
> >       }
> >
> > +     /*
> > +      * The probe can no longer be deferred. Releasing these reference=
s
> > +      * would power down the domains left on by the bootloader.
> > +      */
> > +     for_each_set_bit(bit, &boot_on, bc_data->num_domains) {
> > +             ret =3D imx8m_blk_ctrl_get_boot_on(&bc->domains[bit]);
> > +             if (ret)
> > +                     goto cleanup_pds;
> > +     }
> > +
> >       ret =3D of_genpd_add_provider_onecell(dev->of_node, &bc->onecell_=
data);
> >       if (ret) {
> >               dev_err_probe(dev, ret, "failed to add power domain provi=
der\n");
> >               goto cleanup_pds;
> >       }
> >
> > -     bc->power_nb.notifier_call =3D bc_data->power_notifier_fn;
> > -     ret =3D dev_pm_genpd_add_notifier(bc->bus_power_dev, &bc->power_n=
b);
> > -     if (ret) {
> > -             dev_err_probe(dev, ret, "failed to add power notifier\n")=
;
> > -             goto cleanup_provider;
> > -     }
> > -
> >       dev_set_drvdata(dev, bc);
> >
> >       ret =3D devm_of_platform_populate(dev);
> >       if (ret)
> > -             goto cleanup_notifier;
> > +             goto cleanup_provider;
> > +
> > +     if (bc_data->boot_state_readable)
> > +             pm_runtime_put(bc->bus_power_dev);
> >
> >       return 0;
> >
> > -cleanup_notifier:
> > -     dev_pm_genpd_remove_notifier(bc->bus_power_dev);
> >  cleanup_provider:
> >       of_genpd_del_provider(dev->of_node);
> >  cleanup_pds:
> >       for (i--; i >=3D 0; i--) {
> >               pm_genpd_remove(&bc->domains[i].genpd);
> > +             imx8m_blk_ctrl_put_boot_on(&bc->domains[i]);
> >               dev_pm_domain_detach(bc->domains[i].power_dev, true);
> >       }
> >
> > +     if (bc_data->boot_state_readable)
> > +             pm_runtime_put_sync(bc->bus_power_dev);
> > +
> > +cleanup_notifier:
> > +     dev_pm_genpd_remove_notifier(bc->bus_power_dev);
> > +cleanup_bus:
> >       dev_pm_domain_detach(bc->bus_power_dev, true);
> >
> >       return ret;
> > @@ -375,6 +479,7 @@ static void imx8m_blk_ctrl_remove(struct platform_d=
evice *pdev)
> >               struct imx8m_blk_ctrl_domain *domain =3D &bc->domains[i];
> >
> >               pm_genpd_remove(&domain->genpd);
> > +             imx8m_blk_ctrl_put_boot_on(domain);
> >               dev_pm_domain_detach(domain->power_dev, true);
> >       }
> >
> > @@ -709,6 +814,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8=
mn_disp_blk_ctl_domain_data[]
> >
> >  static const struct imx8m_blk_ctrl_data imx8mn_disp_blk_ctl_dev_data =
=3D {
> >       .max_reg =3D 0x84,
> > +     .boot_state_readable =3D true,
> >       .power_notifier_fn =3D imx8mn_disp_power_notifier,
> >       .domains =3D imx8mn_disp_blk_ctl_domain_data,
> >       .num_domains =3D ARRAY_SIZE(imx8mn_disp_blk_ctl_domain_data),
> > --
> > 2.43.0
>
> Sent using hkml (https://github.com/sjp38/hackermail)



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

