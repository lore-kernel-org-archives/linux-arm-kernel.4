Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5FA606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NEA+IdZ2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnAoGhBT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vg9VULF4P46KBJLdQWnr60lN9eBee5DC89Aia28lE88=; b=NEA+IdZ2L2Z8Od
	juh1F1BjPl51igQRqYWUtFrt57MZWrVslq0iBtz1dCA82TOR49YHN0T9rMUJdOGquR+WloiXkfniN
	B3qGrQOpyjwP/NDa4RJIeMg+T70Pq9YOLQ/RV9a6umYWBCooj1tSDknUjxMHyGKaqL8wAj5KzlyXI
	/KovqnSZ79Uf3p7HYeC1l20bOnHBK+RuvzbU0rNKPWuKKNJ3NcNxYWqDgxkRB1mwXbTtpXLBmA+BM
	7cY6GPaQvHjHhP8ELgpwazfUwn/ha9YEcJmH8uVXxIM99G16lYAdos04GmjFc/S9+kXScLrVfqKkh
	su3/SxtkU+H+X9QUI0nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUByi-0000000DgnV-3Re4;
	Thu, 19 Nov 2026 23:55:44 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUByg-0000000Dgn4-01Tx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 23:55:43 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-15dd124bbe7so527796c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 15:55:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795132541; cv=none;
        d=google.com; s=arc-20260327;
        b=ZTm29DBohqq8nPyfsq4LyuoQ0RcQAJCsxZeDDGzzkK3/yfZs5qS10vg+nxpz3dhv1U
         mglTwr5QZ7xkB/1x/CQh2T8NQpvu/foz01GxyOALfI8uIKYBpg8HG25eCb1g+SSDeuMM
         dAWQ1Ds6/wc3zM8OHfHklqbSQHshuOtxAVMw91DwhtJdCviZQEIm3HtocuiEMA6Kahlo
         evPK3AJ2Gj1LNmt4A/Dg1ifUmZJ4RFKPuTAfPiFwNgoXGJh/O49B+uO0wE6EsDMFDshs
         xWzmY5xMBbRPq5ActqBO7EiLM16vK7+Z3MG/ojEGWnSt3MQLKDnW6uqW4pZKDP8T3hk7
         SXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vg9VULF4P46KBJLdQWnr60lN9eBee5DC89Aia28lE88=;
        fh=fuIH6cfxg/aECCDrAY5Elh4YjAhLfYmpc/wy07NUjw0=;
        b=lpeS0RQJi60HcL8UVf26t97UpJyuWvhcEUI4cmEK7mCtwAx2QLkPzUjZy5WE+cQBls
         6yD84lwdkxtU4EliIYaRVB8n5qsLtie/45c0AAO0rGe5KqAMTt3YGOmML8yiKnQ6vBM+
         ffMDuWOus/HV9+cj+wXbtKlOTo3wq+p9HMsdGZkMokgxhZNpPIhV5S2nlVMkX0MysDc2
         IbdNipn5og753r1BYrvkaypQQ+r1f4zBffJQOQ4ylxpGSxJBkwNtb2BfQ5HLCAUEtX0W
         OcZKzkZ2AcbOrTyc40MjRcTNzAHKMt7Pgcr6naf1fZQH3RSio7CUSHN2QVPKVBBhXyFT
         F4HA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795132541; x=1795737341; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vg9VULF4P46KBJLdQWnr60lN9eBee5DC89Aia28lE88=;
        b=YnAoGhBTO3Q3uk0RjVpUGx2T2C1uWF7iVLr9DZsvGBSC9C3fIvqQpL1ruOwRvA/BED
         hoJJ5+bUeKOM8FIvszxAv+79H9mYFigh2nzChGIclQZol9E2lK/ZqfSFPwShPoYkSheK
         Fa6L5fPkfrhtxrzIlZ2376s54RwazcFtbUV819G+5hrwI+DLkCu3QOAdB+KoTQXsbSqa
         bxuH5Bg9Ly5q3uIvIG+T4HPAvT8KbM3al/ogVhD7t6D+Y3AT8Px8pa/mRJgtZRqRC6Wu
         csBySdPFzz1G8nL2JwNLTNu1Z1Lk8FbYYqK+ZfsVIO2llP/o+RAsgCNi/cVOUJ0w9pSa
         IYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132541; x=1795737341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vg9VULF4P46KBJLdQWnr60lN9eBee5DC89Aia28lE88=;
        b=DkGFMkA745TO33G9ugcRqfbbS1T7Qm9FU2I912AyNwB7qI77q5e/OUSBdVEQ2w+xb4
         JF+na+CpAXpsG6fe8WLl1hivAfZPeP1wKn55cW6owUQ2jHt/G3anhmf65fEeP/1XjhZO
         smNT29FPXo1JlCBR88QSxQN8AjsfNyxom8kRLf3r28iR1UU9QBMm4Adw7rvT4554L6/6
         ZpLd7LB18twRsE3r5RqUeYNuoNHwczG3srPCgNFwHEr2HfvZAC+BkvXFmdIJLWGVHeS2
         RfbrtTZMKohU1ACAQ7dFztUG3wVSyMsmlLV6WRUKPj3+Q2Scvjylg4CeuNg8pQv45gpi
         vufg==
