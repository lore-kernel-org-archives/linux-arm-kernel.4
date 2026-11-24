Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25016606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l9ji7fyX;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GtHMGYxX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fmRjng6hQJCvW4o5qFMAqGU6UlP2DM+1YQfuEhy2UvA=; b=l9ji7fyXb1D4ch
	CRALjmdDXM1T1O8ZtoLnvyZ9akx39mCouYmbxco/jMWgdl4/vCtzpzOmrcDDJRmoxJwB68S7GW2rY
	xrqbzQ9ohsVRPEdYP4VP9qMom1uNYQhcloH2MZwQ0UUB0X7N7tGw15I55oQ20XiuehHMbh6ielol+
	W5xWzUD4iRIsmz5dlV9O56WUMmAYdMRo6V0sbUEe3iWF+8bjwSSBJpEpAdTr72NQOCqGWv9/LN68w
	l5Wc+Nm3UoMczI+/V3qydLdOtnnFkJ0RQXYHAX3LeROl/noabT2xO8V8RwrhUCtBBLoG19LWEzGQY
	UGhoJnje57Q5q+GEhwsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwLS-00000007biL-1QBm;
	Tue, 24 Nov 2026 19:38:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwLP-00000007bhr-2YnW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:38:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2604208f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 11:38:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795549100; cv=none;
        d=google.com; s=arc-20260327;
        b=s7d+tzORqOWrO0PGKma2T2s1LROxw6iyTrJCeTDYvrHF8OIgA760Zj1L6BaDUWKfnH
         Pv84FqxdCNL6zAZL0eFYgNW9sa98/zgIZT3Ir/gZ3xYY8KDBrLiOiUgXM+ep0OqESmsh
         9/B1EDQeeaD2JYQT/vwIIiJWSdcDOLubc+a/5PvXvmQZMrD7xIeE+876nkUaG39bE16H
         EZ31n/Zm/KX9N1czk+TBT1zT7usfFCNG0ohC4S9moryR9sK0vka9xhwmTW1ExC+ULa1w
         m3sU2oYUIAyoZcwAAzuGoCBIdO1MZgz+rOOvAH8hD374V04CzUlHObJfXJiZuTDAppSq
         2P8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fmRjng6hQJCvW4o5qFMAqGU6UlP2DM+1YQfuEhy2UvA=;
        fh=98fgLeYrjo5xwdl9RmJBa4d1O3Kqvv0SEtOSclHKFLs=;
        b=IZM6k6dMxEaHih3a+4w/n7FdpjzassTpfVX4uP65YurxFpTatBfin7UK/X9TlM9HDX
         QJyfNBRnlbWySEurHtzv+QLdRd498KJ+fnygzBj5uDTYeScOGo+Gzzh3EAU1ClUqiNJ2
         3X/7AthQrHsYZYiQEavihfCh9yi7snkMn2YUtfY+G6KXl2J/Vo559hrxBRzh9ceSs0n2
         7ciO/l88T4lXDp+Z877RGFm4th6bnrXxHdaLFouhvTuM4Fsc24bWTbC+uzxKafT5hxqW
         cCd+WG+xVUVGXudhOVxyUV6jTD+nUh/EEIuTnUv7b1/yHV2pQGk0hYxbFM3fXP/4Il/e
         7ERg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795549100; x=1796153900; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fmRjng6hQJCvW4o5qFMAqGU6UlP2DM+1YQfuEhy2UvA=;
        b=GtHMGYxXgnwONUc49+Kpv8yjASrQTmql+jCg/9aMC4/s/HSBcrZVnJJuWboSZB4JF8
         fxAoozaCLiKSffRSFzNUKY6+xmNATXB+SrcmKRCgwLNCa8M34N+j4hEVw0BNgif1lvF/
         piBC95JTTdKLVNqXdCeZui/XrsXRRn+nmJU+V6Rh+NvTgXViDrz/qE+l+I5YZbDJtLre
         Gx8SUE0TrPEqufYTzcJqOE9GGwhID0k5BZ/m2SU75/HfAuo3hDRAiq6a18q84vIdS+Rb
         YQ7ezS3N3cJqrbkWcOPWRLJsJVCEa8T8+dlIGMERirG56HYYIk0eug63eN1EQgR0dg3B
         1GYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549100; x=1796153900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmRjng6hQJCvW4o5qFMAqGU6UlP2DM+1YQfuEhy2UvA=;
        b=O+2Obd5ohqf7740jOKkkzRcQxZ7Kjj6S1YMbEZaIwoQAfcLu/RMYg51ft7EUKBUUzh
         Fy3cw5fkUbHgN0OoiDIIJCp/Qopi+NryflX6lW4gFUb1KqSISsUqcjtvuS8ciMjkOMnX
         AM75JEeHP6riv3vYNyuZKNnlTB2Z4QlgSZ2B5KuNomwr99OR5JdQ7KDUPXAzbgfzpEhj
         /S828FC7mmCuSrL21GiTtjxsINDQqUOex/6cQFHgBkqnrbE7vBJ2dmVlOdRqaXE+vjfZ
         25vKSH97OWLtZbrXYTC9bDwkKhBucxU3A5Ok0bsyDDT1DA0fjbQrtcq4tMD1DxCOgIxU
         5jsw==
