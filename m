Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B0A606A69E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cUFG9VgR;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VflUSknz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K75pxNkSXMitBetgHqOhrCWvaHGIRkdfbpsqksN5qNE=; b=cUFG9VgRKpAjVOAsZAv+E3HfdZ
	bw2iqhFaYyKaAddjGqT2E+aUpWof9i8FqWv1i/IldJHMYJoWt52snx2dQSB0S6YzPXrEdcYSkFtti
	Bx/Z9vGMlWBFLGAbnUX4Xtw3EhNJrscFbjYR7bCzJNo5EAaAi2UOALVyopPnKG8bRsynRXP+Clzuc
	BrK/RIIP7LjSGUpHUoi70VJ2pIa5RI3Z8Lk7q+jA/fYWOIlRzLGvTFF39U0d/YuA8yusfSRtUTYOa
	zMK/y8jIO3QUvJCz5zp5zB4bv6GIaMJYPNyYz8slGE/1bNViMXDivLi/G/KSOoazXJH/pvukeQ5bm
	LvULXfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyJ0-00000007uBo-3dN6;
	Tue, 24 Nov 2026 21:44:02 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyIy-00000007uAj-1F77
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:44:01 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-9495f083657so559045885a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795556639; x=1796161439; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K75pxNkSXMitBetgHqOhrCWvaHGIRkdfbpsqksN5qNE=;
        b=VflUSknzQ8VZ7/00n2WlNeaRjlPV5vE5sCv28r4wzuzl3G4qCKSZmoxkYnorsRzhLE
         oJTVEMk6d62qSsig5oTaDtapEinG7Kff0jNEI5kzaZ2g7uLRBHCRUgP/19P6lzAuRThc
         uQrLL0yiXET27YeyWumjGvDlgL+RvgptVwiiwSjVe8J49nJTcu7zYy26eIcqM4igrKsv
         BqWLLeg5KJjKjd5t63O6mebWSS5JZ0mbMzPYKOY86x1p7MR5VzgUMeX6vOBJG9D5Uz9a
         RI+ZOjlhYvcNGuurPDWkrvckSCJJth5DyIcTM7ARVZcPqNNob/KQg4o7B9JUnFdedI5l
         5DHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556639; x=1796161439;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K75pxNkSXMitBetgHqOhrCWvaHGIRkdfbpsqksN5qNE=;
        b=iG6Mlql9Xp2dy/mxStZNNINcgn7lJAouX3HWulqA5cICeVKBarzzqjmTtKqVYIye2F
         VOumSQD/Zbt0cPqD3qvX38XXPGC4g+SVQHNyY9UHjygo37zsrabfOVuI+5kLaeUfhhMH
         40u8yje5+lMjD27hPCFQjEiGrU7hGpPXloU4lArBIkWCs55rm1yCP1WijcJ2Tir7oOnX
         WSBQuIGacVGbrk4chTAcicRhU8NzCkEBTeLZoEMwqxUSmxKVyAZdS1SRWaE9iiI9OTF7
         5283jcZp92m+qcRNtJxWPdLfzPSYkZuhE62sO3+m3Dp/MZLVoENeYLzTTQma5/HfiegV
         55Uw==
X-Forwarded-Encrypted: i=1; AL+hErFZrxrRulx+CZMkT2XCeQLD9TYmnS6N+oMZDh/GChNY9r9KGsso+UR3OZ5nhb5cYC2koidu2C40hLBM4Ntg+hzN@lists.infradead.org
X-Gm-Message-State: APuU4Z+JD1Lmgp3cS1AvRbKHUKLIOeMO060cj7ZpXPAtxGYBw+DuCL7p
	ZNSzp6TzeA9jFdaV7E119qqsC++BSs1SO7aZNqYFeslEc8fUyZOMExOhO+RSsSthFRU=
X-Gm-Gg: AZFdTZfWOVsftHfzhy/SgoXkGS9giptEU5EnIjVIqe8cPkYcw1lF8/DPLo7zNrB+b0V
	Mubsc1QpohrwQAob2DoYEVtDTICDaMsdOcVb7GI4/w1vch9WhCyyUmJ4xv7X80dIYmAqewcBrzg
	7LG/NduQtjDGBSIaoCdbPnfR6vLIFU1Zv4ditPRhWyeh7H84bO+zgc0nDBu4wigvDieP6zWUhZT
	ygqfZzVxlypSDzzaX4GN2SYEEFVTnG77ARJ7QSJZSbRjcuA32ldgJloOkcHjpj1OvmRPJhIxvHG
	WoYeyFJy8hEGwQSEHn44gMJMBc/lvzgYvMrS7/dOSUpmtjNhlZcUhDYJZ115o8YKMwCV+TtF0XF
	K9QIUBqDVYvxd6x48hn/uWZ4tjHNIgFulPRIWuKLMqHG590xrRPbnNfSm5p/zlQDYHVobGrz/EH
	qBgJc6KcRRcZ2wN6FQqa6U3RrJsQrMf0dNAOsICV2QUCmXNH+dbUeU3K6nT0z87a05PM0J/sk1Y
	LluYXOLtJfX9A6+WzFC4t+1H/ww/BrR2i2EBGH+FF8o8XZ7AZb7VbvgVETwydNmexePUqZ+EJWq
	ZLYFXnQs18eBn7GfppTYS3fIQt6qHko5TztftI3TmKOywuMRPuIVDjA=
