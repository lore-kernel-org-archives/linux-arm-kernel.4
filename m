Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265C3606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ac5h0bjv;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=SeX8fOWj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=; b=ac5h0bjvFxWYv2
	IxcPL3X0le+ohla2jdeIJEtOhVMMTd8/0qlkS1IaHNPcLyg90Xx56/rKgVbrhgWUgkY8sktF/FGso
	4md9K50LpCd+IB/b4+RUbtm4JoCeENf4R8JrWc3O/+1cWx1fQCetigSMlOFQrXgUgBrXKyyLj7MpC
	PjftMnvIBJrmUT5cg3SwTSjqV70Ll7hLnXm3LEROpJsvh22/ZKXNI77Hd3LD79cFUrGX2Sp4lVR2M
	vbA8wH7aai1KEIwReMm4ZEQ7qEFEdjyQ+7znIVGTLdbVWrb2HHFFk3GWp8JnBgFxWTkqEziN4SyG6
	EBZ5RL0D+fWjAIMl9w1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3z9-0000000CQzY-0WNY;
	Thu, 19 Nov 2026 15:23:39 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3z6-0000000CQy5-0Y9N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:23:38 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so23416951fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 07:23:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101813; cv=none;
        d=google.com; s=arc-20260327;
        b=lHYi82caJ9FQwefvjIk9Fy2sY8mQyBpCI77tCurjN7nLzmJ6fEVaN83VLiHKZ9s8S6
         87SJySYWNxtopGv3xhnWxRvCyrLGntyr+B9SQrVFPr4jm5kRnORhjYXXkzTUMuQhLIqG
         aiXeL0JkL3MCltpqsVgNLG86N5jgwcUIr/f33vw6ylmpz93ezw7Beyh2wPeRDtgEt9Ee
         e+Rhlz75w2Fkoo1TmVvXi6yCF4TThnp3HNQnrnvVllt/DMtrQa0Y1T+2kSiRDC+hcZIa
         4/rSkXakS/TcxMxHAuFhbgpFTDosFoA6LMMt7v0DqEKmJFord3bJZwPqun9z2MISMWWl
         GxBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
        fh=KCKGAWwadU0t3zMKPZ+xaLMKaTEai/ArD6yrtuMjD5U=;
        b=TnSH1wh3voXbd8qFyZwit6I2E/Hc258albGsIVYDLkW0fhJs15zsWdi7nUsDEpwmM9
         ulDbXU04W6ldYnzJP+ZQeCKD7U5C3nevBvh+OlF8wIiHh/d9nePsrjK7POhebkIV6t0a
         n4fInNe03urHskgnPfaWayzZuoA8F+0A14045dfr2u9Dbra0bm/azuD8hdujY+RNlerI
         j5z5Zb/tLBsrBVuklbUadufyfn/El276UJvlFSCrgKkq58r6pjbARMpcdwJeeyukH/3e
         0W1jEhdRNk1A0/v0psvMgq547dnKLWco50gd6AOCY59gHexZWF5Bza/aW0P3s8rL5qf0
         rCAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795101813; x=1795706613; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
        b=SeX8fOWjQJIV2pEi9TjXbUg7NHCa606F9dZiKfllCGcnY+yjr60d1AByGxwsgPIcNt
         oEyt15PIVcwwikBvQtivm/Nl2Ca7kF5cXPvN0AEHmwrBW/57TMG8WV+7Edrd/T1AkW9F
         hKP5fEfFdZ2jQMsjKs8SqdJCaNQ8JC8DUvukyIt+jCuNdBKEKG+5R61sUzdbP/wEjga4
         0Ora4i4VP4a57mOYLzY36lq+571MBB4X5X/dndmesWel68MYaV7AZByKO2FXUXl/ok9n
         sVnFwSmR1GMNMyuHrrOUOfIan69gL/j9kSYUOH1Re2n/zGbuHcXTDvj1dDoE2CqUOmNu
         U21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101813; x=1795706613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
        b=tC0r4DNtR8Ms/zNrrLwwwozKK5Skox5xuTd4uOK64Z5R38e6lToAG8fYl/tcDIutp6
         WkyZX4sAvoLaucXGCzdVfh+sAeToih/lmE7CUEYn1C6aLkhqTt6O3ZTx32hJIaX2incz
         Kk1LGbR9LkpEolMLuWUnATvrdOvF7OqL9DRFcrX9CFdRTKJQhbD5hZrlpWnYBoyCouvi
         TFDUo4c9BXnBuuqcGcjhxCVjs00wpr8Rt936XUGds7kU+IDotj+9PU0yaAalNXJztnrw
         DcHrFEyMw5wipsjPXMnQx1sPxWLzj3V/MsmI0oLALyHBx4xo+t/qEtW+lyFNg7vzMcgc
         kgRQ==
X-Forwarded-Encrypted: i=1; AL+hErEtZcH9a71rGCo86724LF3ytFNt9sgHQnRIfwfi6k0vT39Y2QpXfDQ6iY8SgCYK28UyKbae2fQvmf2348KVBBG/@lists.infradead.org
X-Gm-Message-State: APuU4Z+BrIwFxnwX/5+AvdqzAyLmjAy3Et/iD/eBQ+XHMTl8kN1EzsH6
	EzxuBMnWHx3A5d1Zmkv5UF5KFT4560mS707I6FuqgbITFkdolfUd556S+7n0bpc7KM0z4HJOjVU
	UAaY1TF4oABBpCyVZsnNMEopU6ZsDjsFs5cdctRKMGg==
