Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A4F606A883
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lfgn5nZk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BiDOWQWnXjiTVlwWz8It4XU8j0IkMRXtLOxSJ2sBmUk=; b=lfgn5nZkqn0WeLPKA5d5HB8ZND
	1U06ZEoJg+rRiqM9JZisiv9+GN/a60qw3Lf0lXOW+kYU7UUVcrsHVmcfmAtG88BLdvpqut8vE4ht+
	DKObTM0Hd/9gWteH9HN6Zn3xctyUqTkqlzQ/+FSyqA7TdNb4kkIXPMSBAr0v5kQLYcVijqjjBbImw
	hSdIcBRZdzWSUH3RjVNcq+dJW2POMjPpxqBlvuv9hoqGrCGcYeHKsS428iC6+UqS2GSkpVadWWn0G
	7eQxm28Lwdd4qYk+O7QMis60o2x5eq1ryk1sKrQvZxM4PxSTlNEIr/BAb6ZDV/SQd2gEmRNB6Np8D
	TYrt2hxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaBk-0000000AvOB-1Tht;
	Thu, 12 Nov 2026 19:10:25 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaBh-0000000AvMm-0vEs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:10:22 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso81197e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 11:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510620; x=1795115420;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BiDOWQWnXjiTVlwWz8It4XU8j0IkMRXtLOxSJ2sBmUk=;
        b=o8PXlmqEcG6TOwenoOF6/DiUFiMnDyfP4nN1/kcO+XFFTMHhdvBXVs0XQRLR5rZOy2
         GivtRvpSneeKZ51v+GBq/LK++ej2XdIpa2Z8P7t/9csoGRieR8wJ/O+gNV3YjzcHf+eS
         pSNYuviaSlSqqteIcxC/0eQueiM4elFpwCe0yF3CGNDtY0UmzeadO+3h9azm9efrRj++
         SwbcNm8Dynk7L6uWWQqVZ2tOSRtADzmmquUUVVioG+t1IieL1FqDgQHsqqExAB4JDKSH
         /OhsR7wdZYQZpWf7q9hYTlLdn6VzUCiwZri8imkqresUIVpKaFOue/7o8xdG+6ndTmaN
         qhig==
X-Forwarded-Encrypted: i=1; AL+hErGJWGlv10Nk/sZb3d6jP2K6MA4SDv6Sz4+9OED4IgGpLyiXmXWO1n4vb05MrObnl7a8HgFybomNarQAO8Q7mLEb@lists.infradead.org
X-Gm-Message-State: APuU4Z8NdPxy1M6U/t0tW7IT5joSAjNdpDXEoVJM1Cf6pigkBMdS/1TD
	v6tLmppKspKFPoG015i8UFjKcXptLneKEXndv02VepitsHY4RH+vYS5SBR7L208YnE0=
X-Gm-Gg: AYBFou3e3/59nCnKfDeU/OlviDEgMHFZih/qfH+nhbC+01SQTFICKbyeyFDJhuAB7EN
	qqXXnKjLSZg5mr0gHs20E8bOatuwz1ahqivyuXcP2ve+AqZSgp50XKAb/ab1ohNMHpaMqMmE3iB
	v05gty2Yi0C4VICO5AIiaPtx9O6bN3q61j9R8lWAdD4hlQpYmNRk5NVH1k3eL9+PsRtKyPxV+qk
	myRbb4ETMcMd/Qa0pgIEFrtFfKmZYOu3ANW7y7FsP09r2mvacJjflq3CB9ozaf5rDlg2Q+UWyxm
	gmuSvqBRy616JKl2UKBBbdx3SW1FCyk30XyENu4izm8bMPhDW/a9t2usHo1TLFygHciD8VE7ixS
	/kuSOOeisdAu4Wns7XmqQ8QNe2ns9dxWLKYGouOpXBBCppqQNbjbouvdFvEhRMd5/7qkZ/o5Ny5
	LIlLteQHMxrapgkAZgGkUGDMHNQfdyT59F5jaomeAQh+eMQMHY0ot+cWj6dKGNL2Wwa/C/Vi41L
	uDIn8RXD/Eartl1soTwTikLA4Q2NN3JeOoCPL3xnV/ow9owctLPFm2Z9gXChw9Naus1xqCj5LkQ
	kgsvsKKXMPPgdhl/E8qtaCMDf1Z+LMFBKAbh97PUv+FqMAGbSUYnQa+FrtkCrnYuGRYp/1N+9BS
	AWwS+1KwzEcUj
X-Received: by 2002:a05:6122:489a:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ee34aef4c3mr31791e0c.20.1794510619947;
        Thu, 12 Nov 2026 11:10:19 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3422fc0bsm74541e0c.14.2026.11.12.11.10.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:10:19 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc81984fceso32291137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 11:10:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF0gjLBhRPIZLuKkx6XcNsxc3LY1eyOqxB5OgAcMO6ZpFT4MtE0F/0SA+FMiZVZTAsuKbqflIGQRkMi8jYYL7T5@lists.infradead.org
X-Received: by 2002:a05:6102:5ccb:b0:7ce:5952:125d with SMTP id
 ada2fe7eead31-7d64db29605mr42432137.36.1794510618289; Thu, 12 Nov 2026
 11:10:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org> <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
In-Reply-To: <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 20:10:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgM_TMX7HrpsvDaQi96Ht-K6KTBu5PPRRBpcCegf3Q9g@mail.gmail.com>
X-Gm-Features: AclHuK-k7G9fpVKu6BhCbcWfXavvnldoQZhCl9e2eioRf49lg5T7xpzAfc2z5gM
Message-ID: <CAMuHMdXgM_TMX7HrpsvDaQi96Ht-K6KTBu5PPRRBpcCegf3Q9g@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] powerpc/crash_dump: check ioremap_cache() in copy_oldmem_page()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao <leitao@debian.org>, 
	Chris Mason <mason@kernel.org>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
	kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_111021_262102_FBDC246B 
X-CRM114-Status: GOOD (  20.49  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 at 17:39, Christian Brauner <brauner@kernel.org> wrote:
> copy_oldmem_page() maps a page of the old kernel that isn't in the
> linear mapping with ioremap_cache() and copies from it without checking
> whether the mapping worked. If it didn't, the copy reads from an offset
> into the NULL page. That oopses unless the copy happens to be a user
> copy, whose exception table entries turn the fault into a short copy.
>
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns that into -EFAULT like any other short copy.
>
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent copy_oldmem_page")
> Cc: stable@vger.kernel.org
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

