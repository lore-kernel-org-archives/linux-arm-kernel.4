Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AACC606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 21:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JDWKGwZj;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IZAM50Mt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bITuzVEfmK2u8ql0xrA72ELRr2YY5Eit7w0sg9Y24hY=; b=JDWKGwZjyEsR6v
	vCzjMWOxadhnofnEpFUkLxbUge35y8A08vfVB5Fpc2wgh4J9xaIjWboDurbGdpPYhhBqhIqzdrdBe
	qGt4SPchuy+KrmcrI2ZJNUJUlVC/JedtSJDtEiQuZFnm7rtLg5NxY1JsAKf9ytA9amk0pMuvzvfuD
	ZkLnUdvyCSY6pokqBejhQbKiare/CUKOmgV6gMzIrO76cFvJi+RIXX23WH3RNTQ7IqAyUh/ydDosl
	ISzuZSrZM5v7gFCq2+pXYy8ibt5Hm4Te05WKQxCdK7H5mrlbdk+xv+B4iv/mtwYrSpejETeKJhRPY
	mb8r8D8T85MO27trryhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUW6P-0000000GIkQ-3Cu9;
	Fri, 20 Nov 2026 21:25:01 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUW6K-0000000GIjV-3bdL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 21:25:00 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-9906870a9baso731275241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 13:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795209893; cv=none;
        d=google.com; s=arc-20260327;
        b=rJx98Qve81TD5VhdGSDqc7uN0Gp7rJizw005HKk5LXBVAYLN0NmwNYy7w+9crDL1VK
         QVp5DWqbNAKN/ZEFIjrriplzKqfJZojyW1HurYr0t+CfFvRXzBeA26dHxyPLCoBIbHs3
         lDm2z5+Tdj7SRCaceC6mr9HwB8XtiJCkEdoOjKD6CHvlEzyLnGl7ES3lUG1j2WV6l1ZD
         pUuAP/9FMu9ZiRFTEoHwp/0Oqdsvhxw8dqQgyfv6fEuYOSNYi7wA8UhoMyKl6KIxT8Lo
         qKu+dx2LfnZD5FtzYp4TevcDKARsbnDXGea97njfzWX1HfyMT2u00dQPpF/dUHquHj+d
         o46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bITuzVEfmK2u8ql0xrA72ELRr2YY5Eit7w0sg9Y24hY=;
        fh=RMk8Rkr2JBc2GF0HnEyr8tiyBtpQsRmpiMDzvXnW+RU=;
        b=UZpQxG0nN7uZM32g2S4UOmhd+2q1efir7mWPCa1KLAdBoRnVRUr9snFCKSZIR5veAy
         SsdIIoBLcl8OJGnTp+Yw7XdK5sDgJB5dTpwXNmSbk4dNGZZjCyrxmaEg7Lg2WyuLSQwm
         7sGXO+XtdFpvbd44amtDTQyGSxcr4AW/gVrrhEIE9TqWvej9ZNi3RLgxYGmyD/+5aCxB
         kWNtiLPqu5FzJLcr36xmoQr6jhH1093WcNLwY4mkbYJKLSf9keHYDtsdQ9qy+DVUsUl/
         4uz9EYgvkwMoqvFvKYEDqKHhO/0AV3X0JJr31n3rBdRnbjw3vRq6asbIotK07/UecAvw
         RMww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795209893; x=1795814693; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bITuzVEfmK2u8ql0xrA72ELRr2YY5Eit7w0sg9Y24hY=;
        b=IZAM50MtGIEdeDSM/f7Xdcz4dBStp/pPBubHuVmhDvBrAg+YCW+MZoV98T+Dr2Q3WA
         I4aHhqjJ9C++s71C8/4IF2WpLDh8/OsPIpbJa5/N39eM2GS7iXumpoTVUgkTtdciFurO
         whtWtV3F054VmsgSakdBUe7mo2fPo9TQlOOd2ZgLDkork9DUYADEyaFsPgcUZcL5JIqW
         CGbL8X3HE+BWj8iJea7x+XTklcq6zvkrCNTd+aQ+VzyBfISObhEis+w+66tXPzXdukfs
         4wL6DogTMAfi8gZaMm/2J2QJlTKFoc3YPFC2ANqu1JFcMHT9BsrHDTprHeiRX4CIkx+u
         wm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209893; x=1795814693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bITuzVEfmK2u8ql0xrA72ELRr2YY5Eit7w0sg9Y24hY=;
        b=p3FfE24/phW6szzwRRyIO9IeboO/8Kv7HzZlv0eX8sAoxkk9f/o2xnfjo439wBkO0C
         yQIMbn5OnX2ynlEO5gcKAz7lF8Jvjei/kv18rT1SoTyiuH+8lDZoxO3CvaD10zY+j4gC
         EU/R3ZnMX6AZfvKD5NviXKVopKME0sVj/b19GYBiLGwVz4ZbxpU2h0VYYXGiy+bshSO8
         7uEQinzKunIjaqCSxCfR4ueYp5VIM8GquokOs8jhx79qtwbfdel6B+646L0YHoD4QJUv
         /SzSkpejOuhnC9D6DaxPFkN78VwhUUI1zOQ+ARrggQcgc1fzPsquEI1GkVbW5IInVzw4
         3gRw==