X-Gm-Message-State: APuU4Z/YniuaDTSlK4ptPFmGKrQwISs38Aies3m+rxUhQYw0j4uTnORx
	XshzZ04cuy+JrPrOm/cOYZR9td8jL6teH7hTMMXgYE0ircpO4BGS5GsM97giFJGqw5OlvEWQYMW
	mHEBbpVvWxntkbdxZvLkHGP0laAk3ndn/Kgtlll4=
X-Gm-Gg: AYBFou2xKJoGIkoLwYcaBl5x1WtyngZfvK0EVc7NPhLBktE8NgIK9Dtrettc1DChgIE
	WROcqSs3XMVkciNwZXQ77gjw2LAalHIaeosL8/G13QbkTcdGFsrr3NTmtmjQ8S8BGZ5G9w1FMeg
	0UKlTL1hf/unVpvriboRHYGG9pWeo9pKFrbb9r44l0dS5AfO1ReyeejUBCy5IwGmqveYyRaBzsO
	G+qbv6EarFh0QzEcGYpO1w3Nct/2zFFlk2jmGidRO7qMGjSFZp1l3Ql5u1S54wl7m/tba7t+t7h
	cCsOSi2ftV4LbVEGPwyMS4jy6TQGIMQO95dtt476DRuwQyjfhB5gYk/9UXOoou1aJVzPeWQXdNn
	GTp7U18xJJBEOiCIgE8/K2QZ8mIlIIoqQpMMa/2CziCdL5c31Viv6Zb/4pfMVFB9y7rdIhXA=
X-Received: by 2002:a05:7022:5f08:b0:144:c112:5f24 with SMTP id
 a92af1059eb24-1b5568f9e24mr1143919c88.25.1795132540705; Thu, 19 Nov 2026
 15:55:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118183335.1944213-4-ardb+git@google.com> <20261118183335.1944213-6-ardb+git@google.com>
In-Reply-To: <20261118183335.1944213-6-ardb+git@google.com>
From: Demian Shulhan <demyansh@gmail.com>
Date: Fri, 20 Nov 2026 00:55:29 +0100
X-Gm-Features: AclHuK8sRtFtQgUO5Q_iMkUswmChtV37dXZacjQOLydzHxyxRruew8fXCkSlHT4
Message-ID: <CAOLeWCs2UXvpDd-otyt-96SRER9=j4LwAWFjXegDzkr9vH3jng@mail.gmail.com>
Subject: Re: [PATCH 2/2] raid6: arm64: use the EOR3 instruction where available
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_155542_087104_33BECB3B 
X-CRM114-Status: GOOD (  29.47  )
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

A few EOR3-specific suggestions on top of patch 2:

> @@ -129,7 +145,7 @@ static inline void STEP4(unative_t *wp, unative_t *wq=
, const uint8_t *s3,
>   unative_t d1 =3D vld1q_u8(s1);
>   unative_t d0 =3D vld1q_u8(s0);
>
> - *wp ^=3D d3 ^ d2 ^ d1 ^ d0;
> + *wp =3D XOR3(XOR3(*wp, d3, d2), d1, d0);
>   *wq =3D HORNER4(*wq, d3, d2, d1, d0, x1d);
>  }

