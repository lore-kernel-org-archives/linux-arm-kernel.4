Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E884606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VTYkEsg/;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gNK/4zmR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=; b=VTYkEsg/uTwE6Uo3zD0NIEMJJp
	zAv5Kmd3P4kHLAqBhNfSE6hrYHLiEqtRpy0Px4xRgP+ql2fTw7ze06xDrU6UhuTR4DvEcyMFY+te/
	y2i1CnvvDCwuAOlEamjfNDA51qgZQz7wmRa0HeztV8qjLZgj38z/FrWBS+6otiV59ui2hwqlsifAZ
	ySQZC0qxlwXFoe9UUqheE6u9eHq1Nm/MGugj5l7w/o2Yl0CTpdJu2G2XC1Auz32Y6ydIMvnK3Ta6c
	YV4a+2DaSkwCG4U6HFO0tX87w7k0lJpQ/+CK+fmip9nNkU3hmVa/sc5hVQHmtdsVmNrGmBCIowFom
	QGJxaJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrc6-00000001UvU-1eU2;
	Mon, 16 Nov 2026 07:58:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrc2-00000001Usy-1fZv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:58:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso16838845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794815928; x=1795420728; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
        b=gNK/4zmRT2q1aK0LSns8/fdKbUg4n807+pACXJH+HhISRyHkaSCuZx9i9aoPTfhxbd
         2Ta4idS2JZt5odxHqjSpYqBobsAA36WFID8U6CXQzNAEGoNotdF1Hf5POxKIsEQs+g7o
         O3evmDEPgNGGXXS34e9qNwOhwtjrW1j3/jZXEgXjUXq6hIBnYwtm+2NJjK3wgQZig6bz
         hTBWFFxH2TP6LXATPoEvT8T6difSsQtNeoKSnofhQKQIfSFqWxgu5TZKKra/+aKFSnjq
         QSEcrn/UX0C6ZTzZ8DJ08GJ5AwM6TPexAvfbcKroQxaVYWDJTROcQXmm4iJ3M8OnaTPU
         DblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815928; x=1795420728;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
        b=0PBnSvRAS5gMlUoEvRjMJttGxMG8d94rCkz5xk5RNXADf1iu7T+hGRu/Vx/gi8BcF3
         zybylf/LGTIyBIAm2pDiz5T13AxpkWhnRgxNncDwGvszug2OMNMOaFzsoTZ+cgLzUI5D
         d3DGSF7osQyCeYojPDIKvznl4GoiIBpNavofCXHhRtnFbO8ZRn1yE2/x54hVI8kbQtiE
         0c4RVDtijm8y9vmFm5kkMoaAK8JoN3GMb6fZZ9mrvZNJm5Jal0lHtAJsBIqKDE7hJE9R
         FAkzYhhT30yAG8XJfpp5fQZZ6heeC4kJGlnE5lwwu4sipOm75Lx06Bs+mq37/RWvqlc2
         pxAA==
X-Forwarded-Encrypted: i=1; AL+hErFYPUQ+QrMfPGgmIdH65JcB0vHx2mTuEQ1+A1/7/lrzq/5K5ALMVyxoifmW942cKJpk5Duao9KeNnh4ZxPEwMUJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/6XYBAhpb5iaWC+P8yAI9nKmIt6ONlHXTFTI1bUHH/Ebg0XhBY
	4WfqozG1ToP9kYQCbDzbjBtJM2egYzTwDV67k846px3sfA8aET7qaU/f5EhyTCLScvU4
X-Gm-Gg: AYBFou03vBIlQdBNwX1y67rrWwkYtcAwhW7HmMvXgBdBzuBJ4S8Jd08fm7gcP677xX4
	6mo9beAWf6Ar5w2qge/CmLkyvZJpvtTLGAU9qQLw9Ges5TSu9UM1LG/7+nQd4jXdzNBrp5QeR30
	AG7Mq7pz8gq6Yo/8EvEAQiCj3dyIO5C3g02jSbQWxI++l3EzEWfhYIsde61eWlTsBjisfIo4e5C
	90MPsaAEHjvsjKP6PhNgRxNKRSzGb7tn2+VjPBCaiDI9t5IfIflV+9C/dsj7hgbBPttUH/v1WPQ
	XYdU08i7YSGwnUWeJDMvEIH9Q96k6EBe5aL+UcYNCgDZhUm3glPWtS4yqP0XBtu1DnXm6xg6RB5
	VdupwKJ56P5TLvT2nxCd0ZBHYjMYtYg8Le3d5Kk3JYA+PN2j9VIeYKndFDF2qq1jRRDX83r4JUJ
	3UB/TPUvxY1s0iaPCkskwioaQ0f5XrgYFARc9yg0tLjMGB/0FzHmoBiFGh1KzMuB6P6HQ/GEJBp
	ZdTT42744vpz8FXftiaK0P3zImhp/tkKqc0spPO5fsPjF8/ckBO74e4IEFWnGdEJ+rg6nwHUjaT
	ySM+t0z0pZZ6iCXqJ+3JXFJJM2I2WvAczdAH38+gJAdRIn1dKr0nCV3/FCT6+qo=
X-Received: by 2002:a05:600c:3b07:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb5de1f216mr172834365e9.1.1794815928232;
        Sun, 15 Nov 2026 23:58:48 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm375768305e9.2.2026.11.15.23.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:58:47 -0800 (PST)
Message-ID: <aa32167cd3865049bfe0281b8b651c47f5e1c05d.camel@amutable.com>
Subject: Re: [PATCH RFC 2/4] sh/crash_dump: check ioremap() in
 copy_oldmem_page()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao
	 <leitao@debian.org>, Chris Mason <mason@kernel.org>, Thomas Gleixner
	 <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	stable@vger.kernel.org
Date: Mon, 16 Nov 2026 08:58:46 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235850_453906_2AEF0FD7 
X-CRM114-Status: GOOD (  14.56  )
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-11-12 at 17:37 +0100, Christian Brauner wrote:
> copy_oldmem_page() maps a page of the old kernel with ioremap() and
> copies from it without checking whether the mapping worked. If it
> didn't, the copy reads from an offset into the NULL page.
>=20
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns
> that into -EFAULT like any other short copy.
>=20
> Fixes: 4d5ade5b29c6 ("sh: kdump support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0arch/sh/kernel/crash_dump.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/arch/sh/kernel/crash_dump.c
> b/arch/sh/kernel/crash_dump.c
> index 19ce6a950aaca..85c0e58f1a59f 100644
> --- a/arch/sh/kernel/crash_dump.c
> +++ b/arch/sh/kernel/crash_dump.c
> @@ -20,6 +20,9 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	vaddr =3D ioremap(pfn << PAGE_SHIFT, PAGE_SIZE);
> +	if (!vaddr)
> +		return -ENOMEM;
> +
> =C2=A0	csize =3D copy_to_iter(vaddr + offset, csize, iter);
> =C2=A0	iounmap(vaddr);
> =C2=A0

