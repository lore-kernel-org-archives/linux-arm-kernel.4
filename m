Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008CC606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 22:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QPzQen/M;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PdyS2TkR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IDjZSVgHwAuIz39+r5A66Sm/O8aoe/1wLhdOdEPnhHY=; b=QPzQen/MarZEgj
	/Lb/jXDWyPWrcUVcKQR3GjCG2I26cb0TIFFfAHfUr/htf/XvZp41UhEuQt3vuZWwYG3rso39WmrGL
	kaewTPQVVJCjfXLysaUM7XfLl7SqT+KNS95qVNXdAe8JvUAnXiq4LIaaCjkL0BiGRx1oSgxY4pTfz
	PdYQN0xh/vJEb9J4VQe85beraVw56RV0g6EjXKjLBAzrlniVask2T01VOiwx7xMlbmImmMT5er5fw
	osAkce8pLqg9zO9rjaRRjigUaAtZG+DOa9C4UmPbTG5KP0teMdxQW+1zqr+Jz2SmHhGNDxPAn3yjx
	0ttSqfa6rtQQlGVSQnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSM2d-0000000Gp9I-03MI;
	Sat, 14 Nov 2026 22:16:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSM2c-0000000Gp9B-0O5R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 22:16:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C4D461183;
	Sat, 14 Nov 2026 22:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0161C1F000C6;
	Sat, 14 Nov 2026 22:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794694569;
	bh=IDjZSVgHwAuIz39+r5A66Sm/O8aoe/1wLhdOdEPnhHY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PdyS2TkRxRUFB1AbigR8BuzeBsDPUfFp3gvfRlGbyK402/zw9q0NtFRTQwbVxWD15
	 bOFBsnVLxvZGL+LxdA77H9w06jZqOsnIcqWXMa6a43ESfyLrGgXWDCDFbKPZih5Zrf
	 RzN4rejU43FNyNcGfCBiWv/uAVNc2lrUULYEN0V8wgdkUngqHrx+ixzODj6gj3snJb
	 1KXvIhGgB2VfbvfaabPSpuHbHF448CT9z3x+alnWitCNf3YLyNHZVBD4h8yNVL0Nys
	 7u52Y6jAsHvlqSnOiMkm1t2p4OCqmbTLOoEc3MCyoPISIKY0xgmMjsLXkW1s9FN1/T
	 WuohnOztKqFsg==
Date: Sat, 14 Nov 2026 22:15:59 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Victor Chernyakin
 <chernyakin.victor.j@outlook.com>, andy@kernel.org, conor+dt@kernel.org,
 cwweng@nuvoton.com, devicetree@vger.kernel.org, dlechner@baylibre.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 nuno.sa@analog.com, robh@kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Message-ID: <20261114221559.1867c183@jic23-hlaptop>
In-Reply-To: <c52e7b57-9d40-456c-a2f6-545c0bca9b46@gmail.com>
References: <20261104091136.151269-3-cwweng.linux@gmail.com>
	<SN1PR12MB2528F7F6F04801AB698A5A60A5712@SN1PR12MB2528.namprd12.prod.outlook.com>
	<avR2DaxSJJwpnWP9@ashevche-desk.local>
	<c52e7b57-9d40-456c-a2f6-545c0bca9b46@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 09:26:00 +0800
Chi-Wen Weng <cwweng.linux@gmail.com> wrote:

> Andy Shevchenko =E6=96=BC 2026/11/11 =E4=B8=8B=E5=8D=88 10:05 =E5=AF=AB=
=E9=81=93:
> > On Tue, Nov 10, 2026 at 08:08:03PM -0600, Victor Chernyakin wrote:
> >=20
> > ...
> >  =20
> >>> +	if (!num_channels)
> >>> +		return dev_err_probe(dev, -ENOENT, "no ADC channels configured\n");
> >>> +
> >>> +	if (num_channels > MA35D1_EADC_MAX_EXT_CHANNELS)
> >>> +		return dev_err_probe(dev, -ENOSPC, "too many ADC channels\n");
> >>> +
> >>> +	channels =3D devm_kcalloc(dev, size_add(num_channels, 1),
> >>> +				sizeof(*channels), GFP_KERNEL); =20
> >>
> >> Couldn't size_add() just be regular +?
> >> (Question to Andy who originally suggested it)
> >> We've just checked that num_channels is small and won't overflow. =20
> >=20
> > While that's true, the other aspect(s) of this is in play. Namely we wa=
nt to
> > have the same pattern over the kernel that makes code robust (tomorrow =
some
> > cases can be modified unnoticed with opening such an issue again) along=
 with
> > the potential of finding those patterns and update in case of mass-upda=
tes
> > of low-level API, and I have heard for the matter of fact that devm_*al=
loc*()
> > are in the plans to move to something like k*alloc_obj*() or k*alloc_fl=
ex().
> >  =20
For what is is worth we now have devm_kzalloc_objs() in tree.=20
I'd imagine a mass conversion is on the cards, similar to what
was done for the other allocation functions.=20
However, it's controversial so probably don't jump on that just yet!

https://lore.kernel.org/all/CAHk-=3DwgYBrhvo2NAG_Ja-0ovPf=3DxO20Gcopv9Yrr1u=
=3DQVxECZw@mail.gmail.com/


>=20
> Thanks Victor and Andy for the discussion.
>=20
> I'll keep size_add() for consistency and future-proofing, as Andy suggest=
ed.
>=20
> Thanks,
> Chi-Wen
>=20


