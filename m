Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6257606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OIEyCNym;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Xr19gCZv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CkjGtSF/XBh/ScHlNzqScP6mcsPlf2tswFWRNIgKHr8=; b=OIEyCNymVKXGIW
	ezloiNYV7G7x+C6R//US/czUtQLAz22vIGtvmshKTbyEMBiURTiMoOMp7CyYx0QnJdvvXa6elTgVW
	HZmHotUFvE/XGYDFMrMOdBmey+C4L2jsNuKYiT+vcQCPpxCPkE27jETx4f5F6lzz/0tJx1Roz+Yfj
	xQlJoUYLEgksGtLJ0OrvaxOXPnS1UPGgmC8zD2hOaTkNMBdQ0x/HN2mjCTDNiJQ9G3Kx68rtwM4tZ
	OERKqGM7vA8sXdJVXh7CmsQrXgm8n2BiuGFNf4Ue3uZrpLULQve8HVvFkvqJ+GkjRCKm+vD3Jw4mK
	Jbs0HS9vzt7j/+LLSuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyMf-00000007ucG-2EDF;
	Tue, 24 Nov 2026 21:47:49 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyMd-00000007ubv-1H0J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:47:48 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-490d59c3edaso3438050f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:47:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556865; cv=none;
        d=google.com; s=arc-20260327;
        b=PSx2aiu0TCHTRyr0+WbIBu3k+6fCbW4FE2aNUSOEWW7ytVv9T2c0470KUejkUQpfqn
         f8ZDkD8BMMtraYfP5HX7vf2eKzdpAua4FIv8nyBQNDySSBUmCLGs9PDZajgRejeOamUq
         uawCzz63tTKyb7LHCnQmndsnlalz8HnNBHeYlv4MD9Nw46F7Ne4c/vo+5XfBjeMU8krE
         EtEWN492ko0BkCchZxdZRwDGXexpsPukaeB2zjlHJj8IloLc07i9gGA5pOxgzUQCMY6v
         v/yQirpGvIX5m+225yyK/iJgBcrg3+BpfAIcND6RpiyYnkEzov3RVrzFXomA+r/8xU9X
         HmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CkjGtSF/XBh/ScHlNzqScP6mcsPlf2tswFWRNIgKHr8=;
        fh=KM8TGU2qbpbn/enVzGPjECa2YVKwc7YhgoTvz1vVTWo=;
        b=OEwoHCl93vm4m1L4LYjB1zTqFUqgejaARo1D4JFkzFk/NPjZUN1AL/2MXOW1/r/sGu
         robCNwyyCPkylrYjVfFhDQrd9MJtDVuMknza2DJpZJbuPTOt9rO2cPtQWGZZIg96Lvr1
         aAPmYh8mQtA9hR/J/5cIFiM4VqnTpFudLlcUJbEAmgUiDJ/Bzke6o/gn/T09n3B/W1Yy
         QQCyoeZat6ClB52w96AsLiB0hNAJf3f2eU1fcawHivlGCO/Rryt6V70J3vg4PT297Ruc
         rSaw/PCORrW0+oep2RPatcXWkO/Lr5OOYfeZHQt3VoAPkjzf5rEc29GhHxFHCdADzhLe
         FMGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795556865; x=1796161665; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CkjGtSF/XBh/ScHlNzqScP6mcsPlf2tswFWRNIgKHr8=;
        b=Xr19gCZv7H5zbawgskFDVC1XBZjipgLl4NA3kvD5aWhgZB8PcCRuj8VLN3JDRmbsEI
         5tmAYhsWBkL/OIq491+xK7q042ZE544hes12gJtjl4Xpw7cqIGJXJKhnmp8hqzmZJus2
         hFc/XOfcfImkv4cDlRL3Pwc7iX4LUuYwWj00rxX7H2bzJJquWsDT8kOFUwiUAGG1KYUX
         O/w1hYKZwTbLMbgufMhFLaHQuXYt2yWJ0BCw/QujeKeeDMsIFaF7zNmYP8v2y01/Ijgj
         YgW7W3372px7UvnbYEwYoEK1n3MijPOlU7g9hmr8EgV9qDkHRbinLSeYTtt8uxXna0hQ
         avkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556865; x=1796161665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkjGtSF/XBh/ScHlNzqScP6mcsPlf2tswFWRNIgKHr8=;
        b=z8Rz+9RjegTMHVHJuSaVlxTt/beG2Nb5CSLNVoLwlPmzmRnZxrpx8DDZWytqbYq862
         hVMJJ3NLPxM5GoqNflQS4f0XJF1K2yvz+9jJdr13sYnrf4K3jZkSymg3KHmHjadV34d7
         dA5WUm3vctu+gpN2nIrZkOiToKz/Dn0KCinuSIUTftUigDXQrcEahjf/k6kqrNpkwDLh
         MglkSFi5NTgFLZ0zJuVsXF9lOQZzA3NFVcuicF6LW2py5VkjSjUCQwBK7ZGXDbEgmf95
         vgTvXcyRGUIrlmODyKDk1vjm/ZmEEs4f5TfD8qVv4zTqsHxqFLfQk+K7O9xYNoxytO3s
         ohqA==
