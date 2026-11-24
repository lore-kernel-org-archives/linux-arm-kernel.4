Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679AE606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y5LDu9uU;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZWdMYEss
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hVPbxPzCfcI5EYvAMMF38p87BSkLVMs8H/NP5SJFtqM=; b=y5LDu9uUkIqnUgTQgq97M968qA
	p8+uryehVr+sb9l8IADCFrRXEfVNeiQG0KP169wYEACbvpfXmp89NSqAspJK2dMGnfNZoKhdkWY07
	BxaRrForuZpn/wOu3ssnV3W09eJXTLzv70i8VSCnQRciEC1bjt/G8s5+TD3T/TQLoOgAY5xq52LoA
	WUdphQ1pUjKRIZ0PRQZgF2dINQn4HUQydXF/TSRQ83bh7fRPGSBStE1QqIIe6SkE04LjV7k7oQU64
	Pz57MVhxnfLP9arr0+9YTZZvWyE/Y0lpI8DYjE5ZOeY7TPb3af2tRTIIU491zDBxa+bYIlJ6hSnBG
	/iwBQJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyPm-00000007v6e-1VKh;
	Tue, 24 Nov 2026 21:51:02 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyPg-00000007v4q-1MiT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:51:01 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-55d2d380f6aso55843021cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795557055; x=1796161855; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVPbxPzCfcI5EYvAMMF38p87BSkLVMs8H/NP5SJFtqM=;
        b=ZWdMYEss3EXq+bHlcnN9a1zM4tPHHkGjmjB8cuvfaCMBgsYvvGxeo5b18h40Vg02F+
         RpfndEKAM81YZ34dLnnDNZhQsnPfucBa4Vl+9cdgM6AsiNOg/WLb6k2l2wBRC0jsZDBt
         4S9iucBsV9zKISQ9lGQQJlyQ6noym/4p0/FIiJBQMGGmdwPhc3mVMrVEAAejv4bgedae
         GmZHPTGZm816X3DHFmLvuNP67aWdrrdP3XTvVynCb/kNkS33XCmZYNTaQKRVxYO9pUsG
         oAQFi8RtIaiJdiiaM/ek1hYINFrowzSv+tyyOz604RwIIrxNCRSkXIYba+zAMdWHF8at
         MxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557055; x=1796161855;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVPbxPzCfcI5EYvAMMF38p87BSkLVMs8H/NP5SJFtqM=;
        b=SMEjsjMtQvAznt+flNePTa/dMEaXvgmttP6bRsUUJl+8nbvyNIpl7NvAghNd++AtSH
         fDFBHuWtOfTwWDURAl5w+bTKch80az07S/vmbd4uslRNvKTla5e4eiU+QwJvU1ZAhLdL
         1r0iFf2RdDsVRiihO6r9SPcCDq3czYFHXWQD3wtZAL5bN5po9Kv7f8h1uxvu3qHRKrjH
         rhSNWPkfUI4Pcf2a9Zr1PorUV/kjXHbFpgFabEYOi6Yxn7QdYpbWUCaZzPXcGmGPZikk
         SEK3FjfgcodqA6f5cCinittEwlgZXPFfx6+DNVtTiy3BOOvI6bh9XJTI3prMR50QQYVL
         okvg==
X-Forwarded-Encrypted: i=1; AL+hErFjbwWR4cc3aTONkn/uM66Ec5tDHqpuQ5bePAIAVhRZSy6gBo4ftSuz/93gPixZQGRXgQNqwHuPXZOUblPEJ/J0@lists.infradead.org
X-Gm-Message-State: APuU4Z8loydW/nBs+CAe/KlAN8x+9YAzFlIO1hXOEXw5uBZv2rAx2Coq
	R0OHqwjafKFtnw2DiV438xl/ircdrDtP/STZ9nKBzDW1nXYVyR34n4oXx9paUy9IJvcfgkzpJHR
	V3cWP
X-Gm-Gg: AZFdTZexEsMxo4zU8163A6feVs/XtF+UcRaq8VfGyiGBb8nLsHEFqezWCgpXk7jyEcK
	Avq/oOlEYUyn6WtSmj5rUkwatL47CFextn2K4VVZWfCLUtz3DUYV8Khu60EYqVfVuNFQo6M7pnS
	oNMvCfy1zBBDbVtm5HrP1C5fP4pX2HPeHEeYQ4He2mBGaIntfUjvqMT9hksqpvzY7s+K9GCvOpn
	xNccqKFXyU+o4Wvn++V2RKbqQUknNUbDSVdQ2ngc3nSSJyPev0JfBSYpSUCMauuvzIDrvtDqIBG
	4OAgiuknNwJ5TshfJOq+HUi9LSethc0Z+5VCTBq9k4mSsNE9FQWnbKrl+Y6z5SChpndmHLdt0Aw
	17SJJL3+bXxT7y7bPsJaHfXKICHnoxwjWev4BkgHCg2uM2g3NCBpnFqKADY6PFcJlf/YC0g+5Hl
	Gl3YwGyjBsKJ5XxC5btmjAYwtYfbRTmQTG6orNDiWxJaHtNrxSsRwxa7q6fnGASNNRBtZl39kLw
	d09USEZoL5dab4HtTNapSrokCy9f/nGNCCS2mRgSMALZHnM3f4HP/HYNOKgHjMUusk9LdaH0mEI
	x7Z8QrkAI3YkWum/Y//uR2rcHz5JmuKNfVobPr95AoOYCiv3wK4aHqY=