X-Forwarded-Encrypted: i=1; AL+hErE3GfPVSlcH7aQZbLUXgN2O7G+wyfsbg8iJMG1ArLhdpdUwKfumSzwd349zbXxREZj0Y1jqOJrj814HigP0cnRr@lists.infradead.org
X-Gm-Message-State: APuU4Z86qYsBa972K2mKkRhuRSnVXJu0483Izdjqoz5p0L1jSxCY+pi0
	4b/riAAt5oTVfaMWwsVGvPfOFdVG58VIc/Kg0hx1M9sUu02E2j7+tRYz8+NzVSOInW6igO/yjBj
	pgSIxN/vcdiz+17zM84ejauH+wZHBWR1RV5AJNY42
X-Gm-Gg: AZFdTZf7XSQ9Cf0YXrSvDOFfHHnuQqeJvp5HWh0G7tmBkZSfR1oNS8exxBYQkzPluJ9
	Simexn2LaoqP+yhno8Q4YHu36RdZIn1Y9jo2ImGSwh8ow/fXP602IPMq1GdgjkTsERjQ9eaX3Yg
	Esg8WB28ZN7UQe8BQ11fCTFV3xMieRjORTk1cSryZ3vzlCpN6fOGSr23aOIO7G31MWf52eI6iAS
	+2Mhs5vpZze1DWSOY3pup8Y/fHVx+uXKTl7Nr5m/igee5iK+yHzr2ox91/vPhas4rHLUKquZ4tg
	Y7H+o1NtYhdTQFFBPtCMk6iRZb8In3/wZJhjrx/VeuK9kPu4xMDYSFh/uLIO/jPB8BPBAQ2k9Ia
	Y5axZ9sO2Aajm3iN9ox3yAVDbXXel1m5yZUgM
X-Received: by 2002:a05:6102:374c:b0:7d2:8dd6:e2c2 with SMTP id
 ada2fe7eead31-7d73963c573mr2445359137.29.1795209892946; Fri, 20 Nov 2026
 13:24:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <73024f3fce343bd6fba3d08fa366a61b4e2c0fa1.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <73024f3fce343bd6fba3d08fa366a61b4e2c0fa1.1786230311.git.jpoimboe@kernel.org>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Fri, 20 Nov 2026 13:24:42 -0800
