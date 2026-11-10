Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5BD606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fzBhxq3w;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=d8DTDacp;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=kdmBm0AO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=; b=fzBhxq3wCtZo13
	PGP/e2JaH6HOPOim/gteXYfJrdZY3z1zi5J6TGWleo5yH68hwENYgQ6/4RkTd5iPJOHUR+wZT0zD/
	ED4ZFJMb/0niuv2pIo+aupzcjGum2Ra9utxsnvSucaO+0H7LNcXY1En3iEsYDC8ZMGvD0m49DABPa
	gAXyJPYdC2znoHZD5SxS4mfuFIcuH8VjgcVkpspHBxvIvFNgnSkqZ0bI6K8SGKk1fC+1Dkya00OaD
	lIsldcSALQgTXPVijHTj/x8YWA1qJI0fnEo306O7nlpr3dEYE5Tc/OYIlSuXh6rVSlaeKIlFoUhlh
	gNXGhjL2xEYSBpKJu/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg1t-00000002n72-1HzO;
	Tue, 10 Nov 2026 07:12:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg1r-00000002n3M-2UOw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=; b=d8DTDacpH4NHiBymaG0muwvWVH
	ZalX6F/t+DpBd71zQo30I+A9XDXnJxZlzEElN20TZ8YWquDk8dWRkXG1YPLndkHXcZ/xgdxbrGAxS
	R+dv3thHzfCmMlqZYm7yyX5Bu06+SHF4nNZcUIww7KhsslxB8ZEnVbgQX8wy5uGdeYDd10zck8IDs
	IIGBm1ywOEynsJjzZXgkjvfRTc4UL5/y9NAYVJ5wT9nnkBKF7nZC2vQjlx7CLoNyl7HQJwNB1VGd4
	VGLOXT4I0ygQUyCVOBCaLlOfHAU4e9xFy6wRy2/hlm+IHIGix+zWgzQZKzzU+yRodgWxGU87QOtE3
	SpGzzJYQ==;
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg1m-00000008kZg-121G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:12:26 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8b10d24345dso17001817b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:12:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294739; cv=none;
        d=google.com; s=arc-20260327;
        b=VnbZj/3tr9pChP/oewnipCk/UVukgDa8yA99SGt40kWxfZlqisBrOWbJdLjtjetw/R
         P/8DU2CFxAXkdI/MoWgFYkO5wmgAGiZ09ytkp9892JrOF7UHB/es/swIpt7RXGurcwv0
         vANYKFDT0mWQhHCuqX67lRhKVccDQUzyxJR7CfgqYCMhUHo5usKmTqiNnPUeQehbm0UT
         A53yDkNsdAlALyrkFwKzeYPq6PLIdf5qStcC0kZJgE0grN75Zkv2S+jzxiiiujQ/o+rp
         nWGbmJAQUcojOYXykb1+ZwYgv4zwnDiyRriuDxHrdYF3Zrcsupish47jGEN1FmDibKoy
         Aj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        fh=QWDi868y/BwFJWf6BT2BwANzPH5kFyYkQsn/CvYl2HY=;
        b=rklrWt+fA67JLAniYBvwlTFWpzLSy4qHJyhzOh8w+Ej50AcEsPLemP8WlyudW4oDgr
         5Sv63bWaAyQP4254mQrGDLqv6Fhv8ksb1DAlA4Cx7maGVyReLIQhut1d2E0d7XZAiSEo
         iBUg1sPjkIPEHWxnu+xpYflAtXm7ge8I6WbMemaqoKjbIyTDuLAMRZMMI+FMrDkAgyDT
         4e5O6CxLkwzCcadv08cKYIcM2yGnbyIOqaTM1kD2cXXTr3LZ07lky3QpRb3aiwhDQWUj
         Hn/qjKXRVPWYNxL+9NbDQ+098bjNTqxKWF7yDXbTJeSj3CwwHxgiM3En/621AbSque1W
         iqAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794294739; x=1794899539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        b=kdmBm0AOee6Zcy0XybgBTKm3LgNQrEmhAiIfkpGossZ32jaJyUxxuaHr5zluVVXAmv
         /zCaj4nZdBBp7sM9V+T4ql90blu0gLlW+e9qW9iCIReJxm6CFrw3vMsYPdYdQ2C+DW2J
         vwm23XFAF3OY3LwmEQkenSBh7rHAPOMEX3rfX7Ks4+rzOudeTDsk+kbNCIHVwL/Nk3Lt
         ZTTAlKsNoZ74DNrme/pOpcFNsIFbFI2a/m/FCOKZFlM3OdIPJou16QCBdsqaEpWH0h0y
         YCZYRkvumMffzG+HMUMmPhLMA08Em/1DxxOUd5Cxlz7mfng2O8Na+v3yRfI/G4C9nJ/m
         l1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294739; x=1794899539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        b=eVhrbH3F3TUA1nclIiBhV4c6xBEqm/HyyGUma438rbK64yP8Qzqo1lSfUsSTGonQMV
         qgANfBXSQSa8e9bu0Xey5b3dAWWmBGfTbp5RTgDT6uEfLaOeJgzIOzZS6q0uzoGVJDwC
         BUs4fz6BgbcaTOhGGaxWMsgRh1CELf/dDz0X78RK9Rco77D1NGybu3k3UuzJ0oeiam9g
         UPdudCGd2alV/Q4jn3rDw4lYgPRWDwR09+D8umyh6m0cgo0ArIQh6C7iV+PE1Vamxhfk
         787ycBcLypAExBPB3YVRLRB/Q1lLZtmWTMB73tDPQKLU9qBEOo+JMb5y+2a9TnsLTKPp
         g33A==
