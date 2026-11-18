Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FFF606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I6SVo3Nn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kd5v5C4O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tKDarfxiWOcLoTCSjE7AeoaPEMMkfbEBqcBYvqId7kA=; b=I6SVo3NnN870iY
	5whwzT7ZC4MEg7tslTaKWeJMh3lpvd2j+1QkdaFupOkjtsC6PjjJ9dzQ4/XoIbFKYCxYXKXMt5gmg
	YcUQ++9w50A/Hl8k7Uf/GP2kMHz9bRWiyRdL8VgEhcyy2lHxxenTUnm5cLMG8O+uwhGtaCASRaXUh
	xaHf+Stn5TTV2gdyb4C7IiIWrRkjyGKRxc1u18csCjrDFICkKbIRaKnJvNU3RQnuB6gBI0zZTTFvo
	BgV34n7KNDMCz5MilVWlmVQJK8GJgxOKrM2Exf3GdBhbuwj5YTm8xlap0UTitE5agGDRnHVGr0dBw
	eReWBhhH7KCKgu8M2sZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfP6-00000008v6H-1Ta5;
	Wed, 18 Nov 2026 13:08:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfP5-00000008v6A-3Elz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:08:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3741B46023
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 13:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7A31F000C9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 13:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795007327;
	bh=tKDarfxiWOcLoTCSjE7AeoaPEMMkfbEBqcBYvqId7kA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Kd5v5C4O0ad97PKFyM23v0ah51NrP1LwAeOglVZu0sHc3THPBxEJ3v1Rf5KuPAmrF
	 yktZ9In2WOEcBZMG+Vt9Un7fMU7mHcBwfbO3f8fe/IINVw9UAa11BJe0Kl/ksIZT5d
	 PEmc4JCpBMgLWmXBZY1NsxAZXmyFSkPBwVbJ1UMitwYk9aqcY6ktvPC3TTGTrf2vXQ
	 hKm0v1n5KAfkV2z0mLNLJQVnbU/SH2lm2ERbH15kdLUwAfeCFV8RRv85k+cJY8TdM9
	 peQpO5zgXC32Dm3UZU7bUpktx638zdZvpfLACoaWbgvVyQ6qoecQIp8o24JqPhufoQ
	 XBukB1wXNjJmQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1101090e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 05:08:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFUDPkXYIZZhQDAW69lW5vTPLjvgN269g6MHERgQiQsW+HOBuNTVRZmo+c23DrczgqliHMlLXhnoDZR7f6Haato@lists.infradead.org
X-Gm-Message-State: APuU4Z/n7wxhvgzjoLuLpi0oi0wJHXV/IBEQpS17UL3tPopCbhTgg7W9
	I/mihwiMBbE955wFFNvZKEsoD1Ta9g88peazYMWzUwT6/m9uqBMTFEwWhPccsam16jsehfn8wNp
	WLU6dUoeJ/CzdmkJDTofWZILlRkZ/esE=
X-Received: by 2002:a05:6512:3192:b0:5c1:5a83:4285 with SMTP id
 2adb3069b0e04-5c1aa2b16ddmr1030883e87.60.1795007325480; Wed, 18 Nov 2026
 05:08:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116124832.662455-1-arnd@kernel.org> <20261116124832.662455-2-arnd@kernel.org>
In-Reply-To: <20261116124832.662455-2-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 14:08:31 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Ugp2MH1nvBr=+_o6a9UZ4VCU04KY7Z22pzEnGwHAWTg@mail.gmail.com>
X-Gm-Features: Aa3M54rGSDqneypUHMmdmL7dJMYPaYSAWAq3AteQhJuMu5nbQzZhIjBnrf8_3UI
Message-ID: <CAD++jL=Ugp2MH1nvBr=+_o6a9UZ4VCU04KY7Z22pzEnGwHAWTg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] ARM: remove support for highmem on VIVT
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Malin Jonsson <malin.jonsson@est.tech>, 
	Matthew Wilcox <willy@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Michal Simek <monstr@monstr.eu>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Nishanth Menon <nm@ti.com>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 1:48=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> As Jason Gunthorpe noticed, supporting VIVT caches adds some complication=
s
> to highmem that can be avoided these days:
>
> While all ARMv4 and ARMv5 CPUs use virtually indexed caches, they no
> longer really need highmem because we have practically discontinued
> support for large-memory configurations already.  The only machines I
> could find anywhere for memory on ARMv5 are:
>
>  - The Intel IOP platform was used on relatively large memory
>    configurations but we dropped kernel support in 2019 and 2022,
>    respectively.
>
>  - The Marvell mv78xx0 platform was the initial user of Arm highmem,
>    with the DB-78x00-BP supporting 2GB of memory. The only remaining
>    board file is for Buffalo WLX (Terastation Duo), which has only
>    512MB and is going to be removed soon.
>
>  - The Kirkwood platform supports 2GB, and there are actually boards
>    with that configuration that can still work. However, there are
>    no known users of the OpenBlocks A7, and the Freebox V6 is already
>    using CONFIG_VMSPLIT_2G to avoid enabling highmem.
>
> Remove the Arm specific portions here, making CONFIG_HIGHMEM conditional
> on modern caches. Since the cache type is enforced by Kconfig, no
> boot time check is needed here.
>
> Link: https://lore.kernel.org/all/20251219171412.GG254720@nvidia.com/
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Good riddance I'd say. I'd choose VMSPLIT_2G over highmem
any day.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

