Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536A3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4emOXWTw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SAt6ms59
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=; b=4emOXWTwCW3nwvcw3KN5bC6v6l
	J5PCic90Vo1Rm1nV2mzOt6ooLheJAoNk/SW1vLEUtbWGw2beIdUQ26jmN6O6m35uPxp3QZEixdsCc
	3pNIbKE6dT59GAzLAFv8QrY0Wil2HckcZMu3+x8h3d2awPxDzmpcfAaOtPfe7IkRIUeK0CE0GrrFj
	CKuOkr0+kk0HdORFjJz/sJLVsVoBl60TwaBNctVASjadp8U5UVBjMjrRY5sX+wg+v7sgil5p8P+4s
	51/DyqngdcPrKJD6S2V7JxL3skSPpgWujiOxhmiQh+daPeNEoNuaCHC6HrXlwtccPisA7Ig9s8tfP
	nXaAC43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdB8-0000000E2xA-3guH;
	Thu, 26 Nov 2026 17:22:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdB5-0000000E2wF-2dld
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:22:37 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso73205395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 09:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713754; x=1796318554; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
        b=SAt6ms59DpanGe98q3oVNz7b52Y0P0Rc6iOkdj3dMQQvoLQvKMdWX6POiIjShtZmtS
         PiQY05VCdKqs3afXSBydCAIlnMklcflztJ/ch9LE9knlfDm1J2U6RrKy+pZQhjja+EQl
         qfHo/W61IPjrOV43ddW5urgVyRJDUwUA8Sp7xTg4AOvz/JMpE95IOy3BVJ6BbxthCwte
         7rkceHVhDx/yXSlYgr+5BPfJH4ldbpOkmdwYIi8ojJy8fdmgFZEUR1+2ogBQRVFDPPL1
         3p6EPCcPuiFWz1jv0rKmhonrq43bPTjwAFiFz9C18bvAsXdoriKKWWhiTC6q4YzJRohx
         Nr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713754; x=1796318554;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
        b=tY/lo6FX/4Ttp/CL38HQAiGC4KlJtCTPv69e9paRQqLAWYLO9vAKW9IpojzCV0bWtd
         C4a+4uyZfytDZ/LJDQ5J4a9seXf0F63BQWWva1JCZi9AjExKQLjyNsbDZclpHhqQSaft
         e+QSqcPo7dfVqpGFMJNJxVpHcqBImZR8mCK5vPhHQQmjh9m+nmBDI+aLeQWl3u70g5hU
         Cm2XBCDrtE2ygIK15Ar3SZ5PjBPgFwftG5sLFsYG2JzTZoScrIPhCPya0TVKe493LUR3
         pFlvb3IRsQoFg3ooyg9uKtIYd8kq3ibEj7qtryUgHkE85wZlMIuQ8Uo7vKi9RD+2w7Ti
         3ITQ==
X-Forwarded-Encrypted: i=1; AL+hErHJoOUnzqSJvyCdZIn8n+mffElZ0Qo7Kr/qWxIskaEaF6Lq9/ydi+PKroVnAFuqL3yaiix453A7fkMtNNYnROZ3@lists.infradead.org
X-Gm-Message-State: APuU4Z/ybiORYSkYP9pnypeb+N4U9SjxMB1Tekh+sEwFNgxJG2fBr+xc
	FL4+6wbqSL1t2tVgWP1Ve6Ha/hHJFYKJRm79pDqsP9lT6YZayFcOaVAd
