Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D4606A6B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ZIzx4XI;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mTv3vD3t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z3il6KTodoHY8wYVpUPQzETMZOTZfRXZT7LjCWqHye4=; b=0ZIzx4XI/Z0ujjLO0jLCADGQhU
	3VO8dAweRFvRy+BkJL3vhob6T1DppnNjpe7NP1J5hiY0ZXd9v5sCNHy+A3DH8x4VzG08g04Z7XJpC
	2vnLw+joOTZJ9QrYMsOLMGYsmFPAAWY4gswcu/93XFvXreFFl9prYJT2KG45UV11PeejDPw5UTm98
	pkPuYOhZK12T2w2WnsfmyiGGtbX96FHeCCIDfKK5z9lQAU/5Cey7JA4rtl2cM64Lrs6tsY/e+zI79
	2twQ/P+3tKrc58a7U9M63oN5Jt6B0xlS9/u7P6BgIewhJeg0tx8zCMwKZd7jaPtnh0EWtvy+p4SOP
	ZjheenIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxrZ-00000007poS-31Pv;
	Tue, 24 Nov 2026 21:15:41 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxrP-00000007piu-02Kg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:15:40 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-93a40a9a01aso709973585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795554930; x=1796159730; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z3il6KTodoHY8wYVpUPQzETMZOTZfRXZT7LjCWqHye4=;
        b=mTv3vD3tnGhH2oSVtB0S2oq5WZOuljD/B0eQ1F7AWoT7N0ranZy9xIqlTP+HCU4ToW
         2weTboSIU4oFEJ4Z08u9uSc6kzyWlj29szHZOR+KwcGbE+Sg2CHCXReHIhSNseeX5gPA
         ltgseO7nbtNnHb4OqajJDQfyc5fqtTJ2JaS+rm55IJsjYEK91ZTyZa0gjkPkS5kcaS9N
         kFmQKsuPJB7UK3bFQrBVqty4aFY/KJlpWAHVk8J3EPNtXzsH0L99Aslr13oXpuhb4PHd
         Wo57zWPQnxiEZo2Zfj5R2yabuT+A5A+spuvqBgv9Bj7Nms9WxFhqmvcxEnMzdd5w0XOl
         ucqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554930; x=1796159730;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3il6KTodoHY8wYVpUPQzETMZOTZfRXZT7LjCWqHye4=;
        b=atDZM5C3fK3jjj4h7Yl1bP6/yR0JbhqyJzYLSMXAzwaDfp618ILWaBT9rInRLtgpG6
         qo9/I//hUYerbwnxuUsW01QNVMSFJY61+5N5kcWhipaquOksCNUou/sCOchAqgZ10yxZ
         3WM/jA9n7ow68GGaBh8gtRmEIAFdsBiw9ltRfkJF+7IMOkpR1eR3iqvWI6valBsUN3Rm
         696PLT77J9EHGTUla+oI2ZHwafdC7u8TRIWduBABc4Q2+xR63WSilWo/90jI+wHjK3W1
         VwJQnxUkkfWCR1bS/zFWce1hibB88Fhp2OVgfclN4KVpwtjUnLatpyv8ZYZFUc/jsQaD
         V7Ig==
X-Forwarded-Encrypted: i=1; AL+hErHAGygAZ9VKIlqugs6W+lFN1kvKAKco/grpiMhJ+nu9YoOE/QWhPzIFVzSYlnzTKzWa4m2pN7tYl4QK9OadiUhw@lists.infradead.org
X-Gm-Message-State: APuU4Z+9fQRLMdWmGE5NbNbSrFf6Wg8ZRdkCS+IWivREuKiciRiixIxC
	rFSmPC3iaEn40VR3IUdHPlNbrchWYmRxap0G6WMsbB5VdLCK/vPcolluQm7F9+o0o1k=
X-Gm-Gg: AZFdTZegY3Fw12jaQNImEg8X98rKpLK65GbVTK6531DgaQBuH/MeP3r1u1C0hxCqO3o
	pyMtYq4vsu6nnkcp6G5bfU9xWTWlqr+NXtEDz65rHgF5nw+Ws4fUnkNMx3Y84UV1Tjl2/thEwbv
	s413j/bVDg+BeZO/vVl8q0aXGATHQezMWBrxE4GsvAXecADaCiHINthiLRKRJR4vFT3WDhNEVcs
	z0jth92cn7BRi5rEnBgC3uB1OjaG5tCRHIhcZ0Gb9vz0j8PJz49nysnLBA7QMthX3STZ8RBRfNo
	+6xzBQsVML+YbtvpaoE3VEp49gdMj/QsDo1T10G8H/UyRa0Xw5MpJXB3AdplEiwEQ8sw4L3bPWt
	nvWNbF0U14cI77SEziFFO0EiuK1FAsvYp69R5CLVeZMuy0uv9i2hGACfBeJvIrlBFiOaQaKPH39
	dd3SPsIVGhH6YTaM9kj3WgENROCnBal9pMdDhh6/scQMJrPkmV/UjJbT1I4HrvTBU1N2miylTBB
	T4Z+DMnPKwJcmib0Xn/H8XxlXxggVFYU8LZNzkfN1L0jWfnR6K6vgEZhCk5nHqsn6szZvsYcZzp
	aIhqr71dH6FkGhUn4VhF9VJ3lby8mLIwQswwEiOfJZZ8wDAx48egr+A=
