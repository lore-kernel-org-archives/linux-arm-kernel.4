Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E7606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KHlolWHf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ftnAUSPL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6WR6ZmTlr837lJrTD7UQ7XQoQbBH+eN1B1JyI4HAax4=; b=KHlolWHfZjs9/8
	Y7BpRfsInb3JmlyC0lvXe+fEPcy8Dnu+5xnd2mUr1U3qqrbILR+hVPFqYOwMZZM1bZ2xnfUUBXyWw
	DUJ7xpWkizWC+oe5tBp25/0gi/tEISTdbW/0pT5EH5wzU+QPgG8UjDvaY1e2Gvziy8KfDNMHe7/hR
	OHVvBpC0oJ6+v7SXQ029Qr61m8hzbhuqSyKdS8uA7ikFmGLI5xfyT6pN597rvBdMSIUa7j797Z/fu
	DfnyDD5hSHafgJEhemdrO5U4WCdWJnqfH71dLKVE0WLfL1arBADwywt62q0tA1GTq/uuZ0itKIQd8
	GzwXkUxZXcUjufDXSsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBuS-0000000DgUa-0YNV;
	Thu, 19 Nov 2026 23:51:20 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBuP-0000000DgUD-3BrX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 23:51:19 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1b546061d58so624868c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 15:51:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795132276; cv=none;
        d=google.com; s=arc-20260327;
        b=OG3526I2/yjX7zJC78tZJbDgThGft23+MirDoY/58jX7PCyStXDR6jNBZhdGv501Hw
         zZEjswf5ZR1kqxr6gGil3L3nTvHBvct6W0j4qqbECQ6YLxPC3bSylewlAa5Mh1UtZoF7
         z4ILZzqF5sZF0M68FWHDXNGjsjNNwC4vRedwezE1g2MtxWTJgHJtJHumWOXbaoC9LK/I
         5dNTOQamJXt+TpwEAdqWbiDzMyMUMyqRJ7cmMTgqvzTNyBD/6TtQpup11vhHUYJr2Hqb
         +uhVvXSm7VAJIuSMQUEF8VUKKAiM6tLrJ+j8efHBGH6C7bg8boVLoWxsQQYe8pH9zaf9
         oUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6WR6ZmTlr837lJrTD7UQ7XQoQbBH+eN1B1JyI4HAax4=;
        fh=fuIH6cfxg/aECCDrAY5Elh4YjAhLfYmpc/wy07NUjw0=;
        b=r1eLGIpTTbCH0rG5fGLPYPV+4oG1zL4MdhFWY9WpLAxdk9A4lG2TJZUEFW5V5sBqhS
         Gx7PJJaK6w42ZQzsR33iTHbdV4qKA3CXBaNncu2Z0vI6qyEk2qWHE4dR7xRzR3mXh2Jb
         0jLRW7BUnnkd87zWJikGYsSyBHDoOWybB4Uv9abjgL35v9wihSNXWzMDsdtWlp+FgKsO
         3JilB3+/rGQhG3huhLIe9upHJGwxCULu6PcFTiI1a+SWFGmVrK+SrYbiNSRPyrKR0bo5
         d/aZC0JDfzaZvIOT5uaaIu8cTuKSOIWxiqeUfR4AFFMMc6LCtCQqYczS6MW/D+1NwuiI
         Cl9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795132276; x=1795737076; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6WR6ZmTlr837lJrTD7UQ7XQoQbBH+eN1B1JyI4HAax4=;
        b=ftnAUSPLBxPyx17Lw/dKVehyJvhYTqOwV+/ikCemgZIJtdv2OGugyNBQJwWf7UT1Op
         SQVXZmwyocBfcpPXGVnPrAXMl88dvG0VML77xkxKlSbbtYyLPczGBmcayVxJGfCvJ234
         FcsWr0nTupDFc9RBHAdX2gxCYcMZOaJGaq+oOBeuLNMYOaXNvCJ5fqBmEBkL3ynovHF9
         x+PcjHeTsIbIxGo6cU8KL5+3A4pN4gt3me00TXH5k/mfAIpErbpcCBW/eed/XoKeWP0a
         jBUUmz/8RYPuH41VEw9lM7YdPQSsAUGUZgUBJeAVFFFU0SBeOuymsScUn9rkmEHsqnu+
         cpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132276; x=1795737076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WR6ZmTlr837lJrTD7UQ7XQoQbBH+eN1B1JyI4HAax4=;
        b=Ciawrtyw+TA2tcyZ3KcOTFF6EajHtP3KmdLDnSYXH1FeOYboJBVZr98dbG8huL++vU
         4+Xezjz3lpNE+U5jWdYj9XcmrMyKNidQ3A+NPupT03K6zHnCj7SqKRgVholBJvGopkO2
         zUlVP1BgNDaW9xtjyvTQkN29Gao2gN5TXiUaX4MCwnkOv4qXsgHEV4pW8Dkze3uzny49
         bekrClr/xRgZ34x2ecAM1IolM+8hx4zML/DcQ886bSQbhwKZsw/YMCJujB4LFU7Rn4Y2
         p40V8VORwfF2TWHqYTi8vMv6a4hKSSw41Qd7Or5NM9gsUsFxiFfju3csXGyUOr7ZFrM0
         6TPQ==
