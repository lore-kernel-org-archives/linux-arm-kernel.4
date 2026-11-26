Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A361606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eXhc/VYm;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=w3XIudYz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M8E4COdP9INl7vmnYtyvsXubhK56y6QtsdjvRy8Qv1w=; b=eXhc/VYmmZ2ozgvmL7owdfgwdK
	4SuVxD84x6niJkLyrJDQSdxcEtC2R/6So6xuARZ4KO00Oi9x8oKEcoPRuojELgOKpZe+V5RPyyo7e
	7jWAZdGZo7k+oxzoF+AamzYcTMp9rYYJKXV8IuOP0g5YxHhOQCeIvNPnxQvcJP3/wT3SD8QTeRQPr
	fQouU+d3w/3otNF3ypqXo5dkZ1uuQltnqwiS04oJ5SZVb8pokecLLRPdrYArR7eeh0X2wP89Wmtmh
	v+ytWrMOkD5CKhSENNgBgvKNd/JxSy73QkKAQ7hHVmd3zbvaa00MvgEQ5LhCzkei77SI2PgVARKYX
	qT6dRiTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNrt-0000000BkPH-2D4b;
	Thu, 26 Nov 2026 01:01:45 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNrp-0000000BkOs-0lJZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 01:01:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=M8E4COdP9INl7vmnYtyvsXubhK56y6QtsdjvRy8Qv1w=;
	b=w3XIudYzKLMxvl6wulZ5AFHEGNjNrQS+4Zguu6WHNK7MEE4CDenB7hUE9Tg0FDF2IAZS5I73C
	tya9Cbu+mW95Gd1hpJug4ew9ooSGdhlEPLTdtRZCSEhy32Xlu+Kv4Jq3hP0FAnPj3OkffL+6G59
	5wPpCxUUTIDN+dIw6FTnKSQ=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jZdWf05wVzcbRn;
	Thu, 26 Nov 2026 09:00:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A08644057F;
	Thu, 26 Nov 2026 09:01:36 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 09:01:35 +0800
Message-ID: <99b0b1ef-7044-4ce8-977a-ddd1b03037b4@huawei.com>
Date: Thu, 26 Nov 2026 09:01:34 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 01/15] arm64: ptrace: Fix spurious pseudo-single-step
 for PTRACE_SYSEMU_SINGLESTEP
To: Linus Walleij <linusw@kernel.org>
References: <20261111114225.3977243-1-ruanjinjie@huawei.com>
 <20261111114225.3977243-2-ruanjinjie@huawei.com>
 <CAD++jL=mQ8h=6zGUBcc3F9mrafft7V0_tx=jTuv6U7y0ivqNqw@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAD++jL=mQ8h=6zGUBcc3F9mrafft7V0_tx=jTuv6U7y0ivqNqw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_170141_883683_9DD1672E 
X-CRM114-Status: GOOD (  16.15  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, linux-kselftest@vger.kernel.org, will@kernel.org, shuah@kernel.org, peterz@infradead.org, thuth@redhat.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, broonie@kernel.org, mathieu.desnoyers@efficios.com, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, liqiang01@kylinos.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,Linus,

在 2026/11/26 2:08, Linus Walleij 写道:
> On Wed, Nov 11, 2026 at 12:43 PM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> PTRACE_SYSEMU_SINGLESTEP sets both _TIF_SYSCALL_EMU and _TIF_SINGLESTEP.
>> Since commit ac2081cdc4d99 ("arm64: ptrace: Consistently use
>> pseudo-singlestep exceptions"), syscall_trace_exit() injects a
>> pseudo-single-step SIGTRAP (si_code SI_USER) whenever _TIF_SINGLESTEP is
>> set, including for an emulated system call.
>>
>> That pseudo-step was added for PTRACE_SINGLESTEP: the system call runs,
>> and the tracer must get a stop at the return address to inspect the
>> result. An emulated system call does not run, and its syscall-enter-stop
>> already reports the SVC, as the x86 implementation and generic entry
>> (report_single_step()) both say. The extra stop is wrong:
>>
>> 1) Stepping armed before the SVC (the normal case). The SVC exception
>>    leaves the step pending (SPSR_EL1.SS is 0, Arm ARM D2.11.5.1), so the
>>    hardware step is taken at the return address anyway, and the tracer
>>    now stops there twice without the tracee executing anything:
>>
>>         syscall-enter-stop  pc=L
>>         pseudo-step         pc=L    si_code=SI_USER  <- added by that commit
>>         hardware step       pc=L    si_code=TRAP_TRACE
>>         hardware step       pc=L+4
>>
>> 2) Stepping armed after the SVC, e.g. a tracer resuming a
>>    PTRACE_EVENT_SECCOMP stop with PTRACE_SYSEMU_SINGLESTEP. The first
>>    stop is the pseudo-step at L, so the instruction at L is not
>>    executed before the step is reported. Before that commit, and on
>>    x86, the first stop follows the instruction at L.
>>
>> Skip the pseudo-step when _TIF_SYSCALL_EMU is set, as generic entry
>> does. The behaviour of PTRACE_SYSEMU_SINGLESTEP goes back to what it was
>> before that commit. PTRACE_SINGLESTEP is unaffected and still gets the
>> pseudo-step, so both problems fixed by that commit stay fixed.
>>
>> Only tracers using PTRACE_SYSEMU_SINGLESTEP see the difference. Measured
>> in QEMU, L is the instruction after the SVC:
>>
>>   case          before that commit   v7.4-rc1      this patch
>>   normal        L, L+4               L, L, L+4     L, L+4
>>   after seccomp L+4                  L             L+4
>>
>> Fixes: ac2081cdc4d99 ("arm64: ptrace: Consistently use pseudo-singlestep exceptions")
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Oleg Nesterov <oleg@redhat.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> This patch looks like something that should be sent separately and
> even considered
> for stable.
> 
> Can you please send this patch separately to the arm64 maintainers as
> a fix?

The second one is also a bugfix.

I would be happy to send these two patches and the related test cases
separately.

Thanks,
Jinjie

> 
> Yours,
> Linus Walleij


