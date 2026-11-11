Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3108606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TgX2Tc0z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqCYt9PP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=; b=TgX2Tc0zoX+wll
	QQlqbBk56vAbNbto+WLfZfsSm+algY4RJsBPkKX9PRhPr/JckESKuJ/9a010XOwbg8cUm4O0OadDJ
	KCIk4+BhbDVNZYQuV2qie17syQpe9fT8zstmHXLnS+0Hn+X7cje5vcAiZ08c3HX1M8CSmeH1QWH8y
	F/NCTYTCH7W6Gagp3cgfis+YwsorQFM0b4vkLks5AAcBFgMFxGZpa3KObC6x/07AwHn/dT1WbRR1H
	y3dpDjIwbtVtdpNS33XTMi9F6fFoSBnZTJhAe23/JhcP+jamWZ7uTFhbP8bIV8I3OFI1OB8BfQc2J
	xGKgCHJwkqjYSchOj89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2wK-00000005vyG-2xFV;
	Wed, 11 Nov 2026 07:40:16 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2wI-00000005vxS-229u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:40:16 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso1702889a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382812; cv=none;
        d=google.com; s=arc-20260327;
        b=brYA2uiMKX4JINgxVY+0nJMaFnQlwOoMEUZ55BIs4JbzNwpMAjoZXxEOAfpo/RzMoU
         e6JJtE7IMe6z8UP1ddncaSfr0aZaomM3Ga135dDOoBjGkd6qbtuHqpoOaEGHf19ua7JH
         tnBrbpyCoEXzOTbcsDbhBYaTFb7voAvgkAZkcZXEo69ndFB9k8hj1T3pNos9kBAOvM14
         9CNBh8zdS3FctNgiGfoUBgNZ4E3Dj+WH1gPx9u8LoLo63EKPAzy8DSChjmM0v8+9T4VR
         iR94OxqEX7mMlZGrrsWlWYQHCyWYsZi45Y+zewsv6ILpcKBCbfqcPnvq4LizTC3bKLBu
         90RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        fh=K4vJIKxFVaWSvcgZBNOFHQleTyj+5iDeqOGGuNWrknE=;
        b=j1YavyJEjO9sSnWUd16xZZ9rMwwlu90nSjmw0rK6ASWU1uVu/j778WQ8wPBV7BSDY2
         EW6/ldlhZnbq20xCfpw4h5UNX0YAmx+4OSNVGNIFA3796kD8jmcAY4GWK47yZvueTWAZ
         oCiTH3nq+jnQT0fcaveWQKx8aKrvGTfTqNRW5v/ApzKyNFjqkfwNJpGnbUXl6P2ZGCRA
         j9fw8qfCBS426U5hgHVMNaYA0cmGU3Ro9DT7gAphh8rcGZzYRBYRzt0J9GqJoOVYJHdU
         IY8fNjZzRKnfYMyJiR3RhdAR5ZRVhAK+SuktGT8VtAWsPuE04C5NqOT0zPMqOOHW9NkA
         qtyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382812; x=1794987612; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        b=sqCYt9PPU7LTwpPqHDvhQ5hzU9yqPPY9LX3TJJciu9pLnn2NuGbbX3XTYzxS/5mz+8
         CUpoBm/4kTrIA81IFt5XVpqwnZvXt5FJTqf7tkFRzKz/0sHZY2xqwhAm4lQV41gErRhT
         MtTv3+vmx46a9FR8O3LhT0BmmI53blwDXX+gZGDMYix/lldKLnrfdn/6+HgXBhwj15ph
         9txzdzJuc1kQgmSjGsKYwRydE5xarWM6LEuXPOkgLGj+3/OGLdEAgQmXpqjajfAxjg5z
         CtRrILf8iDyIhM00NGxgGitQc2Anx0xduH7ctExqbgPWquN/XmLULjnV8c+WtmYf819H
         Ju1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382812; x=1794987612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE+ZO+LDbUQkJMK6amSVRY89ivr6MWd0ox+os4xr0eo=;
        b=O32nTThYcFzHDJlpsyZ4aGT6JFWn+3pvnn2i1JpS27fiVz/U81EIyJbDe2URupAYzM
         rWaAWM2mWWbbtLNr4U55/P+iw4zTH/lIc+3NKy0bP5KqlToz8VA63EglaTov1LxAC9YU
         2ekHPIYI0twEzTl4fmkYz4QnuWMOl1cRsmky0o81xSgU/zXJrY/qXkRlkX1Fo5XWGFtX
         bN03f70RtPDBNH31gt3k46GMUHLfx2eYVW3y1CnhS+Yc8kur4CBREITKwOWhxSh+hKAU
         3mUuR2U7+0hsVSVfZ5kk6wW4YgI+KOCo1qtirmPbP0T9yPXlz0HhSr3qjKTsmGFrggD0
         MzIA==