X-Received: by 2002:a05:620a:4142:b0:945:d6e9:9a8c with SMTP id af79cd13be357-949baa0735emr2694961785a.33.1795554929441;
        Tue, 24 Nov 2026 13:15:29 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34a8d3sm1142411385a.10.2026.11.24.13.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:15:28 -0800 (PST)
Message-ID: <703f40d914dcb1a4e947e7b06a9e05e926fa9a2b.camel@ndufresne.ca>
Subject: Re: [PATCH v2 09/17] media: rockchip: rga: adjust get_version to
 return the version
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
Date: Tue, 24 Nov 2026 16:15:27 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-9-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-9-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-9kBp7W93i2GBnXDBo1st"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_131531_094564_6D3AD653 
X-CRM114-Status: GOOD (  19.22  )
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

--=-9kBp7W93i2GBnXDBo1st
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Adjust get_version to return the version instead of directly updating it
> in the rockchip_rga structure. This is done in preparation for a
> multi-core support to check that cores with the same compatible share the
> same version.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c  | 10 +++++++---
>  drivers/media/platform/rockchip/rga/rga.c     |  2 +-
>  drivers/media/platform/rockchip/rga/rga.h     |  2 +-
>  drivers/media/platform/rockchip/rga/rga3-hw.c |  8 +++++---
>  4 files changed, 14 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 4d7b0a03820a1..190104f3b2954 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -474,10 +474,14 @@ static bool rga_handle_irq(struct rockchip_rga *rga=
)
>  =09return intr & RGA_INT_COMMAND_FINISHED;
>  }
> =20
> -static void rga_get_version(struct rockchip_rga *rga)
> +static struct rockchip_rga_version rga_get_version(struct rockchip_rga *=
rga)
>  {
> -=09rga->version.major =3D (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF=
;
> -=09rga->version.minor =3D (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F=
;
> +=09u32 version =3D rga_read(rga, RGA_VERSION_INFO);
> +
> +=09return (struct rockchip_rga_version) {
> +=09=09.major =3D (version >> 24) & 0xFF,
> +=09=09.minor =3D (version >> 20) & 0x0F,
> +=09};
>  }
> =20
>  static struct rga_fmt formats[] =3D {
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index c24bc8e26b91e..2107d0f4a1659 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -860,7 +860,7 @@ static int rga_probe(struct platform_device *pdev)
>  =09if (ret < 0)
>  =09=09goto rel_m2m;
> =20
> -=09rga->hw->get_version(rga);
> +=09rga->version =3D rga->hw->get_version(rga);
> =20
>  =09v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
>  =09=09  rga->version.major, rga->version.minor);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 0e62337f8dd38..0e854cdf739f4 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -158,7 +158,7 @@ struct rga_hw {
>  =09void (*start)(struct rockchip_rga *rga,
>  =09=09      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
>  =09bool (*handle_irq)(struct rockchip_rga *rga);
> -=09void (*get_version)(struct rockchip_rga *rga);
> +=09struct rockchip_rga_version (*get_version)(struct rockchip_rga *rga);
>  =09void *(*adjust_and_map_format)(struct rga_ctx *ctx,
>  =09=09=09=09       struct v4l2_pix_format_mplane *format,
>  =09=09=09=09       bool is_output);
> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/medi=
a/platform/rockchip/rga/rga3-hw.c
> index 46ba6d270f232..a80dd7609ccfe 100644
> --- a/drivers/media/platform/rockchip/rga/rga3-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
> @@ -299,12 +299,14 @@ static bool rga3_handle_irq(struct rockchip_rga *rg=
a)
>  =09return FIELD_GET(RGA3_INT_FRM_DONE, intr);
>  }
> =20
> -static void rga3_get_version(struct rockchip_rga *rga)
> +static struct rockchip_rga_version rga3_get_version(struct rockchip_rga =
*rga)
>  {
>  =09u32 version =3D rga_read(rga, RGA3_VERSION_NUM);
> =20
> -=09rga->version.major =3D FIELD_GET(RGA3_VERSION_NUM_MAJOR, version);
> -=09rga->version.minor =3D FIELD_GET(RGA3_VERSION_NUM_MINOR, version);
> +=09return (struct rockchip_rga_version) {
> +=09=09.major =3D FIELD_GET(RGA3_VERSION_NUM_MAJOR, version),
> +=09=09.minor =3D FIELD_GET(RGA3_VERSION_NUM_MINOR, version),
> +=09};
>  }
> =20
>  static struct rga3_fmt rga3_formats[] =3D {

--=-9kBp7W93i2GBnXDBo1st
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX+bwAKCRDZQZRRKWBy
9NsOAQCl3SgdekdUazoIM+9kZjOfYaaF7SSYgHlc1SnMx39trQD+P0z+r4RLdX3v
/WShUTo6ARwWWF9wVLmMB/rnLbeJ9Ao=
=rVxF
-----END PGP SIGNATURE-----

--=-9kBp7W93i2GBnXDBo1st--

