Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEDF606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZS7Onu/A;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DH8iqlsJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=; b=ZS7Onu/AHi0z+nkx8YDapt8l3Z
	2tTyV0E/N84nZ4SbPhvmhlUfb9idSsumdnaCGXVgUdyeaHp3VYXVRlyOIsSCkNed3BI6ONhytdSXB
	vndPrqRQm0c/QDklGjf7tXf0sjWyL7ye8WsTfUvLNkKSh2tVEy2JntGF0sFPv0mc3uw0BnSmKOsBB
	Rb26OdEI6NTAhLF8psKMwYhyrfdqtIocvhO+05V55QE1qrdkFbLN06rxsZl1FSQPeC8mN+NDw1dFu
	lWUEDouazWlcYC/yP2T/30u60+kisaJZPYljMGlVuFk+h4XhlG79I3kd8XEAD4TyovsV83iQlvm6f
	Nfy5qbkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyoo-00000007yfz-1d29;
	Tue, 24 Nov 2026 22:16:54 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyol-00000007yf0-0Yl1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:16:52 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-92123f02faeso52395776d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795558610; x=1796163410; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
        b=DH8iqlsJHYcq++qpCQzAQPX0UKsb9o4UNS6oYNSJp/bN0G1Q+HykbC5pclgWsBf5ad
         TtcpMzM6sBQ3goiWxpD/NK9OzMXnZNKI+Q7FntsAczLl6gaQ2pD03yaRKUqqlYaR88Cr
         vTcKZA2kI26coU7oFmQsIa2PJdsZJshyTSAQEVJwyt5Fr3rtjX5IY74InltsN0bwLqU8
         MHpUAycEJQAKYqpKK9N8adib5V+og3ZeOWahkPRu7+0t75KomS7bzDqJTGZjLhgAdUPT
         qK4cjhfSJJqrLNNPKlqL+rn2CspQ+/io6VlsRDfy+wANhVo/3Q7dHnJXfvRhldxR1pBg
         PT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558610; x=1796163410;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
        b=vY6BBTh/Y1/32hUfP4sNKO0at+KBCav08eaMyWU8UQUR+vF74utay7kTLpmMoKmZe6
         EgLq5WxaaJy6hhe+ovOw8UbFJQb2kezvRN+vSf+RdT1662Zl4nsf4wUHSkyw3YpodbQL
         L7OcQOOXCwBqPr7TjYmOg+gWfwhO0twbnWinkeKNXA5HpUBaj2KjZaOasdYDaz9TwYnD
         RKEdREwqAk35N9lm/OOM810ZWHX3RWYhE0KE17WkJtWkIJeoMlyBOn5KGAxdSDsD41qN
         qbqT2J80Agk3dk7WM1+4HyJpnflap8dZJspP+eJ6xKGOJ1vqklhPW2zS0RvSWpndKUXz
         eaiQ==
X-Forwarded-Encrypted: i=1; AL+hErGvtu9+yxa4t+lpl23bSjJ2fmNymMEsO02gn/upg3JAuvyvzVSPmdvVssoztj9ZYh1AInpXxbHpDVbdLWu0s4Pl@lists.infradead.org
X-Gm-Message-State: APuU4Z+9nNA4l9Iu3BKpn3UiVEf4ZNX7MvNXMDqlBw/gnX0+DIO4gD0a
	cYC92Fi/AdM2MeCTyC/SyD/ld91VBJSZ2KIxzwITrULIOqVKPfq/498QBEtzWJtLXfc=
X-Gm-Gg: AZFdTZc4EFnXxuPsEyPtMUwbxTU9GRd2Dk5bf4XZWjHNfNX9//KZoO1/63F2g342DIE
	l+SfXzKbaXensNgFR/akW3vLI/46buZLkCvBw0Gslk8ZazkciEC6TYAVqE/D/rJKapIQ2a1H+7M
	X4lpN0KKCiUa7wbVR9+Km2HnKWqSzSkMlFwj4wb+Ch5jXgCBF9eMf2mDV63D7P6rbNW5BoZ10KY
	1iWGpqwWDGCjR89ozTa/Wj6eWObwWw1Bl9yBI5Sp9QAAqkGPGbRJz/B3POThyWN/XOQuiEraWh1
	y6YKhkur3m0oFDrD2pjMzhYah+xiIvVcC5D/4Q5L/Kl3D4kJgGxbOJ3hR6Stkj64NamBOU+SwpZ
	tjtTb4+DEbX2dEx6dOkCU2bgg04MGXxZiVosR8WcYT+yYVWfmihJWVsRJVJTF0XHU4UzQuzSooT
	ZcRdGcA+V/XCHnzogpZtwn5ajYHZuVnXxcp8BgLZvf8GBG2+HS2fn1fDaVqTuy3SQr1u0P9nOdR
	A0zNMveMyjBTaBH6foxBsOdZ9BCgsN4CTPNglHroknlmlWE4m/msK1KiSWcMccK3DD9PxRWagY7
	js2E9qxCC0zULXonNDdJiU+kt9mL02T0FiJ4C6P38feDDABZ4fDTI6RT
X-Received: by 2002:a05:6214:1d01:b0:91e:f8bb:bfff with SMTP id 6a1803df08f44-92134a695bemr295012926d6.10.1795558609635;
        Tue, 24 Nov 2026 14:16:49 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bfe82dsm143924506d6.0.2026.11.24.14.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:16:48 -0800 (PST)
Message-ID: <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
Subject: Re: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau
	 <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Tue, 24 Nov 2026 17:16:47 -0500
In-Reply-To: <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
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
	protocol="application/pgp-signature"; boundary="=-fZhiUwItIuN4elZmSsKu"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_141651_187819_0D7F7E9F 
X-CRM114-Status: GOOD (  14.92  )
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

--=-fZhiUwItIuN4elZmSsKu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 922cf74c4eb8..384ff77771ea 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
>  =09 * According to the spec, tile_cols_log2 shall be less than or equal
>  =09 * to 6.
>  =09 */
> -=09if (frame->tile_cols_log2 > 6)
> +=09if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)

Shouldn't this be 6 too? (log2(64)).

Nicolas

>  =09=09return -EINVAL;

> =20
>  =09if (frame->reference_mode > V4L2_VP9_REFERENCE_MODE_SELECT)

--=-fZhiUwItIuN4elZmSsKu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYMzwAKCRDZQZRRKWBy
9BA6AP9PS5poldHn0LERh5sldYW2P73wx+zTyuozNl+3ELVLUQD/aj0MPvIwO2sj
O8VuT9IjLVqFj9L0GOL8uRcAYapAAAk=
=/mpK
-----END PGP SIGNATURE-----

--=-fZhiUwItIuN4elZmSsKu--

