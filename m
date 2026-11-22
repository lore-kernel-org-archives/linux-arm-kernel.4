Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB02606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 19:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=159eugvz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ssGMY0xY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JaMj7DSQxOsWfySVjl+8FAo+oR/C5pxC4TqOkn9ph7U=; b=159eugvzMPaUElqGfuplwok28d
	EdHr6MwXEaW0kLBP/2RjXvi3nJxSdNH6/HMq1q+ngoNmowY0hQsre887ZFfT0H7tGLjiMDlLf5eD0
	YeHbl+rt7mpBVcrukno74Eq9/BjUzPX2ZSb0H285N9OB0JeYCkpnT578m9HP/Md74Axeo7IiSodyz
	Ur2BpLgwrAe6IzZf9lBF3nD/SINlfAujrztVpAnWDsua+vOchbwwjHDw3x3PLxeJq5yXYvullVG2p
	b9C+tHgPx5/dzDsSuoaW6U8QLsxjAFcLehSmOKuCxi/Bi8iJihvqolglyWb7FH8iuzEUa9xKYhcfc
	rUanDIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDSF-00000001fH4-0Jga;
	Sun, 22 Nov 2026 19:42:27 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDS9-00000001fFr-0AH9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 19:42:25 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-67be1e468a8so2310803d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 11:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795376539; cv=none;
        d=google.com; s=arc-20260327;
        b=NmPAF3UpOdkz/EXRWhr5ChjIe9SXeSYlHynGnqJioDmT9LOhX4qiBVsU0omv6L1mlM
         m+sD8Rag7XZSr0XRK/iV6EiJN/bznhjNiMdPnTlas7g5lpU59b6g1OqpdECb3VH572hL
         Dslg9mxz+7dwajWph4r/1QGuPszhhym0Cdzkm/9xQIK2MC73EO8eN8/iOQWz3Mpsol+t
         6DANTSXVuuA5Dr5Vt9kgiszpI49uyH5jATtInUk5CXj9ARzYYEjZ+MwWace5X1YLkkfv
         cpLjSd5Px3gznFSq2FKbnpsQhRfZYwpXZmKcK61ghwLTDn3Qf9lcDP1q2f7RAI+Uzu/X
         rGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JaMj7DSQxOsWfySVjl+8FAo+oR/C5pxC4TqOkn9ph7U=;
        fh=hcsc+BRrXvMUZVF//LNxhrIguN1o1Cgl57ZJ2nqREqo=;
        b=qajUMR0DY1SZoJQtsUx7USeOg2I+Q7C+lzJiEhZTpxhYbKlvqYrnbBuj0Og9FHLyGm
         pVGVYHIZwoEujsOMdy2wj5yNp9Ued49AKnqhuAmxkyb8008NWrUOPYtdXcHbp1rq2gUB
         hZ9UNQERjze6CQvhtQjddzqyGfs3a1/QmoXELpNM0Ros7gZc0DwsDovNJETKE+HSHNRN
         Vnw4esiqlYEGc6Cqlk5y/X+9AerO/UPkxDQyMKM/G9+3O/aOMfVp4yepXqr56NJyyGKf
         rYbCRbeAozqloi9YH53B2Oujk4Cgkoas9MocEVyaVxPDLVRciO4y2hKdG4O5Mzy6T/0a
         0mrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795376539; x=1795981339; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaMj7DSQxOsWfySVjl+8FAo+oR/C5pxC4TqOkn9ph7U=;
        b=ssGMY0xY/+VU/Qx3c96C38XME9z3P7xBYgQpt67K4KKuhNd26tFkrmpf7bnQDmyzzw
         CFshLAJW3fr7Wb3TKD0hyfNl2FVuRXDcIs0WplyEqCJ3iPdWkX3pX3UJo7sklMmQOsR9
         iQFPWoPjzrJoANE9lz/qHCkgDDW6rmVWJ8nb19jOB++J30WHbafxCqMgxq7nKvnmq+rA
         MjT4C/YH9EcjkbJqqJ6doUCWW2B9suHt20js+BsrG/+/UrCoEork/yzrhqZdQ+iAfUE5
         5/KNWTdQnaGAuJdHSlZA25iEkVRofnwO1hngJKrf07p6o+Oue1HVBCmwEdSUETQbW25u
         GcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376539; x=1795981339;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JaMj7DSQxOsWfySVjl+8FAo+oR/C5pxC4TqOkn9ph7U=;
        b=1/l4LhDvo+BYPzVRa5HGfMD8CWRLGGgbD46McsEOHuhXwwq8NankquoKMWpVnsxYJZ
         z6SmB6hiVb5H7yUuyu2QKSZe/Ntbgzl4tG31QrBf+97tMr1WDNIMsxGDVy2vymg9VBVV
         ahICavCGBc0JYxmHSXIGBCgPEKo1+VHOtHpqU7WDVc27Z40bhd+RtRsWtSKh2krX+7DJ
         R6C7Ks8zq4Mx4769+CFQSJA1o4aEvORzKIbd1DeGERnFO9W2tByvOIKXYOR7PPuj2mIh
         oF5J8foBoB2PxuiYfZLtM8s+E8eBg76oI/VNHu/GfqawEmJ6EVWoL60AWTUANADRuokR
         mtAA==