X-Gm-Message-State: APuU4Z9CDoCDnLZxMhRHVrRUdG4520wNATYdQbAcMfGoDgLvQT0gq6/o
	okvDdMo32WcZPw0/E0HaEpFIErjxKszAAmMv+AMQHwlWyicb9bqyc5vLAFBi4H2kc8AuLt1sfOs
	CanCKdR1zCYFBgGZ1Ry1aj85SzvwZiAOjqBIu/GpQ
X-Gm-Gg: AZFdTZfkJggJz5UJGqJUG09m0ZoF7vrgJVMoN4vPMUpxB2dzphG+MkHIdyHbehvIEQM
	QqSvGWn4jayQx73soe3jygGydWm8HGO46dJqUH2bzsrZIwlNbgWd2nTUoNoCW1+n7KPg+Hjur4h
	pwfXyOWUa3nkVFReOhOPMA9hE5d3pgPTs4Zu8k70FOWn8kClWy5Vmg6+GvYGy+nEegncdfRN4JW
	mmWQy9TQDxhjp4QUt6O/nB+GuaehdUfeomOAylWYMWiFVHaJPsYdfE4nH9L0IdrPirO5F6Dw723
	RF6OAmRkCxh8dMKSPKAIBS1sOV5t/sXlTv453BYgTgmlsMreycTGczJtGLoYZbYDeQ8oLFodNG1
	Zum8tzFTHw995FIEtCfXwJfSm/JLH+j3F3e9h45ZGs6BFvh66SmGNulA1FlQXRyzXy1ModxzSHe
	fYQjQ4MX7ZY/0y2zKYA2mofuDw7m2XZYLIg3KcCfr41PH1tjqqsBaMrEJpVAHQcFvb90DI1hrh+
	bfZXssztH7AmiKASiYrB2oiuzTBO8XG+amS0g==
X-Received: by 2002:a05:6000:4283:b0:492:ea10:b073 with SMTP id
 ffacd0b85a97d-4abaf74016emr29464499f8f.18.1795549099956; Tue, 24 Nov 2026
 11:38:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119165825.1793558-5-ardb+git@google.com>
In-Reply-To: <20261119165825.1793558-5-ardb+git@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Nov 2026 11:38:08 -0800
X-Gm-Features: Aa3M54q5AF3TLEx2wnbJLaD3oWTr7I8sNngiCqnDcNr7ZHctiCMTo5xgqxYvh4U
Message-ID: <CAKwvOdmMsCgBuTnMtuDeTzxUqN5fX6pQz5CJ5m=U==DAboMW9A@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: Combine module .init.text with .text
To: Ard Biesheuvel <ardb+git@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_113823_663967_0550B7BE 
X-CRM114-Status: GOOD (  18.73  )
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 8:58=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> This is a follow-up to "arm64: Implement support for BTI veneers" [0]

Forgive me for taking forever to respond here...

Does this series supersede [0] (i.e. I shouldn't spend cycles/time
reviewing [0]), or compliments/"goes on top?"

> which adds support to the module loader for indirect calls to functions
> that were emitted by the compiler without a BTI landing pad.
>
> This series takes the ppc approach, and simply combines .init.text with
> .text when loading modules, so that cross-section calls in the same
> module (which may originate in the same compilation unit) can never go
> out of direct branching range.
>
> This makes the BTI veneer solution unnecessary, and permits some other

Sounds like it supersede's then?

> simplifications that were added, even though .init.text and .text rarely
> end up far away from each other in practice.
>
> Live patch needs additional work, so BTI remains disabled when live patch
> is enabled. (It expects to be able to make indirect calls to any
> function in vmlinux or elsewhere, even if they were never exported)

Doesn't x86 have the same problem with endbr?  How does live patch
work with CET enabled?

>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
>
> [0] https://lore.kernel.org/all/20261005110511.157016-4-ardb+git@google.c=
om/
>
> Ard Biesheuvel (3):
>   arm64: module: Keep executable init sections in the core text region
>   arm64: Re-enable kernel BTI for compatible linkers
>   arm64: module: Revert separate init PLT and init ftrace trampoline
>
>  arch/arm64/Kconfig                  | 17 ++--
>  arch/arm64/include/asm/module.h     | 11 +--
>  arch/arm64/include/asm/module.lds.h |  2 -
>  arch/arm64/kernel/ftrace.c          | 13 +--
>  arch/arm64/kernel/module-plts.c     | 98 +++++++-------------
>  arch/arm64/kernel/module.c          | 46 ++++++---
>  6 files changed, 84 insertions(+), 103 deletions(-)
>
> --
> 2.56.1.708.g77570a6a1d-goog
>


--=20
Thanks,
~Nick Desaulniers

