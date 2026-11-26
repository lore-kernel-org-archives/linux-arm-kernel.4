Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F78606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=inFCADMu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=dxf4Z9oZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v/0H+eeFYmdmqs3rzoBRgVbz7rsz3OGuWh6okG7NDWY=; b=inFCADMulVaFADBRQiIbzzddiW
	VZIt63wUo4MQRrg1b4HZ6iHdNbP2rNPzr2+rf4i6Er024b8DjDmfmOL1xjHrsUVjRJ3r4p/h5QTa1
	hXkrocZlCqiOdDH4sTNCAn9SC0eHYD1SCVlUT3KKgbg3aNCoND9MFdJ+DIXrAfvtOI2/gXh6hnKnl
	yBTiySDP9kAoKgHBb7RjmM/IvMq9AJyV/Heb1BRb8JuMEIB/vnJzea74qKu/4KZXbdCHUlQ3UsLzA
	i3Dpynq5D9g6iCdo+y7VQIKTa3Ti7mNkQeLYVZWDTbQBoQjOBAA0nNXA0f7qgrR4Vau7gg1J0zSGE
	U5RzKsWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaEz-0000000DVZg-0wd5;
	Thu, 26 Nov 2026 14:14:25 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaEl-0000000DVML-2iSt;
	Thu, 26 Nov 2026 14:14:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795702437; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QO94+WDzc88540FN7hTiPl1xptCjeno9y0BJSETD7qUhPkJBgdHlbK2DhMCaThUWhmlFwLNJMd86jTyuHNEvLvnh6+TqjLvFmTiBYURZcgPwdrt/E1izlmnd44fIFcWa76LzMLmweAPpbGPOyM0hhC2L4r/W27IHIDzQuvakucE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795702437; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v/0H+eeFYmdmqs3rzoBRgVbz7rsz3OGuWh6okG7NDWY=; 
	b=Q3Qn9mrawWE+ITINRsKRmKaBBIRBfSLrsL9w2fTHA9Xx05V4yV2684qlBRybPIypo6EVtvpgq/fKcjjOm9ULEMywH0ul1u8Z3fQgiYrzk0EtYq43O1zTy6Nns+73kvfmxTS0d5FrUjqnrMeLyCZFjJGGNt3x0jbUUT9vkLrE9tE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=dxf4Z9oZ7Ex0qE4uw9fUrRbozgbecJ9MUAH6e3lKlIZSRO9VNoUvsGM82KpNcsir+qWA1Ws9r3uRawuWTXBabo3MuHkoCxVl0SswKRQvsvAfT8sgfq/JEp01NcsNQVrp0mnMp/veMT4hpo/4ml1qcR9S5TWeQIalQULzWsewKBE=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=v/0H+eeFYmdmqs3rzoBRgVbz7rsz3OGuWh6okG7NDWY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795702435028347.9531354202811;
	Thu, 26 Nov 2026 06:13:55 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 35D121804FF; Thu, 26 Nov 2026 15:13:50 +0100 (CET)
Date: Thu, 26 Nov 2026 15:13:50 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: chanwoo@kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v4 08/11] PM / devfreq: rockchip-dfi: make RK3588 use its
 clocks
Message-ID: <awg8juW-7cCerIqO@venus>
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
 <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-8-517a68c008fe@collabora.com>
 <772ec0ea-da77-42e3-a281-8b8b7f364bf9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a3o5crxq32b7rld2"
Content-Disposition: inline
In-Reply-To: <772ec0ea-da77-42e3-a281-8b8b7f364bf9@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/295.675.79
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_061414_463321_42127A1F 
X-CRM114-Status: GOOD (  15.55  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--a3o5crxq32b7rld2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 08/11] PM / devfreq: rockchip-dfi: make RK3588 use its
 clocks
MIME-Version: 1.0

Hello Chanwoo,

On Thu, Nov 26, 2026 at 10:00:25PM +0900, Chanwoo Choi wrote:
> > +static const char * const rk3588_clk_names[] =3D {
> > +	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1", "pclk_ddr_mon_ch2",
> > +	"pclk_ddr_mon_ch3",
> > +};
>=20
> For proper operation of this patch, the following patch should be applied.
> The following patch is applied to other git?
>=20
> https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-6=
-43ff34ac8599@collabora.com/

Let me quote the cover letter:

Changes in PATCHv3:
 * split out DFI driver patches from both series and merge them into a
   new one; clock controller and DT patches will be sent separately.

FWIW those clock names are from DT, referencing them in DT obviously
requires the clocks to exist in the first place. I will send a
series with the clocks and the DT changes later today.

Greetings,

-- Sebastian

--a3o5crxq32b7rld2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmsIPpIACgkQ2O7X88g7
+pr1IhAAqCA4Xj1b+Ss7BlM5Kv9ey5ZxdGBIA1MUwbSdahDgw4J4ULogZSDtKTf3
qDdROlY8hubScVYAWfVWFNUp4eB6VUp3/XwMTpi0HVoBlyKqkoOW1cRHES2dz6Zv
v5Bz0BgI5NIpyNgQo1qdJ1aVxRPFk19hqhP8XT8ZLGFsNbYiIdrXlv0wQIdCljhU
GHxe2fx7ewRWY404EfZoAP6mXvewUQf7VtL+bfVbvk0trMeLxfJiYCRQjshzkHEv
GjbL7I98hgKWg40iCTfAiPwWDtD4bIf4cFF2IivL7VgPK40Wbl230KIJI8pTM3Gz
Q54qNozlMqHfcWf+x1EY2Fg8QqvHCgn8oWP2Nzguex/gzuN5wn58L94qChnIpKQy
UJXdifgcjbmUCI0Qwii/FA60xP35ENYY8hRWJVtArHaN+RA8Lt418HPLNIV5JASX
9KoyrM3uy7wNsiHk1dUhUfNRnSqQD2YGtSXAf7AhsPvp0r+zpel9ntUkyyVOgYQD
mYWJMtEpIa70xhSA8Y+pmWohsO0Jynp78FHlyM/P3KQ3sf2MpJ7z52QECeSKrFe5
HoqZyeBuCI27pLjfwnf5MtPnoL9Df8TSCFm/VM9YNSXtpROaGyUqOkCqTyOjzYKO
WskTCeNT99DafpE63CbClDirt8DQbzAqklN6jEmJZyl9tr06rQg=
=YCWj
-----END PGP SIGNATURE-----

--a3o5crxq32b7rld2--

