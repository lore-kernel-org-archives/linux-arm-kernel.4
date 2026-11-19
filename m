Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D7606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 04:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bZVu2UkQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUj1qhby
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LkI7Sy95lBvfbQtMVCxtNAxq0Xj/HDOqrG1KSqd25kM=; b=bZVu2UkQJvQ9Ax
	zAg6sbrGfeeFYQEeDUrh+uoorZP/Im6GRVz9uwpZKwd+oISh8SrkV6sc0h6YNQanZmlt9AYdSC8jV
	dX3ZATtXNgr+DsGWp2GNy/39mL5gKeKL6GPH67THAsspOBMjZdFeoRJ31gn2qwyuiAXBeqQS5Py/k
	NAI/iGoExNNDLetGik1hAaGfH+DRfAA5CIqsp7XljLPNJfRHtJqSxbcf3TW6+Sk+/0bTXPYKT+vST
	A+b5yGpAw4n9RNfST4VYhsMNro6aDL+/YZraxnkEngWtMnsFgQpBck1doM8z28tbVXHvWEBO6emhA
	6NXZPPRytYPCjCbJAyTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTu1s-0000000AqaT-1Rj5;
	Thu, 19 Nov 2026 04:45:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTu1o-0000000Aqa3-3bd9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 04:45:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12476125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 20:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795063542; cv=none;
        d=google.com; s=arc-20260327;
        b=BQvPv77zBhXefybqUJw8qaNUQi/1rHkovPeV+beeJBkD3TRfmSUTIrEYwXdcnxuNQy
         PmROn3qEPAIVudHGwUgWel+JZP+JQF3PTO6mnVC2RIYRrc/zw1orCu/sOr4AJKnoTEbo
         Q5KHf7jcg8nFpl7JtVHhUBMUN+nteCh5oBOHH+e7hAAKyGpnkj29XJYOxpPM74f5XmIc
         ZZFvkiGuTT7zTN/TIxjZewaHYKOhLRA+7DBbW3WQHvjwiajh1pJZC346jFCYG59yD11K
         dQhQ4If3r1NVWFM/xRFAdfHvmLS70QxdIDq/1h6UJjK/EhNYmlTIA6gxX6x53V+cEUDp
         cUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LkI7Sy95lBvfbQtMVCxtNAxq0Xj/HDOqrG1KSqd25kM=;
        fh=WHnTYi3XgtJQzsw2dA4NKc7+G+WuqWNT5i44M4f69so=;
        b=pCgcta4CgvkXNJMyX3gqtJdj6aKtBWVN2FWR45dRaKy8y6I3IKwkR0kMmmgwEAxwXC
         8wWjCCSMTtgcjFR/iMJ9pTzZ97JFjCj11QHRKL9K8IcAR6Ygs2iEJ9RUf9Rn3mm9uM8Q
         twQsrok2uHc2tMXnvToJLAsyYROQ3OGhgc9qIH86juSuTxVMERJ982kgXXlG9579x0aj
         gFd/TPipkkqjrKp+7YelCSI9y61wtxOMlMxR7DzdEPCDNKCgk7MyO7DEV4NpiLzJBzRH
         UM6FjwvQzYiW4s0lLLzFPUZmW3FX9scDn9mnJS8j0ScZQLu/keuFBNdi4aZgXd+uUyjt
         VzdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795063542; x=1795668342; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkI7Sy95lBvfbQtMVCxtNAxq0Xj/HDOqrG1KSqd25kM=;
        b=yUj1qhbyZi38PfuXZOiMBPAub+kKcFnoS215MeH08NDF7FKC3oH7v+Wyxa/j7eaZF5
         AWh0ZjQ9n+9q4hXc7J+d7hrQEzUGnVCLpOXAUnq7pZz0lhT4c6zthjLlYthvYDdM0YkU
         E848NsJzSRfnOToSrQW14lg/4+6YdC5rg4hucoPBKbkz9RLjTEJ95fi5CcPHNwhQWq7Y
         I4t99kDeN/VqQTvjKArWj9mC/+LZ25ofCVFMRY5afp5YMsLlTmXkRCNmdATpAZUPxpMw
         6x5dmdznqG0MAlHezGXMISk/W3f99y+Q8fdxd4NV4aKST63CqAXqxq2B8Ueb5C+E+9Md
         tlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795063542; x=1795668342;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkI7Sy95lBvfbQtMVCxtNAxq0Xj/HDOqrG1KSqd25kM=;
        b=mCvLpi6IqG24xwAs/eKwJCWCx7GvzcrfFOCREr9mYKCMG1OtmpGWvmSb97OlW3dmKB
         y+ajty5SxvTnxNarBtgKrWjmNzLgjYS1W//MO53MWUM0bAIPT4FRZRg60Ulv07bVGEfC
         dvpNj70eIOkWfxNx/htv5FtZ070uZwrSr2SuWdXpTeCaXYacB5oT9Ex6ys10gek+mV/D
         UspvptOTkLLk3fe8QnppHW0fCesg3ezjLMv4Hp/1bPuMMMdaHvSjM2z2aPBi7pWAWhPe
         SH12NvdTIw6CG8yrL9QZ5fBCtc6fq/VxujrXBqMNNcLNaUPnDo4FbO5NJQE+lcNPSSaj
         5j7w==