X-Received: by 2002:a05:620a:2708:b0:93e:7944:b869 with SMTP id af79cd13be357-949bab1dacfmr2718566385a.42.1795556638916;
        Tue, 24 Nov 2026 13:43:58 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949c555faf9sm1038617585a.0.2026.11.24.13.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:43:58 -0800 (PST)
Message-ID: <e2efd3238a5adaf41af0c6edf9c32e2705f683b7.camel@ndufresne.ca>
Subject: Re: [PATCH v2 15/17] media: rockchip: rga: bind all cores to the
 master
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
Date: Tue, 24 Nov 2026 16:43:57 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-15-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-15-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-S18NZIspGqx/2Sw1fM9/"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_134400_714685_24C8E4A2 
X-CRM114-Status: GOOD (  28.66  )
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

--=-S18NZIspGqx/2Sw1fM9/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Bind all core components to the master component. Previously only the
> first core has been added to the master device to avoid creating
> multiple video devices. As the video device creation has been moved to
> the master component, it allows us to bind all cores without creating
> additional video devices.
>=20
> We expect that all cores to report the same version number, as we only
> add cores with the same compatible value. This is important, as  we
> setup the command buffer before actually scheduling the work to a
> specific core. Therefore adjusting command buffers depending on the
> version register only works when all cores have the same value.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2:
> - Fail (instead of warn) on a multi-core version mismatch
> - Also decrease the num_cores when unbinding a core
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D13)
> - move rga->cores at the end of core_bind here
>   (previously done while moving code to rga_core_probe)
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 36 +++++++++++++++++++++----=
------
>  drivers/media/platform/rockchip/rga/rga.h |  1 +
>  2 files changed, 26 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 39fcb5623095b..5348fcc03c525 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -746,23 +746,33 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
>  {
>  =09struct rockchip_rga *rga =3D data;
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
> +=09struct rockchip_rga_version version;
>  =09int ret =3D 0;
> =20
>  =09core->rga =3D rga;
> =20
> -=09rga->cores[0] =3D core;
> -
>  =09ret =3D pm_runtime_resume_and_get(core->dev);
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09rga->version =3D rga->hw->get_version(core);
> +=09version =3D rga->hw->get_version(core);
> =20
>  =09v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
>  =09=09  rga->version.major, rga->version.minor);

Use version here, instead of rga->version.

> =20
> +=09if (rga->num_cores) {
> +=09=09/* we are not the first core, expect that we have the same version=
 */
> +=09=09if (rga->version.major !=3D version.major || rga->version.minor !=
=3D version.minor) {
> +=09=09=09v4l2_err(&rga->v4l2_dev, "Detected multi-core setup with differ=
ent core versions!\n");

pm_runtime_put() is skipped, maybe some more cleanup? I know this should no=
t
happen in practice.

Mostly from Sashiko here,
Nicolas

> +=09=09=09return -ENODEV;
> +=09=09}
> +=09} else
> +=09=09rga->version =3D version;
> +
>  =09pm_runtime_put(core->dev);
> =20
> +=09rga->cores[rga->num_cores++] =3D core;
> +
>  =09return 0;
>  }
> =20
> @@ -770,6 +780,18 @@ static void rga_core_unbind(struct device *dev, stru=
ct device *master,
>  =09=09=09    void *data)
>  {
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
> +=09struct rockchip_rga *rga =3D core->rga;
> +=09u8 i;
> +
> +=09/* Remove our core from the list */
> +=09for (i =3D 0; i < rga->num_cores; i++) {
> +=09=09if (rga->cores[i] !=3D core)
> +=09=09=09continue;
> +
> +=09=09rga->cores[i] =3D rga->cores[rga->num_cores - 1];
> +=09=09rga->num_cores--;
> +=09=09break;
> +=09}
> =20
>  =09core->rga =3D NULL;
>  }
> @@ -992,14 +1014,6 @@ static int rga_probe(struct platform_device *pdev)
>  =09=09component_match_add_release(dev, &match, component_release_of,
>  =09=09=09=09=09    component_compare_of, core_node);
>  =09=09num_cores++;
> -
> -=09=09/*
> -=09=09 * As multi core is not implemented yet,
> -=09=09 * break out of the loop to only have one core per rockchip_rga st=
ruct.
> -=09=09 * Also put the node, which otherwise would've been done by the lo=
op iteration.
> -=09=09 */
> -=09=09of_node_put(core_node);
> -=09=09break;
>  =09}
> =20
>  =09rga =3D devm_kzalloc(dev, sizeof(*rga) + num_cores * sizeof(*rga->cor=
es), GFP_KERNEL);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 94e14c2a2ba6e..522021c3e0249 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -89,6 +89,7 @@ struct rockchip_rga {
> =20
>  =09const struct rga_hw *hw;
> =20
> +=09u8 num_cores;
>  =09struct rga_core *cores[];
>  };
> =20

--=-S18NZIspGqx/2Sw1fM9/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYFHQAKCRDZQZRRKWBy
9JrdAQCUIkDVrw3+EoP8Ue1222LowADVIPyRvbxq5uVXsnQwsgEAjWrOYaUn7LBp
yWr81kHaqm0ymKihIGhaG7/fRJBbxAw=
=0Uj+
-----END PGP SIGNATURE-----

--=-S18NZIspGqx/2Sw1fM9/--

