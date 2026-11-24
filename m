Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E980606A688
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=393QLrcV;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PWLLp7S4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XvU8I+vB/hnkSYqyvTC9KODVvqvC++EcA5WWKHIkmy4=; b=393QLrcVi2yOwDWI1qhTjAqWnL
	BOEtVjluDCcwFZ3/qA6Hp1Xzwpnnv0SlzWVLzBf4BLLWD24syhts6JY61m6Z02UvI1wN9RtRjHhHg
	p5krRtl8uxJgLEB+Ul8kmdJjlKd5WkaV5yosQ9iAulh1EDDHYVXu32nrCY3d3h99anCfKsZ9sRdPR
	u9ltKz08HYZBMwlLeHQBBpqilgenH/15GncQs7ciVbuQaI3ZuY0pC+0A+VKe0+1YYYnR3mQjfRKPR
	spcK+rXxSaG0birggEaKQiLIst9JGsl8BQz59lPm3PRPfMgjKoZv7BaID5KEiZPDZdhxVJUXTr3WM
	q+rnKXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyDq-00000007tFR-06IL;
	Tue, 24 Nov 2026 21:38:42 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyDJ-00000007t5T-0oXO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:38:29 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-93f22a8515eso439971185a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795556288; x=1796161088; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XvU8I+vB/hnkSYqyvTC9KODVvqvC++EcA5WWKHIkmy4=;
        b=PWLLp7S4jf3Ac8oxvJeks905cxZ3/nsfan97XhrdYTsKc5h5MZAnSuR7T1lUkpC3CZ
         Qflo3z361VLot/tObGtKKAhG1raJyqSV2ffRjNSFFYvDaMBWDLEtvzaic4JKCLr+JjEq
         oE9XxCfbgsyJvfDcipLhrvtRvKSnE6qfy2IBMakyxPWfDl4YQjjv3Q0u+wQRuBzWzswc
         RWIwZXVQ+LF1T4RK2sXE78S14EhyyPacj2fupdDtOwmkc0J2JzTT6Kb1lkHdz+vDDF75
         Obs9hODwsqiXDsiyUmaVjIH1fxcueAaPIBs4CAZ5kJNT2xtMLY80RUhCiDbQt1Gehso8
         CjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556288; x=1796161088;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvU8I+vB/hnkSYqyvTC9KODVvqvC++EcA5WWKHIkmy4=;
        b=JzVL7PNKDZ3ZVZCgPtLw3Uru6LmVmo791T5IYIbwNO6vpF8TwDwT0GUa2JBPgMzox9
         kYNHUI2TPlvFY4EQIxb0EvzsFEK4egrhG+u1jIIZwkCp+EptGRFpE4vL/fif2ONPfGvZ
         2OyVqIPXZ3IJUy7B0M+569+1aLsn327ddxv+YHg8lf9Jh5zzB0WRvB9rVjgacjeJzWWJ
         yXouFkTodfJFwe5om0ZCnOW+VLE4Smz6v3VGYiwaIMly1r9Ro+ztoee1nAK/n74+CKyW
         fTMqsAHllWbI/slXXuANfqUAj7PmNCmQHU04j7cARurQ4T0MFPgzQV6JxLMUmD4HKGuo
         Ic6A==
X-Forwarded-Encrypted: i=1; AL+hErHFjkweLYVQE3Jcc0RxJzyqwAJFNp2h84I3dM/vO+F5N28Y1WYXE7eBMAIeBfDWcjz/7KXPfbhVD7Abyakv7XUT@lists.infradead.org
X-Gm-Message-State: APuU4Z+H+4pB71sEY6JkhXIjJpVEDoPtff5deAlaBzzf1vHM1x7LCvPk
	h/UNdBcuH+p7mCg8TmsV8kAHqrSOp406rvPlYNoR+MPp8aKGpzmzLU5wj9YRcB+VNso=
X-Gm-Gg: AZFdTZfqdISJKxVpyRjavAI7rZeSxWHS8dBLFhosUG51gc1Xx0YhXZROdAfXaV35t88
	u51Ho2LEXpDQ4/1D2Ti8lrXI+tds24/xn8o8kgSsVh/b2rByOW0KKWGTb1mzP06sLtyGSk5tpsK
	iLQF1ACz4B8iIdySBJfp+519gROtmzLsK3PkYDVDx1sdLrp2DZN3Se9O8F+abFWF+btNu4IT+4m
	2fVT9+Sm5l1JM2NuIIDuEElpG8BrLQa+4TGVlRBTBXBxoQ2Vd/phks7SU/Wzkfn01DBAmJWAPKR
	a840Xa0nRfifFYll3jR1cUYG5boap6WrNufVfVrJAWGGC8M8FPvXZGUzWmqraBJUc5MOjs+Umb+
	Z3VFaco4nwbsmFrqRx55SFCwZEhwnWIxTUemBuxob2QiL/qZACpej4flCVcsmWGh0EBaVWWcs8Y
	jdag+r/0UBYQiCeEP/3ENr6HYwpwV6G8Sg+KWMdzCOgauw0sF7pFfsGRABZgzGH4C9kLfmrkQG0
	+yXAT8sIDMg2lfsa7eEvwM/WMA3ZrXURYIeEEQBn8YegroWc+GUvOqxzJ3UHD9+QJWqTNmCaVPP
	eAKXJP/aScqQIegrCrGxOSPkk4JkdiXnBsbXQJE8AJlEuAwKt/bWHZI=
