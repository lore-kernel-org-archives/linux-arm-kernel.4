Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D84C606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JU04Huyv;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rHhy/kRK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cAQGnN0T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RGVl29uymQl+NYGzhhAdRoCGDhPq1p2bxTDg+kAVmWM=; b=JU04HuyvO036kpwVsLoU/dImbZ
	i1cYqrXw6O4Zh7NO2UYj0QroPs91j3XIpUKWBUP49SEj4DAVFdNScgh1vOg/QoRA1cT6qKjRhoWJ2
	RXuSVOzWOLBB1ssxKXUUDrwyCKm2hN1LvX5Kel7wW09Jud+boTF3+rB9L8g6eTle8+UhzCdEvM5p9
	asnlyTsphXh/0OvfPulZA0a2Q8n2XLq9mfFR5t/mqHjL6TlunU4d5EtvWs616auaU112CWCP98AAV
	0xq3Tjbu705XCnQSOuDUqQ/UBiFtM8OjfUxgbGqiIO8rayyoJ8YtE0r/9lsZTWkFVJy6CiRTVQggs
	VtSC/GSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUN53-0000000Ergh-1a2X;
	Fri, 20 Nov 2026 11:47:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUN4s-0000000EraY-26HE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:47:00 +0000
Date: Fri, 20 Nov 2026 12:46:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795175205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RGVl29uymQl+NYGzhhAdRoCGDhPq1p2bxTDg+kAVmWM=;
	b=rHhy/kRKnxoBZ3C1Vy5q3goQ0Sa9M+bemSoPX9upOJRj6LOKbB5S5lqUKtRlJuckMTEl+B
	rXQRrvPp00nOlR6J9GoMM3MvV4VW8KeHR0SJMOpDOIwSdcKSug7p4acBgevoe3/D64rlFE
	apjWVP22W6DHaL1QyJu1leNaCknMy0tmqTOk9kvmWblgYuapxOSTYUsjK3XmnokDG3X5uk
	pjuEVB/l57RTLbOD696RcHYP7ttuoVeaEPF+e3QwGYYqT+FCh1o7NQsAC1ycHkeVEOP60A
	0mDji8l9oiJ9am784yJ5nJPNYB9RaJ2I0NTU8F7VDtGiezMJOgJeeMNwHuBUuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795175205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RGVl29uymQl+NYGzhhAdRoCGDhPq1p2bxTDg+kAVmWM=;
	b=cAQGnN0TqodF+ppjAKq8R2iG0HYEJu6K7ZLFa9loTjpPu89w7sQzBwgYjZCrtscRZJ5w1q
	PWb+YPfS5gtQmLBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	=?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Fu Chao-Ying <chao-ying.fu@globalfoundries.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-hardening@vger.kernel.org,
	Paul Burton <paulburton@kernel.org>
Subject: Re: [PATCH v3 1/7] mips: {cm,cpc}: Make cm_core_lock, cpc_core_lock
 raw spinlocks
Message-ID: <20261120114644.VM_HFf9o@linutronix.de>
References: <20261119-i6500-cm3-pmu-v3-0-c86410934b51@mobileye.com>
 <20261119-i6500-cm3-pmu-v3-1-c86410934b51@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119-i6500-cm3-pmu-v3-1-c86410934b51@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_034650_689186_FB9CEE98 
X-CRM114-Status: GOOD (  11.98  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-19 19:51:27 [+0200], Vladimir Kondratiev wrote:
> From: Paul Burton <paul.burton@mips.com>
> 
> cm_core_lock and cpc_core_lock are used to protect access to a CPU's
> core-other/redirect CM and CPC register blocks. Since each CPU sees
> its own copy of this block, we need to ensure that critical sections
> holding a cm_core_lock run on one CPU - ie. we need to disable
> preemption.
> 
> Use raw_spinlock_t to implement cm_core_lock and cpc_core_lock in
> order to provide the guarantees we need on PREEMPT_RT systems.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> [added CPC part]
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

The perf interrupts should be per-CPU and not threaded so this is the
right to do. However mips does not have ARCH_SUPPORTS_RT set. Is this a
longterm goal? Otherwise it doesn't matter since without it set even
lockdep dose not complain where it would otherwise.

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

