Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EDD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XC5+F31r;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JFc4cP7j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0qdXfgFbrt8cELQOGisVmBrQ50jtAJGNxPG8ew5/7vY=; b=XC5+F31rPOT68YoQHyJPkKSznt
	f+4wCJNHqCSzOoDqYa2bwWS2mbrb246lXQmPLBNB1WDxaVRdbiNhHmtRmrVhkaLfZbJBLMzDuS8fc
	tMxrppu966+zLZ5DFljB0vZIgH4dMubSm9kJ/6zECFbBjcPB2JWR0815txhXVq1MJBRov75cUyK4B
	w0czCLv2jWzT/LFj8lR9WtJs8jI25Q2t4PljOQ93NH7DSDKGkxmoNgdonYZ23Fd7w6/g2w79aa6ME
	mJpCHqBZEfWLzCHiIpmkNtPEPdTR0g3beYq7zVqlmm4vXCiRuEBnXTChLsSS+jhdCDFP2cvC0nA8o
	EdZuBWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrIe-0000000FFaX-0H8L;
	Fri, 27 Nov 2026 08:27:20 +0000
Received: from out-91.mta0.migadu.com ([2001:41d0:1004:224b::5b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrIZ-0000000FFZv-2myU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:27:19 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=P7zTh4ysMCYZDF5Ib3q0oR+g3D93VzbkeVMGD4akERA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795768033; v=1; x=1796372833;
 b=JFc4cP7jslkxQxCuhwTcRBbebMpUhUtNpG78hXZW0r4J5O96mQMKupB/btDzuXoPHDT5oFhk
 VmaXRvBF4EFEHeDML0N10AGnqP0ltb14x5+XZi8fp6zNW9TiKXog5NZdRsKRNULHibSEujOYw10
 dWgoOWQgNonlMs3VavxVIao8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 009c4bb6e191c27f;
	Fri, 27 Nov 2026 08:27:13 +0000
X-Mizu-Trace-ID: 009c4bb6e191c27f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so42438e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 00:27:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHrgnXA+fdvq9aLFI+hHwEO+sVLAY0TW4UWQ8Ytw90mvtH9/2sSVXbV0U3Kk4ksv956NiTroXxwXmU6/qM5j1D+@lists.infradead.org
X-Gm-Message-State: APuU4Z9HQkLFRhUlyoZ9brPCrEMvuqnFABNkNBlQE2z5HYyMQvFNz+e4
	0p5jfgNNLnN+vL7uuWCSIzYQzAuXUPmbh6nsJBe3aD31rNgMmZB8+WrK0H8I/J3VkUwUZgpLNHi
	pm3FJlvC9uvJX+a2k0VqlPuS586lIFfrFlm2kTPkK
X-Received: by 2002:a05:6512:3041:b0:5c0:7c6e:4559 with SMTP id
 2adb3069b0e04-5c21a2490b8mr800282e87.9.1795768028694; Fri, 27 Nov 2026
 00:27:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261009072147.474952-1-fuad.tabba@linux.dev> <awV15Rv-caDclC9K@arm.com>
In-Reply-To: <awV15Rv-caDclC9K@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 27 Nov 2026 08:26:32 +0000
X-Gmail-Original-Message-ID: <CA+EHjTw_T_HhfNUytcqf6xefkOoOHgpFq3=J7bgsZSMyu1ON-A@mail.gmail.com>
X-Gm-Features: Aa3M54qBZ_c98t9Ayo9A6TeJjo0TeideV9tW7aQLWPW5qkPop4MRVlx3am7GbX8
Message-ID: <CA+EHjTw_T_HhfNUytcqf6xefkOoOHgpFq3=J7bgsZSMyu1ON-A@mail.gmail.com>
Subject: Re: [PATCH] arm64: Use symbolic constants for the ccmp NZCV immediates
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	anshuman.khandual@arm.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_002717_715487_08A7911A 
X-CRM114-Status: GOOD (  12.57  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 at 11:32, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Fri, Oct 09, 2026 at 08:21:47AM +0100, Fuad Tabba wrote:
> > diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> > index f7dc5fb9427d6..15c381ef7d2c2 100644
> > --- a/arch/arm64/include/asm/ptrace.h
> > +++ b/arch/arm64/include/asm/ptrace.h
> > @@ -30,6 +30,10 @@
> >  #define PSR_MODE_THREAD_BIT  (1 << 0)
> >  #define PSR_IL_BIT           (1 << 20)
> >
> > +/* CCMP NZCV immediates that make the named condition hold */
> > +#define CCMP_NZCV_EQ         (PSR_Z_BIT >> 28)
> > +#define CCMP_NZCV_LT         (PSR_N_BIT >> 28)
> > +
> >  /* AArch32-specific ptrace requests */
> >  #define COMPAT_PTRACE_GETREGS                12
> >  #define COMPAT_PTRACE_SETREGS                13
>
> One nit: I'd place the definitions above (or below) the
> ARM64_S390_COMMON block, the generated s390 header shouldn't need them.
> Otherwise it greatly improves clarity.
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks, I'll respin it as you suggest.

Cheers,
/fuad