X-Forwarded-Encrypted: i=1; AL+hErFiV3MJHJ6ymsrRlw/PTyy9pSeagUy62tGRLsugr98r9l7V8NHTr7Ca3mgqz8zpO7tIAK71L6DpSc82A+X8hnuf@lists.infradead.org
X-Gm-Message-State: APuU4Z8dKN+utJw2GWMY2SC7ZWOJ/9aJqK7osIUC2VZ7DvUc8ALNdIWR
	l+pm7aQzgV1SY6rfdEbVYFMROqyykTmvvPZ+MYx0WnCflIOTRD1jqhrv0vl3LHRCw2j2hMWMR1l
	xiMFJ4MveifpKc7EyNlJ1/M/nTz0h5lg=
X-Gm-Gg: AZFdTZc83kmKzI3wjN1W6e8tpsxQOwkwGFUhYnCC1fWkNKTAZfZDgs1y9+yJapqjjis
	2n0F5qW9FS03GFqhfd4qkbp4mmn/Hv1sbgHuwzXbGIj1Un/5RYQ/XNeNcsRoVJzl84kdKzcYRBV
	PqwM/Q3ni4ml5l3msJlaj/mL5fUH1ee63momH8k+vhz4+l/YdHQS+B8suD0qYmKTpi83TQLZeRQ
	GyXXuPFyu2wyOtrROk4xkqKYTGjbIq7mlqySXd0EFTjU9ctviAkpf3uMzW7mYGgELG0uiLWCCDr
	+AlMEeTzb+gVJIi6883I28aci6IxUHd+Af9oH6e9TbDK9XRGKg0Q9Cq8R0Sp5p5xmJR/jcYMIZX
	UWevdN4Tuke25hjoA78YEPTbhb8nSZxaVXAi6yCloRjbdz5H1o0tQaros+BQff55JqQi0QprLaM
	LTsWMmvL59fezMtjvj7YoS232eYYZKRCqYNajWqheJIBk0idJZMuO0TdkGgtn5Jbi39PXZFDwIf
	f/7JXsNzg==
X-Received: by 2002:a05:690e:1508:b0:67d:a57b:aa93 with SMTP id
 956f58d0204a3-67df448b47bmr3072488d50.97.1795376539312; Sun, 22 Nov 2026
 11:42:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117222224.1465328-1-arnd@kernel.org> <20261117222224.1465328-2-arnd@kernel.org>
In-Reply-To: <20261117222224.1465328-2-arnd@kernel.org>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Sun, 22 Nov 2026 11:42:07 -0800
X-Gm-Features: Aa3M54rGSfhmBnOjNHZCXlTHs3QWw1coAt53gmc8CIX_0C5jk10mHzHBcQ2m1ck
Message-ID: <CAE5sdEgMSSAnZ+XM+03BfRS4_nZDxcp0hGMPJJWCa0PcGwNwDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: add HWCAP3_LS64_ACCDATA
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Navneet Singh <navneetsingh@microsoft.com>, apais@microsoft.com, 
	hargar@linux.microsoft.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_114221_094613_EA9996F5 
X-CRM114-Status: GOOD (  22.99  )
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

