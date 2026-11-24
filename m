Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3577F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FD/hFtL+;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bxRE8qN3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2vecuUwAIUoQP6TE72ZUMV3QOyg4m8UsMYW8q/J7tk0=; b=FD/hFtL+VWEsU6
	I650shqzZvRUW0SL6WR/Lv/tNpJDlzDMUfqOpHWc0lvCW1ZAv6krp1PF1mNiv2do1OWhBw7pcy1Bv
	xYMTMwUmsB473CzphBL9MfB/0oB6Te9kCa/G1xCQ1JRe13vfByObTNcw+0EsPd7I42mzXI7VXjv9q
	/I5dss4RYrcBo3wbQQx7Q6J6BAWdTkFbNvyhTgishryXArGoqbOrmPDuqU0lPgLbTdtu7ttJI7BgJ
	h08fj6g1hi82ldsjc9OC2wC90P1D/vmsWqv7X336OCc5bokkOajEkYITAOUfBcUu2rh588Q3maRlv
	8xNrnXy9YgnbdFS8To4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyGB-00000007tln-1ZjH;
	Tue, 24 Nov 2026 21:41:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyG0-00000007tiU-0YnD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:41:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb606491faso27649315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:40:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556454; cv=none;
        d=google.com; s=arc-20260327;
        b=a3y51ImUmNqxD+29xSoBWfiQiD1QJ5WqD3Ajp/vOlOleKInnxaiwaQKDwlVS/9vFpG
         BuaJ5Jz+Pp5neulhahBBvKfDZTIVJtru0SY3qcxUSBfvDskof6ejfK7nlepRLVMKiblL
         TYfC8Dq3lg3OQPl2VKYjGQfiu3B3bG+pe67KOcjntiinLCRxaUM1luv3t5iSNeMImWDF
         ZJqSWIN57xqtEIenb47fP9mpAJ7/NTUKREsrYYcmSpV1WITNYFyoGG8U2v2o2Htzn4Ew
         3nIJn1cwtWdxAzmFkqxDgwfSpLnEWa7XIx5DGf/8Gbez3UERoVs0U/EtOkTuDhs7cOBg
         EkMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2vecuUwAIUoQP6TE72ZUMV3QOyg4m8UsMYW8q/J7tk0=;
        fh=4zejRd0YBfJAq/Au3AAFYY4CKVD8b75Mxic/TRZf3aI=;
        b=BrNTXFDEVwLO0UDFF8CRke1AxCQDmZm0PHFO57LTgSaAsOrYlRA5byE2fV5Vo4sJ0h
         O4aXze+gkSjuixrK03iNW3ITmwXLnhaJZLVPaUccLv72xDhV81KRglMvvFikND/96Ztq
         +4iTDIIAR1P4oVzcERvzhWP2Q5XqBVp1KFqg2qHlG5JG5Yw9p3OW6AS6ztVQbXXCu2tT
         ake6ubenwuJGxpbXj6h5L7dY4BmplnvrmlcY5jVSrCJiFFWrJ0bSQrhkYFYKerzNMcm5
         2T+YCVWKYOMNt65enb9dN1kOMp3HpoPHRffqO6I/cW1xFQB4pNYR8UX3NI/ruwB/U7gX
         3RKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795556454; x=1796161254; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2vecuUwAIUoQP6TE72ZUMV3QOyg4m8UsMYW8q/J7tk0=;
        b=bxRE8qN3jZJObESJXMw2VNPg8F2EVdJ2hpncYaFRnDOr9EAfWduoMV2zj8LdbXGyxj
         ZN99x/W6e/p3Bnktc7viKyChhQn+t8OtF7aZCj2p4m+Lpv1mvgQqnp/+ZVLT4kcKeMmN
         hq/l+PMFKEOZZUoYtKtlnqh84yQq9xm1KooksOEYWmbT7E0bWiCKwud47LJ1g0GX7rZU
         7wN1vsGKywaLexrbfCWCNVyMz4MPzUe4Jd7Sbi/Z5nvaRELCYaOCdux3aHFZe7cGW2J4
         nwpx++NiFLddqJgk/y4CVwDF/conbZcJTbwDhGF2fwN5BcMm1+nttLzMAo+YO9XQWFVz
         nCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556454; x=1796161254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vecuUwAIUoQP6TE72ZUMV3QOyg4m8UsMYW8q/J7tk0=;
        b=InNB5NNLNaJr4e6bQ1o0A6T5NKkBxmuz/BzaXjZ3zjRjBaRpCrj+nOQganDoint+px
         C7qarupVNpeP/9penH4kx2WaFuX/I6f7iN0eyqNjOGMFQh85yVlppls67hzLsabOv0cP
         Jfr4Hdp2n7prBCfxefR/GBFHDtScaUL10J8vmYMZme23SpeINF008F8CypLksPIiAuo8
         z4xMfZ+Udrc/NtoJrbDWQrMKmQV81w1YZCOqXszHhas/RLuTo/NgfCwtdP7aZbtKYHRu
         FxJl+E7LtivAhftesvyceZttNIlhEuB90he7jSJgwxvbeDPp5K7hevvvPO+yFpROKNzw
         eihQ==