X-Received: by 2002:ac8:598a:0:b0:533:3fc2:8b19 with SMTP id d75a77b69052e-55d769e1664mr304362671cf.20.1795557054795;
        Tue, 24 Nov 2026 13:50:54 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8absm135589651cf.27.2026.11.24.13.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:54 -0800 (PST)
Message-ID: <d1057ae0d26a942d1e79bc09ac188dd804ff97b0.camel@ndufresne.ca>
Subject: Re: [PATCH v2 16/17] media: rockchip: rga: put all cores into first
 core iommu domain
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, Guangshuo Li
 <lgs201920130244@gmail.com>
Date: Tue, 24 Nov 2026 16:50:53 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-16-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-16-23aa2cb74e61@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-cVwN/Xd2NZTsdcaY+cOO"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_135059_639888_5DA51177 
X-CRM114-Status: GOOD (  22.53  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-cVwN/Xd2NZTsdcaY+cOO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Put all cores into the iommu domain of the first core to allow them to
> be used by any core. All buffers accessed by the hardware are allocated
> on the first core, as the scheduling to a specific core is done after
> the allocation. Therefore put all cores into the same domain to have the
> same iommu mapping on all cores.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2
> - Fixed domain not being an err ptr
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D14)
> - Detach domain on unbind callback
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D14)
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 5348fcc03c525..b2eeae0a61771 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -10,6 +10,7 @@
>  #include <linux/delay.h>
>  #include <linux/fs.h>
>  #include <linux/interrupt.h>
> +#include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> @@ -761,6 +762,19 @@ static int rga_core_bind(struct device *dev, struct =
device *master, void *data)
>  =09=09  rga->version.major, rga->version.minor);
> =20
>  =09if (rga->num_cores) {
> +=09=09/* Attach to the first cores iommu */
> +=09=09struct iommu_domain *domain =3D iommu_get_domain_for_dev(rga->core=
s[0]->dev);
> +
> +=09=09if (!domain) {
> +=09=09=09dev_err(core->dev, "Couldn't get domain of the first core\n");
> +=09=09=09return -ENODEV;

Hmm, Sashiko is annoyingly right, this driver support disabling IOMMU befor=
e
this change. Maybe simply return 0, and turn the error into a warning? It a=
lso
says you are missing pm_runtime_put() or something.

> +=09=09}
> +=09=09ret =3D iommu_attach_device(domain, core->dev);
> +=09=09if (ret) {
> +=09=09=09dev_err(core->dev, "Couldn't attach to the domain of the first =
core\n");
> +=09=09=09return ret;

Also missing PM release.

> +=09=09}
> +
>  =09=09/* we are not the first core, expect that we have the same version=
 */
>  =09=09if (rga->version.major !=3D version.major || rga->version.minor !=
=3D version.minor) {

Keep this check above the iommu setup, so you don't have to undo it. Not a =
big
deal though.

Nicolas

>  =09=09=09v4l2_err(&rga->v4l2_dev, "Detected multi-core setup with differ=
ent core versions!\n");
> @@ -788,6 +802,14 @@ static void rga_core_unbind(struct device *dev, stru=
ct device *master,
>  =09=09if (rga->cores[i] !=3D core)
>  =09=09=09continue;
> =20
> +=09=09if (i) {
> +=09=09=09/* Detach from the first core iommu */
> +=09=09=09struct iommu_domain *domain =3D iommu_get_domain_for_dev(rga->c=
ores[0]->dev);
> +
> +=09=09=09if (domain)
> +=09=09=09=09iommu_detach_device(domain, core->dev);
> +=09=09}
> +
>  =09=09rga->cores[i] =3D rga->cores[rga->num_cores - 1];
>  =09=09rga->num_cores--;
>  =09=09break;

--=-cVwN/Xd2NZTsdcaY+cOO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYGvQAKCRDZQZRRKWBy
9EiZAQDgH7HdEx0kZfJoihc2NEWpoQw2AZO/TWinadRHtBt/SgEA5WsnvdZUOkaR
KYMLUEnn4bMuAzk58Ugd+hcGj6IXvgk=
=dLTW
-----END PGP SIGNATURE-----

--=-cVwN/Xd2NZTsdcaY+cOO--

