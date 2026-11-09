Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BD3606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tX0vEZPB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFoU2Hgr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=65mXDclEWyE8ywbYwWS+OTM5iohbgv5+R25SHeg04wo=; b=tX0vEZPBFOdqwiWBd9E2X8GcS/
	UIwhujcopNoRDv/znpUH6mCo1ehROpFF6BEj4csfoIMlnTx5WtT+IQZ+PgpmwdTugn9WE/MkMrRcF
	JxZf2f48vgq+nGV2kvk4lsZrBIraTjXx1oFXwPoI2U+HGm6Keo6dn4QsFlC3T9Yv/DFK2Aww9AbF5
	aaIwSFj23CaczrZVE3MN3mP1dZqBDpPGXjEj3s1pr6N5w46scfpJ4BHxRSDu0iHgY68m1gkEwI4Ms
	5dvZT0IblHngPggft7ufFPLFF2EeBwf+H0SFNpvGtBDFu6jlC1l4puSWwbAVfAojUCkM9OEGS5fM7
	SNwHI5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNDh-00000000UbF-40sL;
	Mon, 09 Nov 2026 11:07:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNDf-00000000Uam-0W35
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:07:24 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso4646875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794222441; cv=none;
        d=google.com; s=arc-20260327;
        b=egYjSJn31Bu+GbRuzrVDZ8bX9gaebePESeXCaohcqcScFG4+BOyg4N8og/hlZk82Tp
         tw8DBd2nLfiaxtP3tPYfR1zbtYZL7iCl+z2itkjY0FBMZnMSqsDP1qwelP2Oe/T9Dwd4
         pbO4vIPIzAoLUjkO6z1+sEpo6x+2jTJF6yd3fI0gx4wXqtenz+jAUHyN9quSjlxPoeor
         E8Y+waMLHuHeqdyrZOSrda4idq3DkTnwx31l+Tga6VZVWfGKOjaGVusiNkND22geRFSe
         +20frfukE+tFfvE1TJ1PnRz3TIfw+PJDMZitCG4u8VdsWNuqaS3gAtrP24trrM9zTrSk
         oELw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=65mXDclEWyE8ywbYwWS+OTM5iohbgv5+R25SHeg04wo=;
        fh=9V6VPe84U529pjv49vxoPm4muEB7qyDNSztPbPANLDU=;
        b=M+sC1FMoya1To5nlmf19S0vJGle4HthoRB0i+JGjATSyye3fNJSoR1xNApAD9CXeFO
         ZtQa4m3zY9XsXir3X2fhXiMvHl+kONsQfWiuuefqLQONa1DQ3O+Xv9VHBiD+SUe8Wfx4
         aL7+kQ76Ap7hZm7x4DYalJOMYjcI4Gpcs/U8+DgjeN8R1c1n8ZvvPJy7PkkupEUyiUok
         nV4Xz1K/JxbOm+DsN/DSOKZiSKcm/yKhTW3XugczA6h2q5XJL8YF1zDchFqPOWIZCsoG
         h7Ol/1I5JnIz4CC1oTneT85ewNDpaGM6GzffXgigZnqOUPSCSHz/9zw7sRk+JHQQBE64
         OzYQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794222441; x=1794827241; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65mXDclEWyE8ywbYwWS+OTM5iohbgv5+R25SHeg04wo=;
        b=gFoU2HgrA7aSsPG6VFSlTuOY9O266IwlJMX82m3seafEg6TJ1OYIstRZsyiBzmumMU
         F9ABm2lreO5+JvOMLBNzhUwRBqhzvfo2Sqbnwd789WqOOOmPkJQk7Txnwhe45M9tXwH2
         jCXLeDgcPY6rO5PAsvmNIVJDSE3Wv06nR7dbuSyeH7CYX1Wyj/HJZz4+kB5X60GpKTFU
         IQEJ0K+015fqYq/oYDpGg5J58VuDuyKcPyWkElAOoDwjPzP8Xpcgrr2HvWGyHD2zX2S9
         lF415bKySIxuZM7JlXDYULhwsT9mXK7fubOdAAzN961ZhTopIbm6tCQrVpxWZAZBFWC+
         1FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222441; x=1794827241;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=65mXDclEWyE8ywbYwWS+OTM5iohbgv5+R25SHeg04wo=;
        b=OiMLHRsc+QHwScIsJ3wiiuUIh77tVm/LSNLvRg7Pvtc3wunxuYKR8dQR4kJ3bTpo99
         tjFLBsTFlwWbBGDRxlHXxp9iflc4JSkcppRw3bSYPCs44ZaIEhwmcZAUdEA3REHbw0n7
         aNNd0o8eF5jelqMziCdjQZcA9Nnb9fg7KtSoqbxwzvTW/1IanXsN+WUCydqCD2MbdDXh
         pyXRUEfj6rVT2mMAIMzrQAMtTv+2mo1eGL14ibhx31nc8sX2A8Xc/QEWk5eTPheZRsVf
         LHkrJvFbGoNb186GLndOLEMRAGmqbIBYfzxROGdBuU1rz8D1aw8W5laOyhmUCnhT/onO
         5egQ==