X-Gm-Features: Aa3M54q00e7eFLXrWdso2Zy4lofaH4uwGilO3mLmdcGkjW-Fq6HTshHMHcZHXiQ
Message-ID: <CADBMgpx9TZ6P5KVWc=emKbT5zfv6psB-woLW6dnwh2XcwPDg5g@mail.gmail.com>
Subject: Re: [PATCH v4 20/22] objtool/klp: Introduce objtool for arm64
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Miroslav Benes <mbenes@suse.cz>, 
	Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_132456_974173_7EA0C3E7 
X-CRM114-Status: GOOD (  24.46  )
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Josh,

On Sat, Aug 8, 2026 at 4:21=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> Add basic support for arm64 on objtool.  Only "objtool klp" subcommands
> are currently supported.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/arm64/Kconfig                            |   2 +
>  tools/objtool/Makefile                        |   4 +
>  tools/objtool/arch/arm64/Build                |   2 +
>  tools/objtool/arch/arm64/decode.c             | 177 ++++++++++++++++++
>  .../arch/arm64/include/arch/cfi_regs.h        |  11 ++
>  tools/objtool/arch/arm64/include/arch/elf.h   |  15 ++
>  .../objtool/arch/arm64/include/arch/special.h |  21 +++
>  tools/objtool/arch/arm64/special.c            |  30 +++
>  8 files changed, 262 insertions(+)
>  create mode 100644 tools/objtool/arch/arm64/Build
>  create mode 100644 tools/objtool/arch/arm64/decode.c
>  create mode 100644 tools/objtool/arch/arm64/include/arch/cfi_regs.h
>  create mode 100644 tools/objtool/arch/arm64/include/arch/elf.h
>  create mode 100644 tools/objtool/arch/arm64/include/arch/special.h
>  create mode 100644 tools/objtool/arch/arm64/special.c
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 11e733b6a3cf3..06b30924509ac 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -209,9 +209,11 @@ config ARM64
>         select HAVE_HW_BREAKPOINT if PERF_EVENTS
>         select HAVE_IOREMAP_PROT
>         select HAVE_IRQ_TIME_ACCOUNTING
> +       select HAVE_KLP_BUILD
>         select HAVE_LIVEPATCH
>         select HAVE_MOD_ARCH_SPECIFIC
>         select HAVE_NMI
> +       select HAVE_OBJTOOL
>         select HAVE_PERF_EVENTS
>         select HAVE_PERF_EVENTS_NMI if ARM64_PSEUDO_NMI
>         select HAVE_PERF_REGS
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index a4484fd22a96d..94aabeee97367 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -11,6 +11,10 @@ ifeq ($(SRCARCH),loongarch)
>         BUILD_ORC          :=3D y
>  endif
>
> +ifeq ($(SRCARCH),arm64)
> +       ARCH_HAS_KLP :=3D y
> +endif
> +
>  ifeq ($(ARCH_HAS_KLP),y)
>         HAVE_XXHASH =3D $(shell printf "$(pound)include <xxhash.h>\nXXH3_=
state_t *state;int main() {}" | \
>                       $(HOSTCC) $(HOSTCFLAGS) -xc - -o /dev/null -lxxhash=
 2> /dev/null && echo y || echo n)
