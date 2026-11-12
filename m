Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A82606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FYSfc7Wl;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Ku9hBoP3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E/hBOzfT4wg2MIZkxfi2jfD1+u36ne/xi/GPYW2g2ew=; b=FYSfc7WlBPp9fX
	TkVolhq+1l0mLq9TzYaF1/VmNxJbd1JqNBEMdr5Lnce0aR9GqtGVrV5h0+dtF9SBLDBmZM7SX35Vq
	WYblGGvWEIAZj9Nd3tZL/SJvpUH/RVGjzIYgS8rqC+F97fXjCY4JKKBryr+sTUQLcKUhCjB5/dHj8
	mn0eT8ExP+WnsuuZjYNsrs0n5CVyhlczECNJwYveQxxO66Uu85Jkju2/LDOisoGGl63iNRCAQXLLr
	OT3TmwIcmn+CgIELOSZBnV9ScJyaaIuQVb2nq4DFMOU6IDxouDKQVpe9kyF2CZsw7hQJTIZkJb1yS
	sSX6l0SxyH0MAMA3GCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWU5-0000000APV2-3Xsy;
	Thu, 12 Nov 2026 15:13:05 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWU2-0000000APUS-45EA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=E/hBOzfT4wg2MIZkxfi2jfD1+u36ne/xi/GPYW2g2ew=; t=1794496382; x=2109856382; 
	b=Ku9hBoP3B5qHqI/dpGHlU4NTwrUsMYT2MSRBXTycvTO0XUEaf5STZWSJJazQy+ChV/yAYESgvks
	WfsvwJW2sV/LJDmSNziV36w60Q6tJN/bor9V2tdBFDvEhbjP5PTDL9GqGEXRdyvSNlKHrJiy8Cjl2
	sa1TCy/YR8DnzC4RpBWRWlM3A7A15pAuQEolByUXMMyAql6nwXYfGKc/ZlacJ570oHDw/Gjuezq71
	7q/UVX+o6TjvtFe6c+v6XbuGVj2A4OdNLKPlZTssDgEgUE0RjhkbJhAgfQ//VsqI58EZIcUMkkULA
	e21YNhqE0V4nNnjlV/zxJjdLLWtgkhwnz0Tw==;
Received: from [177.172.124.218] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xRWTu-009bF1-QY; Thu, 12 Nov 2026 16:12:55 +0100
Message-ID: <f0399f4d-ce4d-4b52-a280-affaf2ea8bd8@igalia.com>
Date: Thu, 12 Nov 2026 12:13:01 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/15] alpha: Remove alpha_ prefix from custom syscall
 entries
To: Magnus Lindholm <linmag7@gmail.com>, Arnd Bergmanon <arnd@arndb.de>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-11-8d1275885d9c@igalia.com>
 <CA+=Fv5Tm4-DV9KEKxO11ta84EvqigB-KDemhOML1hx9zoxx0cA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <CA+=Fv5Tm4-DV9KEKxO11ta84EvqigB-KDemhOML1hx9zoxx0cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_071303_020514_B487CDA2 
X-CRM114-Status: GOOD (  19.03  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Em 11/11/2026 04:43, Magnus Lindholm escreveu:
> Hi André
> 
> On Thu, Nov 5, 2026 at 9:26 PM André Almeida <andrealmeid@igalia.com> wrote:
>>
>> Some architectures need special entry points for some syscalls (like
>> clone3). The current approach is, instead of having a special name like
>> arch_syscall, to name if as __syscall. This is enough to different the
>> common entry point to the architecture specific entry point.
>>
>> Change alpha special syscall entries to do the same. This makes easier to
>> join the syscall tables. Leave alpha_syscall_zero because this syscall only
>> exists in alpha anyway.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> Changes from v7:
>> - Fix __clone3 entry
>> ---
>>   arch/alpha/kernel/entry.S              | 8 ++++----
>>   arch/alpha/kernel/syscalls/syscall.tbl | 8 ++++----
>>   2 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
>> index 790389a15c3c..25d05f45512d 100644
>> --- a/arch/alpha/kernel/entry.S
>> +++ b/arch/alpha/kernel/entry.S
>> @@ -729,9 +729,9 @@ ret_from_kernel_thread:
>>
>>   .macro fork_like name
>>          .align  4
>> -       .globl  alpha_\name
>> -       .ent    alpha_\name
>> -alpha_\name:
>> +       .globl  __sys_\name
>> +       .ent    __sys_\name
>> +__sys_\name:
>>          .prologue 0
>>          bsr     $1, do_switch_stack
>>          // NB: if anyone adds preemption, this block will need to be protected
>> @@ -746,7 +746,7 @@ alpha_\name:
>>          ldq     $26, 56($sp)
>>          lda     $sp, SWITCH_STACK_SIZE($sp)
>>          ret
>> -.end   alpha_\name
>> +.end   __sys_\name
>>   .endm
>>
>>   fork_like fork
>> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
>> index 8fc4701a6328..59eb066a40bf 100644
>> --- a/arch/alpha/kernel/syscalls/syscall.tbl
>> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
>> @@ -9,7 +9,7 @@
>>   #
>>   0      common  osf_syscall                     alpha_syscall_zero
>>   1      common  exit                            sys_exit
>> -2      common  fork                            alpha_fork
>> +2      common  fork                            __sys_fork
>>   3      common  read                            sys_read
>>   4      common  write                           sys_write
>>   5      common  osf_old_open                    sys_ni_syscall
>> @@ -72,7 +72,7 @@
>>   63     common  getpgrp                         sys_getpgrp
>>   64     common  getpagesize                     sys_getpagesize
>>   65     common  osf_mremap                      sys_ni_syscall
>> -66     common  vfork                           alpha_vfork
>> +66     common  vfork                           __sys_vfork
>>   67     common  stat                            sys_newstat
>>   68     common  lstat                           sys_newlstat
>>   69     common  osf_sbrk                        sys_ni_syscall
>> @@ -242,7 +242,7 @@
>>   309    common  get_kernel_syms                 sys_ni_syscall
>>   310    common  syslog                          sys_syslog
>>   311    common  reboot                          sys_reboot
>> -312    common  clone                           alpha_clone
>> +312    common  clone                           __sys_clone
>>   313    common  uselib                          sys_uselib
>>   314    common  mlock                           sys_mlock
>>   315    common  munlock                         sys_munlock
>> @@ -474,7 +474,7 @@
>>   542    common  fsmount                         sys_fsmount
>>   543    common  fspick                          sys_fspick
>>   544    common  pidfd_open                      sys_pidfd_open
>> -545    common  clone3                          alpha_clone3
>> +545    common  clone3                          __sys__clone3
>>   546    common  close_range                     sys_close_range
>>   547    common  openat2                         sys_openat2
>>   548    common  pidfd_getfd                     sys_pidfd_getfd
>>
>> --
>> 2.56.0
>>
>>
> 
> This conflicts with my Alpha for-next:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
>    branch: for-next
> 
> Commit d38895ba9330 ("alpha: dispatch system calls from C") removes
> the fork_like assembly wrappers and changes the table entries to
> sys_fork, sys_vfork, sys_clone and sys_clone3.
> 

Thanks for the review and testing! I will make my work depend on this 
commit then, I believe is the easiest way forward here.

> Consequently, this rename is no longer needed when integrating your
> series on top of that branch. I skipped this patch for my integration
> test and retained those existing entries.
> 
> My for-next is registered with linux-next, so this is an interaction
> we should account for when the trees are combined.
> 
> Thanks,
> Magnus