X-Forwarded-Encrypted: i=1; AL+hErHREqbdE+NSw0KlAACEVUeunpYbyMAZO98ZTEq2Lh3apbRBSD8JvPlYxvQekYjCRRudNhhJWvu6lDn5wCr2YkQt@lists.infradead.org
X-Gm-Message-State: APuU4Z8YypGf0p5JNJ83uNQowS9CmYuIIiNkmewRGPwUvxzN9YS5LV7Q
	wsbMCJAN9R3Z7/touZ3fP+pTuKxzQiqTJxzNWOBTM0dT9a1Y9dYirCuAVQxQycGMSkRNJoY4FZM
	C8nLu1gTbX6M2DABb1a7LeWlu87COY0Y=
X-Gm-Gg: AYBFou0KPJz1MnNympd2cCt+RAvq31h6ixq4Ix5RxZsTTmU61LC8xBzcmJ3X1z2IzmJ
	u0lRjC1wq8JhjHju1Qlr1gv6NzXWORLpElvtX/FmhOuHkYjElA/+AYnx3K1H6VBI8RC1OQOR+TS
	+HqJCDv/TtolPde0hlV0NqCyP5JAihlnKkQlgkvjqz17FK9yNR/ao5Bbx1MS17ojWukMn/qSQqW
	rSKxxX4nhJ2535mfsssNBCvep2sVv+OCyc8ZyJv8x+P321d1NnMz/2sgSc/yMyqjpVffJ3B1gpY
	HG9BlSLi0M/dZiM9t5fGc8WzGYJX6SE/etkjG/GDfSr4mC9D/j1nBLlWJa9hxY2002hm1YSKHaT
	k+ETisXNTCyIqHJrrIfQobVRWLgbbU2bohR5QBA==
X-Received: by 2002:a05:600c:3b04:b0:4a2:e0c:2b0a with SMTP id
 5b1f17b1804b1-4b960e9a794mr69581505e9.16.1794222440621; Mon, 09 Nov 2026
 03:07:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com> <20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
In-Reply-To: <20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Mon, 9 Nov 2026 19:07:23 +0800
X-Gm-Features: AclHuK99Avp6YitNghM646M3nFfapLv4xavJ0UAfEt09SDcSvaVsVIm1DZLJeo0
Message-ID: <CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Andrew Morton <akpm@linux-foundation.org>
Cc: catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com, 
	linux-mm@kvack.org, baohua@kernel.org, dev.jain@arm.com, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, david@kernel.org, rppt@kernel.org, leo.yan@arm.com, 
	xueyuan.chen21@gmail.com, chleroy@kernel.org, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, ajd@linux.ibm.com, 
	jiangwen6@xiaomi.com, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_030723_175373_EDDC06E7 
X-CRM114-Status: GOOD (  13.69  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 9 Nov 2026 at 15:08, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Sat,  7 Nov 2026 21:49:43 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>
> > This patchset accelerates ioremap, vmalloc, and vmap when the memory is
> > physically fully or partially contiguous.
>
> Thanks.  This looks pretty mature and reviewed.  I'll add it to the
> pipeline for linux-next testing.
>
> Sashiko likes it.  I'm working on a different AI review setup which
> finds different things.  Very slowly.  I'll let you know if anything
> interesting pops out.
>
> Do we have sufficient ARM review?
>

Thanks for picking this up.

On ARM review: Dev reviewed the earlier revision in detail and
his suggestions are folded in. Leo Yan tested the large vmap() path
on TRBE/SPE. We'd welcome more ARM review from Ryan, Catalin
and others.

Wen