> diff --git a/tools/objtool/arch/arm64/Build b/tools/objtool/arch/arm64/Bu=
ild
> new file mode 100644
> index 0000000000000..d24d5636a5b84
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/Build
> @@ -0,0 +1,2 @@
> +objtool-y +=3D decode.o
> +objtool-y +=3D special.o
> diff --git a/tools/objtool/arch/arm64/decode.c b/tools/objtool/arch/arm64=
/decode.c
> new file mode 100644
> index 0000000000000..47658c76e1af0
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/decode.c
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <objtool/check.h>
> +#include <objtool/disas.h>
> +#include <objtool/elf.h>
> +#include <objtool/arch.h>
> +#include <objtool/warn.h>
> +#include <objtool/builtin.h>
> +
> +const char *arch_reg_name[CFI_NUM_REGS] =3D {};
> +
> +int arch_ftrace_match(const char *name)
> +{
> +       return 0;
> +}
> +
> +s64 arch_insn_adjusted_addend(struct instruction *insn, struct reloc *re=
loc)
> +{
> +       return reloc_addend(reloc);
> +}
> +
> +bool arch_callee_saved_reg(unsigned char reg)
> +{
> +       return false;
> +}
> +
> +int arch_decode_hint_reg(u8 sp_reg, int *base)
> +{
> +       exit(-1);
> +}
> +
> +const char *arch_nop_insn(int len)
> +{
> +       exit(-1);
> +}
> +
> +const char *arch_ret_insn(int len)
> +{
> +       exit(-1);
> +}
> +
> +int arch_decode_instruction(struct objtool_file *file, const struct sect=
ion *sec,
> +                           unsigned long offset, unsigned int maxlen,
> +                           struct instruction *insn)
> +{
> +       u32 ins;
> +
> +       if (maxlen < 4) {
> +               ERROR_INSN(insn, "can't decode instruction");
> +               return -1;
> +       }
> +
> +       /* arm64 instructions are always LE, thus no bswap_if_needed() */
> +       ins =3D le32toh(*(u32 *)(sec->data->d_buf + offset));
> +
> +       /*
> +        * These are the bare minimum needed for static branch detection =
and
> +        * checksum calculations.
> +        */
> +       if (ins =3D=3D 0xd503201f) {
> +               /* NOP: static branch */
> +               insn->type =3D INSN_NOP;
> +       } else if ((ins & 0xfc000000) =3D=3D 0x14000000) {
> +               /* B: static branch, intra-TU sibling call */
> +               insn->type =3D INSN_JUMP_UNCONDITIONAL;
> +               insn->immediate =3D sign_extend64(ins & 0x03ffffff, 25);
> +       } else if ((ins & 0xfc000000) =3D=3D 0x94000000) {
> +               /* BL: intra-TU call */
> +               insn->type =3D INSN_CALL;
> +               insn->immediate =3D sign_extend64(ins & 0x03ffffff, 25);
> +       } else if ((ins & 0xff000000) =3D=3D 0x54000000) {
> +               /* B.cond: intra-TU sibling call */
> +               insn->type =3D INSN_JUMP_CONDITIONAL;
> +               insn->immediate =3D sign_extend64((ins >> 5) & 0x7ffff, 1=
8);
> +       } else if ((ins & 0x7e000000) =3D=3D 0x34000000) {
> +               /* CBZ/CBNZ: intra-TU sibling call */
> +               insn->type =3D INSN_JUMP_CONDITIONAL;
> +               insn->immediate =3D sign_extend64((ins >> 5) & 0x7ffff, 1=
8);
> +       } else if ((ins & 0x7e000000) =3D=3D 0x36000000) {
> +               /* TBZ/TBNZ: intra-TU sibling call */
> +               insn->type =3D INSN_JUMP_CONDITIONAL;
> +               insn->immediate =3D sign_extend64((ins >> 5) & 0x3fff, 13=
);
> +       } else {
> +               insn->type =3D INSN_OTHER;
> +       }
> +
> +       insn->len =3D 4;
> +       return 0;
> +}
> +
> +size_t arch_jump_opcode_bytes(struct objtool_file *file, struct instruct=
ion *insn,
> +                             unsigned char *buf)
> +{
> +       u32 ins;
> +
> +       ins =3D le32toh(*(u32 *)(insn->sec->data->d_buf + insn->offset));
> +
> +       switch (insn->type) {
> +       case INSN_JUMP_UNCONDITIONAL:
> +       case INSN_CALL:
> +               ins &=3D ~0x03ffffff;
> +               break;
> +       case INSN_JUMP_CONDITIONAL:
> +               if ((ins & 0xff000000) =3D=3D 0x54000000)
> +                       ins &=3D ~0x00ffffe0;                /* B.cond */
> +               else if ((ins & 0x7e000000) =3D=3D 0x34000000)
> +                       ins &=3D ~0x00ffffe0;                /* CBZ/CBNZ =
*/
> +               else
> +                       ins &=3D ~0x0007ffe0;                /* TBZ/TBNZ =
*/
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       ins =3D htole32(ins);
> +       memcpy(buf, &ins, 4);
> +       return 4;
> +}
> +
> +u64 arch_adjusted_addend(struct reloc *reloc)
> +{
> +       return reloc_addend(reloc);
> +}
> +
> +unsigned long arch_jump_destination(struct instruction *insn)
> +{
> +       return insn->offset + (insn->immediate << 2);
> +}
> +
> +bool arch_pc_relative_reloc(struct reloc *reloc)
> +{
> +       switch (reloc_type(reloc)) {
> +       case R_AARCH64_PREL64:
> +       case R_AARCH64_PREL32:
> +       case R_AARCH64_PREL16:
> +       case R_AARCH64_LD_PREL_LO19:
> +       case R_AARCH64_ADR_PREL_LO21:
> +       case R_AARCH64_ADR_PREL_PG_HI21:
> +       case R_AARCH64_ADR_PREL_PG_HI21_NC:
> +       case R_AARCH64_JUMP26:
> +       case R_AARCH64_CALL26:
> +       case R_AARCH64_CONDBR19:
> +       case R_AARCH64_TSTBR14:
> +               return true;
> +       default:
> +               return false;
> +       }
> +}
> +
> +void arch_initial_func_cfi_state(struct cfi_init_state *state)
> +{
> +       state->cfa.base =3D CFI_UNDEFINED;
> +}
> +
> +unsigned int arch_reloc_size(struct reloc *reloc)
> +{
> +       switch (reloc_type(reloc)) {
> +       case R_AARCH64_ABS64:
> +       case R_AARCH64_PREL64:
> +               return 8;
> +       case R_AARCH64_PREL16:
> +               return 2;
> +       default:
> +               return 4;
> +       }
> +}
> +
> +#ifdef DISAS
> +int arch_disas_info_init(struct disassemble_info *dinfo)
> +{
> +       return disas_info_init(dinfo, bfd_arch_aarch64,
> +                              bfd_mach_arm_unknown, bfd_mach_aarch64,
> +                              NULL);
> +}
> +#endif /* DISAS */
> diff --git a/tools/objtool/arch/arm64/include/arch/cfi_regs.h b/tools/obj=
tool/arch/arm64/include/arch/cfi_regs.h
> new file mode 100644
> index 0000000000000..49c81cbb6646d
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/include/arch/cfi_regs.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _OBJTOOL_ARCH_CFI_REGS_H
> +#define _OBJTOOL_ARCH_CFI_REGS_H
> +
> +/* These aren't actually used for arm64 */
> +#define CFI_BP 0
> +#define CFI_SP 0
> +#define CFI_RA 0
> +#define CFI_NUM_REGS 2
> +
> +#endif /* _OBJTOOL_ARCH_CFI_REGS_H */
> diff --git a/tools/objtool/arch/arm64/include/arch/elf.h b/tools/objtool/=
arch/arm64/include/arch/elf.h
> new file mode 100644
> index 0000000000000..418b90885c501
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/include/arch/elf.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _OBJTOOL_ARCH_ELF_H
> +#define _OBJTOOL_ARCH_ELF_H
> +
> +#define R_NONE         R_AARCH64_NONE
> +#define R_ABS64                R_AARCH64_ABS64
> +#define R_ABS32                R_AARCH64_ABS32
> +#define R_DATA32       R_AARCH64_PREL32
> +#define R_DATA64       R_AARCH64_PREL64
> +#define R_TEXT32       R_AARCH64_PREL32
> +#define R_TEXT64       R_AARCH64_PREL64
> +
> +#define ARCH_HAS_INLINE_ALTS 1
> +
> +#endif /* _OBJTOOL_ARCH_ELF_H */
> diff --git a/tools/objtool/arch/arm64/include/arch/special.h b/tools/objt=
ool/arch/arm64/include/arch/special.h
> new file mode 100644
> index 0000000000000..8ae804a83ea49
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/include/arch/special.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _OBJTOOL_ARCH_SPECIAL_H
> +#define _OBJTOOL_ARCH_SPECIAL_H
> +
> +#define EX_ENTRY_SIZE 12
> +#define EX_ORIG_OFFSET 0
> +#define EX_NEW_OFFSET 4
> +
> +#define JUMP_ENTRY_SIZE 16
> +#define JUMP_ORIG_OFFSET 0
> +#define JUMP_NEW_OFFSET 4
> +#define JUMP_KEY_OFFSET 8
> +
> +#define ALT_ENTRY_SIZE 12
> +#define ALT_ORIG_OFFSET 0
> +#define ALT_NEW_OFFSET 4
> +#define ALT_FEATURE_OFFSET 8
> +#define ALT_ORIG_LEN_OFFSET 10
> +#define ALT_NEW_LEN_OFFSET 11
> +
> +#endif /* _OBJTOOL_ARCH_SPECIAL_H */
> diff --git a/tools/objtool/arch/arm64/special.c b/tools/objtool/arch/arm6=
4/special.c
> new file mode 100644
> index 0000000000000..5a6424a59e1c5
> --- /dev/null
> +++ b/tools/objtool/arch/arm64/special.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include <objtool/special.h>
> +
> +/*
> + * On arm64 a zero-length replacement means the alternative has a callba=
ck,
> + * whose address is stored in the replacement offset.  It must be preser=
ved.
> + */
> +bool arch_alt_ignore_new_reloc(struct section *sec, unsigned long offset=
)
> +{
> +       return false;
> +}
> +
> +bool arch_support_alt_relocation(struct special_alt *special_alt,
> +                                struct instruction *insn,
> +                                struct reloc *reloc)
> +{
> +       return true;
> +}
> +
> +struct reloc *arch_find_switch_table(struct objtool_file *file,
> +                                    struct instruction *insn,
> +                                    unsigned long *table_size)
> +{
> +       return NULL;
> +}
> +
> +const char *arch_cpu_feature_name(int feature_number)
> +{
> +       return NULL;
> +}
> --
> 2.54.0
>
>

Flagging an issue I'm seeing, in case you haven't encountered it yet:
applying this patch to v7.4-rc3 (with the new objtool klp unit tests)
I'm getting a failure building with LLVM:

$ make -C tools/objtool ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- LLV=
M=3D1 tests
make: Entering directory
'/usr/local/google/home/dylanbhatch/worktrees/arm64-clang/tools/objtool'
make[1]: Entering directory
'/usr/local/google/home/dylanbhatch/worktrees/arm64-clang/tools/lib/subcmd'
make[1]: Leaving directory
'/usr/local/google/home/dylanbhatch/worktrees/arm64-clang/tools/lib/subcmd'
make[1]: Entering directory
'/usr/local/google/home/dylanbhatch/worktrees/arm64-clang/tools/objtool'
make[1]: Leaving directory
'/usr/local/google/home/dylanbhatch/worktrees/arm64-clang/tools/objtool'
TAP version 13
# preflight
#   objtool   /usr/local/google/home/dylanbhatch/worktrees/arm64-clang/tool=
s/objtool/objtool
(klp: yes)
#   compiler  Debian clang version 21.1.8 (3)
#   arch      arm64  (host x86, cross)
#   tmpdir    /tmp  (each test builds in a fresh directory here)
# not run: 6 tests in x86/ (this run is arm64)
1..46
                                                            not ok -
test-abs-and-addressable: abs_and_addressable.c does not build: 1
error generated.
...

I haven't been able to dig into it too closely, but my AI tool is
suggesting adding -mcmodel=3Dlarge for llvm, or putting '.set abs_sym,
0x1234' in a separate object and using partial_link.

Thanks,
Dyaln