Writing this as:

*wp =3D XOR3(*wp, XOR3(d3, d2, d1), d0);

keeps *wp out of the inner EOR3 so d3 ^ d2 ^ d1 can issue in parallel
with the previous iteration's P update, cutting the loop-carried latency
on *wp in half.

Similarly, in HORNER4(), keeping 'q >> 4' at the outer XOR of 'hi' and
folding 'q << 4' and PMUL(hi, x1d) together in a single final XOR3():

unative_t hi =3D vshrq_n_u8(q, 4) ^
      XOR3(vshrq_n_u8(d3, 5), vshrq_n_u8(d2, 6), vshrq_n_u8(d1, 7));
unative_t lo_d =3D XOR3(vshlq_n_u8(d3, 3), vshlq_n_u8(d2, 2),
     vshlq_n_u8(d1, 1)) ^ d0;

return XOR3(vshlq_n_u8(q, 4), PMUL(hi, x1d), lo_d);

shortens the critical loop-carried Q chain (+7-8% for 16-32 data disks
with GCC).

Finally, in xor_syndrome_real(), neither GCC nor Clang folds GFMUL() with
the final q[d] XOR across the 'if (start)' merge point. Passing q[d] into
a GFMUL_XOR() helper using XOR3():

static inline unative_t GFMUL_XOR(unative_t v, unative_t m0, unative_t m1,
 unative_t q)
{
return XOR3(vqtbl1q_u8(m0, v & 0x0f),
   vqtbl1q_u8(m1, vshrq_n_u8(v, 4)), q);
}

and calling on a single line (for unroll.awk):

if (start) {
wq$$ =3D GFMUL_XOR(wq$$, gm0, gm1, vld1q_u8(&q[d+NSIZE*$$]));
} else {
wq$$ ^=3D vld1q_u8(&q[d+NSIZE*$$]);
}

saves one vector XOR per lane when start > 0 (+3-4% on partial stripe
updates with GCC).

BR,
Demian