X-Forwarded-Encrypted: i=1; AL+hErF+/vLww0KOqD/piEYNqHu5iLb0t5JcpE+8eH9Kr/yt7oyHmrXzcs2yJHEKL6Qz2ShRF8QPpEL3G24Sk6oq6i0C@lists.infradead.org
X-Gm-Message-State: APuU4Z8/lQEpoAcdSEKHGXcbr6GAopY3hk4sBZGuw19ma05oBLijgXpy
	JFNL72g94qbDgFCzwOaMy88RRAAQz/wAvKMP212sp47OV4kQahM/xSSeh+TZ/4wxFUJzqx9fbej
	yOZTov30wFMS2M4qeQKydQv9Ab6kIyYc=
X-Gm-Gg: AYBFou2yXiWLlmWXOevuLZPQc+mE6NrWGGWg4bV3SJMwvceGcHC28Uu8G5vTeeJdp3Z
	M97JL3vCt9m5tjUCBXt6IN9rAkIYjP5YjZlRYGcsmye7GLeZlTlBtccmwtZvb/+KJ/72k6ET0/m
	ALFg/qfHdKx0mhvaq7s3QO5FildCdLoEFSK/e5bdOPpZXbBGZmpPzzI7x6Rw65TMy8bveICR4RQ
	VVqRk4ssU/AyJhufFQ3cUpRKJ1mJUZOAeqxdbqM7xc59V1REjebNVYKUVfQ6SwG8jS/8Pz98iKV
	4I8EXA/HZ2C5sovl4XrGyi85ye6cYdMT8UEQk7jdm9g7L59JgAYfns0FeRR0kBapzI5M1DaybMJ
	gQ/HbNLpIu5gOf1Gc/NMDNKCv0JXpqpey6rSF
X-Received: by 2002:a05:690e:c81:b0:679:96af:e306 with SMTP id
 956f58d0204a3-67c568269e8mr1104943d50.56.1794294739207; Mon, 09 Nov 2026
 23:12:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at> <20261106101954.46907-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101954.46907-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Nov 2026 08:12:07 +0100
X-Gm-Features: AclHuK-NNQu1JbIxB1uGpolHVv_SmZbveDQeysJSYIv9CiWjgRe7D4MXv9gg7C8
Message-ID: <CAFBinCD5aQ_AsNxELgUd5yzXsghUVQg1tuGtVvF-bmPx+AjaUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: rc: meson-ir: allow the receiver to wake
 the system
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_071222_308823_FEBF0C21 
X-CRM114-Status: GOOD (  13.08  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 6, 2026 at 11:20=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The suspend callback switches the decoder off, so nothing is left to
> notice the remote and the receiver can never wake the system from
> s2idle, where only Linux interrupts can wake the CPUs.
>
> When the device is a wakeup source, keep the decoder running and arm
> its interrupt as a wake interrupt instead. Boards without the
> wakeup-source property keep the existing behaviour.
>
> This does not affect suspend to RAM on boards whose firmware watches
> the IR receiver itself while the SoC is down, as on S4 where BL31 wakes
> the board on the remote's power key.
>
> Tested on an S905W2 board in s2idle: the power key on the remote wakes
> it; with wakeup disabled for the receiver it does not.
>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

