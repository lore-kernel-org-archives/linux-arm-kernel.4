Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BC4606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L97xV3xb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIvjM1jf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=; b=L97xV3xburJG63
	iF6XJvdT5EU95b+gitoLJ/1DL2y2mqzHHmGvxJSU0VwRmRA50q5XVAJVqYIHjeFoaOPktS4fT7hLj
	iN0Epfx1hwG8wOep6skOopJglVkCFrmau6qGM4+raPYuXlc01JZHbODSWEE623Ld90ebSIVAZFdCu
	kUjXm9i6hbHhPHAu86IXYFPr0lqO20cWwZjJ9LEqyOwf+PE7F55HHp46JcvYt42WSUc9nBer0J/Ae
	OzLPULrRewjeQ9JWWwu8s9KCOvGHEu7TJAcWF4/9k/1zpo4TJL+Jl/GY1nv4itrjHaA48ja2JC6zx
	UtSISvc/fEdMIdek7ATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR37H-00000005xMp-3ea1;
	Wed, 11 Nov 2026 07:51:35 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR37E-00000005xLz-1b3J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:51:34 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso449463466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:51:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794383490; cv=none;
        d=google.com; s=arc-20260327;
        b=f0v9liBdfxjyTPZTlLTs6maUQTemF1eyuvNNtogUcSuHepfSPTq49pyN1uvv9IdGAV
         pZ0jl+47VQZO3HzxNSbQb30xMNrVl/7giwA0iHptg1PyBZHu9tsXDQjG4wto8gtzP7GT
         e3QRZ7iE+hgRFY0cwb8j3I3p1pWgd29Pg+X4WuraY6TZuQu/9rXwB3T9LFEFCDAzyyBv
         rHKS9HcK1DFvL2fhtZwACtvA3VtjRsMhAXC8lyVwXEkRrTT3b7do8dkAbGIgR0azXt+v
         XR7H87cBiCq802dS3E+XlaZQlRSvmYUEHD+MoIq30MKUtlmZa8xO/evjzwdcQuovVS70
         iEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
        fh=IEyjP93M7FFthqpNd0+0tR4VbmRAh7SEpAaGrKz/IsQ=;
        b=n/+90Oi+wNCnb40zARjt8cC76hFT3f/sEbAa751krD6Ec6Bthl/64VfKIxOYC+3V6D
         EgbtLneMrVpDEGy3gFcp6ytOfDA6wklGW23jD44Z2VXAKPYq88SYOkZHKvIT25AqEN8F
         9TXenmGs2BjekoVtVmzF7hPlQjKU1O1va958haSzcwI1Im98ybwO+lLF7cB9b5iOCBjY
         euXq+ZfxNu3EROIYOynwFZUlxe/Krb2J+tQ2zI+FIpmfGOEOQIZVoqPGhvODUDDtDo+7
         RCUUZp2f+cKSqPVztb0PGMiLaF0hPwyYahWpP1reG0Yx7mls07DFF2KxoB+cxY8jcO9b
         okMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794383490; x=1794988290; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
        b=SIvjM1jf56f2e8c7Izj6K3A/39WJP4Rc8DvXvQqVXMViP2KEtwL/ZGreP8I3tq7XXy
         BytsN5ZbqhPk59xe6bTCqg3a1RFaXKnjGw6HISVEXXNmykBMNXiQ5rcO+OdgZhnkO/IR
         KUQFQp02dBXSwtdkLFUTq1fbCDc2eLKiW82NViHTwc8NMWUjF1dHtg3GAu+ay3W1bxxm
         49gdNh8WrGcrPa84PelfvC8w/VnDALIIbQEE6JKSJnL4wA8gI5VMk33jkCZbBm09Cc9W
         wo/3pB81dOd0dm8Nvin4AGzTSyvjXqyp2jnrsLwczaPWg+3sW/F7rvQeie/sJj1kXm7w
         sb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383490; x=1794988290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFEMjHMawTmVswvfRrvWbFxJOe74UcDMeDcBfOcyoV4=;
        b=l758GVaNos0gUtMde2a/RowSz8Up72xyUqMC9vkZjK/IFhfeRRG+q17daTVT3mmiYQ
         WykpEJLi+QfEBimP2YMyAphK4kvHRjwgb2hbO3IICdJjvE7lhT8XwIW8PzCPaj0qZn0M
         fKDPpW6aAhFseh9jW9vZb+64zcS+8fZ0611YS+k3+i1HkeQ37G4MZtKKvz8603of/9K9
         R98IxmRw/i6FvS2Bt3lEUbFT3Vba28vd7+B80hgbHqFvhXRozbF9jQ+5CgiHV1Rl9lTE
         MiheBZeJ8sHEDARaxPh+qvoLeggYFkuXjID46hqs8LzCH0C27zmW8gdFn3crnNWpxgTZ
         nf2w==
