Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B0606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y4mvQIfV;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GXRzv2vi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FULaFNtrULKtjyIOf20Z7zfzpc6DhShhuKKqg8qTcek=; b=Y4mvQIfVL5N/8sUwtwcqLEUIbm
	otU/de/r3xFcCibon5PDiSbngtUI2eOJOi6I05tABdjmi5Tnkns9l7l8wvZlrBv/yjXK+ZfbBE3ul
	PwLZg2K0o/ZO5kEdD72abQRUzTWRKevPBkOh9mFW7YjwK1RuDhQz/d1zgajkg5WjPS+CzISyo4Rg2
	kEqL5cRpSCnFuYvNu7Q5tljCxGEe2bPTbRO4Fy3Lm5VXT8vbVz96nGVpoMYgSby+wKllTH8iIfI4w
	3AGDBBqBeQh0LJ2Go2rN23+GHoEixbRDLSQxXJSwRQoc1F/vQU4teSJkxyvH9KVVVcOXnzWXrzZKS
	lnlE7cCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6zd-0000000D1bw-46pn;
	Thu, 19 Nov 2026 18:36:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6zb-0000000D1b9-1hr4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795113377;
	bh=T0pI6QoapOdjZGBfMviw/VjaDgMcZ0ZLY/0s1FdOCz8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GXRzv2viFAwjbxAOLNWsmzavPED2g8LFVjMa9FNCzMdEvFnpd3cKQ9/5N8zyBbawb
	 Nv41WlfmgXmmK2Zy463yIHU61hlVhYDD2Gh7s1zJMaTy7yptllR3ZLdXBoQY0kPB12
	 wyy0zhnZbPbwWPNPOrMx7/f2v8XrmMJnGOdxavlaiCKqA2A9LnQ8b2gr2uZS1IYpvr
	 c3OTki0lGjdRRvmf5EDZG/7yKk5DMZUfpPFjibZ/4JjcHjeVWINHe80wLZg/Oiz76e
	 dXn9TI1KBZ4aq/AhnoCaw+m9Zx+rdGlisChHzBLbFy0mKqSDQDys3pDijm3O6GQFj6
	 jj2wTnmIurvMQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85D3317E0406;
	Thu, 19 Nov 2026 19:36:14 +0100 (CET)
Message-ID: <5ff0d8de9df06706f3c5412b642e150d5f068851.camel@collabora.com>
Subject: Re: [PATCH 2/3] media: verisilicon: hantro: cancel watchdog work
 before m2m release
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Shengzhuo Wei <me@cherr.cc>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer	 <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Ming Qian <ming.qian@nxp.com>,  Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>, Bin Liu
 <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>, irui
 wang <irui.wang@mediatek.com>,  kyrie wu <kyrie.wu@mediatek.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Date: Thu, 19 Nov 2026 13:36:13 -0500
In-Reply-To: <20260825-media-timeout-work-v1-2-ebfebbeb6c31@cherr.cc>
References: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
	 <20260825-media-timeout-work-v1-2-ebfebbeb6c31@cherr.cc>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-1wAt75ie9F4gKgzfOH9h"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_103619_620607_AD1F31DA 
X-CRM114-Status: GOOD (  15.44  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-1wAt75ie9F4gKgzfOH9h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 25 ao=C3=BBt 2026 =C3=A0 03:34 +0800, Shengzhuo Wei a =C3=A9crit=
=C2=A0:
> Each job arms vpu->watchdog_work, cancelled only by the
> job-completion path. If a job stalls, hantro_remove() drops the last
> reference to vpu->m2m_dev via v4l2_m2m_put() with the watchdog still
> pending, and hantro_watchdog() then dereferences the freed m2m_dev --
> a use-after-free.
>=20
> Drain the watchdog before the m2m device is released.
>=20
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> Assisted-by: GLM:5.3
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 2e81877f640fb429b18d2f4fd64bc0c392cf600e..1b04b98371a48184f390a1379=
1243fd00d6b80ef 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -1284,6 +1284,7 @@ static void hantro_remove(struct platform_device *p=
dev)
>  =09hantro_remove_dec_func(vpu);
>  =09hantro_remove_enc_func(vpu);
>  =09media_device_cleanup(&vpu->mdev);
> +=09cancel_delayed_work_sync(&vpu->watchdog_work);

Same comment as for mediatek driver.

Nicolas

>  =09v4l2_m2m_put(vpu->m2m_dev);
>  =09v4l2_device_unregister(&vpu->v4l2_dev);
>  =09clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);

--=-1wAt75ie9F4gKgzfOH9h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9BnQAKCRDZQZRRKWBy
9GSlAP9EsaWLG8JyqO/cX436Nctw6ISzDKmkLD6Z0tjeBm29fgEAtpOfRfVkBMCN
IJuqlSJQ3i9bJ1WiaUzaUfiM4xTi3As=
=N4qZ
-----END PGP SIGNATURE-----

--=-1wAt75ie9F4gKgzfOH9h--

