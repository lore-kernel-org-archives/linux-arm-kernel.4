Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E3B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xX9/+Tyx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRRuUfkx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wX/FVCUzVIh9tUuN5iJYqAoQF6PWVCKZHLN6FXdcM2w=; b=xX9/+Tyxo9MfA7BiAEDR2VC9gE
	yMKxcYrFIssuJHgoYzCknUpGV7QzlITNTbdCo9NFrEfMw/D5IXICZDuWPcHGcCg0MGjGL11G92MIs
	mAmu792M0abAIVQmrvR8Iccr9CUPITZ1TYp3lrodgzSyyrvUEruDuQmg/+5y+ONlTv2QRxw5HYQQ5
	4DZ9s6SGE0o4zP2ZcwFLWx4cxL1+dF/3eNMY13u5KRo2Y5PQKnlxbFUBiSkVxtkdjfELZ6fRAlgoD
	0fgLOVcuZZHtaIN8Fn2Sj2m057EfCr5or11nJ2oLqPXQRZs+0s89gDitKW/sJB/dwWDj46jTXtTos
	RBfWKJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuBy-0000000Foy4-1nqf;
	Fri, 27 Nov 2026 11:32:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuBu-0000000FowJ-1Jze;
	Fri, 27 Nov 2026 11:32:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 159BE430AD;
	Fri, 27 Nov 2026 11:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5EB971F0089C;
	Fri, 27 Nov 2026 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795779153;
	bh=wX/FVCUzVIh9tUuN5iJYqAoQF6PWVCKZHLN6FXdcM2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZRRuUfkxfTyVqsxa0619jUylpIgFMfJ6lDjCL2nbNS67VXHa0Ni0C8STG8WMMK9IT
	 wqt6CU1IIZtnDihdrxClId1wOj/rKt0r6pz2oFLFcNT8Usf+nBJOEPUvi1ElFdnF2f
	 IuoE2S1YRWHElrKmo3EAH4QlHcHn2NN27SlY2R1s5k247F6kp3EyVspJ0moVEMu61n
	 pxD3i+rzlWAZ24RWov3SGRXuE+1rmLX82xOEbHYkLhpky0rA9iLP+mwTDYTAR8+mgZ
	 olRu4xDnZzP6TGWx/KuZsG51w2x6qzqnesaRMGyPq9omvDtPMQYpl40Tfhkx9aR6hF
	 an5mI4H/C50mA==
Date: Fri, 27 Nov 2026 12:32:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 24/25] dt-bindings: pwm: rockchip: Add RV1106 compatible
Message-ID: <awlpwN73zsCPPpdF@monoceros>
References: <20260810121121.210040-1-vlad@zlab.su>
 <20260810121121.210040-25-vlad@zlab.su>
 <anq1YM2KzkycOzNm@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4yohrfi6hcwzkpgi"
Content-Disposition: inline
In-Reply-To: <anq1YM2KzkycOzNm@monoceros>
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


--4yohrfi6hcwzkpgi
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 24/25] dt-bindings: pwm: rockchip: Add RV1106 compatible
MIME-Version: 1.0

On Tue, Aug 11, 2026 at 07:39:37AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Mon, Aug 10, 2026 at 03:11:15PM +0300, Vladislav Leonov wrote:
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description:
> > +      Some PWM channels (e.g. on rockchip,rv1106-pwm) additionally
> > +      support capture mode and use a second interrupt for that.
>=20
> Is it clear what the first irq is about? Maybe spend a word on that,
> too?
>=20
> Otherwise looks fine for me.

I marked this patch as changes-requested in patchwork now and discard it
=66rom my inbox. Please send an update mentioning the purpose of the first
irq if/when you care about it.

Best regards
Uwe

--4yohrfi6hcwzkpgi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsJakoACgkQj4D7WH0S
/k7RyQf9GwSgCvWfCEuntvedN0BuWWwDO37M+L0I+K+oTL94nW/JVSeKxnCG0gTT
s/M8cJ9Vr2DmJ79LzcaXq6+FQJ6qr+ONq6amEq8jt5M36qBMVmVjIphE/VegAfCv
pL/GO5t7X30eVr5Dmhe9G3lZ9Ud94PdiC9PCaHDPU8nmQz/PnH42FQTnm6BICnkC
867tlVXHSIHENDN+P3rjSLsgzVH4uYwJOtrQURHpzaE7PQi5GomAcS46c50/asni
zYOeeLd2cRO/QF2mQUZ496dfaHg2h5t602Kwx81Wc8dAeUwCx01dAslF53OW0mI6
ya9O1cZmBYu8gzwG+YB7vaTkboHUcw==
=p8HE
-----END PGP SIGNATURE-----

--4yohrfi6hcwzkpgi--