On Tue, 17 Nov 2026 at 14:22, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> LS64_ACCDATA extends the LS64 feature with the user-space ls64bv0 instruction
> and the EL1 ACCDATA register. Like LS64, it was added with Armv8.7, and it
> roughly corresponds to the 'enqcmd' feature for shared hardware workqueues
> on x86 CPUs as described in the kernel's SVA documentation. [1]


A few small notes on this patch (the first three were also highlighted by the
Sashiko review [1]):

- Nit: s/ls64bv0/st64bv0/ in the commit message.
- Should this come as Patch 2/2 after enabling st64bv0 in the kernel so
  HWCAP3_LS64_ACCDATA is not advertised to userspace at an intermediate
  commit?

>
> Userspace can check availability of HWCAP3_LS64_ACCDATA to see if the shared
> hardware workqueue feature is possible on a given driver.
>
> Link: https://www.kernel.org/doc/html/v7.3/arch/x86/sva.html#enqcmd [1]
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Documentation/arch/arm64/elf_hwcaps.rst | 7 +++++++
>  arch/arm64/include/uapi/asm/hwcap.h     | 1 +
>  arch/arm64/kernel/cpufeature.c          | 1 +
>  arch/arm64/kernel/cpuinfo.c             | 1 +
>  4 files changed, 10 insertions(+)
>
> diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
> index f60ca5612daa..f63035696654 100644
> --- a/Documentation/arch/arm64/elf_hwcaps.rst
> +++ b/Documentation/arch/arm64/elf_hwcaps.rst
> @@ -478,6 +478,13 @@ HWCAP3_SVE_LUT6
>      Functionality implied by ID_AA64PFR0_EL1.SVE == 0b0001 and
>      ID_AA64ISAR2_EL1.LUT == 0b0010.
>
> +HWCAP3_LS64_ACCDATA
> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 >= 0b0011. Note that
> +    the function of instruction st64bv0 requires support by CPU, system
> +    and target (device) memory location and HWCAP3_LS64_ACCDATA implies
> +    the support of CPU. User should only use st64bv0 on supported target
> +    (device) memory location, otherwise fallback to the non-atomic
> +    alternatives.
>
>  4. Unused AT_HWCAP bits
>  -----------------------
> diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
> index 10272ddb4d6f..c85c445275f6 100644
> --- a/arch/arm64/include/uapi/asm/hwcap.h
> +++ b/arch/arm64/include/uapi/asm/hwcap.h
> @@ -155,5 +155,6 @@
>  #define HWCAP3_F16F32DOT       (1UL << 9)
>  #define HWCAP3_F16F32MM                (1UL << 10)
>  #define HWCAP3_SVE_LUT6                (1UL << 11)
> +#define HWCAP3_LS64_ACCDATA    (1UL << 12)
>
>  #endif /* _UAPI__ASM_HWCAP_H */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 952f70a48190..bbd809c83a6c 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -3226,6 +3226,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
>         HWCAP_CAP(ID_AA64ISAR1_EL1, DGH, IMP, CAP_HWCAP, KERNEL_HWCAP_DGH),
>         HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
>         HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64, CAP_HWCAP, KERNEL_HWCAP_LS64),
> +       HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA, CAP_HWCAP, KERNEL_HWCAP_LS64_ACCDATA),
>         HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
>         HWCAP_CAP(ID_AA64ISAR3_EL1, FAMINMAX, IMP, CAP_HWCAP, KERNEL_HWCAP_FAMINMAX),
>         HWCAP_CAP(ID_AA64ISAR3_EL1, LSFE, IMP, CAP_HWCAP, KERNEL_HWCAP_LSFE),
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 94e6cd211d70..009de5255d2d 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -158,6 +158,7 @@ static const char *const hwcap_str[] = {
>         [KERNEL_HWCAP_F16F32DOT]        = "f16f32dot",
>         [KERNEL_HWCAP_F16F32MM]         = "f16f32mm",
>         [KERNEL_HWCAP_SVE_LUT6]         = "svelut6",
> +       [KERNEL_HWCAP_LS64_ACCDATA]     = "ls64_accdata",

should we drop underscore to maintain consistency?

>  };
>
>  #ifdef CONFIG_COMPAT
> --
> 2.53.0
>

[1] https://sashiko.dev/#/patchset/20261117222224.1465328-1-arnd%40kernel.org

