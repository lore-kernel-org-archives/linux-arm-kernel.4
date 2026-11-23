Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C10606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gIOBuJ2+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Cli0A10U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pCYboGv9stOVE3+lbJeSKa31s5n4S6clOgc0Cw8ID4Q=; b=gIOBuJ2+mJbJAR
	Tb6m6OD57RFnhQ6MdBasaHdAsEHzdRnFtXPKBT5xe2sgjB3PHmfqfSnmRNswyTCUfxKeZ3+uI1Le6
	qG/VzY47UsLy2XM4n0ZBHn2aQh2vPlJepHpdliu7VC2yKJwuO2vSMP+CHoHIST1PuSFmZmWLNvTWp
	lAxr/Z0ruDXZHGOuMNIwijuOLVUKWbFob2hRlse/+kTw2s1G+dVcJCx+46/vZVIsFdG5ExTJo421E
	6Aw/FlY+B0eiquW+JZcv9u4QBrM6F2FWIYU4b42NB6bM4zSOJ5kIfTn75wNZtzXBrMLf67G6SNuGs
	IUuVBQXodjbj7MN0h19A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXDK-00000004F9s-2op9;
	Mon, 23 Nov 2026 16:48:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXDH-00000004F8m-3fYZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:48:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81767143D;
	Mon, 23 Nov 2026 08:48:15 -0800 (PST)
Received: from [10.57.91.245] (unknown [10.57.91.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A4433F632;
	Mon, 23 Nov 2026 08:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795452498; bh=SktO3foME/slcuizGcNzpJUNhSlVgGucNlMrZ+GAfqA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cli0A10UXCHGn9oip1xle9GsZggWjVZ/7xp4pPLV3dKaWjcpw5tD3sKkM0RfimPvo
	 DoQ9GuYAQErIcn+xAhT070EYL4vay/KXjubGseA00PagBz2irMCcJMPibpypCvl73R
	 gtX691WDQmMHSD1Xk2u7YsDZAzwNSgpXxvoyz3CE=
Message-ID: <0fad3d48-54cc-4919-bff9-254347c933c4@arm.com>
Date: Mon, 23 Nov 2026 16:48:14 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, stable@vger.kernel.org
References: <20261117172341.3152407-1-ryan.roberts@arm.com>
 <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com> <awAay4FFj1_wQtaL@arm.com>
 <DN07ZMOAD4GP.37PG3XUPBG4CM@gmail.com>
 <a6cda8a2-992f-41f9-a814-ee78363c3a69@arm.com>
 <DN2ALO12MI1Z.3HI553HDMO2FL@gmail.com>
 <85385aae-af06-4742-a39b-5a95e3e73a7e@arm.com> <awRd1mHcQDVNi9U9@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <awRd1mHcQDVNi9U9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_084820_061434_C296137F 
X-CRM114-Status: GOOD (  21.08  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/11/2026 15:37, Catalin Marinas wrote:
> On Mon, Nov 23, 2026 at 10:49:58AM +0000, Ryan Roberts wrote:
>> On 23/11/2026 04:07, Alexei Starovoitov wrote:
>>> On Sun, Nov 22, 2026 at 12:58 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>> I view this patch as a fix to arm64, not as a fix to BPF. I haven't changed any
>>>> BPF code - I've only removed an out of date comment in BPF code, which assumed
>>>> the code path was for Spectre v4 only. But that's not true since Commit
>>>> dff883d9e93a ("bpf, arm64, powerpc: Change nospec to include v1 barrier").
>>>
>>> Fair enough, but the arm64 part of that comment is stale.
>>> The verifier relies on nospec for v1 since
>>> commit d6f1c85f2253 ("bpf: Fall back to nospec for Spectre v1").
>>>
>>>> arm64 was previously nop'ing barrier_nospec() despite seemingly needing it in
>>>> the same situation as x86. I think this is orthogonal to whether or not the BPF
>>>> interpreter permits speculation attacks in other places?
>>>
>>> Not quite. In the interpreter the barrier sits behind an indirect branch:
>>>
>>>   goto *jumptable[insn->code];
>>>
>>> arm64 has no retpoline, and the prog can train this branch.
>>> With a wrong target the CPU skips ST_NOSPEC and runs the next insn.
>>> So the interpreter is still not safe.
>>> Yet you're arguing that you're making bpf interpreter a viable option
>>> on arm64. That's just not fair to users.
> 
> [...]
> 
>>> Say it in the commit log that you're fixing one tiny issue and leaving
>>> giant security hole in place.
>>> With that I'm no longer nacking it.
>>
>> Happy to fix up the commit log as you suggest.
> 
> This patch closes the Spectre v1 hole in the interpreter but, as per
> Alexei's point, we are still left open to Spectre v2, even with CSV2.
> CSV2 only isolates branch prediction between contexts and here the
> predictor could be trained from within the BPF program itself (in
> theory, not sure if this has been demonstrated on arm64 though).
> Training it this way is harder but I wonder whether it's worth patching
> the kernel for v1 or just recommend that people disable unprivileged,
> interpreted BPF (that's Arm's official recommendation anyway). Would we
> give the wrong impression that such configuration is safe?
> 
> If Alexei makes the Kconfig change to force JIT always on, I'd be
> inclined to drop this patch.

Works for me.

