Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D043606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mkRJTlC3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJ9iEzpF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eQBlPzsdCnXUF+GyLfk4qn4PYlra+1Sjq9ndrbvDC2w=; b=mkRJTlC3mlxnvDR7u2d4Xf/Kx0
	eRDic/nsYJhNsORA5KuEKEBdl0WSRx4A9/xk15TjKi9mgQVAziW54lvg/s3SFCGK0zBjYssKKIiDy
	dkhpkimTXnwQgXrQYH7uO6aFs+4PbzMBESe2qbJXPoiu/QFk0O8yRfISK+P7g4oIXYCTLoGaraOrl
	JiPPmyP1mi1H4apytGJIK9EcC+9RTdyhTwFIu0+qZiDqoWo8Ynqg22uQYem0JXHevtpvuW+jsN6XP
	jiw6/f0ILgYepoeHTaCPRyqZqyLYPa6zWAS0hLGjyPQilHTveA0+K0FWuD54fEFBtyER7LCWS/Zgx
	VIFWbpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpNA-0000000AWoz-14h6;
	Wed, 18 Nov 2026 23:47:28 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpN7-0000000AWoK-1gNs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 23:47:27 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-67db6d4054eso1725611d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 15:47:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795045643; cv=none;
        d=google.com; s=arc-20260327;
        b=WWA9KsSyt7aJvE8jSPE2PfUM2LcfVpbijOrMPbwu/SKhc3eQelCLIhD/C57ufmLWAb
         F8NrO5K5KFc1PzD6RggeL078vEYjRaAFQBVVxJ3e+TjqXRHQwY6fA/SP4VSL4SGC2Yiy
         nYXahs74tZxSo4pahPdFF0sqWSZxQBIqtmP8I4msrsXRk+X3K3HW2CKNQAo5OZqx6pwk
         OOokdxMrrMjxoqwTbD+kBfmU7h9QY4gDjeWfQ3aWcUT1NZywSB/mOvGSeut/43Nr59dg
         X0jASeinu2E4k4xoFXZnXrLmze4zjQd5zx/15xkvJfs7KpBEg7s4aj3oGLDnPGRnSslU
         69yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eQBlPzsdCnXUF+GyLfk4qn4PYlra+1Sjq9ndrbvDC2w=;
        fh=3e9hc/XhdeqZDzqeTh7qRFKdhJF19C0ZWeR1i1T+VYA=;
        b=Oo1O4BKUDThGdX0w5gCyo6tT3SJF8mQiSS7unEhMvXAXTfEOFaO+fI5x0EAfDe12zK
         sGarsVSGMuu0fup2WcLnuWC0XudSrb91Tfv7zFQfoH7a/UU59HTyBCb8DHQuHzhjGJ7o
         7yOu4ZghlKRaSJevSrdYdXjalEQqNMO43mCGQFyrKSgEx4oA1fUEury9pH+ZfCCmKoQe
         9F8iBMxLkjmqA35kBvDej00yDqmZKTWXgXUzxmUZYjdxoaHWgpbX7NjfvHU3kH8R7ooa
         qs9IX3A+H9qqR+rTCnUEdwhupHGnhJRiCEmzpsfH3MQ/m1GIUfS/cg1tvq6Qnc7UN2J/
         ONig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045643; x=1795650443; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQBlPzsdCnXUF+GyLfk4qn4PYlra+1Sjq9ndrbvDC2w=;
        b=mJ9iEzpFUdxli8L7UjGN2Cmev026j+eTrACfEgPkeeNDmKIBF4wOHOVsQroQUSgLFE
         96wjgNSxm1NsdFlCtUASeN8h3M2V5cHBYh7WUiiUlAamE5ifK4QlUYhDNQjvVrjf2YYG
         J/YZ8GHKpXdByZbWupHcK9IxYxgDgMBiPWbuTHEWWNKzBOqdAh9AquJ4fo+s5zjhAke9
         DaavQHLbvozjZw8XjhaheO2hZoVsu+aKL4UrgeQ89qYPBz5dKSAg4g1B3UrGnD+akPTJ
         qLt7+YAjTMS1NckFu0fnjDqnk0a9O/avbSGSFSBZyesbyEgWyrmZ5vLQOhYNAqSBpIJo
         PMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045643; x=1795650443;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eQBlPzsdCnXUF+GyLfk4qn4PYlra+1Sjq9ndrbvDC2w=;
        b=BYQPpHLzgFkDOVkQ34fMeqGYska0ZhNh/SxSnq0aQpmR2C/MbWAbj7nb4UlGAwNnoL
         1Q47UzchxpidbM/gqLYx2IvMc8P0DtB6RgxM46T96qbq5b6hnBOeT4nMXKCAiEfh+hlv
         eedu13SJxdorPIWeFn6kNB9NmAujoH2KXNQ0WIA10AJn2HGK6zUfM4yty61snsfQVjHF
         yC7ghyNOGdpasLveTZcdNnl9u7v0HvF+YLt9lfNVP/plUSHWJ0MHpll2gOcPpEcjHHib
         pjC3YBmvKF5bmOzC4MP7sNggmqSh5ihG49j6xcCAm/AHq45frm8JanNTCLC9ZLKI2ROG
         3wfw==