X-Gm-Message-State: APuU4Z8oevSZndbUm3diEzOyXSGl1r6Qfz7y2u3hlCvp2FttG8BDsaxx
	DIw5WPzL5E10jqqSM8gEc6GpgcolO0Vp2GQOP9UFQ4fEmAa1191e+v6zJFP/hyTLsB3XlAaL4ZH
	pBkWocHhT/L0xoAGHghYNO/F55GMxMmO1rOwCVWAfxHgzTy9hUzfGyUCbsY4=
X-Gm-Gg: AZFdTZevZIrIX8I8uV3GtztKVyDLY406GpesjmmjSIcUjez81gTf1KAqAc8mZzfZ7R3
	EOvC7m1k9iac2ic0OvuOdsM+0mBqUr24hXdoPs+CCIZNHg3vbikb+fzk1PUOmu0tMlLzynXzWBx
	3iNGdtRRwDr0RwH3xbLpaRPbyTWGKQhHPiA52gFviovZCJ8C0NYNV4TinnD/FK+FmPJ1mTlsn8+
	Lq8PZjuBx2H9ChaOgvtqrpp2DMUsFz3k4K8b920dvzgJxeMxoamo6kLYP3Sh/2rOykUufhSZFzP
	gmgetvuQkloxsrK8sc9bDV5q9HQ3mqgLz8oQK80U+Xv24Ej2mTAL5upxry1nL4CrQuUIQjw5a8a
	Ai0ZLn1HRg8qh4+sVUDmJ555c71Xh1CFb53KltHS1tag78bUin+PPKhMK+wv/BID7f7E/7PDQnq
	koqBIUsEJBr/TXsQuT3EhC/H6gBg5ZgNGfRSdhro01O0Z98kQSwWK7rM4rIj7Sc7EexrqC3H4L0
	yA93LL4NWTwyCCg5uowNUKu2/x9E9gVlK2wbtdh/ctMWYD8VEz6Ul6EKEs=
X-Received: by 2002:a05:6000:29c6:b0:4a6:56b1:cfc9 with SMTP id
 ffacd0b85a97d-4abb41f4e0cmr23142225f8f.22.1795556864515; Tue, 24 Nov 2026
 13:47:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119165825.1793558-5-ardb+git@google.com> <20261119165825.1793558-8-ardb+git@google.com>