X-Forwarded-Encrypted: i=1; AL+hErErSKujl1MI7kNAnF9Zs+iVUIkmnY+xA4HOgO6DipJO6qjEJfjpveGSh2mDbBf9BE0cY63eyyTCBvHAG5v6DMxe@lists.infradead.org
X-Gm-Message-State: APuU4Z+YFUcEP2nEhBuv1tEpwAVE4yTQXYLcAU0fVmxjEPFvDng+Sdtb
	xoHb8T7rd5MfaPPB0jnhuaaKfz138gNfA2jRfbP3knT+mYGXyBlb6RuogxgqW2fAf04nLtII6sU
	LSJpj6Y/ClXqBqbMD9eLJFWpMMqDdOAY=
X-Gm-Gg: AYBFou1yAeAAU0USdiVLWlcH80PNwXXHZvKdM0BQAyN/ohgYCP19xTY/76yzyvYRv88
	/F+6lOoVWWy6oBs9HCtE4sOCAtCiUlAhxGjpVepnmiEjXOUMDon8jJNQZ+5XGdD+wfLuumA5LUI
	QSUH35ozyv5FAgSf0gvBdNfssjF8aTR8eOMeeWKWKkrhuGwdoGhZ0G1QIr5N592MAL1vKWfWv+F
	Rljtibc9SmXBNwA7FQtOw2NHLKfpbwrocU40K77/ZvW6ndwyoEAXlO/zd/STy/5zTTSbAxF4ODP
	OR8T+U8MDKTXrNq1oGhRA8DfDgQhZIzlbKO+0KnSpuco4uaHmXjkWJyFFkBkdDlIABY144rg+fD
	Q7geBANkbR6uy/8hnlOuZxAz8Zu1VU06WNOXATsAt69ekwFJ4CupoaCdbtkLl5ShOXS+Bgw==
X-Received: by 2002:a05:6402:a614:b0:6b4:2aa6:2bf7 with SMTP id
 4fb4d7f45d1cf-6b7773fba00mr814626a12.17.1794382812113; Tue, 10 Nov 2026
 23:40:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-10-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:40:00 +0100
X-Gm-Features: AclHuK-efo-IN8C0PeBM3H51GRM-qrC5WxHB8slQK0l-tYnt6GeST1OC-lb_0Yw
Message-ID: <CA+=Fv5RNznnVyh4AM_ZTdwyK4iv-8TEO5Ejx0_81sf5CTeoGgw@mail.gmail.com>
Subject: Re: [PATCH v9 10/15] alpha: Define entry point for
 set_mempolicy_home_node syscall
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_234014_544596_D10D5333 
X-CRM114-Status: GOOD (  18.11  )
X-Spam-Score: -1.9 (-)
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

Hi Andr=C3=A9

On Thu, Nov 5, 2026 at 9:06=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Instead of explicitly defining set_mempolicy_home_node as sys_ni_sycall i=
n
> the syscall table, define it as the real syscall entry point,
> sys_set_mempolicy_home_node. As per commit fdb7d9b7acd0 ("alpha: remove
> DISCONTIGMEM and NUMA"), alpha doesn't have NUMA support, so none of the
> mempolicy sycalls will ever be compiled for alpha, resulting in the
> COND_SYSCALL() fallback being used to result in the sys_ni_syscall.
>
> There's no function change here, but this step helps to unify the syscall
> tables and create a common table to rule them all.
>
> Acked-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 52e3538cc7df..8fc4701a6328 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -489,7 +489,7 @@
>  # 557 reserved for memfd_secret
>  558    common  process_mrelease                sys_process_mrelease
>  559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_ni_syscall
> +560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
>  561    common  cachestat                       sys_cachestat
>  562    common  fchmodat2                       sys_fchmodat2
>  563    common  map_shadow_stack                sys_map_shadow_stack
>
> --
> 2.56.0
>

My Acked-by already in this patch still stands.

I tested the series against my Alpha for-next, with the integration
adjustments described in my replies to patches 11 and 12. Full GENERIC
SMP and DP264 UP builds passed.

The generated dispatch table changes syscall 560 to
sys_set_mempolicy_home_node as intended. Alpha has no NUMA support,
so this still resolves to the sys_ni_syscall fallback.

Thanks,
Magnus