=D1=81=D1=80, 18 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:3=
3 Ard Biesheuvel <ardb+git@google.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The SHA3 extension to the arm64 instruction set provides EOR3, which XORs
> three vectors in a single instruction. Use it to fold the XORs in the
> Horner steps of the NEON syndrome code, which reduces the instruction
> count from 5.25 to 4 per data disk and vector for the 4-disk step, i.e.,
> a reduction of a third compared to the original code.
>
> Build the EOR3 versions from the same neon.uc source, with
> RAID6_NEON_EOR3 defined and the SHA3 extension enabled, and use them
> instead of the plain NEON versions on CPUs that implement SHA3. Use
> -march=3Darmv8.2-a+sha3 for this: SHA3 is an optional extension of
> ARMv8.2, so any CPU that implements it implements ARMv8.2 as well. This
> is also what older toolchains (e.g., GCC 8.5 with binutils 2.36) need to
> accept EOR3.
>
> With SHA3 enabled, GCC and Clang fold a ^ b ^ c into EOR3 by themselves.
> The exception is the loop carried P accumulator: recent GCC versions
> reassociate the XORs into it in a way that only permits a single EOR3
> instruction where two can be used, so use the veor3q_u8() intrinsic
> explicitly for that case.
>
> Results on an Apple M2 running Linux, best of the 1x/2x/4x/8x versions,
> in MB/s, using a userspace build of the same code (4 KiB per disk):
>
>   gen_syndrome()      2 data    4 data    8 data   16 data   32 data
>   Avalanche (P) neon   54099     46028     41733     40484     39569
>                 eor3   63505     56936     53229     51807     51380
>   Blizzard (E)  neon   21670     16197     15524     13915     12475
>                 eor3   23388     19800     19583     17278     15609
>
>   xor_syndrome(), 16 data disks, stop =3D 15, in GB/s by value of start:
>                            0         4         8        12        15
>   Avalanche (P) neon      39        37        36        33        25
>                 eor3      50        46        44        38        25
>   Blizzard (E)  neon      13        14        13        12         9
>                 eor3      16        17        16        14         9
>
> Compared to the code before the previous patch, this is 15-48% faster for
> gen_syndrome() on the performance cores, and 18-39% on the efficiency
> cores.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  lib/raid/raid6/.gitignore      |  1 +
>  lib/raid/raid6/Makefile        | 19 +++++++++
>  lib/raid/raid6/arm/neon.c      | 42 +++++++++++---------
>  lib/raid/raid6/arm/neon.h      | 16 ++++++++
>  lib/raid/raid6/arm/neon.uc     | 20 +++++++++-
>  lib/raid/raid6/arm64/pq_arch.h | 34 +++++++++++++++-
>  6 files changed, 110 insertions(+), 22 deletions(-)
>
> diff --git a/lib/raid/raid6/.gitignore b/lib/raid/raid6/.gitignore
> index 6be57745afd1..2e9bd6299837 100644
> --- a/lib/raid/raid6/.gitignore
> +++ b/lib/raid/raid6/.gitignore
> @@ -4,5 +4,6 @@ altivec*.c
>  int*.c
>  tables.c
>  neon?.c
> +eor3_?.c
>  s390vx?.c
>  vpermxor*.c
> diff --git a/lib/raid/raid6/Makefile b/lib/raid/raid6/Makefile
> index 5cdb7223de2a..314ed1012cc0 100644
> --- a/lib/raid/raid6/Makefile
> +++ b/lib/raid/raid6/Makefile
> @@ -24,6 +24,10 @@ raid6_pq-$(CONFIG_KERNEL_MODE_NEON) +=3D arm/neon.o \
>                                    arm/neon8.o \
>                                    arm/recov_neon.o \
>                                    arm/recov_neon_inner.o
> +raid6_pq-$(CONFIG_ARM64)       +=3D arm64/eor3_1.o \
> +                                  arm64/eor3_2.o \
> +                                  arm64/eor3_4.o \
> +                                  arm64/eor3_8.o
>  raid6_pq-$(CONFIG_LOONGARCH)   +=3D loongarch/loongarch_simd.o \
>                                    loongarch/recov_loongarch_simd.o
>  raid6_pq-$(CONFIG_ALTIVEC)     +=3D powerpc/altivec1.o \
> @@ -56,11 +60,21 @@ CFLAGS_arm/neon2.o +=3D $(CC_FLAGS_FPU)
>  CFLAGS_arm/neon4.o +=3D $(CC_FLAGS_FPU)
>  CFLAGS_arm/neon8.o +=3D $(CC_FLAGS_FPU)
>  CFLAGS_arm/recov_neon_inner.o +=3D $(CC_FLAGS_FPU)
> +# SHA3 is an optional extension of ARMv8.2, so any CPU that implements i=
t
> +# implements ARMv8.2 as well
> +CFLAGS_arm64/eor3_1.o +=3D $(CC_FLAGS_FPU) -DRAID6_NEON_EOR3 -march=3Dar=
mv8.2-a+sha3
> +CFLAGS_arm64/eor3_2.o +=3D $(CC_FLAGS_FPU) -DRAID6_NEON_EOR3 -march=3Dar=
mv8.2-a+sha3
> +CFLAGS_arm64/eor3_4.o +=3D $(CC_FLAGS_FPU) -DRAID6_NEON_EOR3 -march=3Dar=
mv8.2-a+sha3
> +CFLAGS_arm64/eor3_8.o +=3D $(CC_FLAGS_FPU) -DRAID6_NEON_EOR3 -march=3Dar=
mv8.2-a+sha3
>  CFLAGS_REMOVE_arm/neon1.o +=3D $(CC_FLAGS_NO_FPU)
>  CFLAGS_REMOVE_arm/neon2.o +=3D $(CC_FLAGS_NO_FPU)
>  CFLAGS_REMOVE_arm/neon4.o +=3D $(CC_FLAGS_NO_FPU)
>  CFLAGS_REMOVE_arm/neon8.o +=3D $(CC_FLAGS_NO_FPU)
>  CFLAGS_REMOVE_arm/recov_neon_inner.o +=3D $(CC_FLAGS_NO_FPU)
> +CFLAGS_REMOVE_arm64/eor3_1.o +=3D $(CC_FLAGS_NO_FPU)
> +CFLAGS_REMOVE_arm64/eor3_2.o +=3D $(CC_FLAGS_NO_FPU)
> +CFLAGS_REMOVE_arm64/eor3_4.o +=3D $(CC_FLAGS_NO_FPU)
> +CFLAGS_REMOVE_arm64/eor3_8.o +=3D $(CC_FLAGS_NO_FPU)
>
>  ifeq ($(CONFIG_ALTIVEC),y)
>  altivec_flags :=3D -maltivec $(call cc-option,-mabi=3Daltivec)
> @@ -109,6 +123,11 @@ targets +=3D arm/neon1.c arm/neon2.c arm/neon4.c arm=
/neon8.c
>  $(obj)/arm/neon%.c: $(src)/arm/neon.uc $(src)/unroll.awk FORCE
>         $(call if_changed,unroll)
>
> +# the arm64 EOR3 versions are built from the same source
> +targets +=3D arm64/eor3_1.c arm64/eor3_2.c arm64/eor3_4.c arm64/eor3_8.c
> +$(obj)/arm64/eor3_%.c: $(src)/arm/neon.uc $(src)/unroll.awk FORCE
> +       $(call if_changed,unroll)
> +
>  targets +=3D powerpc/altivec1.c \
>            powerpc/altivec2.c \
>            powerpc/altivec4.c \
> diff --git a/lib/raid/raid6/arm/neon.c b/lib/raid/raid6/arm/neon.c
> index 2f8e98f5556e..722f15f2a6ad 100644
> --- a/lib/raid/raid6/arm/neon.c
> +++ b/lib/raid/raid6/arm/neon.c
> @@ -7,6 +7,7 @@
>
>  #include <asm/simd.h>
>  #include "algos.h"
> +#include "arm/neon.h"
>
>  /*
>   * There are 2 reasons these wrappers are kept in a separate compilation=
 unit
> @@ -19,35 +20,38 @@
>   *   outside a kernel_neon_begin()/kernel_neon_end() pair.
>   */
>
> -#define RAID6_NEON_WRAPPER(_n)                                         \
> -       static void raid6_neon ## _n ## _gen_syndrome(int disks,        \
> +#define RAID6_NEON_WRAPPER(_pfx, _n, _name)                            \
> +       static void _pfx ## _n ## _gen_syndrome(int disks,              \
>                                         size_t bytes, void **ptrs)      \
>         {                                                               \
> -               void raid6_neon ## _n  ## _gen_syndrome_real(int,       \
> -                                               unsigned long, void**); \
>                 scoped_ksimd()                                          \
> -                       raid6_neon ## _n ## _gen_syndrome_real(disks,   \
> +                       _pfx ## _n ## _gen_syndrome_real(disks,         \
>                                         (unsigned long)bytes, ptrs);    \
>         }                                                               \
> -       static void raid6_neon ## _n ## _xor_syndrome(int disks,        \
> -                                       int start, int stop,            \
> +       static void _pfx ## _n ## _xor_syndrome(int disks,              \
> +                                       int start, int stop,            \
>                                         size_t bytes, void **ptrs)      \
>         {                                                               \
> -               void raid6_neon ## _n  ## _xor_syndrome_real(int,       \
> -                               int, int, unsigned long, void**,        \
> -                               const u8 *);                            \
>                 scoped_ksimd()                                          \
> -                       raid6_neon ## _n ## _xor_syndrome_real(disks,   \
> +                       _pfx ## _n ## _xor_syndrome_real(disks,         \
>                                 start, stop, (unsigned long)bytes, ptrs,\
>                                 raid6_vgfmul[raid6_gfexp[start]]);      \
>         }                                                               \
> -       struct raid6_calls const raid6_neonx ## _n =3D {                 =
 \
