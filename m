Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE1E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fU8eJvii;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NR0yTnO8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+Dr3Yxe6IMfqQTqamQRvWaq+1EPQPGHIOcF25gOzcos=; b=fU8eJviimeeaosA0R2JsE2GYtD
	vy2nghdZzlHorXf582eaYHjCrWMcIcmvQH1eVY0gxPme43nUHpRQfV3Z3wFy8bY4lpS8hB3pPlSId
	O4zsP2erXZoD3ODXqQr9Xfo7jd8+x83vU3pP5LchxU6PbtWj1uKfPoEGiBfp19qc/2XJEPZfKYOxq
	3ABLLBS/TjHx8L6YWNBRL4ICv/KEzM97HRKlXva6i4nwPpcKOZyxfP3OQzF+z41clJOXciIJRkJOP
	dxjbneGi2R5VqL3lIwPb9AfbjDF6zV4D3/p6fPebSt00OxtZGUmFf1MjW8oKPlx6+6fMDP0AfVeeV
	5ZlZEFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW7K-000000042DA-1WET;
	Mon, 23 Nov 2026 15:38:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW7I-000000042CR-1vqF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:38:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5017C176B;
	Mon, 23 Nov 2026 07:38:00 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C4F43F763;
	Mon, 23 Nov 2026 07:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795448283; bh=ZtZSCFfSS7AH1eoflbymwNl2l/6JZjRWRRcFOneOrtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NR0yTnO8eL//qf8rHTLt5m/S5J1hkJUzo1muilLaNZrwO0c1pSt7D9cwwm9bCG3Zw
	 dxeucstnM+0H/F4tzbbBlYMXzGETjbM+Dd8y/v+KiUzCy6GO1YfI6fTbJhyUhaP/gx
	 PjEgbnLXZA2jNZiRzkOHlyEm203Of8VqEoZYwClw=
Date: Mon, 23 Nov 2026 15:37:58 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
Message-ID: <awRd1mHcQDVNi9U9@arm.com>
References: <20261117172341.3152407-1-ryan.roberts@arm.com>
 <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com>
 <awAay4FFj1_wQtaL@arm.com>
 <DN07ZMOAD4GP.37PG3XUPBG4CM@gmail.com>
 <a6cda8a2-992f-41f9-a814-ee78363c3a69@arm.com>
 <DN2ALO12MI1Z.3HI553HDMO2FL@gmail.com>
 <85385aae-af06-4742-a39b-5a95e3e73a7e@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85385aae-af06-4742-a39b-5a95e3e73a7e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_073804_606641_D36533F6 
X-CRM114-Status: GOOD (  25.43  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 10:49:58AM +0000, Ryan Roberts wrote:
> On 23/11/2026 04:07, Alexei Starovoitov wrote:
> > On Sun, Nov 22, 2026 at 12:58 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
> >> I view this patch as a fix to arm64, not as a fix to BPF. I haven't changed any
> >> BPF code - I've only removed an out of date comment in BPF code, which assumed
> >> the code path was for Spectre v4 only. But that's not true since Commit
> >> dff883d9e93a ("bpf, arm64, powerpc: Change nospec to include v1 barrier").
> > 
> > Fair enough, but the arm64 part of that comment is stale.
> > The verifier relies on nospec for v1 since
> > commit d6f1c85f2253 ("bpf: Fall back to nospec for Spectre v1").
> > 
> >> arm64 was previously nop'ing barrier_nospec() despite seemingly needing it in
> >> the same situation as x86. I think this is orthogonal to whether or not the BPF
> >> interpreter permits speculation attacks in other places?
> > 
> > Not quite. In the interpreter the barrier sits behind an indirect branch:
> > 
> >   goto *jumptable[insn->code];
> > 
> > arm64 has no retpoline, and the prog can train this branch.
> > With a wrong target the CPU skips ST_NOSPEC and runs the next insn.
> > So the interpreter is still not safe.
> > Yet you're arguing that you're making bpf interpreter a viable option
> > on arm64. That's just not fair to users.

[...]

> > Say it in the commit log that you're fixing one tiny issue and leaving
> > giant security hole in place.
> > With that I'm no longer nacking it.
> 
> Happy to fix up the commit log as you suggest.

This patch closes the Spectre v1 hole in the interpreter but, as per
Alexei's point, we are still left open to Spectre v2, even with CSV2.
CSV2 only isolates branch prediction between contexts and here the
predictor could be trained from within the BPF program itself (in
theory, not sure if this has been demonstrated on arm64 though).
Training it this way is harder but I wonder whether it's worth patching
the kernel for v1 or just recommend that people disable unprivileged,
interpreted BPF (that's Arm's official recommendation anyway). Would we
give the wrong impression that such configuration is safe?

If Alexei makes the Kconfig change to force JIT always on, I'd be
inclined to drop this patch.

-- 
Catalin