X-Gm-Message-State: APuU4Z9al9S7QmgzNLyPlLLfcYz01ybcrLE50tfsyCmbnjk7OjUZEN4/
	yizT9q5435hoYh5GRZdskxBU8ELScaD68ervvOkx1IXgOKUPnkvL5bpAk8QLDAjzoaW+8ie2ZVp
	QNmtq3xvCVG7cipQlB59RQzYogWd4CdSq3kb4sPDb
X-Gm-Gg: AZFdTZcnv61UTSw3i+jl8rW6Oaxg3P1zJHIkWTlAW9kQZtol4TmhJTgajhZGkcqOudP
	HYCxSEEC2APFw3cpvvs1LL24nQPevNf9nDJkPtasKPle5tivEi/4iw/u5ouQ6B4E0KNlA8cSxkm
	AcDqDJH+o2UaI1jMmMHThbKUX7Iwqfdb6bIO/XolrSYnAlDJfe64tYtw+G96yMHG/DV+zPl1D7n
	NiChzeXrRdJNoe5QusVUSjcSKiaEvznYpiKQl+wo070eZ0rDOHKwB9eIDxu+DYEn8BdYTOBKEb5
	gcfhc+1yWnrbMBZ/4uWMe0644FpME7QaBU0gacZm3RWY4wqtgp2lbCBr6nEqj97WrnshRcwWosM
	pIvrwWQf76NoBp/GrZUbjx8BbBCp8EiAfQWrDCTir0X2meROEjUWW6DPDJRdWwwz4vU7RFsq1pp
	nEFnlcq+Ipxs6vhFWmKAqFrtLC3BWHT5at68to5ToNUVtaOnwjjOR+nCEhnnB8t7Q1u7WiM8j4l
	88IYfAw/4M55CxCMJJwCDbNjUoQCDZYsScNAw9AoQ6e7vwFrvFhPryrwdg=
X-Received: by 2002:a05:600c:8b11:b0:4bb:6871:8f21 with SMTP id
 5b1f17b1804b1-4bb88822346mr328376725e9.23.1795556453811; Tue, 24 Nov 2026
 13:40:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119165825.1793558-5-ardb+git@google.com> <20261119165825.1793558-6-ardb+git@google.com>