In-Reply-To: <20261119165825.1793558-8-ardb+git@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Nov 2026 13:47:33 -0800
X-Gm-Features: Aa3M54qz_ym5p2hDyyP1dQDy7v1-svAa8d-5YysA1FoV1m-LmPt9GwicKEi_khM
Message-ID: <CAKwvOdnB80ExY27A5Pu=tgwNGpJ0LFLm=hCgca9f=XFALmdJGA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: module: Revert separate init PLT and init
 ftrace trampoline
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, panfan@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_134747_492119_EBF355EA 
X-CRM114-Status: GOOD (  34.42  )
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
> This reverts commit a7ed7b9d0ebb ("arm64: ftrace: fix unreachable PLT for

cc the author of a7ed7b9d0ebb

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ftrace_caller in init_module with CONFIG_DYNAMIC_FTRACE") and commit
> 24af6c4e4e0f ("arm64: module: split core and init PLT sections").
>
> Now that executable init sections are kept in the core text region, all
> branch instructions that may need a PLT entry, as well as all ftrace
> callsites, live in the core text region, and so a single PLT section and
> a single ftrace trampoline suffice.
>
> This also means that branches to symbols defined in another section of
> the same module no longer need a PLT slot, as all executable sections are
> within direct branching range of each other. So only reserve PLT slots
> for branches to external symbols, i.e., SHN_UNDEF symbols as before
> 24af6c4e4e0f, but also SHN_LIVEPATCH symbols (and other reserved section
> indexes), as these are resolved against vmlinux or other modules.
>
> On arm64 allmodconfig (10604 modules, disregarding modules with 'test' or
> 'torture' in their name), this drops 2126 reserved but never used PLT
> slots for intra-module branches (about 25 KB in total).
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/module.h     | 11 +--
>  arch/arm64/include/asm/module.lds.h |  2 -
>  arch/arm64/kernel/ftrace.c          | 13 +--
>  arch/arm64/kernel/module-plts.c     | 98 +++++++-------------
>  arch/arm64/kernel/module.c          | 13 +--
>  5 files changed, 40 insertions(+), 97 deletions(-)
>
> diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/mod=
ule.h
> index fb9b88eebeb1..9d34f915d59b 100644
> --- a/arch/arm64/include/asm/module.h
> +++ b/arch/arm64/include/asm/module.h
> @@ -7,24 +7,17 @@
>
>  #include <asm-generic/module.h>
>
> -struct mod_plt_sec {
> +struct mod_arch_specific {
>         int                     plt_shndx;
>         int                     plt_num_entries;
>         int                     plt_max_entries;
> -};
> -
> -struct mod_arch_specific {
> -       struct mod_plt_sec      core;
> -       struct mod_plt_sec      init;
>
>         /* for CONFIG_DYNAMIC_FTRACE */
>         struct plt_entry        *ftrace_trampolines;
> -       struct plt_entry        *init_ftrace_trampolines;
>  };
>
>  u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
> -                         void *loc, const Elf64_Rela *rela,
> -                         Elf64_Sym *sym);
> +                         const Elf64_Rela *rela, Elf64_Sym *sym);
>
>  u64 module_emit_veneer_for_adrp(struct module *mod, Elf64_Shdr *sechdrs,
>                                 void *loc, u64 val);
> diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm=
/module.lds.h
> index 603f92a8a73e..983e768203a1 100644
> --- a/arch/arm64/include/asm/module.lds.h
> +++ b/arch/arm64/include/asm/module.lds.h
> @@ -1,8 +1,6 @@
>  SECTIONS {
>         .plt 0 : { BYTE(0) }
> -       .init.plt 0 : { BYTE(0) }
>         .text.ftrace_trampoline 0 : { BYTE(0) }
> -       .init.text.ftrace_trampoline 0 : { BYTE(0) }
>
>  #ifdef CONFIG_UNWIND_TABLES
>         /*
> diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
> index e1a3c0b3a051..389675690293 100644
> --- a/arch/arm64/kernel/ftrace.c
> +++ b/arch/arm64/kernel/ftrace.c
> @@ -258,17 +258,10 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
>         return ftrace_modify_code(pc, 0, new, false);
>  }
>
> -static struct plt_entry *get_ftrace_plt(struct module *mod, unsigned lon=
g addr)
> +static struct plt_entry *get_ftrace_plt(struct module *mod)
>  {
>  #ifdef CONFIG_MODULES
> -       struct plt_entry *plt =3D NULL;
> -
> -       if (within_module_mem_type(addr, mod, MOD_INIT_TEXT))
> -               plt =3D mod->arch.init_ftrace_trampolines;
> -       else if (within_module_mem_type(addr, mod, MOD_TEXT))
> -               plt =3D mod->arch.ftrace_trampolines;
> -       else
> -               return NULL;
> +       struct plt_entry *plt =3D mod->arch.ftrace_trampolines;
>
>         return &plt[FTRACE_PLT_IDX];
>  #else
> @@ -339,7 +332,7 @@ static bool ftrace_find_callable_addr(struct dyn_ftra=
ce *rec,
>         if (WARN_ON(!mod))
>                 return false;
>
> -       plt =3D get_ftrace_plt(mod, pc);
> +       plt =3D get_ftrace_plt(mod);
>         if (!plt) {
>                 pr_err("ftrace: no module PLT for %ps\n", (void *)*addr);
>                 return false;
> diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-p=
lts.c
> index 7afd370da9f4..0a0257b6a5e8 100644
> --- a/arch/arm64/kernel/module-plts.c
> +++ b/arch/arm64/kernel/module-plts.c
> @@ -67,11 +67,9 @@ static bool plt_entries_equal(const struct plt_entry *=
a,
>  }
>
>  u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
> -                         void *loc, const Elf64_Rela *rela,
> -                         Elf64_Sym *sym)
> +                         const Elf64_Rela *rela, Elf64_Sym *sym)
>  {
> -       struct mod_plt_sec *pltsec =3D !within_module_init((unsigned long=
)loc, mod) ?
> -                                               &mod->arch.core : &mod->a=
rch.init;
> +       struct mod_arch_specific *pltsec =3D &mod->arch;
>         struct plt_entry *plt =3D (struct plt_entry *)sechdrs[pltsec->plt=
_shndx].sh_addr;
>         int i =3D pltsec->plt_num_entries;
>         int j =3D i - 1;
> @@ -101,8 +99,7 @@ u64 module_emit_plt_entry(struct module *mod, Elf64_Sh=
dr *sechdrs,
>  u64 module_emit_veneer_for_adrp(struct module *mod, Elf64_Shdr *sechdrs,
>                                 void *loc, u64 val)
>  {
> -       struct mod_plt_sec *pltsec =3D !within_module_init((unsigned long=
)loc, mod) ?
> -                                               &mod->arch.core : &mod->a=
rch.init;
> +       struct mod_arch_specific *pltsec =3D &mod->arch;
>         struct plt_entry *plt =3D (struct plt_entry *)sechdrs[pltsec->plt=
_shndx].sh_addr;
>         int i =3D pltsec->plt_num_entries++;
>         u32 br;
> @@ -154,8 +151,21 @@ static bool duplicate_rel(const Elf64_Rela *rela, in=
t num)
>         return num > 0 && cmp_rela(rela + num, rela + num - 1) =3D=3D 0;
>  }
>
> +/*
> + * We only have to consider branch targets that resolve to symbols that =
are
> + * not defined in the module itself. This is not simply a heuristic, it =
is a
> + * fundamental limitation, since the PLT itself is part of the module's =
core
> + * text region, and needs to be within 128 MB as well, so the module's c=
ode can
> + * never grow beyond that limit. Note that SHN_LIVEPATCH symbols are res=
olved
> + * against vmlinux or other modules, so these need to be taken into acco=
unt.
> + */
> +static bool branch_target_is_external(const Elf64_Sym *s)
> +{
> +       return s->st_shndx =3D=3D SHN_UNDEF || s->st_shndx >=3D SHN_LORES=
ERVE;
> +}
> +
>  static unsigned int count_plts(Elf64_Sym *syms, Elf64_Rela *rela, int nu=
m,
> -                              Elf64_Word dstidx, Elf_Shdr *dstsec)
> +                              Elf_Shdr *dstsec)
>  {
>         unsigned int ret =3D 0;
>         Elf64_Sym *s;
> @@ -167,19 +177,8 @@ static unsigned int count_plts(Elf64_Sym *syms, Elf6=
4_Rela *rela, int num,
>                 switch (ELF64_R_TYPE(rela[i].r_info)) {
>                 case R_AARCH64_JUMP26:
>                 case R_AARCH64_CALL26:
> -                       /*
> -                        * We only have to consider branch targets that r=
esolve
> -                        * to symbols that are defined in a different sec=
tion.
> -                        * This is not simply a heuristic, it is a fundam=
ental
> -                        * limitation, since there is no guaranteed way t=
o emit
> -                        * PLT entries sufficiently close to the branch i=
f the
> -                        * section size exceeds the range of a branch
> -                        * instruction. So ignore relocations against def=
ined
> -                        * symbols if they live in the same section as th=
e
> -                        * relocation target.
> -                        */
>                         s =3D syms + ELF64_R_SYM(rela[i].r_info);
> -                       if (s->st_shndx =3D=3D dstidx)
> +                       if (!branch_target_is_external(s))
>                                 break;
>
>                         /*
> @@ -246,13 +245,11 @@ static unsigned int count_plts(Elf64_Sym *syms, Elf=
64_Rela *rela, int num,
>         return ret;
>  }
>
> -static bool branch_rela_needs_plt(Elf64_Sym *syms, Elf64_Rela *rela,
> -                                 Elf64_Word dstidx)
> +static bool branch_rela_needs_plt(Elf64_Sym *syms, Elf64_Rela *rela)
>  {
> -
>         Elf64_Sym *s =3D syms + ELF64_R_SYM(rela->r_info);
>
> -       if (s->st_shndx =3D=3D dstidx)
> +       if (!branch_target_is_external(s))
>                 return false;
>
>         return ELF64_R_TYPE(rela->r_info) =3D=3D R_AARCH64_JUMP26 ||
> @@ -261,14 +258,14 @@ static bool branch_rela_needs_plt(Elf64_Sym *syms, =
Elf64_Rela *rela,
>
>  /* Group branch PLT relas at the front end of the array. */
>  static int partition_branch_plt_relas(Elf64_Sym *syms, Elf64_Rela *rela,
> -                                     int numrels, Elf64_Word dstidx)
> +                                     int numrels)
>  {
>         int i =3D 0, j =3D numrels - 1;
>
>         while (i < j) {
> -               if (branch_rela_needs_plt(syms, &rela[i], dstidx))
> +               if (branch_rela_needs_plt(syms, &rela[i]))
>                         i++;
> -               else if (branch_rela_needs_plt(syms, &rela[j], dstidx))
> +               else if (branch_rela_needs_plt(syms, &rela[j]))
>                         swap(rela[i], rela[j]);
>                 else
>                         j--;
> @@ -280,10 +277,9 @@ static int partition_branch_plt_relas(Elf64_Sym *sym=
s, Elf64_Rela *rela,
>  int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>                               char *secstrings, struct module *mod)
>  {
> -       unsigned long core_plts =3D 0;
> -       unsigned long init_plts =3D 0;
> +       unsigned long plts =3D 0;
>         Elf64_Sym *syms =3D NULL;
> -       Elf_Shdr *pltsec, *tramp =3D NULL, *init_tramp =3D NULL;
> +       Elf_Shdr *pltsec, *tramp =3D NULL;
>         int i;
>
>         /*
> @@ -292,21 +288,16 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_S=
hdr *sechdrs,
>          */
>         for (i =3D 0; i < ehdr->e_shnum; i++) {
>                 if (!strcmp(secstrings + sechdrs[i].sh_name, ".plt"))
> -                       mod->arch.core.plt_shndx =3D i;
> -               else if (!strcmp(secstrings + sechdrs[i].sh_name, ".init.=
plt"))
> -                       mod->arch.init.plt_shndx =3D i;
> +                       mod->arch.plt_shndx =3D i;
>                 else if (!strcmp(secstrings + sechdrs[i].sh_name,
>                                  ".text.ftrace_trampoline"))
>                         tramp =3D sechdrs + i;
> -               else if (!strcmp(secstrings + sechdrs[i].sh_name,
> -                                ".init.text.ftrace_trampoline"))
> -                       init_tramp =3D sechdrs + i;
>                 else if (sechdrs[i].sh_type =3D=3D SHT_SYMTAB)
>                         syms =3D (Elf64_Sym *)sechdrs[i].sh_addr;
>         }
>
> -       if (!mod->arch.core.plt_shndx || !mod->arch.init.plt_shndx) {
> -               pr_err("%s: module PLT section(s) missing\n", mod->name);
> +       if (!mod->arch.plt_shndx) {
> +               pr_err("%s: module PLT section missing\n", mod->name);
>                 return -ENOEXEC;
>         }
>         if (!syms) {
> @@ -330,34 +321,20 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_S=
hdr *sechdrs,
>                  * sort branch relocations requiring a PLT by type, symbo=
l index
>                  * and addend
>                  */
> -               nents =3D partition_branch_plt_relas(syms, rels, numrels,
> -                                                  sechdrs[i].sh_info);
> +               nents =3D partition_branch_plt_relas(syms, rels, numrels)=
;
>                 if (nents)
>                         sort(rels, nents, sizeof(Elf64_Rela), cmp_rela, N=
ULL);
>
> -               if (!module_init_layout_section(secstrings + dstsec->sh_n=
ame))
> -                       core_plts +=3D count_plts(syms, rels, numrels,
> -                                               sechdrs[i].sh_info, dstse=
c);
> -               else
> -                       init_plts +=3D count_plts(syms, rels, numrels,
> -                                               sechdrs[i].sh_info, dstse=
c);
> +               plts +=3D count_plts(syms, rels, numrels, dstsec);
>         }
>
> -       pltsec =3D sechdrs + mod->arch.core.plt_shndx;
> -       pltsec->sh_type =3D SHT_NOBITS;
> -       pltsec->sh_flags =3D SHF_EXECINSTR | SHF_ALLOC;
> -       pltsec->sh_addralign =3D L1_CACHE_BYTES;
> -       pltsec->sh_size =3D (core_plts  + 1) * sizeof(struct plt_entry);
> -       mod->arch.core.plt_num_entries =3D 0;
> -       mod->arch.core.plt_max_entries =3D core_plts;
> -
> -       pltsec =3D sechdrs + mod->arch.init.plt_shndx;
> +       pltsec =3D sechdrs + mod->arch.plt_shndx;
>         pltsec->sh_type =3D SHT_NOBITS;
>         pltsec->sh_flags =3D SHF_EXECINSTR | SHF_ALLOC;
>         pltsec->sh_addralign =3D L1_CACHE_BYTES;
> -       pltsec->sh_size =3D (init_plts + 1) * sizeof(struct plt_entry);
> -       mod->arch.init.plt_num_entries =3D 0;
> -       mod->arch.init.plt_max_entries =3D init_plts;
> +       pltsec->sh_size =3D (plts + 1) * sizeof(struct plt_entry);
> +       mod->arch.plt_num_entries =3D 0;
> +       mod->arch.plt_max_entries =3D plts;
>
>         if (tramp) {
>                 tramp->sh_type =3D SHT_NOBITS;
> @@ -366,12 +343,5 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Sh=
dr *sechdrs,
>                 tramp->sh_size =3D NR_FTRACE_PLTS * sizeof(struct plt_ent=
ry);
>         }
>
> -       if (init_tramp) {
> -               init_tramp->sh_type =3D SHT_NOBITS;
> -               init_tramp->sh_flags =3D SHF_EXECINSTR | SHF_ALLOC;
> -               init_tramp->sh_addralign =3D __alignof__(struct plt_entry=
);
> -               init_tramp->sh_size =3D NR_FTRACE_PLTS * sizeof(struct pl=
t_entry);
> -       }
> -
>         return 0;
>  }
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 39e7a50733a9..e0cbd499e4a9 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -450,7 +450,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>                         ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 26,
>                                              AARCH64_INSN_IMM_26, me);
>                         if (ovf =3D=3D -ERANGE) {
> -                               val =3D module_emit_plt_entry(me, sechdrs=
, loc, &rel[i], sym);
> +                               val =3D module_emit_plt_entry(me, sechdrs=
, &rel[i], sym);
>                                 if (!val)
>                                         return -ENOEXEC;
>                                 ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc=
, val, 2,
> @@ -499,17 +499,6 @@ static int module_init_ftrace_plt(const Elf_Ehdr *hd=
r,
>         __init_plt(&plts[FTRACE_PLT_IDX], FTRACE_ADDR);
>
>         mod->arch.ftrace_trampolines =3D plts;
> -
> -       s =3D find_section(hdr, sechdrs, ".init.text.ftrace_trampoline");
> -       if (!s)
> -               return -ENOEXEC;
> -
> -       plts =3D (void *)s->sh_addr;
> -
> -       __init_plt(&plts[FTRACE_PLT_IDX], FTRACE_ADDR);
> -
> -       mod->arch.init_ftrace_trampolines =3D plts;
> -
>  #endif
>         return 0;
>  }
> --
> 2.56.1.708.g77570a6a1d-goog
>


--=20
Thanks,
~Nick Desaulniers

