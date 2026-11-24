Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDD2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BaeQ5l4C;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZPwD4VLg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fiIU6xlbIXxSNj9YDB57fALFXrcAD48xRem5XKs4A1U=; b=BaeQ5l4CVWowfv1XUvnDkUH62Y
	EVxw+wj5MANz96xXzRcXITVlgQ865+Imu6ztS8uckAOyJKurosVX/ss1FgYqJj7N3lCuyKCh5o7zV
	hVKU1AWLBUutMrvXb5E/I7va7TSO7XmcR8gSkz5oDi88k7GZ9F8EueGBf+9+6jSEOqbzW0foUOKBz
	DQhGSy5yDDWsXPMLKEWRke94wTEo7zhotQQ9fEmJkb2a9vibgVwXfeJ+9hvqXhi8p08DJC76TuHgq
	ev2amrBZD+ORulUDH76hO6uMYAqZVCH21E6bDX1GeHFV5sv9papgogdAWFk6RN3NPW11iwq/ZlpvZ
	X0puGcAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxPY-00000007l7w-1T53;
	Tue, 24 Nov 2026 20:46:44 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxPU-00000007l6X-3NtW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:46:42 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-55c5b6584ceso37101621cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795553199; x=1796157999; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fiIU6xlbIXxSNj9YDB57fALFXrcAD48xRem5XKs4A1U=;
        b=ZPwD4VLgt1BHvUVYZ/AYCj6Sq2/k3eliCJ7B8t+NjMcKOsA6RcTBEKH0ELpRMStNxD
         62V3Aa6cDuUlttdZkwLCimgA+xpLoEDnBS+ik6PF+/D8HM9pqvIiPrbS4vM0dFl99+vc
         D9fCwItJSxiCN/6YJpEqbscgKDt1gN72GB1yhDbWCs4cd+ze8g+H24Drq8xzdezTM2tx
         /CHHfyrKLin2IraDi/T4PQZT8EF/GtYDS05CrYEeKsciIIPIHvvOoCAqwZLdzAgzxk0x
         7zJTNdnnw00EHtET3z4nl2yrFU1pwWNurj3Ees3RMzfNNuyz/1E4zeZd0Y9Hd4PQvlV0
         8jWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553199; x=1796157999;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiIU6xlbIXxSNj9YDB57fALFXrcAD48xRem5XKs4A1U=;
        b=njNYmqCwFGVGlg6ABaZy/V8Co4Rcpb2WcynUElrDe2SVR+O8u1FPMM/KEIkxHR0O86
         WvLs1//DiaiG5TnOVENum/jpVgfS86HYbM5yV8cHYpqfRVMg+MvOqSZFNgZYCIPifdgN
         +P/zJroY1LRdGFR+37goRLWx2FSz91qrCqo53SBCSrxlB0MvzhQaEUdx2BS6DQZIVuMd
         5jO4fhdeUTuD9jPuv0yJc0/Mb1/EzW1PkPVQwBWsrW+PYJ+MUuVtrYxv+nhqTyixO0yz
         /hmsszyXeQlsrbY1oNqWpIeCWQbatJiBsjUB7yT4petC/BQa0sOVDVuHj4YU1yBEE9WT
         ZO4A==
X-Forwarded-Encrypted: i=1; AL+hErGPCOOPd07uCi/ymzyFIMtyE5Iha5mcXyak5ApN+QkNkqNHKUmcE1FpmJeU6LmDicrnguose8csTY5AP9rhSIJ0@lists.infradead.org
X-Gm-Message-State: APuU4Z+w0cWI3S+k1GmdbxjUkN58uZ3Pbv3pCBgvdOlMNy/Jk7lyoB8I
	IBZ7WOXYj2NeMbUlSwJ1DeGtPme85KHIb3URBPs8cMVH8VWtLP0CxrX4Nvi2dxX64tg=
X-Gm-Gg: AZFdTZfDOCa2lBtShIDFmcXDvAtjUWrj8zmQxN/2JIeOy1Nh004HF/VO0Hnfk9nHkjI
	ayvu3A4Nh79a8oIDDwJiOECUyVG9NupJAHs0pRFb4BCDTRfWPEfwreCtY01J2/xZMJBYDgOC9yF
	3jg+d+Zs+2s76PhaKNq+vwpUT3KPcigTzLVfCdhUVzjjqdCkWDSfMaMz7088thO5xz6uvo0VX+o
	iLEy/3MQcgGqMuEw1c0HbzKOFZcBeCY3FQpqCGa5SaTUEMMxeolJ85wOffHzlkkZItwo5zmSJX6
	XgLwYJWBxPrcOFo628+FEX22YR8GKe2RNoRU7eg7qn7vUmmO49kYvxExhnTGThg8QpyQBcxZPB3
	3UTXUo3wXgYaETr+lHZ3RYuXwRJO5eQg2je3ouC0O2ZigGUdF48TmWjgi8JgIBFt8IG5GwOasLX
	OGWcDzqCPMA+2EGcjYQvoK6UGK8TB9MxkxT7h75iY41Dfals8v3tHJSv49poeSAkTwc3h4mHdQ2
	ff6kbXdwrFLPYUUci8ORJFxTTjeO6yPrBaMZ7T1feusccCL9WlW4oqbanJ2QzwhwkmeiBU74VpJ
	ZVggDjAXmOlcDIEvYqvWSjf967mU1Al4CgUVWzc0mh3bxSIkxfOKAEw=
X-Received: by 2002:ac8:5a50:0:b0:535:a5fa:ee05 with SMTP id d75a77b69052e-55d76a68f72mr297291921cf.69.1795553199445;
        Tue, 24 Nov 2026 12:46:39 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7c654585sm130765191cf.5.2026.11.24.12.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:46:38 -0800 (PST)
Message-ID: <bc5e98e046f373ae491210e218ded9f06f997734.camel@ndufresne.ca>
Subject: Re: [PATCH v2 04/17] media: rockchip: rga: removed unused regmap
 member
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
Date: Tue, 24 Nov 2026 15:46:37 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-4-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-4-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-MYb0fk1ys1f42Xkvhfm5"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_124640_857490_E3C6154F 
X-CRM114-Status: GOOD (  15.24  )
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

--=-MYb0fk1ys1f42Xkvhfm5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> The grf member variable is never accessed or written by the RGA driver.
> Therefore drop it from the rockchip_rga struct.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 2b4f5694375a4..0e62337f8dd38 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -71,7 +71,6 @@ struct rockchip_rga {
>  =09struct video_device *vfd;
> =20
>  =09struct device *dev;
> -=09struct regmap *grf;
>  =09void __iomem *regs;
>  =09struct clk_bulk_data *clks;
>  =09int num_clks;

--=-MYb0fk1ys1f42Xkvhfm5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX3rQAKCRDZQZRRKWBy
9PZvAP97BrjjWk9V+gf2ONjhQjCuulubPU+SH6u/ajoB9+AP+wEAhck2FAqU1AHS
lSsUCU6gvG4EIWmI38xkcilLfrI5Ag0=
=Yixs
-----END PGP SIGNATURE-----

--=-MYb0fk1ys1f42Xkvhfm5--

