Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DCC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WlYueGAa;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=r65Rlnhf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gKa/gdamMUlaWDKNkrOUJ1SInjLPj8wlXGgQUUSMb74=; b=WlYueGAaRXy1dl
	r2oenEFmkXBKe3umXLi0I0+/OxHbnIw058ocZmq+4nZyFy8oxEK1FI3y5WdJkWPVuJxv8ulI8FuQ0
	MXGovLWFofGsq9/oKMj8xfEERZLV7Y7FUJD3UgxTPFJblbCUBCUFENi8AAof9qS1suBhKuLP/wuFM
	i2Hcnq7ufDSzBawwZkToXiCyd+eSmp7te8l4XvTwHxnEU7CNxJGIOIh5LJ2+LxGcHUrl1DzKJpN6H
	iQX/4Gd4o8ffcR3kzNpCs5GAwjHZrHLVwTjilZLVaF+PLzeYM0C9USURGk4uQGV6yCCQ3qpTHOhkp
	6yy6bsrEHDHoW0YojaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3PK-00000000sek-2oh0;
	Sun, 22 Nov 2026 08:58:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3PH-00000000seO-108A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 08:58:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 627501575;
	Sun, 22 Nov 2026 00:58:38 -0800 (PST)
Received: from [10.57.93.187] (unknown [10.57.93.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F0E63F882;
	Sun, 22 Nov 2026 00:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795337921; bh=bCKwLVxRq7BP98z/sJOreaPLixuU4Iox1OmuawUOOQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r65RlnhftwPn2uAKmfrTFqTgXtr7b9iN2qr1OKnyriE/PPtviiFEhdREmC8i4dQEo
	 UYLAxo66d4ZWduKiTokPXsHpW+LSygjPY8BvyL2aTCvnHz5sdH5TLfn2HNOeAt+7E8
	 rMdmMC8J3RQWw7PAzC0ZTevjIBGcgP6l8MilWQyU=
Message-ID: <a6cda8a2-992f-41f9-a814-ee78363c3a69@arm.com>
Date: Sun, 22 Nov 2026 08:58:37 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, stable@vger.kernel.org
References: <20261117172341.3152407-1-ryan.roberts@arm.com>
 <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com> <awAay4FFj1_wQtaL@arm.com>
 <DN07ZMOAD4GP.37PG3XUPBG4CM@gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <DN07ZMOAD4GP.37PG3XUPBG4CM@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_005843_436859_0882C58F 
X-CRM114-Status: GOOD (  13.93  )
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

On 20/11/2026 17:38, Alexei Starovoitov wrote:
> On Fri Nov 20, 2026 at 10:02 AM UTC, Catalin Marinas wrote:
>> On Thu, Nov 19, 2026 at 01:18:03AM +0000, Alexei Starovoitov wrote:
>>> On Tue, Nov 17, 2026 at 09:23 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>> The arm64 JIT implements BPF_NOSPEC with a speculation barrier, but the
>>>> interpreter calls barrier_nospec(), which falls back to a no-op on
>>>> arm64. Programs executed by the interpreter therefore lack the
>>>> Spectre-v1 barriers assumed by the verifier. Contrary to the code
>>>> comment, kernel-wide SSBD does not provide this protection, since it
>>>> mitigates Spectre v4 rather than Spectre v1.
>>>
>>> Nack.
>>> In bpf-next arm64 has no interpreter when the JIT is built.
>>
>> And what about current mainline/stable or when one disables BPF_JIT
>> explicitly? Should we force BPF_JIT=y as well when ALWAYS_ON=y?
> 
> Anyone who didn't have BPF_JIT_ALWAYS_ON=y were exposed to speculation
> attacks forever. The security hole was wide open. We've been saying it
> forever. At the next merge window we will say
> "you cannot make wrong choice anymore".

I view this patch as a fix to arm64, not as a fix to BPF. I haven't changed any
BPF code - I've only removed an out of date comment in BPF code, which assumed
the code path was for Spectre v4 only. But that's not true since Commit
dff883d9e93a ("bpf, arm64, powerpc: Change nospec to include v1 barrier").

arm64 was previously nop'ing barrier_nospec() despite seemingly needing it in
the same situation as x86. I think this is orthogonal to whether or not the BPF
interpreter permits speculation attacks in other places?

Looking at bpf-next, it is still possible to deselect BPF_JIT when building. If
this is such a security issue, shouldn't we disallow that on arm64, or at the
every least make it an EXPERT option?

Thanks,
Ryan