X-Gm-Gg: AZFdTZduhgPVY8H2d9zS0QIGCzMU0zcxEo8DuE1wqLegoH88CLuLHN6ezJ2Qbps3z5W
	umUZJkz7rWkCEiPoIt1fILYnfN7KYwWJYU2S0rkMQ6JGVWlz5oZYoXMrFjYiliqhFnYU89VoTmF
	3UZ3hQkBgKawVzOtQP2RTUZpDhp+P2fKf/RwIcMAHbEyHmWUbhkN4Wlmknz8x1kZLvtVY45laKZ
	CFd+/qafbdTrYEIVsqqLXBGwxFS2I5KrI+SQwmZRbSjo8da6wV+vCiDQCEYDSyJF7F4eB1vx2QT
	9H4ryqCFgPVDgZtySyQtBYqYX86OhbWh4eYAaLY4al00ufMa3+kAUzEfH676dhrB2Jnbes97RXs
	l3DW6etmN2XUfLCtRPOmOQL7HpNEMqxe9TFHTh68DvWJGak59v1/ID/Q+vytKjd92HVUOC8FD10
	0Ga2cd1YBPRveWf9TOIA4lzKuw+fvklTI3BrSdE0hXylhc0jIWYze6uhn73pD6KMr4ptJnLZLFU
	Pwd/K5k83rgxuTis+dVnMm/PkM8b1xILmxeZWSn4Yj5r5lJpBobhXrJE1FDqlQuoXNfem/gjYjj
	JcZULlbW9QMySGN1K9Yf1TjgR1yhGfwWJuVHY/PCHu2wm8F+/dLxvWYqcCMWz8UwKHuYvgy5gQa
	8wxZq0vdF4jeBtwdieHZ3r1WJ4ETGNUp643vDDYbdZZmc2z+AcT3jMJWqD7aoBx0mxCuV2yNPZW
	x4MYveHZqf44ruaBDjEKJ+pQ+7tEWiQ4vp7ogPLbT/IApsn25Alz4/SriS/VtwtV0PizuJmGbJz
	YuuGuOO435vZm/vi4NBk0Bfbe78ejLLetBiNo5lBChBFmOvKEMUowJueEC+hEk=
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr450092465e9.25.1795713753675;
        Thu, 26 Nov 2026 09:22:33 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm348317715e9.0.2026.11.26.09.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:22:33 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Hans Verkuil <hverkuil@kernel.org>, aiyengar1990@gmail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject: Re: [PATCH 2/2] media: cedrus: report only the picture as capture payload
Date: Thu, 26 Nov 2026 18:22:32 +0100
Message-ID: <KjxG6AExQdOXUtc6OkeVCQ@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-2-f9f50812c85b@gmail.com>
References: <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
 <20261119-b4-cedrus-generic-fixes-v1-2-f9f50812c85b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_092236_271869_CC9EE606 
X-CRM114-Status: GOOD (  18.52  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne =C4=8Detrtek, 19. november 2026 ob 17:34:48 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> For 10-bit H.265 the driver appends the low 2 bits of every sample to
> the capture buffer and counts them in sizeimage (extra_cap_size).
> buf_prepare reports the whole sizeimage as bytesused, so userspace that
> copies the payload gets the private plane as part of the picture.
>=20
> Report only the picture; sizeimage stays the allocation size.
>=20
> Fixes: 65429ba82572 ("media: cedrus: h265: Support decoding 10-bit frames=
")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index 9b2d24e77fdb..b7e0cbe548e6 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -511,8 +511,15 @@ static int cedrus_buf_prepare(struct vb2_buffer *vb)
>  	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core sets
>  	 * it to buffer length).
>  	 */
> -	if (V4L2_TYPE_IS_CAPTURE(vq->type))
> -		vb2_set_plane_payload(vb, 0, pix_fmt->sizeimage);
> +	if (V4L2_TYPE_IS_CAPTURE(vq->type)) {
> +		unsigned int payload =3D pix_fmt->sizeimage;
> +
> +		if (ctx->current_codec->extra_cap_size)
> +			payload -=3D ctx->current_codec->extra_cap_size(ctx,
> +								     pix_fmt);
> +
> +		vb2_set_plane_payload(vb, 0, payload);
> +	}
> =20
>  	return 0;
>  }
>=20
>=20