> -               .gen_syndrome   =3D raid6_neon ## _n ## _gen_syndrome,   =
 \
> -               .xor_syndrome   =3D raid6_neon ## _n ## _xor_syndrome,   =
 \
> -               .name           =3D "neonx" #_n,                         =
 \
> +       struct raid6_calls const raid6_ ## _name =3D {                   =
 \
> +               .gen_syndrome   =3D _pfx ## _n ## _gen_syndrome,         =
 \
> +               .xor_syndrome   =3D _pfx ## _n ## _xor_syndrome,         =
 \
> +               .name           =3D #_name,                              =
 \
>         }
>
> -RAID6_NEON_WRAPPER(1);
> -RAID6_NEON_WRAPPER(2);
> -RAID6_NEON_WRAPPER(4);
> -RAID6_NEON_WRAPPER(8);
> +RAID6_NEON_WRAPPER(raid6_neon, 1, neonx1);
> +RAID6_NEON_WRAPPER(raid6_neon, 2, neonx2);
> +RAID6_NEON_WRAPPER(raid6_neon, 4, neonx4);
> +RAID6_NEON_WRAPPER(raid6_neon, 8, neonx8);
> +
> +#ifdef CONFIG_ARM64
> +/* versions using the EOR3 instruction from the SHA3 extension */
> +RAID6_NEON_WRAPPER(raid6_eor3_, 1, eor3x1);
> +RAID6_NEON_WRAPPER(raid6_eor3_, 2, eor3x2);
> +RAID6_NEON_WRAPPER(raid6_eor3_, 4, eor3x4);
> +RAID6_NEON_WRAPPER(raid6_eor3_, 8, eor3x8);
> +#endif
> diff --git a/lib/raid/raid6/arm/neon.h b/lib/raid/raid6/arm/neon.h
> index a9977ec57f27..a8fc4ba06944 100644
> --- a/lib/raid/raid6/arm/neon.h
> +++ b/lib/raid/raid6/arm/neon.h
> @@ -16,6 +16,22 @@ void raid6_neon8_gen_syndrome_real(int disks, unsigned=
 long bytes, void **ptrs);
