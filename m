Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B976606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KeKha3aC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EVbrZKS6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=; b=KeKha3aCHWwIe6xbokuQU6OAZj
	8Dh0bTfo7sGQruAi3itYB24pjxNscbmdgq3fbsyfj6Pytj6iGyw4eEA32b8BwjSmKEwHT+NIZv7I6
	CalUxb8AEx9f8aiqfSt2GPgqSMY2RahzJuenqgbh3VUrvharLhc1hLgpXBr5yLyNwTir9peJWq9Oo
	Wpm0spLK/7GfhuyTtgcR62hvWO2TCkk7aJW1lLOpn2Z8zvsFgSiJYS6ygh9PzGyn916IYIhd6kIqz
	/WrawB4iLeBb3kwSqgXsLOcaAzTiYH4RtUSOrMeD6cnoFeJh8pLHDcfryZINgojVnrq86YZMXjrAP
	EmLGVMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd2u-0000000E1c8-3Kds;
	Thu, 26 Nov 2026 17:14:08 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd2s-0000000E1bn-1kuy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:14:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5123825f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 09:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713244; x=1796318044; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
        b=EVbrZKS6ggmLM7qQfyfXohDsh8hhxL99Eq1MNOiZhayJOIEnZD1Fpxx+dwfXVuj4Ks
         6UhLGGm18+nN/J6hSFsbkzOMTws1JPetvoNO8uwSbBtTYocqQtgt01b+ySN04MhdN2iH
         OpQwUKa4hQ9CSbI8t3BH+xUXvnu2GAH18ual2qHj1ksiYu8/2hCcBwjNYMC833JnRSAp
         aq6pzJpWzuGBxHi/KZbxrZCWy0BFlAyzrGLP74qu2UdPLEi4clalew21lGi2q/T5h+Ii
         r7UXcCvuctcmYUaMFWQB/KBY0Rek3kDKUwk8+vYCb5a6XNzCOx3a6XeJN1zU9Ei4NXo3
         vdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713244; x=1796318044;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi/ivCTbo4DPg8u3yeaJ2VRoY8CK+U4XBvUgOwH9f/A=;
        b=eg7sJ1Rh8+vPxpNgl5jRJWWWmIrM9AHxS1L4YE79lNMAL+3JcDhux/2/vt2LH+gcqW
         oPdFrykdOYngkmmvYYJCWfYYs2PwioXM5Ch8pYqZRwFl0Uw0tAL04L4bDcTkZ1ovM0hx
         kG4sKU5quvSNpDNmS1I8hdQeDcxhKTL0xrph/uh5jhdX30t+jgSWLJ4noSHthbxu0O9f
         n4558BR+TwuTAB+u8Th5mX5m1S/+43CT+nmAfMVojOWBVHkR3ONCKTT22Y2DPXEJFred
         PbN6w9AbYlTnKJ6ZCu4qyoQQSRf9QHIVdECU9/Hde6iSR9dwv62BYiC/sDINLlpXiDT+
         pLDA==
X-Forwarded-Encrypted: i=1; AL+hErGvrpxSBmeCZl5LF+jtezE1MB/Uep8GwlpYC9yE/6eU1gy/puc7gRRSftZQN8svS7Lq8doKFVRrduqZyH+y39es@lists.infradead.org
X-Gm-Message-State: APuU4Z82SfApvN+dQSVKwj2o/0XNB+h/dEs+u+1tSMlJx7EMfShG8r73
	zAsI9G0uS5xZUwdxvRFFp9sksv1EHpV1N3mUGLLfzW7kpIykSBGYQpl/
X-Gm-Gg: AZFdTZc5ReGs3emfmCozYokM0rnTAnS8CQc+7w7C1jc1UvCG6XC/ioNCgdvet1AVzCE
	ffyufzbx2ulcp6+yazWqlJc5gpFkpUodJmrbU4Rn2ObcP0gJdrEnloKJupaixM5ldFloPQGdGyk
	7EK07LcsgL4QJ5cOyYbnSRFFdB3CG6eRCCvVF1s1Gvrcs9ggrDlfuOGaiRW5KeQMJPTKJ3uF1Wv
	S75pdZZdcqFWi8HWZF0y3mVajLITnD3/Mh0Iaq1kvZ1UcPWkxCIs2pN78IT4luy3RVKbZSB8bIQ
	xSCz51eSE2L8ZrH+QD+tyCdNY0xfpX6hgy9cJS8RPQaXebf5ZbFEsn/klTUZrXi4KtwGgOpFF6b
	LqYuM1dTiUCjaQ2ZhwqW8gTh6U6qWZbp+fawqyvUJaLmUGBEwU2JN4x+XXqLqKA71CzutuG8XGA
	2vhyUum/wjB1fzO4d+Tol4exlEPCyn8eF5K9Rl5n3VF1mw5i4JnMjioP6AhLW4H9zxMxJXPo915
	tRr0KJk3cNxdFSJCPYGFU7rHuQI1zTfk3otco5oZby+bFxorWtmBA3P5xMMCtkToEqVh+Igiw1V
	dXjHYOnBGVMgi5AiFVADOR6bt2eUzLe20lQA+4aoM7SVhRGDsfQ45fpYnqBxE+uACVIqtiVbhWG
	mIcFG2VnLk8C299oi5iL5l6OXKYbo6Mplg/YmQcMY+Hnm+sjM0KhDr6GPasIhOYzcK/OPwpOqF3
	EyfMDsqA1JlqqmXPC5jzFAg+C4X0/rdSZUnx8nbmySbb3YNoMlU2eOUNVfEeRG75sXBUFk5aOef
	oSy1JEsPKbe8JIv2Q1uCrNcjCefPPU15CYPA6o8edivtV9WOrVSuwRNKxCeVrWI
X-Received: by 2002:a05:6000:4704:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-4abb5eabd6bmr42342899f8f.56.1795713244030;
        Thu, 26 Nov 2026 09:14:04 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39494189f8f.34.2026.11.26.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:14:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, paulk@sys-base.io, mchehab@kernel.org,
 Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Cc: gregkh@linuxfoundation.org, wens@kernel.org, samuel@sholland.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: Re: [PATCH] media: cedrus: fix typo in comment
Date: Thu, 26 Nov 2026 18:14:02 +0100
Message-ID: <A2PFvd_UTOK2TCyMMfkywg@gmail.com>
In-Reply-To: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
References: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_091406_498243_2C083E18 
X-CRM114-Status: GOOD (  12.91  )
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

Dne sreda, 7. oktober 2026 ob 16:00:56 Srednjeevropski standardni =C4=8Das =
je Caio Vinicius Ferreira napisal(a):
> Fix a spelling mistake in a comment: Neightbor -> Neighbor.
>=20
> Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 780da4a8b5af..f57642c0d8fa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>  	}
>  	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
> =20
> -	/* Neightbor information address. */
> +	/* Neighbor information address. */
>  	reg =3D VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_in=
fo_buf_addr);
>  	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
> =20
>=20





