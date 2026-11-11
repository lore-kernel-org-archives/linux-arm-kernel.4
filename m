Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33FD606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PqBoLoJx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRHFkCwz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=; b=PqBoLoJxped6Vy
	ycmRlAjPd0edBctJMQg/HPz7Uya9mRq00QkiQ6c5DG404lMoRmZlnoQULoTEnIi4i+wF1Y4pKU7mi
	mdLy0rytUrgu488Dr8Vu+AIqsPYPz/7RGzZ1XB9/0hYdpKJiAAXjKUbQg9XGhlNq+foPooaostYXL
	3d5sNXMcEtiM0/8p3tXQCyIzp7Z00YJMZQ6iNA2Cjayw+6E5eAC5u10UFdiZxLOrfomzYk+ykznJj
	Itdu7V5eRbTgq3O+iaBMIybyj0bj4P/VQvhAPFDaltPj7b98yjtchsiXuWlEcqlDkxzZMxGc3oBoW
	dlZYA+8lWufTjJHy+2Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2zM-00000005wP4-2CrY;
	Wed, 11 Nov 2026 07:43:24 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2zH-00000005wNV-1GdY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:43:20 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso2278654a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794382997; cv=none;
        d=google.com; s=arc-20260327;
        b=j+qIMnm3nwvWj617ZdhuCpQE1PmqKXNenZCEKR7kOSWfuPxdyqg88xzUbMDK+IfPSS
         ZXHNRv3cFO1o4/yttAV0agGY21LMaYt9WCGE2zbSJ5+zHTMarSNcEexJeFzdjtppsXNH
         gMRE5jxItr065RDndX/patgIWrIOrKCNHChrutLv8g3+w1vl/VaxS/fOhZ/pKkSd/W2l
         oELAf9TJvd6K2JPU/KW0wWj7q20WuwwPqFUNLokoJZTYRSJtRfAyeTFQnRkz9fRqaD9d
         U86OOecfi0k/AsYoM3aVF50boyAh3SjRfo8jBh3VI0nfRe2agVL6bAdCdAGQGfEHXEu5
         cuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        fh=LFMV4do/ytqSu71OWZrKln8MyfUVLjYbH0o2pD7ELP8=;
        b=k46tE6NF1vIcoPXI7Q9Xcb39RbXP6QR00XDrK6VA8NrgHYfxvPp7rVqcsxQQiBkTBQ
         QekRdJEgNgUvw6s8Ew4InKzBjPTnWiOTOA0DIKtrCshsPtEEvqXEYkXg9bpW5W/Dod/w
         u9fGS5eP3nkcNqLKNHTd1pAUwi3RJVKCNAIc1AsVsSGbY65GHEHet6/drSqf+KGWq0LT
         FjcnWe7n90xzSBX9DhdmKzmlqgKXlJtbmD0c1rtnXB1jGrjyDNrd39vleIh3qvtwULzx
         /ar+NcGy8bsd+SbD9gvqfCDL3N1/KnSatGuOMeraa4bxucfj+QneIbd/xXDNvjroETrv
         6gQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382997; x=1794987797; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        b=jRHFkCwzoFG7RFfIKbr4bWABD1+lnGZuPBz5jzpXoBsOZWINPdIcV+moH01+PQw0VY
         Qg2Ca54jE8+A5Xc7QfOXuWNh0ylc32Yf2lppl/CVW1ykXgiPg3/DFW+1R0PIxVlvV2N8
         AxvgbTNu2fh45LJXPUFigh5u9jWv+7M95R38vHjO0EkR1/cmIxrOGhEGFhAdDQUHVR6d
         cCuP4KgTPb/pNBX34Of9lyqyidxsbR3QAL1hF5dehrfA/MkNzvljn8bHk75sqvBdHknb
         xmiv39rSPi4mjXHh4sZAMLvFMdQSkZVLTz39iCAAtwWCXsJpqj9A0R2/aXlR7YK7YW+g
         wYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382997; x=1794987797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27U7oUdIa14bzFyO20wq2H7dyWDMznLD1QtfCXJzapQ=;
        b=M7x9Wfek7QK/a4SKEDLaM7p4S10VQGHkcVOwtUv5VuSL97YlrXhUl7s4b+zNk/aGMC
         r75mQHfRfvuInPNOXPLSKabjNMy5sYE6Fwu1e9P4dB/8f0cA7ravBIt3pKJxFnmDu2zA
         snRxY5UFe2fTScBtZQc+cTDODvKGK/113P/+YA/kd3ovjEgJZtEWZZBnsOErHVEqVxFM
         STLyh8D3uQsItVh/DGJwtQqvSgSVbn/riTnBEw5F2iR7Ls5167K+o4eFkfrFF1iTOoio
         dRUENdQVpH7+/+zwaj58zHRfswPPMUWJ2ouqZ5lUptqO7B+Rxx1pt6RlbraHHReFHord
         IAiw==
X-Forwarded-Encrypted: i=1; AL+hErFGEHXR5ms9CTQgQU2ar6hrkaIStNG+Q3KDE1Bt3LU5pYKA7GkJrFKHiupsn25klpdfgzWCS5XKfoz7LeK7lLMa@lists.infradead.org
X-Gm-Message-State: APuU4Z+HPYXWD7QPfBr6Qu7i3LMYOyuuXZHR7uG5aR/dlHI4RVtQfKhz
	5Zy0MtlM1xjS5Jjvq2iJcGfmqaxSECUf1VkRJw/gshyUY6GB5oOfrJ9muJSPeEjekCnTKl6iIFJ
	1DQeKmzlOUkmIdA94PViRmyBWuwYpSAo=