X-Gm-Message-State: APuU4Z+oh0f6DHILKfJvJ2C7ct4GkrQbaQqD/BEHajKz6hVWmPQ8HRUj
	a+arWH5RyJpjBMphOTVnp2fcDPy+DTyfevZ6lMfONEh+2F2CQYmND3L9snGqGLHuWyQDJsbKG0I
	gmJjCduRmtSwgRRVIrRPsHPWN6SqEoQ4=
X-Gm-Gg: AYBFou20oZZqaCOmsB1WKrWXZPymT4+xhB0sYd112McAnKxXidfwZWbRjocyzVGFAIG
	AXzhKBNnPtnjAFqj4lURjc3w06sBAsa9dBXeO+DLLsV2amfpyJ6//9yu9NXm4zRH6LFJfeA6LXu
	+t5pbD47Ruu/j+9bpeM/kLpupVamqkfR75o5ibi0wKjH1Uwc2CJ+m6uBFYGYvVEitPGZZ8/Bd2w
	0CW0l/NMVaPYtW5FlYTh+b/xx8czzPH8k8YuWh/9VfuntBBLjXrBLBwsx2TTEwB0N9moy+5YGDj
	Z0fVVerJVPe5SGswotqMfygEaOK04EYv4fMKeYsdRrKKXSg9b3FuFUiz+V0KRpLFpYBOeMuhdW5
	NcRn6dU5s0yd53sHYvL8YKY1kiSZgsU/jalaTK6+OunFiYta97sZXryg6tFv3+IXHkqoQE0s=
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id
 a92af1059eb24-1b556911012mr1057356c88.38.1795132276131; Thu, 19 Nov 2026
 15:51:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118183335.1944213-4-ardb+git@google.com> <20261118183335.1944213-5-ardb+git@google.com>
