Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53DE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=45/NUz/m;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KA0HR32j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tPyuE7S2TUAx7/+V8L0/XTqSVIYLcvo870bw2C9SIe4=; b=45/NUz/mfpsgoa
	tneuhrKN5sm+xw+l10PK51sWn4G7CIy4B4/hUTPDI/gALvDQ7v5JEynHInFK3GQEY8d4Hfl43dzdt
	hA465mTm4dBQDPkWR+2AP9GbVrVxsMCmToTunfuALATaW0s2lMN7E0dEL+9/PgyUguMCWYW5gUCHK
	4hwhLuYrKaP9cJ4RZxopqkB1OpqYjYB7i2fyi3DxXLhHAz7RjRMYElvDuGcicyzOaxkVcOa65AhHM
	LkFLXiqEDkbTiSIDiMlFfcPwRpb0ovyd22iebKfpMDyo74UNS2H74291STL6R3DzerIfC3hfbs3IV
	Mo057KYr1CZMEx8M0Rxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBSh-0000000DeOg-2QRk;
	Thu, 19 Nov 2026 23:22:39 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBSf-0000000DeNn-1OL0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 23:22:38 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so190757f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 15:22:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795130554; cv=none;
        d=google.com; s=arc-20260327;
        b=le3CU3lIJER1pPHrqyiYsZBUttFBFQuIMwDPxua2sArZD6f1fhBGnQdeFHcASGZbP3
         nVtw6OIdB1ntOG+rwK/aYULpkdHV3ziGphwFLg8e8EpoBKf59FT4++AEkx5j5KZ+J1w5
         vtunhUeLZEJJCavGFOsVyUx/8FUO2mH2LfPgUd0lbJEbWK4wf2NY1GrG9hzI3KTiXY2X
         Jn6kTf6qaK+udIDf2Fb6kUiKs2xaeKVK8IcG16zVdKsBUzlkTZcXaKlRTNX7lHwr5FRN
         CyWmNoBe/WxSFT1JCJbqmBrB8WmepvNzUMrU5GyZxJtqRQCyGuRFWmDugVms25kGFEBU
         Y/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tPyuE7S2TUAx7/+V8L0/XTqSVIYLcvo870bw2C9SIe4=;
        fh=o9EryvUtRwJZC5hUFIN5TElzCTUdKCAyY17tDBBrASQ=;
        b=SyTJEVU1qbQ8uxCKE5fApcIDZ1RScvgzNY7I9svxd4gHayh3DYOtyo7fqHANX9QvYY
         nEEYowyh9GhiIweoWYbKvFagQLtrsN44dNkifT+/3l/IXZDmKG9Tsm15vWdd3+0Xjiu6
         WpUupJZzBYbcnTVH3RPn0d72OynhalmcKQ1Kt5Or2bE0vg7CKFbRD/EFaw0s55+X8WHg
         5aBJVzzJFQIG3F9QrmkV6YJtBY+U2NWtASk7LMsj7LJJUA0tCuujdteAfy2cYZju3rWC
         eXVh1ywLKcPEJCW8xzKt6O9FOV3NA5yzXxKh77WHPpvPG2S7t+V8wAgZNJ8DOV6IO7h4
         tcFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795130554; x=1795735354; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tPyuE7S2TUAx7/+V8L0/XTqSVIYLcvo870bw2C9SIe4=;
        b=KA0HR32jZCpY+iFwJwCve7h9w1O7jzmT0w3naQdwj5Aa6YmGOv/jGZ3vPxxcV6sUH3
         QobtDtZOWxVaLS4u152lFyhhMmLXHtNI7iMAcOzXedLvGGFhJktTVPxuXBHqGutDwSx3
         KuT3KmVScsyw2TOTYye6FQX8+d5UR2lYl53VA2hLL3vfxjvNyof3vc0z+zjUJq425gyD
         cpoeEFQtCv38QeBqiwQYqbfN72VZ3ntquZoxAadwuVOPPsfTr3PbTbTT8ZtEiG+oglIv
         dPqxyNfI4M/TmuZ7mQRoWgjtuzFSA3vrOdJkCOl+0PLyo+zXiuO04LWRQi6mfKlqcYhB
         SYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795130554; x=1795735354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tPyuE7S2TUAx7/+V8L0/XTqSVIYLcvo870bw2C9SIe4=;
        b=JRN7jAQSxiE+XyQKvCeyL6rei3s1o8kBumn+sCQrk527934xfyDqBX8FEfQ+9++lkM
         jtXHcxJX/v9fA3h6DmJ1krc95OFI29MJ5nx8wmVm3gHKxcqAi6EwmhjmUP5s64Yx1eCs
         /sOSssrpmeCTJAVv2suEgmorfBb37bDZ3eVa7uFRZew1Y+uTLwlmT3T3XsRAUNC/NwXP
         Tc4KQairv0xr3ei6jkynJyqSZu9f7QeaaHmy20Qehv/6GWvXT5B3hwqd7nScsM8wdAGy
         VMYNfRQKG0TFOSdKE1+b+MUd1tAVs50FwFBoHbWs6gzshdyOaw23RLvS21V8fa3oneSt
         hw/g==