X-Gm-Gg: AYBFou0JVs1NdTq8U+hntxHU9nZ+A9TwC9HcQUG65i1UY/UEsjvR0sbJVtKqX6CImbc
	TydToO9xQBzpxayI32dfkf1lh8Wdb4kKJSBxgluxZJPMz3N5Ry+DXxaKAerwy74OflSsYu9To8L
	gtTa5KP85pd6lHL4GpDV+ZwqqXctygon3pJBh1B2daXZXqo14RXoLNlZJI+tgppXh7P6GwPt94w
	C7kY+CXGEvgP7UjAMvNQ14aYvH7YpuwZvpRBmDhs5qROguUcOuMaxuVW8VLYPEk9//PnD8sEA5g
	wV+TFQO26aWLC7l73epc/yVV9428OsnF4xKqnAaTmp1DcTz//dRDlvhJDjh9PcXW+H03zl8anj5
	17n5Ml1fXNTzCUxoyL5J9wFioFiuJwxzqA9uxoWrKLUGQQ03wHhpcygRlmq3l0IbtyUjsaOJA/k
	eIWLJMl4jFOW4hqhPwTKK72ihKSdPMxvFnjALRjp3mgKi9pjedBqPHlaE=
X-Received: by 2002:a2e:bd05:0:b0:3a6:6d05:7375 with SMTP id
 38308e7fff4ca-3ae7f9d5f2bmr884941fa.8.1795101813092; Thu, 19 Nov 2026
 07:23:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-4-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-4-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:53:20 +0530
X-Gm-Features: AclHuK-bYeekeWya8STnw2Y8eECaMfbCySlAAK-yinBr0JM6XHZ34xL9AEfbGuQ
Message-ID: <CAAhSdy3TtQCE8Fa5FitihgSKewXLApPOOhWHU1QCw=6F-P_4=g@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] riscv: Add Control Transfer Records extension parsing
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_072336_243048_466AB046 
X-CRM114-Status: GOOD (  14.41  )
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

On Wed, Nov 18, 2026 at 3:21=E2=80=AFPM Vikram Singh
<vikram.singh3@oss.qualcomm.com> wrote:
>
> Adding CTR extension in ISA extension map to lookup for extension
> availability.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-4-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  arch/riscv/include/asm/hwcap.h | 6 ++++++
>  arch/riscv/kernel/cpufeature.c | 2 ++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index b5952db9259f..ee200d8cfccb 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -126,6 +126,10 @@
>  #define RISCV_ISA_EXT_ZIC64B           116
>  #define RISCV_ISA_EXT_SV48             117
>  #define RISCV_ISA_EXT_SV57             118
> +#define RISCV_ISA_EXT_SSPESA           119
> +#define RISCV_ISA_EXT_SSPLCOFI         120

These two does not belong in this patch.

> +#define RISCV_ISA_EXT_SMCTR            121
> +#define RISCV_ISA_EXT_SSCTR            122
>
>  #define RISCV_ISA_EXT_XLINUXENVCFG     127
>
> @@ -136,10 +140,12 @@
>  #define RISCV_ISA_EXT_SxAIA            RISCV_ISA_EXT_SMAIA
>  #define RISCV_ISA_EXT_SUPM             RISCV_ISA_EXT_SMNPM
>  #define RISCV_ISA_EXT_SxCSRIND         RISCV_ISA_EXT_SMCSRIND
> +#define RISCV_ISA_EXT_SxCTR            RISCV_ISA_EXT_SMCTR
>  #else
>  #define RISCV_ISA_EXT_SxAIA            RISCV_ISA_EXT_SSAIA
>  #define RISCV_ISA_EXT_SUPM             RISCV_ISA_EXT_SSNPM
>  #define RISCV_ISA_EXT_SxCSRIND         RISCV_ISA_EXT_SSCSRIND
> +#define RISCV_ISA_EXT_SxCTR            RISCV_ISA_EXT_SSCTR
>  #endif
>
>  #endif /* _ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 72bce616491f..b3e3c30f4c8b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -652,6 +652,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
>         __RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinux=
envcfg_exts),
>         __RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
> +       __RISCV_ISA_EXT_DATA(smctr, RISCV_ISA_EXT_SMCTR),
>         __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>         __RISCV_ISA_EXT_DATA_VALIDATE(ssccfg, RISCV_ISA_EXT_SSCCFG, riscv=
_ext_ssccfg_validate),
>         __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> @@ -659,6 +660,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinux=
envcfg_exts),
>         __RISCV_ISA_EXT_DATA(ssqosid, RISCV_ISA_EXT_SSQOSID),
>         __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> +       __RISCV_ISA_EXT_DATA(ssctr, RISCV_ISA_EXT_SSCTR),
>         __RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
>         __RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_e=
xt_svadu_validate),
>         __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> --
> 2.43.0
>

Regards,
Anup