In-Reply-To: <20261119165825.1793558-6-ardb+git@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Nov 2026 13:40:42 -0800
X-Gm-Features: Aa3M54pZGVIFJNagmnS0x03Ff96oVK8AJNy7UJ-KqsPysCZXxxNZRHHhkuMJL8c
Message-ID: <CAKwvOdk7MFxj5uadbpaaQkbdu46TxzPPEqn=ieF_JWNL4_KsSg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: module: Keep executable init sections in the
 core text region
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_134056_229607_8DFDD5F8 
X-CRM114-Status: GOOD (  35.59  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 8:58=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Since commit 3e35d303ab7d ("arm64: module: rework module VA range
> selection"), the core and init text regions of a module may end up more
> than 128 MiB apart, i.e., out of direct branching range of each other.
> This is why the module loader maintains a separate .init.plt section for
> branches emitted into .init.text, and a separate ftrace trampoline for
> ftrace callsites in .init.text.

(Sorry, for picking nits in the commit message, but still think this
could use a stronger problem statement up front, particularly some
mention of BTI since without BTI this is a non-issue)

"This is a problem because the compiler may omit BTI landing pads for
such cross section calls, which can lead to BTI exceptions for large
kernel modules that are built with BTI and make calls between
.init.text and .text" (or something to that effect).

i.e. commit message doesn't mention BTI at all, and BTI is why having
those too-large-to-encode operands in a direct jump are problems.

(two comments below on configs and includes)

>
> __init code typically makes up only a small fraction of a module's code,
> so instead, keep .init.text in the core text region, by overriding
> module_init_section(). Do the same for .exit.text in
> module_exit_section(), which is only consulted when CONFIG_MODULE_UNLOAD
> is disabled, in which case .exit sections are moved into the init region
> too.
>
> On arm64 allmodconfig (10604 modules, disregarding modules with 'test' or
> 'torture' in their name), this grows the aggregate size of the modules'
> core text regions by 2.6 MB (+0.58%), or 243 bytes per module on
> average. As this only costs an additional page at runtime if a module's
> core text region happens to end within that many bytes of a page
> boundary, this is expected to affect ~5.5% of modules. In practice, 527
> modules (5%) grow by at least one page, of which 16 by more than one,
> adding up to 567 pages of 4 KiB. Given that allmodconfig enables KASAN,
> KCOV, UBSAN and GCOV instrumentation, which inflates __init code by
> 1.5-2x, these figures should be taken as an upper bound.
>
> On a distro-style configuration without sanitizers (1023 modules), the
> average growth is 104 bytes per module, or ~10 KiB per 100 loaded
> modules, which is expected to cost ~2.5 additional pages of 4 KiB (or
> ~0.6 pages of 16 KiB).
>
> This permits the separate init PLT and init ftrace trampoline to be
> removed in a subsequent patch.

Maybe not worth the trouble ("over configuration"), but I do wonder if
you'd want to make either of the below changes conditional on BTI or
MODULE_UNLOAD (as is, they are unconditional)? i.e. don't pay for what
you don't use?

>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/kernel/module.c | 33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 24adb581af0e..39e7a50733a9 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -25,6 +25,39 @@
>  #include <asm/sections.h>
>  #include <asm/text-patching.h>
>
> +/*
> + * The module loader allocates the core and init text regions of a modul=
e
> + * independently, and so they may end up out of direct branching range o=
f each
> + * other. This complicates the handling of PLTs and ftrace trampolines, =
which
> + * need to be emitted within range of the branch instructions that use t=
hem.
> + *
> + * So keep executable .init sections in the core text region instead. Th=
is
> + * costs a bit of memory, as __init code will no longer be freed after t=
he
> + * module's init routine returns, but this is usually a small fraction o=
f the
> + * overall size of the module. Non-executable .init sections are not aff=
ected.
> + */
> +bool module_init_section(const char *name)
> +{
> +       if (strstarts(name, ".init.text"))

#include <linux/string.h> # IWYU


> +               return false;
> +
> +       return strstarts(name, ".init");
> +}
> +
> +/*
> + * Without CONFIG_MODULE_UNLOAD, the module loader places .exit sections=
 into
> + * the init region, as they will never be used. Keep .exit.text in the c=
ore
> + * text region in this case too, so that branches emitted into it are al=
ways
> + * guaranteed to be in range of the core PLT.
> + */
> +bool module_exit_section(const char *name)
> +{
> +       if (strstarts(name, ".exit.text"))
> +               return false;
> +
> +       return strstarts(name, ".exit");
> +}
> +
>  enum aarch64_reloc_op {
>         RELOC_OP_NONE,
>         RELOC_OP_ABS,
> --
> 2.56.1.708.g77570a6a1d-goog
>


--
Thanks,
~Nick Desaulniers

