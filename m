Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD854606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iw7BSBuM;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qP3K5iFW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c4Z9yGuax/8NR1BznxmdHxIivPIjV06ghC9n97sXVMc=; b=iw7BSBuMDQ9V65jcL11C4luWuq
	A/rUyels4zGZMIxdBIP1a6J3MdWywKs5BlRxBJoIztvLt8PjCMzk6XFI/W2xoewoDjXIXSd/vaNRF
	PR2D9uxtd/ALxL8xK1ib8LHtW4geP0GXMLyV2WiZrXMhsSo7VS7Oj1APkeiuCOvGE8l8kqwX+UU2n
	ZZICzqRriZiWzxuPNiBcyluK9LsDc7kG8ZO1xJrYT43+D37I8moRABmXlFpLV3yxBTkec/Ih+D/hS
	l9oXR8bMruurL8JV9ix+G5/4a2ttN8f2ScOuRnvm1MnmKLHc05t3OvizBE2l75t5jhHYxylfolJHY
	jW8LDalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQKF-0000000FNd6-112M;
	Fri, 20 Nov 2026 15:14:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQK9-0000000FNbw-1Zqu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:14:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 95F0E1A1739;
	Fri, 20 Nov 2026 15:14:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64637601B9;
	Fri, 20 Nov 2026 15:14:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CCA511BC0335;
	Fri, 20 Nov 2026 16:14:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795187682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c4Z9yGuax/8NR1BznxmdHxIivPIjV06ghC9n97sXVMc=;
	b=qP3K5iFWwUKZwIQKOP9+wMMMEfmEjshq5oP054+bmu2JyLKtD0QR5NC9lf76y0NiPFLWU0
	TsiGBvknc+ag9cbrXCdGHc8nz8bJR05lx2uwRZ/kO9z2xqN0bm6a1QmYB4NlMr4mYD/uSW
	KNDEUD8rdlrSbKndfYWTzHmqqyVAMAVHwHqGe9gphJOclw39r9N0owsORjQIlNZ1f5oVei
	Y3LsPlEHRvrsdUvcoBnzzQI/RhNLKqfSGdt0Ps4UTbBfjSb1+XB3QsP+MklkVt9oBH5cuA
	NaKMNA0k7flFUWpx3vKHLltVcYo4Xqr94UFfw0L94GMe6MRtZ+YjmnytNfBlrQ==
Message-ID: <fa5f43740321588aad8a5125eafd947c27a2f613.camel@bootlin.com>
Subject: Re: [PATCH v4 0/2] ACPI: platform: ACPI 6.5 fixed clock support
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thomas Petazzoni
	 <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Nov 2026 16:14:37 +0100
In-Reply-To: <CAJZ5v0i4ybwsOKfj_LS_m7EL-AYAhPQJmLNWBm8gdZ5uvfcJug@mail.gmail.com>
References: <20261120125722.209609-1-paul.cercueil@bootlin.com>
	 <CAJZ5v0i4ybwsOKfj_LS_m7EL-AYAhPQJmLNWBm8gdZ5uvfcJug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_071449_602558_37EF60D6 
X-CRM114-Status: GOOD (  21.51  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rafael,

Le vendredi 20 novembre 2026 =C3=A0 15:31 +0100, Rafael J. Wysocki (Intel) =
a =C3=A9crit=C2=A0:
> On Fri, Nov 20, 2026 at 1:57=E2=80=AFPM Paul Cercueil <paul.cercueil@boot=
lin.com>
> wrote:
> >=20
> > Hi Rafael, Russell,
> >=20
> > Here's the v4 of my patchset that adds partial support for ACPI 6.5
> > clock resources.
> >=20
> > Sashiko complained about the clock names being too long still, as
> > ACPI device names can be up to 17 characters and the limit of clock
> > names is 16 characters; so I now name them "acpi-clkX".
> >=20
> > Note that I expect warnings from Sashiko that I got on my v3 and didn't
> > correct, because they are bogus.
> >=20
> > On the clkdev patch:
> > "When clk_find(dev_id, NULL) is called, does incrementing match here
> > give a (dev_id, con_id) entry a higher score than an exact
> > (dev_id, NULL) entry?"
> >=20
> > My answer is that you call clk_find(dev_id, NULL) when you know you onl=
y
> > have one clock provided, so you don't need to care about matching
> > priorities.
>=20
> Sashiko has a new comment on the first patch though:
>=20
> https://sashiko.dev/#/patchset/20261120125722.209609-1-paul.cercueil%40bo=
otlin.com

Yes, Sashiko came back to the charge with better arguments this time.

Sadly it seems to be correct, if I change the behaviour of clk_get(NULL) I =
will
break some drivers that rely on it not finding named clocks.

I can pass NULL as the con_id to clk_hw_register_clkdev() and then I can dr=
op
the first patch. Then, I guess register any other clock for the same device=
 with
the "acpi-clkX" con_id.

> > On the ACPI patch:
> > "Should the con_id argument to devm_clk_hw_register_clkdev() be NULL
> > instead of name? [...] Setting con_id to "<dev_name>-<idx>" instead of
> > NULL prevents wildcard connection matching in clk_find(), so any
> > consumer driver calling clk_get(dev, con_id) with a non-NULL con_id
> > fails with -ENOENT."
>=20
> This time Sashiko complains about something else in this patch AFAICS
> (link above).

It looks like I need identifying names for devm_clk_hw_register_fixed_rate(=
),
and those don't need to be 16-chars long (that's only for clkdev) - so I'll
restore my "<ACPI_ID>-clkX" naming scheme there.

Cheers,
-Paul