>  void raid6_neon8_xor_syndrome_real(int disks, int start, int stop,
>                                     unsigned long bytes, void **ptrs,
>                                     const uint8_t *gmul);
> +void raid6_eor3_1_gen_syndrome_real(int disks, unsigned long bytes, void=
 **ptrs);
> +void raid6_eor3_1_xor_syndrome_real(int disks, int start, int stop,
> +                                   unsigned long bytes, void **ptrs,
> +                                   const uint8_t *gmul);
> +void raid6_eor3_2_gen_syndrome_real(int disks, unsigned long bytes, void=
 **ptrs);
> +void raid6_eor3_2_xor_syndrome_real(int disks, int start, int stop,
> +                                   unsigned long bytes, void **ptrs,
> +                                   const uint8_t *gmul);
> +void raid6_eor3_4_gen_syndrome_real(int disks, unsigned long bytes, void=
 **ptrs);
> +void raid6_eor3_4_xor_syndrome_real(int disks, int start, int stop,
> +                                   unsigned long bytes, void **ptrs,
> +                                   const uint8_t *gmul);
> +void raid6_eor3_8_gen_syndrome_real(int disks, unsigned long bytes, void=
 **ptrs);
> +void raid6_eor3_8_xor_syndrome_real(int disks, int start, int stop,
> +                                   unsigned long bytes, void **ptrs,
> +                                   const uint8_t *gmul);
>  void __raid6_2data_recov_neon(int bytes, uint8_t *p, uint8_t *q, uint8_t=
 *dp,
>                               uint8_t *dq, const uint8_t *pbmul,
>                               const uint8_t *qmul);
> diff --git a/lib/raid/raid6/arm/neon.uc b/lib/raid/raid6/arm/neon.uc
> index 6f74e2b82fc4..e1084a8d3a18 100644
> --- a/lib/raid/raid6/arm/neon.uc
> +++ b/lib/raid/raid6/arm/neon.uc
> @@ -33,6 +33,10 @@
>   * Since this reduction is linear, the bits shifted out of all terms can=
 be
