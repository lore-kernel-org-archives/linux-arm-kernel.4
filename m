Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CB0606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JkAiMMxY;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IgmDLLBf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=; b=JkAiMMxYxjuZvzM7iBtuhP69Mw
	ool5fvEoqwh1sgLztSdZe0czRa9hH60B9V+kaXYjvUzHiME0s9xHfGdiGQu5MFAmyaCREfNmz4O0R
	McGY+9pFkeEEzJ0AEI8kgTY3orN/PbjVfS2ghAFcX045xCXHGgQFE1VXaTqu7kkEOKEBCVkploNjQ
	goOKE4HYr9Qz3SvQ8GnlYEeVqU03Cw0vuV2Wh5WTo6uLVrjJPwF7It5JKP04wPXzk5ey2R7lxQuE/
	H/2KyhtrdyOv5D6UDtVyw7xF5KamCx+Hg1rSv483XPHLBJfoROUmfnGwS+vjzRIAcqBrlEvkvmq6G
	Zwwi/j7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrbl-00000001Umy-3e8G;
	Mon, 16 Nov 2026 07:58:33 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrbj-00000001Ulg-1U3n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:58:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-49412eb1474so1449597f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794815909; x=1795420709; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
        b=IgmDLLBfrFdsaPqlNCX700adF3vdT83kDFQXlYadlcFAcD0K8waDricPSM1R4eSnPC
         CxHx0IRQhscMGUrs/KpqDz76cFig4JXRRWfYYotqbrdlPabYszlEfv+3RE7YRSbPT0CN
         t9wN+7zZpImEcP1WyPmaxxH29ZugGGHXTqQmgalR0vZHSfgxD01NrqcL/47Y2QLx25YM
         LNs7+9Wb7OeB7JFJPrgYaotNq+2lVC2XJtpazyqoW13fvwlGoswKE+pJSu8TiBhAnQmP
         WrW5tZ7gh3dPobwq6zXvzTUSXMJ1IYabLMWu7dpx5hxehBLFhT61bJVZBqahhcm+342n
         WP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815909; x=1795420709;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
        b=tNrZRY1xFhzQ17bJ++C+Z5aPEkrjBfz5YA7zNPpJrjcOrTK7Ag2/beTyUtk7kZAXrw
         zp89d5aDt9bvQ9iZK7n9MjiPmOcxRuQNzq5DBR7JbGGD4A8fWAWSlIAkq+Xy4ehGKxMJ
         bo+7XnTy1i9shuvP0bIVdCjmhjxLSK422Mlo5mpUCdMNLAkhCvo3c7eCnGeecwMakA+C
         y8UnLXSjGzxVAClKXC0i3A497wbFx/Njqm7jJ2sBG30YbxLyCD8vE7nwGj3rd+Wmxcwk
         yrlspww2uSvHwoUxfpPxW7XnBjl0xdU68WMB1Nd4RKYQ1GAJLIn3VKWtxKbvD5avBJEm
         YpzA==
X-Forwarded-Encrypted: i=1; AL+hErFt5NPY5rG7U0Gsd0SumwyLWrQTrweGlPyFa2adHkQyBm7C5uzyXBJRshv1w4c8zyLWfYi9+u6YOfg5hE6Fc7Lj@lists.infradead.org
X-Gm-Message-State: APuU4Z9JAdEOOMwjJEntRBH6qj/mPQITqjgtZImAjL8DvhWgyP4vNAb1
	+rxO6ELyvFpqWk1LtwE3QiRdWb1fjEdi0JT0QAMEtZ3cA+9GPctSgQngmybfMjTF5KDU
X-Gm-Gg: AYBFou0zNXtxEDjBuz8Tp0czZimtr6aHNr0Zgi7+WJD+8ArOiUoG9g76QgGtX4nHz8S
	oIgRHXYOKMt96y2q8bOBikV4qbLrUwx+Bbt+nStafltvtBrvaDQj4tfMww//G1WVvSrdemNxuy3
	p0+eoYkJhBC+U+WPfUyzic8kW1dDitMwCQwJqpgsSUnTrmBdo8Kp9akERoJSNvsXxVrbcqnTGLf
	YhKk3LlVy2tcp+ZG14FWGVQoHhvV5hSvhsoroeAObtf65PAmQV9gxWyncWCsHThpl5FBZWMgXTx
	UEvX61USUiWy3s2WF2KuiqizA4X4M3dV1/ntMSvsLkCp3lUO0AyAG0kLxJ4JrmCOCBx1d6J4n7p
	d74GXMo2g8EowmDKjVwD06HqAbWTL/K2AaV/NVv6WzNbuqQNbzoaaUwM99QctZ3gemUgREQqOXv
	+MaLBzVZalSFDHf4DYp8A0P6ijVjBAHmTp4HbgLzPSdyMHDPoSMqsUxCE+F8qUpdzXYqI4KxIQo
	Dv/uJwShyi3nR9mwLLgeNAnxcsWVi8ttVimaUidlR/HPf+bdyy12JLR6RzIY1D3yBl/qpJ2aY8s
	1fCxAYuw1Bb96X5UABVpbzWg2RpuOWubR/qSOJCCbi6EDUxcKt/aJXDUbNKPyJc=
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr20084703f8f.45.1794815908942;
        Sun, 15 Nov 2026 23:58:28 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm21124748f8f.28.2026.11.15.23.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:58:28 -0800 (PST)
Message-ID: <19b4c35c016a91302bf6bc3380bfcd3d21dc50c0.camel@amutable.com>
Subject: Re: [PATCH RFC 1/4] powerpc/crash_dump: check ioremap_cache() in
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
Date: Mon, 16 Nov 2026 08:58:26 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235831_474290_9F88C9DB 
X-CRM114-Status: GOOD (  16.15  )
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
> copy_oldmem_page() maps a page of the old kernel that isn't in the
> linear mapping with ioremap_cache() and copies from it without
> checking
> whether the mapping worked. If it didn't, the copy reads from an
> offset
> into the NULL page. That oopses unless the copy happens to be a user
> copy, whose exception table entries turn the fault into a short copy.
>=20
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns that into -EFAULT like any other short copy.
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent
> copy_oldmem_page")
> Cc: stable@vger.kernel.org
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0arch/powerpc/kernel/crash_dump.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/crash_dump.c
> b/arch/powerpc/kernel/crash_dump.c
> index 103b6605dd68f..1543917bd3e1d 100644
> --- a/arch/powerpc/kernel/crash_dump.c
> +++ b/arch/powerpc/kernel/crash_dump.c
> @@ -86,6 +86,8 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0		csize =3D copy_to_iter(vaddr + offset, csize, iter);
> =C2=A0	} else {
> =C2=A0		vaddr =3D ioremap_cache(paddr, PAGE_SIZE);
> +		if (!vaddr)
> +			return -ENOMEM;
> =C2=A0		csize =3D copy_to_iter(vaddr + offset, csize, iter);
> =C2=A0		iounmap(vaddr);
> =C2=A0	}

