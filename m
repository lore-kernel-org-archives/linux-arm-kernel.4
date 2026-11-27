Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7900606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AcQaPNLu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QlSfbZ73
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YB7PRwG4EacmEB2KHGqos+U4iE7VPEEu+UnlhOUCZ/0=; b=AcQaPNLuwab/uwuDSrpOpcIYpB
	TeGpbhL975e+BXj3PDxhtoYQ9luKV15LD+fF4S76OSfoeU1OAOat+gQMPJuAJhursR7dORcwBW4mY
	KyAbaI7+dE96hiPy8SLZukru80mTrV9rK4ebvtWrifUOq8EMDUAZvxgSM860S1GqygIj7hQ4hBdBn
	eZeTVwmVfYt6VZezCMM9PpbxCAkuDN/m6kIZo2BJNIWhcZK+hSTWQvfwYqQtGR6s02DRfu3wUELV+
	mi5FWEVvWzZq/4o0TP5OtCUbQy1+zI2lTbvXuUnrPDNcZhd3d+/eMUf61SoPqQDgOU1FgOGNVp7be
	MRlYk7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWroD-0000000FKwk-3GJd;
	Fri, 27 Nov 2026 08:59:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWroC-0000000FKwe-1VDE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:59:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 7A28660619;
	Fri, 27 Nov 2026 08:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 797871F00897;
	Fri, 27 Nov 2026 08:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769995;
	bh=YB7PRwG4EacmEB2KHGqos+U4iE7VPEEu+UnlhOUCZ/0=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=QlSfbZ73mHrcZnGAXOOtmbXyjdlg+s/D23EhkCPIZVuIijxGjIEseUFG75lZQR6rg
	 BfTTFJzEw4hxsh7z0ZknJ/O2pSyoIBJllA+WDkNwWwTCa/s67acIRoqM/Z6A60CrsU
	 cnFDbIyqDuk6deUFz5mnIDbhWzYpSXwuLCcqL1h8I2am5QQgRDdQ477trixB1jIepW
	 qe2I6vtlNWrAFffssHKSkeQPcYPnFxa6WVqUjEkvT7mBEBe7ikxpEO9+VaBeQY+Nr0
	 nynBOVol5c0lZVtbvUcQMMl6DXbWDfNr2UopIxyd7hGrFv6TzVSrtMnHaB54Kkhg3e
	 U3NKMBG7EJsag==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=27ee1cf6c1634033421e4332c97dfdd2c01110b636f58eb8a51a86830c41;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 09:59:45 +0100
Message-Id: <DN5VBYNBOJ72.1AB3PNDNJZF2M@kernel.org>
Subject: Re: [RFT PATCH 06/13] gpio: max7360: create the regmap-irq chip
 from the gpio-regmap callback
Cc: "William Breathitt Gray" <wbg@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "Petar
 Stepanovic" <pstepanovic@axiado.com>, "SriNavmani A"
 <srinavmani@axiado.com>, "Prasad Bolisetty" <pbolisetty@axiado.com>,
 "Tzu-Hao Wei" <twei@axiado.com>, "Karthikeyan Mitran" <kmitran@axiado.com>,
 "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Lee Jones"
 <lee@kernel.org>, "Long Zhao" <longzhao@ambarella.com>, "Joseph Telaak"
 <joseph@telaak.dev>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
X-Mailer: aerc 0.20.0
References: <20261126153600.299724-1-mwalle@kernel.org>
 <20261126153600.299724-7-mwalle@kernel.org>
 <awiaDVcNkqjaRL6S@ashevche-desk.local>
In-Reply-To: <awiaDVcNkqjaRL6S@ashevche-desk.local>
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

--27ee1cf6c1634033421e4332c97dfdd2c01110b636f58eb8a51a86830c41
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 26, 2026 at 9:43 PM CET, Andy Shevchenko wrote:
> On Thu, Nov 26, 2026 at 04:35:17PM +0100, Michael Walle wrote:
>> Use the new gpio_regmap_add_irq_chip() helper to create the regmap-irq
>> domain.
>
> ...
>
>> +struct max7360_gpio {
>> +	struct device *dev;
>> +	struct regmap *regmap;
>> +};
>
> Why do we need both? Is regmap created with difference 'dev'?

Because the regmap is fetched from the parent, i.e the MFD. But the
callback still needs the GPIO device for allocations.

I wanted to keep the change as simple as possible and just moved the
whole init section over. But it's even simpler to just set up
everything in probe and then just call gpio_regmap_add_irq_chip() in
the callback, though that brings more fields to struct max7360. But
it makes the code a nicer example.

-michael

--27ee1cf6c1634033421e4332c97dfdd2c01110b636f58eb8a51a86830c41
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawlGghIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/g0JgGAlQ5/oEFh4r65CmLFDVD3n2y7Vrta3g4H
ZJVaywz5Lz3ZoprK1sbbKtnIars4TwI5AYDG7i38BOgAOxidvuuLd1mL1TH0ztdT
wmUR5Sd89BivOMGXvrzhQdo42CAWS3duaj8=
=F/oP
-----END PGP SIGNATURE-----

--27ee1cf6c1634033421e4332c97dfdd2c01110b636f58eb8a51a86830c41--

