Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51789606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V7UMhurL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BJm+tiGS;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=c4QAiMe/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Content-Type:
	MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=; b=V7UMhurL6XO0NGqJVGLA/Bc5vT
	hy2VghAUaJO4ZQiuPV0jsrLuN/kzov0uZgledkrIu1F7rhB0hhQd6iPzNukhuCA/S/LQzJCaO581/
	wthkEow1cUvFAgXEF9+ofmeHxAZGZjrLQO+TR3H5tNluVMbpzggk70X4SCAsCAebqLEsLu6MLkiAG
	HAvBwo9TLTdhII7NcO0KiXOFFCcraGJTWtxmvqT/+Z8xOujmyaVOjZOpz4o0T1++JPDEm8+GEBOkB
	u1W7hiFAaR9FjRyMWu072FO270mdrVNTXDCFQEYF0kckGE+Dcqn/zR7KrZuuHYPVOSr842t+XII7+
	T9dFPLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmnI-0000000C5aD-1UVl;
	Fri, 13 Nov 2026 08:38:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmu-0000000C5MI-3exa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 08:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=; b=BJm+tiGSuoAxWT5d7IruPUMoYg
	3qhIb/e4klP/a+DvBPzUdneEFAqnW0q6wGz+8kJehwVy04actl81NSrc/5tZYRlqUJRj44NF9tM0w
	9MwtzSHFVEYbpV88iyihoLkBZuZhJvfmYJWnHfnYuTzsHH1h1qM6zNvYHMcQrlOo+xeSjwmVkr/4P
	3b6YSnVSSbWKYOOdskMVUia+rN+1Fdwvz/b3jjEQzGTbjkdkleHO6gFoTmBWDtCa78nXLKr95bAFb
	AoUYwE9YvzM6Eoi6S6aAEoCZeK+Xwd22ftDdRI1Qf0wDVgerKC10qck3UziOeRJvz6vImvlA/3fIp
	JYEZu5wQ==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmr-0000000B4px-29yA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:37:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ed1414df17so5056785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559051; x=1795163851; darn=lists.infradead.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=;
        b=c4QAiMe/rq7lddv9XtO8mKYFho+JrEerk6wMRvqzMCYo832eepQ11fiPd8i/NSEVwI
         HIgvaP/2fgKdsfymHuEHE8anJupKrAjoyebKGZ8kjzgf4bkUMLxZELNfKbCutZVOmnV8
         VsleW0D4IE62Q27Mek9Zu6tly2Y14eHaTKQ+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559051; x=1795163851;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=;
        b=iPX9bjPTGbRMuOnqpcaOzIkEXBwU5ssE3vW//tZCYneL5IQ8CXWx91mvyQF5WVg/SR
         OW0S46+NgHprl60uB/+Dz6T0n4NNebqOv8Ad4B6SK5X/GooVdeAmATwVoMXJapsnDQVC
         owU4Pvx3VR1YERwxe7Mm6ooN/FTOY7rL21AMVmPEzRmi5tnMdMEmCtoeFsZdqCw3zuQw
         fUdn2rjMd3KG0FnSEseH/WmKNYIgGksUZyBCXIGgnXKdD3yjrertu6YFOeMoLUGIAgWP
         TLwcXEhFsZLgzMFj3lBW+HT1i3cFPwkjb8xYl0Q9+Iff1APqB2Rlr1/rgax8nEcfKfWG
         kBCQ==
X-Forwarded-Encrypted: i=1; AL+hErG2OzvP4qbWzafBtQYWyJfP899rFpP2VVX4pgBYSbbeRx3ainCYvwdKds0+h7tSO/LW+fGbU0I8177dpg27wyNn@lists.infradead.org
X-Gm-Message-State: APuU4Z95o46c//2Ez5Re/NzF/TUksaXB0MpMZwN3wGMK3mXjXq7q03eV
	qlax9QcAGQ/K2nKJh2O6W4JgfJjNvMdwAGcWehhobA4QLn3llAKHD+iwAz9HtZpeYek=