X-Forwarded-Encrypted: i=1; AL+hErGb7Li5QYYvULQiDdrntQBMSfffxU7BA9CzTPKUU4ZFaDFJJO680QhD+dARujhOTTD7Hh8a808UO59vmi0WWvuU@lists.infradead.org
X-Gm-Message-State: APuU4Z+k3M02XUkC2vKz77vQtmP7lp2rLIsCGU1X34VPqKsnzrHbe3ph
	z0dREJfaGuYI9WtjKzGL5+krRbuwYQQJrzaG3vOBexMMuLXACRO9IRnuBciD1dI1likoLe+f9jd
	uKyDGhOppxthwLg2AtK7H/Xv4AB1DTKo=
X-Gm-Gg: AYBFou32fFAgeKZ6/XRJB6evfqHMLE8EdwpMlsnlGPo4YRyCFBDa0Vrsn+437gIbYa+
	DY78JGeEcqrLr/objbvB+BTJ00DvUQk+z9yZPRxTTQqpO+3CKxSQWvN8K27TAwLyeHhF+ba/Tjn
	rFArAqhQeEHlnVZcd/dgWvtNtOJVF9eLn3/dOqbptzv1yfGPoq9xkR/RelDVmp1DrQj1RyCS4/6
	sO4/BQKFhKnAc0XMALtqxkfWx80Ei/e9C/HbZ/qztqaEt5ViRjjksEUxwKwe0W2oUArNeVq/Rt1
	FClS6ghkKnaTLTjmjRWWqLFAd3PFe+Th+vyNbq1pG8p828IvGAtr4e3fuk9uJCD35+EVRGfyaoM
	+UxyBMh1nVdoJ03NlWW4u2EfRfLYgkYjTQ5LrHZrM+eEaVNoJMD4CqMZXZQwZlyaO0dSEt1bNO3
	NVPGMy81SZt4O1I4Aw8w==
X-Received: by 2002:a05:600c:8b5c:b0:4a2:397:73f6 with SMTP id
 5b1f17b1804b1-4bb7da13a97mr99793645e9.8.1795063542301; Wed, 18 Nov 2026
 20:45:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119000112.2377949-1-andrii@kernel.org> <20261119000112.2377949-2-andrii@kernel.org>
 <DMYSXNCMOF26.38XGLPOW4K29X@gmail.com>
In-Reply-To: <DMYSXNCMOF26.38XGLPOW4K29X@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 18 Nov 2026 20:45:30 -0800
X-Gm-Features: Aa3M54ru9v9e2z-jn0buLdaQZSqjE5mLeJ2k6xUEdsRdwJ_B7hJSsTaDWvpbQxk
Message-ID: <CAEf4BzbcPkqX+YncZ+3ysFnXmJWaAUyZiF9BkhbTW27h7MxPxg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/3] arm64: perf: Don't report the caller
 twice in caller-regs callchains
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	peterz@infradead.org, jolsa@kernel.org, rostedt@goodmis.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_204545_024697_2901F12F 
X-CRM114-Status: GOOD (  21.31  )
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

On Wed, Nov 18, 2026 at 5:38=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Nov 18, 2026 at 04:01 PM Andrii Nakryiko <andrii@kernel.org> wrot=
e:
> > Do the same on arm64. Set pstate to PSR_MODE_EL1t, which exceptions
> > taken from the kernel never have (the kernel runs in EL1h, or EL2h
> > with VHE), and skip the leaf regs->pc in perf_callchain_kernel() for
> > regs with that mode. The unwind still starts from regs, with the frame
> > record at x29 walked by the unwinder.
>
> my bot thinks the following will be a more accurate fix...
>
> diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm=
/perf_event.h
> index ee45b4e..7c5ab65 100644
> --- a/arch/arm64/include/asm/perf_event.h
> +++ b/arch/arm64/include/asm/perf_event.h
> @@ -13,11 +13,12 @@
>  #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
>  #endif
>
> +/* PSR_MODE_EL1t marks these regs for kunwind_stack_walk() */
>  #define perf_arch_fetch_caller_regs(regs, __ip) { \
>         (regs)->pc =3D (__ip);    \
>         (regs)->regs[29] =3D (unsigned long) __builtin_frame_address(0); =
\
>         (regs)->sp =3D current_stack_pointer; \
> -       (regs)->pstate =3D PSR_MODE_EL1h; \
> +       (regs)->pstate =3D PSR_MODE_EL1t; \
>  }
>
>  #endif
> diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrac=
e.c
> index 3ebcf8c..de394ff 100644
> --- a/arch/arm64/kernel/stacktrace.c
> +++ b/arch/arm64/kernel/stacktrace.c
> @@ -357,6 +357,13 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
>                 if (task !=3D current)
>                         return -EINVAL;
>                 kunwind_init_from_regs(&state, regs);
> +               /*
> +                * With perf_arch_fetch_caller_regs() the PC is a copy of=
 the
> +                * LR in the frame record at FP. Start from that record.
> +                */
> +               if (processor_mode(regs) =3D=3D PSR_MODE_EL1t &&
> +                   kunwind_next(&state))
> +                       return -EINVAL;

if arm folks approve, I'm all for this fix deeper in the generic
unwinder code, smaller and cleaner change, thanks!

>         } else if (task =3D=3D current) {
>                 kunwind_init_from_caller(&state);
>         } else {
>

