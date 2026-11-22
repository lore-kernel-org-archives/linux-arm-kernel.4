Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C96606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 00:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HJ1oRNJL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UGhRLrFg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8RhArZNo8p16GcHuh6NIuiaO1SE3vke5Fkl7bF9WXX4=; b=HJ1oRNJLlUbMax
	yQNDseKNT5cHRPmIxCu5H46Wk6vZyBsljznqnmw8aiLVwzAXMjlmmp074G2ohGNsVNw23ryIn/q+G
	CMY6Mf+icwsnLSxBS4AbfgDWywCyYuUw2ML0SmWFC2quhxuXKn5MOla+32ZgRyAOWN3UgSUS8R70O
	RG1lXE7E6JA09CL+0L6361ZTiLot8RIvXOaTm/IabDvjY8j8EG68R4Il3TRA5V0feQD3Ti6jiIVsn
	jqGdpIOI0knWp0ePK8zMMRCsAFb+TyFHNTDXYxy7V78JeWSv7ldPYnA3sXK/QllSXlxiRizR70ZnP
	JSdwDFhFx/uEHDVkC3DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvRM-00000000aiI-2jr8;
	Sun, 22 Nov 2026 00:28:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvRK-00000000ai8-41Zh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 00:28:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6514261891
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 00:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38F71F000EB
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 00:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795307297;
	bh=8RhArZNo8p16GcHuh6NIuiaO1SE3vke5Fkl7bF9WXX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UGhRLrFgtuywO9ZMC+tmRQw0GrZhEJWe37Hj5LwNPGYSWfalQC+IuGbM0vR7f33cm
	 QbFU3k0iT31YsR/mr5ZQrOvtpgJuwcVSDLVtGQWZxPx+MC/vRZagmohzuwEJh4BMfk
	 VeOqpsQ+P9mxUKmCdzQyaOc8UNTFQA28tmFMMhZyg2/eU0KGlf2xjRH3+xP9pvBANe
	 h7ekRMiLhsLBcJbjAAGcBTq6emCPbJ6yVgmrOL/YNmau1hDfbSGG0hfp9JsGpeL8Am
	 q9ZmXv08zExR02+uWxG4Tsd2JZLe0OOGPDNUycMothSucpHj5Zlg8x3vTEqXQfIJGY
	 qUBaS4S5jzaOw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so2898828e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 16:28:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFqKZHeQIZVt7IM7EZIOLvng7l0l7h+rbvwf1OSOLvVGNYZ+MpMjX/I0JhVZPG1vBcYbNwrBnjnW+9/W0xNbxqA@lists.infradead.org
X-Gm-Message-State: APuU4Z/eY7P1KDIGJ6zvzC7JN1oLgCK/A9t12j9N27fA9RsnCPPN8lx1
	0QaRlcPUl2nMRUr0hAdNiqg3mbs7YmrGO6/5KehNQkqvoDAFZ0ASTMVfkfyVR7BqMna2dV8K0OB
	WhnV6LaWZDok+PV7tGjnhqvqCjou9s+A=
X-Received: by 2002:a05:6512:1042:b0:5c1:606b:ae8f with SMTP id
 2adb3069b0e04-5c1bc660882mr2353410e87.7.1795307296619; Sat, 21 Nov 2026
 16:28:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com> <20261015142552.4128028-7-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-7-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 01:28:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLkik4jJd0h2jnZFFQa_rZrnkoF6U2n69vPOoDMEFo5tgg@mail.gmail.com>
X-Gm-Features: Aa3M54o4IKo8fD9YUMMNm9Se3tMa7QPg9dEL1ZzSewcxTabcAD38a3EgY369qO4
Message-ID: <CAD++jLkik4jJd0h2jnZFFQa_rZrnkoF6U2n69vPOoDMEFo5tgg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/15] misc/arm-cla: Accelerator context save and restore
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
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
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ryan, Jean-Philippe,

thanks for your patch!

On Thu, Oct 15, 2026 at 4:27=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:

> From: Jean-Philippe Brucker <jpb@kernel.org>
>
> Add helpers to save and restore CLA context for later domain switching.
> The saved state includes DATA registers, LRESP, per-accelerator SRSTATE
> and any implementation-defined internal accelerator state exposed
> through the IAS register window.
>
> Use ENTERSR to stop each accelerator and collect SRSTATE, then read the
> advertised internal register state with REGREAD. Restore by entering SR
> mode from a reset, idle accelerator, writing the saved internal state
> with REGWRITE and completing the transition with EXITSR.
>
> Reject accelerators that require SAVE/RESTORE operations during setup,
> since that path needs a DMA buffer for state storage. Allocate
> per-device save areas for all CLAs in a domain, sized from the combined
> IASSIZE discovered at setup time.
>
> Signed-off-by: Jean-Philippe Brucker <jpb@kernel.org>

This just describes mechanism and not use.

I see what the code is doing but not how it is used.

E.g. part of me think: if it is technically a part of the CPU,
why is the context not stored in pt_regs?

So I assume the context change at other points than when
the process on the current CPU is preempted or scheduled
in.

This context (ha!) is needed here so we can understand
the *purpose* of this context switch.

Maybe the use of contexts and context switching need to
be in the cover letter?

Yours,
Linus Walleij