X-Gm-Gg: AYBFou2uKRaJ0FMIy5t7PhxAvcPP1VkKjBWyh9uHP3pqn/1zAUs4gcjL3/NXuNk151z
	MR9SEf8eVAxmaGKpwyXQ3HRvqZhfOD36ioQuXF48didavoZote7nCFDjbU4X6ntY9OH8icHBGwi
	CqRXsbKTeLPbXUE0AgUhqoat89OYnXFf8nABL5TgbRPl8pHvnZKiZjVcYLAmNyEwNlsE2Qi0fBs
	75wjbpslEvChVj557X0dp/5csvK1Zy0MfxqLl/YqZIdvap7Mmn+b+kWWMIeAO8IgaLGtsYn/RWe
	FXk9ke85ftrWstGlquVvxNM4KgjT849I+REOjzR4ZqXJ4m3hG1EsJP55heq1dB9xTXUWW0K+Q0Q
	ee5xz5wj5tcQ8p3pXiClTLhJTO1rOFtdCQdrqW2npo/c0bGE28CvOsi1qRRoqusX2xJTdeVCcSk
	mX8En1VNG2RpwjCXqW3DTYu+nXLc2KOuUhIqu+mUp/4j/MGr1ghV6x0c1wE0rHOdabCwSm5Vurc
	4iZZi2M7VRDqKIUegOU50gMRlxFovZiDdyr0uKGmhVx14t2F7QYfNcW1ICBkiRRrlwQvZZ+dBwm
	YK1ZYjKuDIFhUaCEo5sOsXJ+qnYEdxUONZ1w57s8kUEFUvXi8RLcvG91L+XlcvGJNZJsQsZ/4zg
	kKCEG9SNz8DmTZgaz6yDehNJkwwMsMVplBsPL6cdswkig57ayLZecgXBWn1bk88kFzhXgZeunCy
	j+dLyXeGmU4p7hvdM6aHKts0Xv87hXuWfeupRG0rnjM4OTTGJUdPCJHbs8vBM=
X-Received: by 2002:a17:903:2b07:b0:2ed:3057:4f79 with SMTP id d9443c01a7336-2ee0de41b68mr16715855ad.20.1794559051439;
        Fri, 13 Nov 2026 00:37:31 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm6785655ad.22.2026.11.13.00.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:30 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:29 -0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
In-Reply-To: <20261027101703.GB2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name> <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name> <20261027101703.GB2668564@noisy.programming.kicks-ass.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003729.4a4222d8270db2bd@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_083733_431273_29150CFA 
X-CRM114-Status: GOOD (  21.25  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peter,

Peter Zijlstra writes:
>I just noticed that there's a number of task_stack_end_corrupted()
>checks that:
>
> - do not also do task_scs_end_corrupted(); should
>   task_scs_end_corrupted() be put inside task_stack_end_corrupted() to
>   make sure they're always done in tandem and the shadow stack check
>   isn't lost?

I had a look at the other callers, and I don't think the shadow stack
check is being lost in any of them. Two are the oops paths in the x86 and
powerpc fault handlers, and neither architecture has
CONFIG_SHADOW_CALL_STACK. So putting it inside task_stack_end_corrupted()
would only change __might_resched() and the stack tracer, and only on
arm64 and riscv.

Both of those are about the task stack in particular. __might_resched()
got its hint in
a8b686b3af44 ("sched/debug: Check for stack overflow in ___might_sleep()")
because at the time a stack overrun could corrupt thread_info and trigger
the warning on its own. The stack tracer checks right after it has
recorded a new maximum depth for the task stack. Neither has anything to
do with the shadow stack as far as I can see.

schedule_debug() would also still want to check the two separately, so
that the panic message keeps saying which stack it was.

> - should these other sites also respect this switch? It seems weird to
>   only have this one site affected.

It is a bit odd, but I think only this one should follow it. None of the
others depend on CONFIG_SCHED_STACK_END_CHECK today, and the switch is
only meant to be the boot time version of that option. They also only
look at the magic once something has already gone wrong and we're
printing a report about it. The stack tracer is the exception, but it
only looks when it's enabled and sees a new maximum. So there's no cost
to avoid by turning them off.

If they did follow the switch, anyone who leaves it off would lose the
"Thread overran stack" hint from their oopses.

So I've left both as they are in v2, and the changelog now says why the
other callers don't follow the switch. Let me know if you'd still rather
have them folded together, though.

Thanks!

Chris