In-Reply-To: <20261118183335.1944213-5-ardb+git@google.com>
From: Demian Shulhan <demyansh@gmail.com>
Date: Fri, 20 Nov 2026 00:51:03 +0100
X-Gm-Features: AclHuK8B5YXBFxn_TFGsQsroKtXbOYWyYjMBVXmenRjY8_Q8BmJt8P7gKe1QHsI
Message-ID: <CAOLeWCsy83QWMgUV1e-TXH3Z__6PSewLOb=oh+Q7KgSxUqQwiA@mail.gmail.com>
Subject: Re: [PATCH 1/2] raid6: neon: process four data disks per Horner step
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_155117_883220_0FC32D7E 
X-CRM114-Status: GOOD (  36.30  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ard,

I tested this on ARM Neoverse-V2 (GCC 15.2 and Clang 21.1) and have a
couple of suggestions:

> static inline unative_t PMUL(unative_t v, unative_t u)
> {
> return (unative_t)vmulq_p8((poly8x16_t)v, (poly8x16_t)u);
> }

Since 'hi' in HORNER2/HORNER4 only holds 4-bit values in [0..15],
reducing via vqtbl1q_u8() against the 16-byte low-nibble table in
raid6_vgfmul[0x1d] (on !CONFIG_ARM, where single-register TBL is native)
is exact and avoids the 2-pipe PMUL+shift bottleneck on cores like
Neoverse-V2, where single-register TBL issues across all 4 ASIMD pipes.

> +void RAID6_NEON_FN($#, gen_syndrome_real)(int disks, unsigned long bytes=
,
> +  void **ptrs)
>  {
>   uint8_t **dptr =3D (uint8_t **)ptrs;
>   uint8_t *p, *q;
>   int d, z, z0;

While touching this, making 'd' unsigned long (here and in
xor_syndrome_real()) avoids 32-bit sign-extension (sxtw) of the loop
index and lets GCC form paired ldp/stp q, q accesses.

BR,
Demian

=D1=81=D1=80, 18 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:3=
3 Ard Biesheuvel <ardb+git@google.com> =D0=BF=D0=B8=D1=88=D0=B5:

>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The NEON code evaluates the Q syndrome using Horner's rule, multiplying b=
y
> x =3D {02} once for each data disk. This takes six instructions per data
> disk and vector: four for the multiplication by x, and two XORs to add th=
e
> data to P and Q. It also creates a dependency chain through Q that is fou=
r
> instructions long for each data disk.
>
> Instead, process four data disks at a time, i.e.,
>
>   Q' =3D x^4.Q + x^3.D[z+3] + x^2.D[z+2] + x.D[z+1] + D[z]
>
> Multiplying by x^n amounts to shifting each byte left by n bits, and
> reducing the n bits that are shifted out modulo the RAID-6 polynomial.
> Since this reduction is linear, the bits shifted out of all four terms ca=
n
> be XORed together first, and reduced using a single polynomial
> multiplication (PMUL) by 0x1d, which is exact as long as no more than 4
> bits are shifted out. This reduces the instruction count to 5.25 per data
> disk and vector, and the length of the dependency chain through Q to that
> of a single step per four data disks.
>
> In xor_syndrome(), replace the loop that scales Q by x^4 at a time for th=
e
> unmodified disks on the 'left side' with a single multiplication by
> g^start, using the nibble based table lookups that the recovery code uses
> already. This is much faster when only a few high numbered disks are
> modified, which is the common case for partial stripe writes.
>
> Put the code that performs the Horner steps for each lane in a helper
> function, so that unroll.awk keeps the instructions for each lane
> together. This prevents the 8-way unrolled version from running out of
> registers.
>
> While at it, use the ^ and & operators rather than the veorq_u8() and
> vandq_u8() intrinsics, which makes the code easier to read, and allows
> the compiler to use EOR3 instructions by itself, as long as the SHA3
> extension is enabled (see the next patch).
>
> Results on an Apple M2 running Linux, best of the 1x/2x/4x/8x versions,
> in MB/s, using a userspace build of the same code (4 KiB per disk):
>
>   gen_syndrome()      2 data    4 data    8 data   16 data   32 data
>   Avalanche (P) old    55203     42463     37529     35354     34744
>                 new    54099     46028     41733     40484     39569
>   Blizzard (E)  old    19790     15393     14050     13333     12887
>                 new    21670     16197     15524     13915     12475
>
>   xor_syndrome(), 16 data disks, stop =3D 15, in GB/s by value of start:
>                            0         4         8        12        15
>   Avalanche (P) old       34        33        30        24        11
>                 new       39        37        36        33        25
>   Blizzard (E)  old       12        12        11         9         4
>                 new       13        14        13        12         9
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  lib/raid/raid6/arm/neon.c             |   6 +-
>  lib/raid/raid6/arm/neon.h             |  12 +-
>  lib/raid/raid6/arm/neon.uc            | 180 ++++++++++++++------
>  lib/raid/raid6/arm/neon_compat.h      |  22 +++
>  lib/raid/raid6/arm/recov_neon_inner.c |  19 +--
>  5 files changed, 161 insertions(+), 78 deletions(-)
>
> diff --git a/lib/raid/raid6/arm/neon.c b/lib/raid/raid6/arm/neon.c
> index af90869aaffc..2f8e98f5556e 100644
> --- a/lib/raid/raid6/arm/neon.c
> +++ b/lib/raid/raid6/arm/neon.c
> @@ -34,10 +34,12 @@
>                                         size_t bytes, void **ptrs)      \
>         {                                                               \
>                 void raid6_neon ## _n  ## _xor_syndrome_real(int,       \
> -                               int, int, unsigned long, void**);       \
> +                               int, int, unsigned long, void**,        \
> +                               const u8 *);                            \
>                 scoped_ksimd()                                          \
>                         raid6_neon ## _n ## _xor_syndrome_real(disks,   \
> -                               start, stop, (unsigned long)bytes, ptrs);=
\
> +                               start, stop, (unsigned long)bytes, ptrs,\
> +                               raid6_vgfmul[raid6_gfexp[start]]);      \
>         }                                                               \
>         struct raid6_calls const raid6_neonx ## _n =3D {                 =
 \