>   * XORed together first, and reduced using a single polynomial multiplic=
ation
>   * by 0x1d, which is exact as long as no more than 4 bits are shifted ou=
t.
> + *
> + * When built with RAID6_NEON_EOR3 defined, this file is compiled with t=
he
> + * arm64 SHA3 extension enabled, allowing the compiler to fold the addit=
ions
> + * into three-way XOR (EOR3) instructions.
>   */
>
>  #include <arm_neon.h>
> @@ -43,7 +47,19 @@ typedef uint8x16_t unative_t;
>
>  #define NSIZE  sizeof(unative_t)
>
> +#ifdef RAID6_NEON_EOR3
> +#define RAID6_NEON_FN(n, fn)   raid6_eor3_ ## n ## _ ## fn
> +
> +/*
> + * The compiler emits EOR3 for a ^ b ^ c by itself, but recent GCC versi=
ons
> + * reassociate the XORs into the loop carried P accumulator such that EO=
R3
> + * can no longer be used, so spell it out for that case.
> + */
> +#define XOR3(a, b, c)          veor3q_u8(a, b, c)
> +#else
>  #define RAID6_NEON_FN(n, fn)   raid6_neon ## n ## _ ## fn
> +#define XOR3(a, b, c)          ((a) ^ (b) ^ (c))
> +#endif
>
>  /*
>   * The SHLBYTE() operation shifts each byte left by 1, *not*
> @@ -116,7 +132,7 @@ static inline void STEP2(unative_t *wp, unative_t *wq=
, const uint8_t *s1,
>         unative_t d1 =3D vld1q_u8(s1);
>         unative_t d0 =3D vld1q_u8(s0);
>
> -       *wp ^=3D d1 ^ d0;
> +       *wp =3D XOR3(*wp, d1, d0);
>         *wq =3D HORNER2(*wq, d1, d0, x1d);
>  }
>
> @@ -129,7 +145,7 @@ static inline void STEP4(unative_t *wp, unative_t *wq=
, const uint8_t *s3,
>         unative_t d1 =3D vld1q_u8(s1);
>         unative_t d0 =3D vld1q_u8(s0);
>
> -       *wp ^=3D d3 ^ d2 ^ d1 ^ d0;
> +       *wp =3D XOR3(XOR3(*wp, d3, d2), d1, d0);
>         *wq =3D HORNER4(*wq, d3, d2, d1, d0, x1d);
>  }
>
> diff --git a/lib/raid/raid6/arm64/pq_arch.h b/lib/raid/raid6/arm64/pq_arc=
h.h
> index 27ff564d7594..4e397aa36480 100644
> --- a/lib/raid/raid6/arm64/pq_arch.h
> +++ b/lib/raid/raid6/arm64/pq_arch.h
> @@ -1 +1,33 @@
> -#include "arm/pq_arch.h"
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <linux/cpufeature.h>
> +#include <asm/neon.h>
> +
> +extern const struct raid6_calls raid6_neonx1;
> +extern const struct raid6_calls raid6_neonx2;
> +extern const struct raid6_calls raid6_neonx4;
> +extern const struct raid6_calls raid6_neonx8;
> +extern const struct raid6_calls raid6_eor3x1;
> +extern const struct raid6_calls raid6_eor3x2;
> +extern const struct raid6_calls raid6_eor3x4;
> +extern const struct raid6_calls raid6_eor3x8;
> +extern const struct raid6_recov_calls raid6_recov_neon;
> +
> +static __always_inline void __init arch_raid6_init(void)
> +{
> +       raid6_algo_add_default();
> +       if (cpu_has_neon()) {
> +               if (cpu_have_named_feature(SHA3)) {
> +                       raid6_algo_add(&raid6_eor3x1);
> +                       raid6_algo_add(&raid6_eor3x2);
> +                       raid6_algo_add(&raid6_eor3x4);
> +                       raid6_algo_add(&raid6_eor3x8);
> +               } else {
> +                       raid6_algo_add(&raid6_neonx1);
> +                       raid6_algo_add(&raid6_neonx2);
> +                       raid6_algo_add(&raid6_neonx4);
> +                       raid6_algo_add(&raid6_neonx8);
> +               }
> +               raid6_recov_algo_add(&raid6_recov_neon);
> +       }
> +}
> --
> 2.56.1.708.g77570a6a1d-goog
>

