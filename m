Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCAD606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 22:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z0P08hNU;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fZ9mbQl0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DXV3jwg1vEpIFRKy3B1iiTGO2c9okEZN1fkPq1gh+eA=; b=z0P08hNUoScPYgYdJ9rCeCpMh1
	czOZ+sxIFgU4oL60888nQUhsZ2pwzqaFPz5HsVXw9pIrQI9fGhId8ttwp9Bv7R1txcsnP+ICXOmbV
	jduss1tYvszl9CGvAxnf00AVNn0ARkm1Nq0AwWZO/HND2ZKhd/wRXBtB/CwwwPzexu71/oEFDXIbz
	E8poFUDgvbYYzWY9qlK3yzCXi+oyuVyn3mhq+81mr5RPTWsdIjrisYM2Rv7AyyqpAPQ7h90hllwpL
	jySkiatRuOHPgz2dtqE8zkdehLfLMA6x3SchwxBGIIbAp3/d8TYQp1RbLQgHNvlbCHrsKSj0zWcVt
	FmfPVp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhvM-0000000Ecq6-1R0D;
	Thu, 26 Nov 2026 22:26:40 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhvJ-0000000Ecpj-2ASb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 22:26:38 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-9496577d4c4so821631585a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 14:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795731996; x=1796336796; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXV3jwg1vEpIFRKy3B1iiTGO2c9okEZN1fkPq1gh+eA=;
        b=fZ9mbQl0r2vWAAHrmtMu64qMTxKkfjXDkd3kjoGpslSUjS15D8M4o45NkPsn5//0f2
         sSJDP2cNbeD9sCJc5wDjFsP/2E4LQWkhq62+trCyBjxlvbqtrjwyUO0MIufUxv6s/bpJ
         tMRcxg/ZlAUIhrCv0A6ezoUftH3JtOXPgqzafLshK+54om+NG2B+awwO1VFGodad91Wb
         p9O9aD4Jo4suciNLEv2wVeOZtB5c1p6XSeNKmK5PGoEOclpMYEHYXfldKZ+U4zAYjftQ
         AOq2j3Hgq4s/Z1EvKXeXbM+5gVZChIrs/8n9FtCPGB8X2AHHxxxtpoGfQR+trSvO8DwK
         zHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795731996; x=1796336796;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXV3jwg1vEpIFRKy3B1iiTGO2c9okEZN1fkPq1gh+eA=;
        b=FTGLIGGS/tY6xUeziMSc601ilWRMVgTBpxVoV/o2LX3A8ewxi6V1wzQggAaAqElLdC
         6qLZ7eodcMXm+Db+smq/xc0omnpkSPqZY7dspysy3v1CmEis1umpgMj/cjZb8U8LFsLr
         WltffJ9luuJc8ZGSUr+9k3UxmITNLELHlJ4odxsHWWA1fr9wooVtnC/lmIMIkJ2pKx+W
         yKUFGUIKbGzqJ6T8yJ7O0iH1AsUHobHEcwqgfgtbQAHwEt8V/NyqKoIG/LaTIqgvIrpM
         jXiCjoT1WhxOUvmtpdcPmtkP/Tf8f2h39ueED2txI0mLnKGVebgL/DKwfvz+Jit/VDEB
         fXxw==
X-Forwarded-Encrypted: i=1; AL+hErFkE3vQnsmryZCqMdlIRGdbzrPSbNorDUh2EPEOjypwL6VLW+hOnw4dfW3hMX231eoYKYV9psntIiph+4YSI+xR@lists.infradead.org
X-Gm-Message-State: APuU4Z9Uwt42ewbrsAfd4NIFC27QxaDRpoa8k1xvUnpo7V/zDLq1FNBN
	tRKE8G9qCgjm6xAy/ZXl/8zOd0Is2MURezcjh7TI7ML1p9z6F/WNbYXlaZPg4/IABbU=