X-Forwarded-Encrypted: i=1; AL+hErEM+lQ4Pfu8d6z8xGuXd19437/6Xjqnnyo8OGChfRIbVRVhI7YMll9hoLUBl5sMwm9gwQyeo+e2qUbNbybtCJ2U@lists.infradead.org
X-Gm-Message-State: APuU4Z/o7pius2rId19Oj7EeUv5v0hyy9CLhP2ZyidD/s7/GONwlzRW9
	eJAsLo5A55Bbo8f4MgdFVO6k+vIrNTZ4+Y9Kap4nZyjLIbUpJO0qMmDXVPB0Z5obJpOu4cAhDkM
	6LL01as98jf9WyzbM1i9m9IHcquA0wFU=
X-Gm-Gg: AYBFou1YVN0JJNyU0b2JfaKEZhcoHkjZ3/EZ04vlyFfXrqIkPmpTXJvJsI81hPqUECn
	xFQ2qxcHLYYoIbQdKYJq6TjToUdZSr163OR3IMZF9FHBN0dLPGAIl8h+wQc0s6YeWDWijjks+s6
	wJ4Ox4qX6Ji5Fk5ap6yXm2D4LJxUgmUdw8rMvjy4BZbLGkgUM2c7k1t6dLXLc8sMhEoa8gAG+q8
	mtFXsBrkKYNZQIcURwBEwCHxCDBmTutZi4RItttXR8J0PHh2/k0FiYcrwgjie35ROTaUSWPpkXK
	sWvFHwFEaKXGVKXwDPpyb4Wc2OrxM1KkZz8+wHCmjnV9X+b0jpqj+LBntteWI5f07V3KudphOB7
	YsYgpj1vdAoXRFWUYyVo+0KYf/5+/ZTORjEfJTM/7P0GZgl3ZETC0LVCs1ccAah1OgMd1dA==
X-Received: by 2002:a17:906:f596:b0:c33:923b:ad66 with SMTP id
 a640c23a62f3a-c5066d0bb14mr114825966b.43.1794383490428; Tue, 10 Nov 2026
 23:51:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com> <20261105-tonyk-syscall_table-v9-12-8d1275885d9c@igalia.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-12-8d1275885d9c@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Nov 2026 08:51:18 +0100
X-Gm-Features: AclHuK9CC8htHdABEClpUnIw4kUNRCRbcWaYA_peZjxEX-MI6234hqDvVucRruU
Message-ID: <CA+=Fv5QBnNipJH5SKKV0iiPc1CQz+6f8dGzsRoKt1riMNxxOOg@mail.gmail.com>
Subject: Re: [PATCH v9 12/15] alpha: Use the common syscall table
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
X-CRM114-CacheID: sfid-20261110_235132_474257_52589F2E 
X-CRM114-Status: GOOD (  16.47  )
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
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andr=C3=A9,