>                 .gen_syndrome   =3D raid6_neon ## _n ## _gen_syndrome,   =
 \
> diff --git a/lib/raid/raid6/arm/neon.h b/lib/raid/raid6/arm/neon.h
> index 2ca41ee9b499..a9977ec57f27 100644
> --- a/lib/raid/raid6/arm/neon.h
> +++ b/lib/raid/raid6/arm/neon.h
> @@ -2,16 +2,20 @@
>
>  void raid6_neon1_gen_syndrome_real(int disks, unsigned long bytes, void =
**ptrs);
>  void raid6_neon1_xor_syndrome_real(int disks, int start, int stop,
> -                                   unsigned long bytes, void **ptrs);
> +                                   unsigned long bytes, void **ptrs,
> +                                   const uint8_t *gmul);
>  void raid6_neon2_gen_syndrome_real(int disks, unsigned long bytes, void =
**ptrs);
>  void raid6_neon2_xor_syndrome_real(int disks, int start, int stop,
> -                                   unsigned long bytes, void **ptrs);
> +                                   unsigned long bytes, void **ptrs,
> +                                   const uint8_t *gmul);
>  void raid6_neon4_gen_syndrome_real(int disks, unsigned long bytes, void =
**ptrs);
>  void raid6_neon4_xor_syndrome_real(int disks, int start, int stop,
> -                                   unsigned long bytes, void **ptrs);
> +                                   unsigned long bytes, void **ptrs,
> +                                   const uint8_t *gmul);
>  void raid6_neon8_gen_syndrome_real(int disks, unsigned long bytes, void =
**ptrs);
>  void raid6_neon8_xor_syndrome_real(int disks, int start, int stop,
> -                                   unsigned long bytes, void **ptrs);
> +                                   unsigned long bytes, void **ptrs,
> +                                   const uint8_t *gmul);
>  void __raid6_2data_recov_neon(int bytes, uint8_t *p, uint8_t *q, uint8_t=
 *dp,
>                               uint8_t *dq, const uint8_t *pbmul,
>                               const uint8_t *qmul);
> diff --git a/lib/raid/raid6/arm/neon.uc b/lib/raid/raid6/arm/neon.uc
> index 14a9fc2c60fa..6f74e2b82fc4 100644
> --- a/lib/raid/raid6/arm/neon.uc
> +++ b/lib/raid/raid6/arm/neon.uc
> @@ -22,15 +22,29 @@
>   * $#-way unrolled NEON intrinsics math RAID-6 instruction set
>   *
>   * This file is postprocessed using unroll.awk
> + *
> + * The Q syndrome is evaluated using Horner's rule, but four data disks =
at a
> + * time, i.e.,
> + *
> + *   Q' =3D x^4 * Q + x^3 * D[z+3] + x^2 * D[z+2] + x * D[z+1] + D[z]
> + *
> + * Multiplying by x^n amounts to shifting each byte left by n bits, and
> + * reducing the n bits that are shifted out modulo the RAID-6 polynomial=
.
> + * Since this reduction is linear, the bits shifted out of all terms can=
 be