X-Received: by 2002:a05:620a:2988:b0:93e:c12c:f11f with SMTP id af79cd13be357-949bab3a1edmr2796314185a.75.1795556287741;
        Tue, 24 Nov 2026 13:38:07 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb4481c2sm1133265885a.43.2026.11.24.13.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:38:07 -0800 (PST)
Message-ID: <5282c61813191d778e724ea27e0b81c554ccc945.camel@ndufresne.ca>
Subject: Re: [PATCH v2 14/17] media: rockchip: rga: move video device to the
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
Date: Tue, 24 Nov 2026 16:38:06 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-14-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-14-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-0uIQZovRXgZxDGcSLoFT"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_133809_264187_52181BA3 
X-CRM114-Status: GOOD (  29.35  )
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

--=-0uIQZovRXgZxDGcSLoFT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Move the video device allocation and registration to the master
> component bind function in preparation for binding multiple cores
> to the master. Moving it to the master bind function allows to
> only register the v4l2 device when all cores have been successfully
> bound to the master device. This also causes the video device to be
> bound against the master platform device instead of a specific core.
>=20
> As v4l2_device_register sets the drvdata (if it hasn't been set) to it's
> v4l2_device struct pointer, v4l2_device_unregister also zeroes it if the
> drvdata matches this pointer. This creates a problem, as the driver
> allocates it's main rockchip_rga struct during probe and sets it as it's
> drvdata. As the v4l2_device struct is the first element of the
> rockchip_rga struct, it has the same pointer than the rockchip_rga
> struct. Therefore v4l2_device_unregister incorrectly assumes that it has
> set the drvdata and clears it. This causes problems, as unbinding a
> core will unbind the master component, but not remove it. Therefore when
> adding the core again, the master component will be bound again and
> tries to access an NULL pointer.
>=20
> As the rga core binding expects the rockchip_rga struct to be fully
> initialized, bind the cores as the last step of the rga master bind.
> This also avoids a potential isr to hit just between the core bind and
> the actual initialization of the m2m device.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2
> - unbind components in the error handling of rga bind
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D11)
> - Bind cores at the end, as they expect a fully initialized rga struct
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D11)
> - Fix v4l2_device_unregister clearing the drvdata set on probe
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 109 ++++++++++++++++--------=
------
>  1 file changed, 58 insertions(+), 51 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index fa34b93b1b7a5..39fcb5623095b 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -746,39 +746,15 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
>  {
>  =09struct rockchip_rga *rga =3D data;
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
> -=09struct video_device *vfd;
>  =09int ret =3D 0;
> =20
>  =09core->rga =3D rga;
> =20
>  =09rga->cores[0] =3D core;
> =20
> -=09ret =3D v4l2_device_register(dev, &rga->v4l2_dev);
> -=09if (ret)
> -=09=09return ret;
> -=09vfd =3D video_device_alloc();
> -=09if (!vfd) {
> -=09=09v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
> -=09=09ret =3D -ENOMEM;
> -=09=09goto unreg_v4l2_dev;
> -=09}
> -=09*vfd =3D rga_videodev;
> -=09vfd->lock =3D &rga->mutex;
> -=09vfd->v4l2_dev =3D &rga->v4l2_dev;
> -
> -=09video_set_drvdata(vfd, rga);
> -=09rga->vfd =3D vfd;
> -
> -=09rga->m2m_dev =3D v4l2_m2m_init(&rga_m2m_ops);
> -=09if (IS_ERR(rga->m2m_dev)) {
> -=09=09v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
> -=09=09ret =3D PTR_ERR(rga->m2m_dev);
> -=09=09goto rel_vdev;
> -=09}
> -
>  =09ret =3D pm_runtime_resume_and_get(core->dev);
>  =09if (ret < 0)
> -=09=09goto rel_m2m;
> +=09=09return ret;
> =20
>  =09rga->version =3D rga->hw->get_version(core);
> =20
> @@ -787,38 +763,13 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
> =20
>  =09pm_runtime_put(core->dev);
> =20
> -=09ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
> -=09if (ret) {
> -=09=09v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
> -=09=09goto rel_m2m;
> -=09}
> -
> -=09v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
> -=09=09  vfd->name, video_device_node_name(vfd));
> -
>  =09return 0;
> -
> -rel_m2m:
> -=09v4l2_m2m_release(rga->m2m_dev);
> -rel_vdev:
> -=09video_device_release(vfd);
> -unreg_v4l2_dev:
> -=09v4l2_device_unregister(&rga->v4l2_dev);
> -
> -=09return ret;
>  }
> =20
>  static void rga_core_unbind(struct device *dev, struct device *master,
>  =09=09=09    void *data)
>  {
>  =09struct rga_core *core =3D dev_get_drvdata(dev);
> -=09struct rockchip_rga *rga =3D core->rga;
> -
> -=09v4l2_info(&rga->v4l2_dev, "Removing\n");
> -
> -=09v4l2_m2m_release(rga->m2m_dev);
> -=09video_unregister_device(rga->vfd);
> -=09v4l2_device_unregister(&rga->v4l2_dev);
> =20
>  =09core->rga =3D NULL;
>  }
> @@ -944,20 +895,76 @@ static struct platform_driver rga_core_pdrv =3D {
>  static int rga_bind(struct device *dev)
>  {
>  =09struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> +=09struct video_device *vfd;
>  =09int ret;
> =20
> +=09ret =3D v4l2_device_register(dev, &rga->v4l2_dev);
> +=09if (ret)
> +=09=09return ret;
> +=09vfd =3D video_device_alloc();
> +=09if (!vfd) {
> +=09=09v4l2_err(&rga->v4l2_dev, "Failed to allocate video device\n");
> +=09=09ret =3D -ENOMEM;
> +=09=09goto unreg_v4l2_dev;
> +=09}
> +=09*vfd =3D rga_videodev;
> +=09vfd->lock =3D &rga->mutex;
> +=09vfd->v4l2_dev =3D &rga->v4l2_dev;
> +
> +=09video_set_drvdata(vfd, rga);
> +=09rga->vfd =3D vfd;
> +
> +=09rga->m2m_dev =3D v4l2_m2m_init(&rga_m2m_ops);
> +=09if (IS_ERR(rga->m2m_dev)) {
> +=09=09v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
> +=09=09ret =3D PTR_ERR(rga->m2m_dev);
> +=09=09goto rel_vdev;
> +=09}
> +
> +=09ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);

Shouldn't this be kept last like it was before?

> +=09if (ret) {
> +=09=09v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
> +=09=09goto rel_m2m;
> +=09}
> +
>  =09ret =3D component_bind_all(dev, rga);
>  =09if (ret) {
>  =09=09dev_err(dev, "component bind failed\n");
> -=09=09return ret;
> +=09=09goto rel_m2m;
>  =09}
> =20
> +=09v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
> +=09=09  vfd->name, video_device_node_name(vfd));
> +
>  =09return 0;
> +
> +rel_m2m:
> +=09v4l2_m2m_release(rga->m2m_dev);
> +rel_vdev:
> +=09video_device_release(vfd);
> +unreg_v4l2_dev:
> +=09v4l2_device_unregister(&rga->v4l2_dev);
> +=09dev_set_drvdata(dev, rga);
> +=09return ret;
>  }
> =20
>  static void rga_unbind(struct device *dev)
>  {
> +=09struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> +
> +=09v4l2_info(&rga->v4l2_dev, "Removing\n");
> +
>  =09component_unbind_all(dev, NULL);
> +
> +=09v4l2_m2m_release(rga->m2m_dev);
> +=09video_unregister_device(rga->vfd);
> +=09v4l2_device_unregister(&rga->v4l2_dev);
> +=09/*
> +=09 * As &rga->v4l2_dev =3D=3D rga, v4l2_device_unregister (incorrectly)
> +=09 * clears the drvdata. Therefore just set it again
> +=09 * (ensuring it's correct regardless of the struct member position)
> +=09 */
> +=09dev_set_drvdata(dev, rga);
>  }
> =20
>  struct component_master_ops rga_master_ops =3D {

--=-0uIQZovRXgZxDGcSLoFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYDvgAKCRDZQZRRKWBy
9GqGAP4q+QYBtXorY2V20/Fjjuwd/k9H1RlDAJC1g2YbcNegfwD+N43LeKqeaQ/8
2zEP9Za6fbSKXjaFDf0/ir5zRkms4gs=
=wsLc
-----END PGP SIGNATURE-----

--=-0uIQZovRXgZxDGcSLoFT--