X-Gm-Gg: AZFdTZflGNZoX4k3IBbPBt+7jkhSgv1kKQvalwZYyVoHUmqSmrqIvKO2qSLXwOPvSVn
	UWq6R/bbwmD42HBXM39sSZH3IhfhH7gEBk8BvrXouvNDeP9BncGT/sQbwBy8iGdwOVcBht7l3pE
	n7IgU6QKUgI2tFnxewIGGNW3jGqRH3z//xI1D1e+XTSFU4DLcMUfaMkHP2VkzUfimIEDSTQP4V6
	QJyrPbDUAs5SUlVbwocC3HHlRa7axT9AQzOp5MZiBV9Pq3AiW7wiy3COayNTLFD3gptQ4mqJtRd
	9v5SgJM4FWtEb4nrBg2Lbsks8obWHFfvkTiZ9BwHcX7l/ZkVJgslcvZQqtefk3ZVwM5gZaRPXoG
	mHV4JYDalkbzH5xArpN98vuat5VENUqAdgVJjScLZSmV4hsP4jHqjn2rT2ER+e7ANEktVzTUoCq
	hdr/Pybgo1W59nw6niIPSl8mvZu/ANjIreuPfvVfJgcql5Nhm8g6fYD5TgHP4iefLGuJzXbzHp7
	WuM4zc1ROpMjf6y/EWy9Aei8lEy7BcCDjl8G9z+S3107Rx57UsedGpPYV5BJEh+51GfmmTi0L5y
	gpNUneROYspOQ3gWEdLndCQq8jN371ipK+2Ob6oTOGtjoZMrIneIcwuN
X-Received: by 2002:a05:620a:372b:b0:949:70c5:c0ce with SMTP id af79cd13be357-949b35ac8e0mr4145462985a.19.1795731996315;
        Thu, 26 Nov 2026 14:26:36 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm1681287985a.14.2026.11.26.14.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:26:35 -0800 (PST)
Message-ID: <f41c7d6471f41d7fcc2109e14289e47091610822.camel@ndufresne.ca>
Subject: Re: [PATCH] media: sun8i-di: Don't sleep while waiting for
 coefficient access
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Samuel Holland
	 <samuel@sholland.org>, Hans Verkuil <hverkuil@kernel.org>, Maxime Ripard
	 <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:26:34 -0500
In-Reply-To: <20261104185930.885203-1-jernej.skrabec@gmail.com>
References: <20261104185930.885203-1-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-i1ae5NoATxMPm6Cs3hN+"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_142637_577407_1D0F9710 
X-CRM114-Status: GOOD (  16.30  )
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

--=-i1ae5NoATxMPm6Cs3hN+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 04 novembre 2026 =C3=A0 19:59 +0100, Jernej Skrabec a =C3=A9cri=
t=C2=A0:
> deinterlace_irq() calls deinterlace_device_run() to start processing
> the second field, so it runs in hard interrupt context. However,
> deinterlace_device_run() waits for coefficient access with
> readl_poll_timeout(), which may sleep.
>=20
> Use readl_poll_timeout_atomic() instead.
>=20
> Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/m=
edia/platform/sunxi/sun8i-di/sun8i-di.c
> index 65bc426e5aac..bb90e0efa4d1 100644
> --- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> +++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> @@ -163,8 +163,8 @@ static void deinterlace_device_run(void *priv)
>  =09/* neutral filter coefficients */
>  =09deinterlace_set_bits(dev, DEINTERLACE_FRM_CTRL,
>  =09=09=09     DEINTERLACE_FRM_CTRL_COEF_ACCESS);
> -=09readl_poll_timeout(dev->base + DEINTERLACE_STATUS, val,
> -=09=09=09   val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
> +=09readl_poll_timeout_atomic(dev->base + DEINTERLACE_STATUS, val,
> +=09=09=09=09  val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
> =20
>  =09for (i =3D 0; i < 32; i++) {
>  =09=09deinterlace_write(dev, DEINTERLACE_CH0_HORZ_COEF0 + i * 4,
>=20
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

--=-i1ae5NoATxMPm6Cs3hN+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiyGgAKCRDZQZRRKWBy
9MOtAP4lcK/xSN3c+U7uRq10fy5MnpVhec9Sqx0NG67DpPGZAgEA8d3GOhpIEGXC
xicNBf+fQ7gEyX7c665ziueulfyRVAg=
=8HHY
-----END PGP SIGNATURE-----

--=-i1ae5NoATxMPm6Cs3hN+--