X-Forwarded-Encrypted: i=1; AL+hErHQgR78USjvlp6Du4S601lMSt++huV1+tTtiCBHuRcAef4xoTPzVGSg1GVru3m13ucrenLmZcrClnQZOVlZvjrL@lists.infradead.org
X-Gm-Message-State: APuU4Z8J7aaKj6aXq4G6CeSG9qd/UFILHDAPupNz+d6DcPxgSuxw5Kmj
	7ILQg63LWkqYbPxdtKMvBPccys5OlsEYKm3E9hWqHgajB2L2SDmtLdGiipOhH5sysZS3jhA+JBM
	ed/R8S5578Mh1WcmJ5ecjS+rSugrv9Ls=
X-Gm-Gg: AZFdTZcqK/ku5+fI9WvLyggrmBx8r6V1HHTq6kx6V1/fvuTG73Qn18EvU+KLmM3KTub
	VBzh966oQGixuO4DJMD/3YAQ//I8mYJ7HF8gcptsPZhQVLfBg/HEyqa9LYax68Z4fMZhKwL+9LA
	lAZolOKzqCjuej/8odAbnjwPWybo6NIkdhtbw0Cj1bDK5S5G53dBlXX05aeiVHfVKg3CPYjfF4M
	eX5fImwnh8obIXhg+qxDJD/1+oKgClpy+QtlT6ueMelVPl3YJnK1EPf+EqIIIj4kX3SJkfGBPyo
	BTerO9DUG4glCCsCbL88Vgh2Fx3Wf6565bg6wHizhFe/+zAVRZD0OE+0NCNOLAsSkhJnMgZLe5K
	ceVoOwmnTMqMkcld2N8NxpNFciyhp1CLpKNFwta8YhW2Ih1n+rPsHLwAFbeJlOX6EHwzYJzGjzy
	QDALxYFUTd6teKRy0Lz7tzIWEUNf5p8tWEpqowekIsJK+nWKFk/FR+sO51QwHGwWi9bTJJwZcdT
	QW95J4=
X-Received: by 2002:a05:690e:43ce:b0:67d:b262:92f8 with SMTP id
 956f58d0204a3-67dd3fdc0c2mr1270228d50.46.1795045643596; Wed, 18 Nov 2026
 15:47:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117222224.1465328-1-arnd@kernel.org>
In-Reply-To: <20261117222224.1465328-1-arnd@kernel.org>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Wed, 18 Nov 2026 15:47:12 -0800
X-Gm-Features: AclHuK_2KS4BekP-0pSMj9w4NCC-36T5SpqBDjBsi3PNo1diUcnpEXUOY_hCT2A
Message-ID: <CAE5sdEgtUDxOqnOHn+Z8PE2xgA7khft_62J5KOH824SiviUNoA@mail.gmail.com>
Subject: Re: [PATCH 0/2] st64bv0 support in iommu-sva
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
X-CRM114-CacheID: sfid-20261118_154725_476832_68D61737 
X-CRM114-Status: GOOD (  17.38  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026 at 14:22, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Hi Siddharth,
>
> Here is a what I came up with for enabling ACCDATA in arm64 Linux,
> similar to the earlier patch and rebased on current linux-next.
>
> I hope this works for you, please let me know how it goes.
>
>      Arnd
>

Hi Arnd,

Thanks a lot for putting this together and rebasing it on linux-next,
much appreciated!

I'll review and test both patches on our hardware and get back to you
with results/feedback before this week.

Siddharth

> Arnd Bergmann (2):
>   arm64: add HWCAP3_LS64_ACCDATA
>   arm64: dynamically enable st64bv0 for SVA
>
>  Documentation/arch/arm64/elf_hwcaps.rst |  7 ++++
>  arch/arm64/include/asm/cpufeature.h     |  5 +++
>  arch/arm64/include/asm/exception.h      |  1 +
>  arch/arm64/include/asm/mmu_context.h    | 17 ++++++++
>  arch/arm64/include/uapi/asm/hwcap.h     |  1 +
>  arch/arm64/kernel/cpufeature.c          |  1 +
>  arch/arm64/kernel/cpuinfo.c             |  1 +
>  arch/arm64/kernel/entry-common.c        | 11 ++++++
>  arch/arm64/kernel/traps.c               | 52 +++++++++++++++++++++++++
>  arch/arm64/tools/sysreg                 |  5 +++
>  10 files changed, 101 insertions(+)
>
> --
> 2.53.0
>
>
> Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> Cc: Fuad Tabba <fuad.tabba@linux.dev>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>,
> Cc: Catalin Marinas <catalin.marinas@arm.com>,
> Cc: Will Deacon <will@kernel.org>,
> Cc: Mark Rutland <mark.rutland@arm.com>,
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
> Cc: Joey Gouly <joey.gouly@arm.com>,
> Cc: Zenghui Yu <yuzenghui@huawei.com>,
> Cc: Steffen Eiden <seiden@linux.ibm.com>,
> Cc: Yicong Yang <yangyicong@hisilicon.com>,
> Cc: Zhou Wang <wangzhou1@hisilicon.com>,
> Cc: Navneet Singh <navneetsingh@microsoft.com>,
> Cc: apais@microsoft.com, rlmenge@gmail.com,
> Cc: hargar@linux.microsoft.com, kvmarm@lists.linux.dev,
> Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
> Cc: linux-kernel@vger.kernel.org,