X-Gm-Gg: AYBFou3Haew99/cV6yzzs/1biYSLCRwJxa+JSOary3V7pWRVn7ScF9/MmWL4Kj9Zy40
	AGkHr+5gQcrgWIYoaEyqgl984oa3xzBMsHyI/EpPEbEQOH+gz1WeyzcchNVcUFc9ZOoGXUvE+ie
	sxmNhpqqZhlXPdgOETZcvDjhEZw4NgB2Ece0FdKVnBZbTNiKMTD98S7dSz4/5DXiXTWY5K9oQV4
	oUYBvyQ2ufxK9wDmI5+T/Zxfqh1R1zqNMiIQEz2NuyJ4iydFTM1HJsBPANRD+HqP/sbKGg8U1LF
	9XkIAhJC1Jb+dGVcxANZXDT/OAG83xKcCdX2/LkloT6kWY2lVOdqVWGt1UM5BN2RXm+bRHnfeiZ
	asgnQjb7r/IshgJ1i+q3uF4hLqdbhKpgK0+TP4a/jppZTgYO5uOpEheqYnAu92EqwY2YUiw==
X-Received: by 2002:aa7:c1c4:0:b0:6b5:90b9:e1f4 with SMTP id
 4fb4d7f45d1cf-6b7773edf4bmr819135a12.15.1794382997169; Tue, 10 Nov 2026
 23:43:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:43:04 +0100
X-Gm-Features: AclHuK-WWcZzAuRTugYoSHBXz8aDMS8vLzO87BtuVYEGxCZ10b0uUmgcqCUEPe8
Message-ID: <CA+=Fv5Tm4-DV9KEKxO11ta84EvqigB-KDemhOML1hx9zoxx0cA@mail.gmail.com>
Subject: Re: [PATCH v9 11/15] alpha: Remove alpha_ prefix from custom syscall entries
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
X-CRM114-CacheID: sfid-20261110_234319_401631_CD0815FC 
X-CRM114-Status: GOOD (  21.05  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andr=C3=A9

On Thu, Nov 5, 2026 at 9:26=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Some architectures need special entry points for some syscalls (like
> clone3). The current approach is, instead of having a special name like
> arch_syscall, to name if as __syscall. This is enough to different the
> common entry point to the architecture specific entry point.
>
> Change alpha special syscall entries to do the same. This makes easier to
> join the syscall tables. Leave alpha_syscall_zero because this syscall on=
ly
> exists in alpha anyway.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
> Changes from v7:
> - Fix __clone3 entry
> ---
>  arch/alpha/kernel/entry.S              | 8 ++++----
>  arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 790389a15c3c..25d05f45512d 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -729,9 +729,9 @@ ret_from_kernel_thread:
>
>  .macro fork_like name
>         .align  4
> -       .globl  alpha_\name
> -       .ent    alpha_\name
> -alpha_\name:
> +       .globl  __sys_\name
> +       .ent    __sys_\name
> +__sys_\name:
>         .prologue 0
>         bsr     $1, do_switch_stack
>         // NB: if anyone adds preemption, this block will need to be prot=
ected
> @@ -746,7 +746,7 @@ alpha_\name:
>         ldq     $26, 56($sp)
>         lda     $sp, SWITCH_STACK_SIZE($sp)
>         ret
> -.end   alpha_\name
> +.end   __sys_\name
>  .endm
>
>  fork_like fork
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 8fc4701a6328..59eb066a40bf 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -9,7 +9,7 @@
>  #
>  0      common  osf_syscall                     alpha_syscall_zero
>  1      common  exit                            sys_exit
> -2      common  fork                            alpha_fork
> +2      common  fork                            __sys_fork
>  3      common  read                            sys_read
>  4      common  write                           sys_write
>  5      common  osf_old_open                    sys_ni_syscall
> @@ -72,7 +72,7 @@
>  63     common  getpgrp                         sys_getpgrp
>  64     common  getpagesize                     sys_getpagesize
>  65     common  osf_mremap                      sys_ni_syscall
> -66     common  vfork                           alpha_vfork
> +66     common  vfork                           __sys_vfork
>  67     common  stat                            sys_newstat
>  68     common  lstat                           sys_newlstat
>  69     common  osf_sbrk                        sys_ni_syscall
> @@ -242,7 +242,7 @@
>  309    common  get_kernel_syms                 sys_ni_syscall
>  310    common  syslog                          sys_syslog
>  311    common  reboot                          sys_reboot
> -312    common  clone                           alpha_clone
> +312    common  clone                           __sys_clone
>  313    common  uselib                          sys_uselib
>  314    common  mlock                           sys_mlock
>  315    common  munlock                         sys_munlock
> @@ -474,7 +474,7 @@
>  542    common  fsmount                         sys_fsmount
>  543    common  fspick                          sys_fspick
>  544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          alpha_clone3
> +545    common  clone3                          __sys__clone3
>  546    common  close_range                     sys_close_range
>  547    common  openat2                         sys_openat2
>  548    common  pidfd_getfd                     sys_pidfd_getfd
>
> --
> 2.56.0
>
>

This conflicts with my Alpha for-next:

  https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
  branch: for-next

Commit d38895ba9330 ("alpha: dispatch system calls from C") removes
the fork_like assembly wrappers and changes the table entries to
sys_fork, sys_vfork, sys_clone and sys_clone3.

Consequently, this rename is no longer needed when integrating your
series on top of that branch. I skipped this patch for my integration
test and retained those existing entries.

My for-next is registered with linux-next, so this is an interaction
we should account for when the trees are combined.

Thanks,
Magnus