> + * XORed together first, and reduced using a single polynomial multiplic=
ation
> + * by 0x1d, which is exact as long as no more than 4 bits are shifted ou=
t.
>   */
>
>  #include <arm_neon.h>
>  #include "arm/neon.h"
> +#include "arm/neon_compat.h"
>
>  typedef uint8x16_t unative_t;
>
>  #define NSIZE  sizeof(unative_t)
>
> +#define RAID6_NEON_FN(n, fn)   raid6_neon ## n ## _ ## fn
> +
>  /*
>   * The SHLBYTE() operation shifts each byte left by 1, *not*
>   * rolling over into the next byte
> @@ -54,13 +68,85 @@ static inline unative_t PMUL(unative_t v, unative_t u=
)
>         return (unative_t)vmulq_p8((poly8x16_t)v, (poly8x16_t)u);
>  }
>
> -void raid6_neon$#_gen_syndrome_real(int disks, unsigned long bytes, void=
 **ptrs)
> +/* Q * x + D */
> +static inline unative_t HORNER1(unative_t q, unative_t d, unative_t x1d)
> +{
> +       return SHLBYTE(q) ^ (MASK(q) & x1d) ^ d;
> +}
> +
> +/* Q * x^2 + D1 * x + D0 */
> +static inline unative_t HORNER2(unative_t q, unative_t d1, unative_t d0,
> +                               unative_t x1d)
> +{
> +       unative_t lo =3D vshlq_n_u8(q, 2) ^ vshlq_n_u8(d1, 1) ^ d0;
> +       unative_t hi =3D vshrq_n_u8(q, 6) ^ vshrq_n_u8(d1, 7);
> +
> +       return lo ^ PMUL(hi, x1d);
> +}
> +
> +/* Q * x^4 + D3 * x^3 + D2 * x^2 + D1 * x + D0 */
> +static inline unative_t HORNER4(unative_t q, unative_t d3, unative_t d2,
> +                               unative_t d1, unative_t d0, unative_t x1d=
)
> +{
> +       unative_t lo =3D vshlq_n_u8(q, 4) ^ vshlq_n_u8(d3, 3) ^
> +                      vshlq_n_u8(d2, 2) ^ vshlq_n_u8(d1, 1) ^ d0;
> +       unative_t hi =3D vshrq_n_u8(q, 4) ^ vshrq_n_u8(d3, 5) ^
> +                      vshrq_n_u8(d2, 6) ^ vshrq_n_u8(d1, 7);
> +
> +       return lo ^ PMUL(hi, x1d);
> +}
> +
> +/*
> + * Perform a Horner step for a single lane.  Each step is a single state=
ment
> + * so that unroll.awk keeps the code for each lane together, which avoid=
s
> + * running out of registers with the wider unrolls.
> + */
> +static inline void STEP1(unative_t *wp, unative_t *wq, const uint8_t *s,
> +                        unative_t x1d)
> +{
> +       unative_t d =3D vld1q_u8(s);
> +
> +       *wp ^=3D d;
> +       *wq =3D HORNER1(*wq, d, x1d);
> +}
> +
> +static inline void STEP2(unative_t *wp, unative_t *wq, const uint8_t *s1=
,
> +                        const uint8_t *s0, unative_t x1d)
> +{
> +       unative_t d1 =3D vld1q_u8(s1);
> +       unative_t d0 =3D vld1q_u8(s0);
> +
> +       *wp ^=3D d1 ^ d0;
> +       *wq =3D HORNER2(*wq, d1, d0, x1d);
> +}
> +
> +static inline void STEP4(unative_t *wp, unative_t *wq, const uint8_t *s3=
,
> +                        const uint8_t *s2, const uint8_t *s1,
> +                        const uint8_t *s0, unative_t x1d)
> +{
> +       unative_t d3 =3D vld1q_u8(s3);
> +       unative_t d2 =3D vld1q_u8(s2);
> +       unative_t d1 =3D vld1q_u8(s1);
> +       unative_t d0 =3D vld1q_u8(s0);
> +
> +       *wp ^=3D d3 ^ d2 ^ d1 ^ d0;
> +       *wq =3D HORNER4(*wq, d3, d2, d1, d0, x1d);
> +}
> +
> +/* Multiply by the constant described by the nibble tables in m0 and m1 =
*/
> +static inline unative_t GFMUL(unative_t v, unative_t m0, unative_t m1)
> +{
> +       return vqtbl1q_u8(m0, v & 0x0f) ^ vqtbl1q_u8(m1, vshrq_n_u8(v, 4)=
);
> +}
> +
> +void RAID6_NEON_FN($#, gen_syndrome_real)(int disks, unsigned long bytes=
,
> +                                        void **ptrs)
>  {
>         uint8_t **dptr =3D (uint8_t **)ptrs;
>         uint8_t *p, *q;
>         int d, z, z0;
>
> -       register unative_t wd$$, wq$$, wp$$, w1$$, w2$$;
> +       unative_t wq$$, wp$$;
>         const unative_t x1d =3D vdupq_n_u8(0x1d);
>
>         z0 =3D disks - 3;         /* Highest data disk */
> @@ -69,30 +155,41 @@ void raid6_neon$#_gen_syndrome_real(int disks, unsig=
ned long bytes, void **ptrs)
>
>         for ( d =3D 0 ; d < bytes ; d +=3D NSIZE*$# ) {
>                 wq$$ =3D wp$$ =3D vld1q_u8(&dptr[z0][d+$$*NSIZE]);
> -               for ( z =3D z0-1 ; z >=3D 0 ; z-- ) {
> -                       wd$$ =3D vld1q_u8(&dptr[z][d+$$*NSIZE]);
> -                       wp$$ =3D veorq_u8(wp$$, wd$$);
> -                       w2$$ =3D MASK(wq$$);
> -                       w1$$ =3D SHLBYTE(wq$$);
> -
> -                       w2$$ =3D vandq_u8(w2$$, x1d);
> -                       w1$$ =3D veorq_u8(w1$$, w2$$);
> -                       wq$$ =3D veorq_u8(w1$$, wd$$);
> +               z =3D z0 - 1;
> +
> +               /* Process 1 and/or 2 disks so that a multiple of 4 remai=
ns */
> +               if (z0 & 1) {
> +                       STEP1(&wp$$, &wq$$, &dptr[z][d+$$*NSIZE], x1d);
> +                       z--;
> +               }
> +               if (z0 & 2) {
> +                       STEP2(&wp$$, &wq$$, &dptr[z][d+$$*NSIZE], &dptr[z=
-1][d+$$*NSIZE], x1d);
> +                       z -=3D 2;
> +               }
> +               for ( ; z >=3D 0 ; z -=3D 4 ) {
> +                       STEP4(&wp$$, &wq$$, &dptr[z][d+$$*NSIZE], &dptr[z=
-1][d+$$*NSIZE], &dptr[z-2][d+$$*NSIZE], &dptr[z-3][d+$$*NSIZE], x1d);
>                 }
>                 vst1q_u8(&p[d+NSIZE*$$], wp$$);
>                 vst1q_u8(&q[d+NSIZE*$$], wq$$);
>         }
>  }
>
> -void raid6_neon$#_xor_syndrome_real(int disks, int start, int stop,
> -                                   unsigned long bytes, void **ptrs)
> +/*
> + * @gmul points to the 32 byte nibble table (see raid6_vgfmul[]) that
> + * multiplies by g^start.
> + */
> +void RAID6_NEON_FN($#, xor_syndrome_real)(int disks, int start, int stop=
,
> +                                        unsigned long bytes, void **ptrs=
,
> +                                        const uint8_t *gmul)
>  {
>         uint8_t **dptr =3D (uint8_t **)ptrs;
>         uint8_t *p, *q;
>         int d, z, z0;
>
> -       register unative_t wd$$, wq$$, wp$$, w1$$, w2$$;
> +       unative_t wq$$, wp$$;
>         const unative_t x1d =3D vdupq_n_u8(0x1d);
> +       const unative_t gm0 =3D vld1q_u8(gmul);
> +       const unative_t gm1 =3D vld1q_u8(gmul + 16);
>
>         z0 =3D stop;              /* P/Q right side optimization */
>         p =3D dptr[disks-2];      /* XOR parity */
> @@ -100,53 +197,28 @@ void raid6_neon$#_xor_syndrome_real(int disks, int =
start, int stop,
>
>         for ( d =3D 0 ; d < bytes ; d +=3D NSIZE*$# ) {
>                 wq$$ =3D vld1q_u8(&dptr[z0][d+$$*NSIZE]);
> -               wp$$ =3D veorq_u8(vld1q_u8(&p[d+$$*NSIZE]), wq$$);
> +               wp$$ =3D vld1q_u8(&p[d+$$*NSIZE]) ^ wq$$;
> +               z =3D z0 - 1;
>
>                 /* P/Q data pages */
> -               for ( z =3D z0-1 ; z >=3D start ; z-- ) {
> -                       wd$$ =3D vld1q_u8(&dptr[z][d+$$*NSIZE]);
> -                       wp$$ =3D veorq_u8(wp$$, wd$$);
> -                       w2$$ =3D MASK(wq$$);
> -                       w1$$ =3D SHLBYTE(wq$$);
> -
> -                       w2$$ =3D vandq_u8(w2$$, x1d);
> -                       w1$$ =3D veorq_u8(w1$$, w2$$);
> -                       wq$$ =3D veorq_u8(w1$$, wd$$);
> +               if ((z0 - start) & 1) {
> +                       STEP1(&wp$$, &wq$$, &dptr[z][d+$$*NSIZE], x1d);
> +                       z--;
>                 }
> -               /* P/Q left side optimization */
> -               for ( z =3D start-1 ; z >=3D 3 ; z -=3D 4 ) {
> -                       w2$$ =3D vshrq_n_u8(wq$$, 4);
> -                       w1$$ =3D vshlq_n_u8(wq$$, 4);
> -
> -                       w2$$ =3D PMUL(w2$$, x1d);
> -                       wq$$ =3D veorq_u8(w1$$, w2$$);
> +               if ((z0 - start) & 2) {
> +                       STEP2(&wp$$, &wq$$, &dptr[z][d+$$*NSIZE], &dptr[z=
-1][d+$$*NSIZE], x1d);
> +                       z -=3D 2;
> +               }
> +               for ( ; z >=3D start ; z -=3D 4 ) {
> +                       STEP4(&wp$$, &wq$$, &dptr[z][d+$$*NSIZE], &dptr[z=
-1][d+$$*NSIZE], &dptr[z-2][d+$$*NSIZE], &dptr[z-3][d+$$*NSIZE], x1d);
>                 }
>
> -               switch (z) {
> -               case 2:
> -                       w2$$ =3D vshrq_n_u8(wq$$, 5);
> -                       w1$$ =3D vshlq_n_u8(wq$$, 3);
> -
> -                       w2$$ =3D PMUL(w2$$, x1d);
> -                       wq$$ =3D veorq_u8(w1$$, w2$$);
> -                       break;
> -               case 1:
> -                       w2$$ =3D vshrq_n_u8(wq$$, 6);
> -                       w1$$ =3D vshlq_n_u8(wq$$, 2);
> -
> -                       w2$$ =3D PMUL(w2$$, x1d);
> -                       wq$$ =3D veorq_u8(w1$$, w2$$);
> -                       break;
> -               case 0:
> -                       w2$$ =3D MASK(wq$$);
> -                       w1$$ =3D SHLBYTE(wq$$);
> -
> -                       w2$$ =3D vandq_u8(w2$$, x1d);
> -                       wq$$ =3D veorq_u8(w1$$, w2$$);
> +               /* P/Q left side optimization: multiply by g^start */
> +               if (start) {
> +                       wq$$ =3D GFMUL(wq$$, gm0, gm1);
>                 }
> -               w1$$ =3D vld1q_u8(&q[d+NSIZE*$$]);
> -               wq$$ =3D veorq_u8(wq$$, w1$$);
>
> +               wq$$ ^=3D vld1q_u8(&q[d+NSIZE*$$]);
>                 vst1q_u8(&p[d+NSIZE*$$], wp$$);
>                 vst1q_u8(&q[d+NSIZE*$$], wq$$);
>         }
> diff --git a/lib/raid/raid6/arm/neon_compat.h b/lib/raid/raid6/arm/neon_c=
ompat.h
> new file mode 100644
> index 000000000000..81410b2c2c99
> --- /dev/null
> +++ b/lib/raid/raid6/arm/neon_compat.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
> + */
> +
> +#ifdef CONFIG_ARM
> +/*
> + * AArch32 does not provide this intrinsic natively because it does not
> + * implement the underlying instruction. AArch32 only provides a 64-bit
> + * wide vtbl.8 instruction, so use that instead.
> + */
> +static inline uint8x16_t vqtbl1q_u8(uint8x16_t a, uint8x16_t b)
> +{
> +       union {
> +               uint8x16_t      val;
> +               uint8x8x2_t     pair;
> +       } __a =3D { a };
> +
> +       return vcombine_u8(vtbl2_u8(__a.pair, vget_low_u8(b)),
> +                          vtbl2_u8(__a.pair, vget_high_u8(b)));
> +}
> +#endif
> diff --git a/lib/raid/raid6/arm/recov_neon_inner.c b/lib/raid/raid6/arm/r=
ecov_neon_inner.c
> index 53c355efa7ff..66f687e5dea8 100644
> --- a/lib/raid/raid6/arm/recov_neon_inner.c
> +++ b/lib/raid/raid6/arm/recov_neon_inner.c
> @@ -6,24 +6,7 @@
>
>  #include <arm_neon.h>
>  #include "arm/neon.h"
> -
> -#ifdef CONFIG_ARM
> -/*
> - * AArch32 does not provide this intrinsic natively because it does not
> - * implement the underlying instruction. AArch32 only provides a 64-bit
> - * wide vtbl.8 instruction, so use that instead.
> - */
> -static uint8x16_t vqtbl1q_u8(uint8x16_t a, uint8x16_t b)
> -{
> -       union {
> -               uint8x16_t      val;
> -               uint8x8x2_t     pair;
> -       } __a =3D { a };
> -
> -       return vcombine_u8(vtbl2_u8(__a.pair, vget_low_u8(b)),
> -                          vtbl2_u8(__a.pair, vget_high_u8(b)));
> -}
> -#endif
> +#include "arm/neon_compat.h"
>
>  void __raid6_2data_recov_neon(int bytes, uint8_t *p, uint8_t *q, uint8_t=
 *dp,
>                               uint8_t *dq, const uint8_t *pbmul,
> --
> 2.56.1.708.g77570a6a1d-goog
>

