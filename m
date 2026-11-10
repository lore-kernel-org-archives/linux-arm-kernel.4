Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3EC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fOt4c1Lt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ouLOLSrb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AqOIoaAagfF8f+5anLVjn5ybzEQ34T4RWG7tiFaGW54=; b=fOt4c1LtVQ8Fnx
	pB/mLtL6r9TA7kABgHsSwmIE8f6O1QNZLXXYqZlyDWeBn4CaU0vB2vkEEWt6F54ej5fccllRHo0wP
	4xfMxJcN2GPtfYe+daSRk8UMIxSUWDnYGksEAUo6GCF6eX3b3P7wJc0xrBMO92NyW3ls0P7LSIWxP
	ZBqaSmBurq6cIFkf4bVZgn/wCz36ll+iUsTPqJpLpMDsmFIzeJ0Kjr6R1enqfMEzS/sfEMjetiJzf
	rirYj9Yojg5wBhIHq2N8Ezwvga1w6Alpej/FsHoo8kPbzC1V4PgnOuUPsExCZ0C8IEZAB+BZgA6jR
	vS8rpNU6iX0yTE9jP56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoE9-00000004SkL-2UJi;
	Tue, 10 Nov 2026 15:57:41 +0000
Received: from mail-ej2-x0b.google.com ([2a00:1450:4864:34::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoE5-00000004SiC-3P9N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:57:40 +0000
Received: by mail-ej2-x0b.google.com with SMTP id a640c23a62f3a-c505c42e4ecso31913166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:57:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794326255; cv=none;
        d=google.com; s=arc-20260327;
        b=d0IKP5cXEjZGoMvlFPu+lzaw5D9eEvbEwMqz+PTBeWe+WlzQXYKozFAXk9M97+ReHF
         F72iZ6swuWY8UONTsOGTo6lP6cnzYid4+ZLTDCIO8fd0biM4b7E/+Yo7ZumXwukH/Mv0
         CuXqcjJIPtiRhGZVe87Ka879vqOnRA20bAPLNnDW3WCBVSg/aaNSpwlXle2mXRd9iOdy
         hBgrPzGZT3JX93c8OeBulniEay/fp/MvGHuK52ei8p6oaq4bVQLjkABdJc4DQdbiJWQ+
         PhQmmymU/pjOUqSthaDDLvN/xgGtgL9kMyqcygeuUoc2B8QZr6WGzVFN5nX8SSxL80vp
         58vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AqOIoaAagfF8f+5anLVjn5ybzEQ34T4RWG7tiFaGW54=;
        fh=pfodEAtRzaH/R3wtOf0HnFn04wm2yaaCQW8OgHki/e0=;
        b=QgVPOiHKLSe2EUgTx+6N1GmdhjYnnhXsK1/149RINC720PnKXOOOBPFO5I0TeYE6CM
         VSFQPx/6a/wtZrJXJ1dI0GnXGJo+wXWVT+wedmPaj9W4k/071a5Ia74i1Aqktor+jqOj
         xwiuMGAv/x5NzRSpqNrzJh6OlK6TaZry7LmonOpZhJeVDjsXhHaF5U3eM1uMIzjx1q0A
         2K+finorx/OzSjm7YPcMwakFQJVasPgBqbQLfu3AjEnnJ+txyTm81ZXJPhf1tF+CJCMQ
         TL3U7heTXL8S4C5XN8wKPjtCz+b34iANlVm0tpRlQ5XI96K74CwN1Mvc5n8F8B69D2UC
         l2CA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326255; x=1794931055; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqOIoaAagfF8f+5anLVjn5ybzEQ34T4RWG7tiFaGW54=;
        b=ouLOLSrbqN3cUxmpUe5woK8R3DnDSx2ip//hr9paceeLyG+YVeGe3a88Nwr/8+AP3K
         iL6xnQBpsbOaoA3VaTDvzyWYEpeNo6qXlAWhbLBFVzVKm2YjhYk1lQADY6ui+pVPesrW
         Jf56y+b05jTCzgfYsoH5zLcG+gVGyq2iBERdMh9Gwk6tzmSq2Ie/Mk51VkoQQn0Jz/71
         Qp4scWjWPO9jnoCGe1LOLAIbMmY8n1ODaXuO55g8+Z9MkaW6NIjJXZ+nnuQ9FqEZ+YTe
         vXnX2Rm0QjXyZGuY0pePWqg8NKFHC6ZML568JDH/3d5PGqHEe2xxqBHrCgpnrZWfrfXC
         IkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326255; x=1794931055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqOIoaAagfF8f+5anLVjn5ybzEQ34T4RWG7tiFaGW54=;
        b=FXyVDksg8w+FWbn+PB3fr36iTIQb6vLTKsq0Lb3dsskay4KWhPgTL7xLae4aBthj11
         fBh0OUlLyMg0iAXM8TrLKb7C11x5vvxLUyOSCeLc2KrGga55XitnS6Hya1fYMCsu1Utj
         Pt5U0NjWcqL9WJIaSf0X9pEUCUGGNbgIBBlyvMeE0MbAjKc/uCoXeTC/2WrQQussK3ob
         NGg8Fu7OixptqKzB7XphiIyWyin6BkOdpUyDGv9OQ2hN60pkgaW/bfxX59/OjPe7MR8O
         IJV0JJMPYDiI4ipMHB/B+IT7XpaYwkwchaRPU8ag9m0Z4OPsR7d+BMSb4cIcErEkwXqo
         QvAw==
X-Forwarded-Encrypted: i=1; AL+hErExxBjm6QQqucRCpSaK724z2ZLkjkaLnjXtosy1pNxfRz0B8Zb+yB7UgMTtFDYoSxgL2l/yOq806+AQd/O0irRz@lists.infradead.org
X-Gm-Message-State: APuU4Z8EorgtToOEBaNN/LcryDZf0xEB0mzZBKJCFykFV7FZsPFGZ1xU
	c754+LJvD/ofAHJ+5H3JVsNRbAujMzVuJEPzo6pRrEE6UqqTM9OtCB2bULGBJrfMo+rHITJEuEx
	SUw64dVFoW6aLMdR2iGGeK3SNFTr0SYk=
X-Gm-Gg: AYBFou2GDcHEwq++zRSiQreQzODze+14tMr48DiRPEOakQAV+ZtOIiKaO350io5Idm1
	MiWjLvJTp1gk63H4uLw53sZqpcwoasqxoDT7gntM/0liv9B2Mqzi2JIaEUcT+lyLDl1Z1evpj7B
	359g/m4jzwk1deWHXOvoNKN+Ghy67tPc8PJPxMZ0J0IUe/k3XHJRYDbFkze6bDT1yRI3YLWktR4
	I9Ez5X+B9q0ECbVNPHKrgPXuhi/a6XCxqJq23kn/1e7Ts0NSglORqBbcjufI1KV1h/SqhmE+IL1
	4aZfZtwoMGOH761aWux0dBiPywhHhqaJqGjo7fwfL7t1pv06Qn/y0u27SaoCEoFKE/3hAUJIMOV
	NZrcG1ok6jn+Kowy5RDPbxJjkaFB5y4gaV38j+c4LkoSuqVsGgPDqG+DLrvSwGt8MuRMa8i68
X-Received: by 2002:a17:906:f58d:b0:c46:7ec3:fdfc with SMTP id
 a640c23a62f3a-c5049655093mr330817366b.34.1794326255020; Tue, 10 Nov 2026
 07:57:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102212506.3348537-1-coiaprant@gmail.com> <20261102212506.3348537-4-coiaprant@gmail.com>
 <1754e4c8-3b6e-4983-a7fb-d3444c1156c1@redhat.com>
In-Reply-To: <1754e4c8-3b6e-4983-a7fb-d3444c1156c1@redhat.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 10 Nov 2026 23:57:21 +0800
X-Gm-Features: AclHuK8jzcDwnWHZT9BxNPqc1Y_PBqiAP6DVGP8roGJ07xtaPAuYBnsbVsZu0DY
Message-ID: <CALj3r0h5yTq41tQnGo4ECCmoAx5_2B7VFkYq62aA8e+qjKJ0tA@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] net: pcs: xpcs: make supported_interfaces authoritative
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Heiko Stuebner <heiko@sntech.de>, Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
	Fabio Baltieri <fabio.baltieri@gmail.com>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_075737_886766_D73DEB68 
X-CRM114-Status: GOOD (  19.54  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Paolo Abeni <pabeni@redhat.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=8810=E6=97=
=A5=E5=91=A8=E4=BA=8C 22:41=E5=86=99=E9=81=93=EF=BC=9A
>
> On 11/2/26 22:25, Coia Prant wrote:
> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > index 6f0a110e32d2..25fdc9c6b72c 100644
> > --- a/drivers/net/pcs/pcs-xpcs-rk.c
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> > @@ -483,6 +483,7 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, =
struct device_node *pcs, int
> >       struct platform_device *pdev;
> >       struct dw_xpcs_rk *pxpcs;
> >       struct dw_xpcs *xpcs;
> > +     DECLARE_PHY_INTERFACE_MASK_ZERO(supported_interfaces);
>
> Please respect the reverse christmas tree order above.
>
> >
> >       if (!of_device_is_available(pcs))
> >               return ERR_PTR(-ENODEV);
> > @@ -536,6 +537,15 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev,=
 struct device_node *pcs, int
> >               return xpcs;
> >       }
> >
> > +     /*
> > +      * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
> > +      */
> > +     __set_bit(PHY_INTERFACE_MODE_1000BASEX, supported_interfaces);
> > +     __set_bit(PHY_INTERFACE_MODE_SGMII, supported_interfaces);
> > +     __set_bit(PHY_INTERFACE_MODE_QSGMII, supported_interfaces);
>
> Sashiko thinks this last statement is a no op:
>
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261102212506.334853=
7-1-coiaprant@gmail.com
>
> I don't think this is 'net' material, I suggest resubmitting for
> net-next.
>
> /P

Hi Paolo,

Thanks for the review.

1. Reverse Christmas tree: My bad, I will move the
   `DECLARE_PHY_INTERFACE_MASK_ZERO` declaration to the top of the
   function to comply with the variable ordering.

2. QSGMII no-op: Sashiko is right, it is currently a no-op. The core's
   compat table does not have an entry for QSGMII, so the intersection
   (phy_interface_and) filters it out. This actually demonstrates the
   intended behavior perfectly: the glue reports what the hardware can
   do, and the core filters it based on what it actually supports. If
   the core adds QSGMII support in the future, the glue will
   automatically pick it up. I'll add a brief note in the commit
   message to clarify this.

3. Tree selection: Understood. I will rebase and resubmit the series
   for net-next.

Coia

