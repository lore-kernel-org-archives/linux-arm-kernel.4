Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7987F606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u8jPvfi3;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UQReXKOc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2q3/QmVzfD4Z2ni+YyHWx7ZyhuowtZXCzNWmjrN2ByM=; b=u8jPvfi39n6G/rbptoh2o7/fir
	B8i/H4BT0qc3GFszaSMqFxNYGXWp3TxVH+l2R7ITNiONqcIxIEEtcWEd6btpXEshJTvovpm85FXjZ
	SEiBYN8PAxJIfB6T6+jfDqx4ZLgUngTVVoun2l4ZMp2rlgADdlFBz051F6mitHdFQykldUbjnB72i
	FXbxtjTtfPCIvrepSGtZNE3ulb3nWY+kRn0In4m+Ob1SK42emHPytmkSw9cdNFgebhujHJGSjYOQo
	fc9QvH0HcWhXW6aDu9nGHMz0KuJiIXgovC9D7M4I7DhCYCJJDa/AE5VYCFUXIRGtGdKsbQD1ERw+K
	x4oQs09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULSP-0000000EYbD-1IjB;
	Fri, 20 Nov 2026 10:03:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULSN-0000000EYad-1oma
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:03:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42E161477;
	Fri, 20 Nov 2026 02:02:53 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72B303F673;
	Fri, 20 Nov 2026 02:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795168976; bh=i5/VLaDm62sfWrEYNnw69oTmhljFVc4In1rpcL1/1zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQReXKOcPsmse556UMpJd1uddleMWU/Zf2t83nyz8DoSdIrMjlM4AP4PfmWgxsciw
	 6Z7uDGEzqrx7PMqAm4DEMgNdFNwxS7F19NMhnWzwXvx7pZ0kFrLwnhCcS7srf0PwPZ
	 dxj1b9IB8hXltqntg9UxXeoadaybCgJQyItFG43k=
Date: Fri, 20 Nov 2026 10:02:52 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
Message-ID: <awAay4FFj1_wQtaL@arm.com>
References: <20261117172341.3152407-1-ryan.roberts@arm.com>
 <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_020259_597762_20837141 
X-CRM114-Status: GOOD (  10.42  )
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

On Thu, Nov 19, 2026 at 01:18:03AM +0000, Alexei Starovoitov wrote:
> On Tue, Nov 17, 2026 at 09:23 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
> > The arm64 JIT implements BPF_NOSPEC with a speculation barrier, but the
> > interpreter calls barrier_nospec(), which falls back to a no-op on
> > arm64. Programs executed by the interpreter therefore lack the
> > Spectre-v1 barriers assumed by the verifier. Contrary to the code
> > comment, kernel-wide SSBD does not provide this protection, since it
> > mitigates Spectre v4 rather than Spectre v1.
> 
> Nack.
> In bpf-next arm64 has no interpreter when the JIT is built.

And what about current mainline/stable or when one disables BPF_JIT
explicitly? Should we force BPF_JIT=y as well when ALWAYS_ON=y?

-- 
Catalin