X-Gm-Message-State: APuU4Z8k14A6a0RBLS1jmcQd1t44Lek8zyBL0eeAqMJKPGHY6ZouA9Sw
	taL2X1m+GMSCU7FLJ30iP7Pbp3iDhboyaSgZrMYTSMLJgrMtJ1G7wqDFq68jTL3cvnlU3TYMkf6
	Bt3OFxKfAXh8uf9+PG3T7/1NBHWnk6wqj7ZXPC0g/9XhOzSAixbb+p9DJ
X-Gm-Gg: AZFdTZfGlMvNcZkCNtzU7IU3fd+WdC/Fo3j6S7748/iMnCWnpSXjq5VHLiWhfoVXu0X
	QH5h0YVsoPNdvZYHL0ZqV8EgDnN2WZcWpYMGh6TMo/K+ZlgNFA1SupAtd2vrajENYyYwyyGpzXv
	kWTN6us6LRGFTxafZ5mtXf3nFB3ljy5ZeKAWPaX+VbeLKzXVK4Nex7dBMAS6gcMcLNRJgQ/C62G
	qLn/4Y8S4jHwgjw5qcj3kPo45e6sMcCARG1jv7x0wU15eUueGyDHidyhTT3gi0H+dOjCwGLaAoK
	C3inyNuOacE5+H2PARnOEZceFWFaj7ZtJ8KF7l+4+gHTILHohET0th7CbxxrrcVN4ygDJxHOO29
	lGapLLSAX9uDny0YjraPEnZEBfT5NWj9NXx4uobFP2ZJkyENs64OhdNkCw7ywbYpGi6xkBrpUAe
	0NkgwwFIAp0UTGDhJSL254w7dT7oiJNoLBupZf9MbC+9s1IR1Kzh66n97vKFQmndHy+Q23CCqc0
	ier82Xyg6aenA3M85IT5Gl2k1iRwmbje7Rl
X-Received: by 2002:a5d:64ef:0:b0:4a5:af7a:b7ad with SMTP id
 ffacd0b85a97d-4aba4d612fcmr1945291f8f.0.1795130553685; Thu, 19 Nov 2026
 15:22:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119165825.1793558-5-ardb+git@google.com> <20261119165825.1793558-7-ardb+git@google.com>
In-Reply-To: <20261119165825.1793558-7-ardb+git@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 19 Nov 2026 15:22:22 -0800
X-Gm-Features: Aa3M54oX9gD3PwXkdL9MfyfNN0bukrGqq8Iwv0tKCzZFqgQEGQyQKTiufK4zATg
Message-ID: <CAKwvOd=21QJOrdVa7OrL9i27f5nJLsMzim=xpFgg2oiX3BK=0Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: Re-enable kernel BTI for compatible linkers
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_152237_398160_DE3C282F 
X-CRM114-Status: GOOD (  30.21  )
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
X-Spam-Status: No, score=-28.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 8:58=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The compiler is permitted to omit BTI landing pads from static functions
> that never have their address taken, but are only called directly, even
> if those calls originate from other code sections. This causes problems
> for calls from .init.text into .text if those sections are placed far
> apart, as veneers involving indirect calls will be used in that case.
>
> Now that .text and .init.text are combined, this can no longer happen,
> and so we can re-enable kernel mode BTI under two conditions:
>
> - live patch is disabled - it also needs BTI landings pads on functions
>   with static linkage inside vmlinux that were never exported (and
>   therefore never had their address taken)
>
> - landings pads are emitted even in pathological cases where the size of
>   vmlinux's .text segment exceeds the range of a direct branch, and the
>   linker needs to emit landing pads at the callee end so that the
>   veneers can call them without causing a BTI fault.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/Kconfig | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 1075bc661833..f0fb2d7ff130 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2202,18 +2202,23 @@ config ARM64_BTI
>           BTI, such binaries can still run, but you get no additional
>           enforcement of branch destinations.
>
> +config LD_HAS_BTI_STUBS
> +       # A linker may need to insert a veneer when a call to a function =
with
> +       # static linkage in the same compilation unit but in a different
> +       # section is out of range for a direct branch instruction. Such a
> +       # veneer performs an indirect call, and thus requires a landing p=
ad
> +       # under BTI, which the static function may lack. Only recent link=
ers
> +       # are guaranteed to emit those landing pads correctly in all case=
s.
> +       def_bool (LD_IS_BFD && LD_VERSION >=3D 24200) || \
> +                (LD_IS_LLD && LLD_VERSION >=3D 200000)

A bit of a rock fetching quest (sorry), but it would make it easier
for reviewers to verify these version checks if you had git trailers
linking to commits (or bug reports) for these linkers with the
relevant fix.  I don't think that necessitates a v2, if the
maintainers you're expecting to pick up this series are kind enough to
manually re-add them (unless b4 can pick up `Link:` trailers like
that).

> +
>  config ARM64_BTI_KERNEL
>         bool "Use Branch Target Identification for kernel"
>         default y
>         depends on ARM64_BTI
>         depends on ARM64_PTR_AUTH_KERNEL
>         depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
> -       # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D94697
> -       depends on !CC_IS_GCC || GCC_VERSION >=3D 100100
> -       # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106671
> -       depends on !CC_IS_GCC
> -       # https://github.com/llvm/llvm-project/issues/215547
> -       depends on !CC_IS_CLANG || CLANG_VERSION < 210000
> +       depends on !LIVEPATCH && LD_HAS_BTI_STUBS
>         depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
>         help
>           Build the kernel with Branch Target Identification annotations
> --
> 2.56.1.708.g77570a6a1d-goog
>


--=20
Thanks,
~Nick Desaulniers