On Thu, Nov 5, 2026 at 9:06=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:
>
> Remove some of the duplicated code by using the common syscall number
> table.
>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/Makefile    | 14 +++++++---
>  arch/alpha/kernel/syscalls/syscall.tbl | 49 ----------------------------=
------
>  arch/alpha/kernel/systbls.S            |  1 +
>  3 files changed, 11 insertions(+), 53 deletions(-)
>
> diff --git a/arch/alpha/kernel/syscalls/Makefile b/arch/alpha/kernel/sysc=
alls/Makefile
> index b265e4bc16c2..03099daff6b9 100644
> --- a/arch/alpha/kernel/syscalls/Makefile
> +++ b/arch/alpha/kernel/syscalls/Makefile
> @@ -7,17 +7,23 @@ $(shell mkdir -p $(uapi) $(kapi))
>  syscall :=3D $(src)/syscall.tbl
>  syshdr :=3D $(srctree)/scripts/syscallhdr.sh
>  systbl :=3D $(srctree)/scripts/syscalltbl.sh
> +systbl_common :=3D $(srctree)/scripts/syscall_common.tbl
> +abis :=3D common,__clone3
>
>  quiet_cmd_syshdr =3D SYSHDR  $@
> -      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
> +      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr \
> +                  --common-tbl $(systbl_common) --common-offset 110 \
> +                  --abis $(abis) $< $@
>
>  quiet_cmd_systbl =3D SYSTBL  $@
> -      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) $< $@
> +      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) \
> +                  --common-tbl $(systbl_common) --common-offset 110 \
> +                  --abis $(abis) $< $@
>
> -$(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
> +$(uapi)/unistd_32.h: $(syscall) $(systbl_common) $(syshdr) FORCE
>         $(call if_changed,syshdr)
>
> -$(kapi)/syscall_table.h: $(syscall) $(systbl) FORCE
> +$(kapi)/syscall_table.h: $(syscall) $(systbl_common) $(systbl) FORCE
>         $(call if_changed,systbl)
>
>  uapisyshdr-y           +=3D unistd_32.h
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 59eb066a40bf..7066a3920899 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -463,52 +463,3 @@
>  532    common  getppid                         sys_getppid
>  # all other architectures have common numbers for new syscall, alpha
>  # is the exception.
> -534    common  pidfd_send_signal               sys_pidfd_send_signal
> -535    common  io_uring_setup                  sys_io_uring_setup
> -536    common  io_uring_enter                  sys_io_uring_enter
> -537    common  io_uring_register               sys_io_uring_register
> -538    common  open_tree                       sys_open_tree
> -539    common  move_mount                      sys_move_mount
> -540    common  fsopen                          sys_fsopen
> -541    common  fsconfig                        sys_fsconfig
> -542    common  fsmount                         sys_fsmount
> -543    common  fspick                          sys_fspick
> -544    common  pidfd_open                      sys_pidfd_open
> -545    common  clone3                          __sys__clone3
> -546    common  close_range                     sys_close_range
> -547    common  openat2                         sys_openat2
> -548    common  pidfd_getfd                     sys_pidfd_getfd
> -549    common  faccessat2                      sys_faccessat2
> -550    common  process_madvise                 sys_process_madvise
> -551    common  epoll_pwait2                    sys_epoll_pwait2
> -552    common  mount_setattr                   sys_mount_setattr
> -553    common  quotactl_fd                     sys_quotactl_fd
> -554    common  landlock_create_ruleset         sys_landlock_create_rules=
et
> -555    common  landlock_add_rule               sys_landlock_add_rule
> -556    common  landlock_restrict_self          sys_landlock_restrict_sel=
f
> -# 557 reserved for memfd_secret
> -558    common  process_mrelease                sys_process_mrelease
> -559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
> -561    common  cachestat                       sys_cachestat
> -562    common  fchmodat2                       sys_fchmodat2
> -563    common  map_shadow_stack                sys_map_shadow_stack
> -564    common  futex_wake                      sys_futex_wake
> -565    common  futex_wait                      sys_futex_wait
> -566    common  futex_requeue                   sys_futex_requeue
> -567    common  statmount                       sys_statmount
> -568    common  listmount                       sys_listmount
> -569    common  lsm_get_self_attr               sys_lsm_get_self_attr
> -570    common  lsm_set_self_attr               sys_lsm_set_self_attr
> -571    common  lsm_list_modules                sys_lsm_list_modules
> -572    common  mseal                           sys_mseal
> -573    common  setxattrat                      sys_setxattrat
> -574    common  getxattrat                      sys_getxattrat
> -575    common  listxattrat                     sys_listxattrat
> -576    common  removexattrat                   sys_removexattrat
> -577    common  open_tree_attr                  sys_open_tree_attr
> -578    common  file_getattr                    sys_file_getattr
> -579    common  file_setattr                    sys_file_setattr
> -580    common  listns                          sys_listns
> -581    common  rseq_slice_yield                sys_rseq_slice_yield
> -582    common  fchroot                         sys_fchroot
> diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
> index 68f3e4f329eb..9a67d29f7818 100644
> --- a/arch/alpha/kernel/systbls.S
> +++ b/arch/alpha/kernel/systbls.S
> @@ -7,6 +7,7 @@
>
>  #include <asm/unistd.h>
>
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, n=
ative)
>  #define __SYSCALL(nr, entry) .quad entry
>         .data
>         .align 3
>
> --
> 2.56.0
>

This also needs an adjustment when combined with my Alpha for-next:

  https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
  branch: for-next

Following d38895ba9330 ("alpha: dispatch system calls from C"), Alpha
uses sys_clone3 directly. The ABI selection should therefore be:

  abis :=3D common,clone3

rather than common,__clone3. The removal of the old table entries
also conflicts because the clone3 entry has changed.

For testing, I skipped patch 11, removed the entries from 534 onward
as intended here, and selected common,clone3.

With those adjustments, full GENERIC SMP and DP264 UP builds passed
using GCC 14.2.1. The generated syscall numbers are unchanged.
Comparing the native dispatch entries shows only patch 10's intended
change at syscall 560; clone3 remains sys_clone3.

The only build warning was the previously observed saved_config
COMMON-symbol warning. I have not runtime-tested this combination.

Thanks,
Magnus

