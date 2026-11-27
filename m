Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ED7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uWYv64LY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DwFZ6jy5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xsCAkQrZqOlyqp+K6FyPHaXXiUliiHj9e9iQ/EMedeI=; b=uWYv64LYMwPsgFHRVMHT4s+HOc
	7ra+RH+IIz99bl7fznA4OsiBZzmoVW/A34TEIYCRPNbORCTYmDTtr3pxwzvO186iLxYeXQaT1Dwy3
	jNPFFEh56fjXiERoOSnyCUHXLHLgjgSSlJ9vhcLCwbyZaeJdEkOtegTOPUBvMOTLnORnojF/ECNj7
	QJp0+ZUI71mMixvRzN7y67yjqsh1M851vL3bgYrG+p6Wk0GJpLIvPArWWbS8C3eU+H58UcWXhle/P
	xV+LPUY38em2u7IPJE/ilkl6cPPCOH8lifJy1FivVbhffExLoqGMTVvSyWh8QgF1dvawfyXBysEyZ
	82a6+AjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX02c-0000000HK1d-0CL6;
	Fri, 27 Nov 2026 17:47:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX02a-0000000HK1V-2Df5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:47:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A467D60CF4;
	Fri, 27 Nov 2026 17:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22C01F00893;
	Fri, 27 Nov 2026 17:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795801639;
	bh=xsCAkQrZqOlyqp+K6FyPHaXXiUliiHj9e9iQ/EMedeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DwFZ6jy5i7v0Ce0szyaN47D+IYRGf2KxZHgass/2jatppBSNDhzbCNMg/dOAsvrDm
	 LIxYonfPd6ldLs58BdFVkaiXXvOUqU4pY69Lg7nV0uuNwraX4n12BAPxP0KWhRiKWX
	 uVvM3snSL3nMhGVtVm7om2KLrLvCzm18x1Lp18lGljJsrzaN6bRiGIKePxYoXg/pH/
	 /aPhMjVNI9E0a9aNWal4NDJv6TlKfwSUVGlHUrR3rLd/UZO4BNDKNaE4ooNOEoUD3R
	 wOE8mx7L4Ei6V5Awp7KzQ1e71EfbWSWQVGu/mSLN8Xxq8mNWcmkmziXLXkH6c2iS71
	 crvqyaUKM1Kdg==
Date: Fri, 27 Nov 2026 17:47:10 +0000
From: Will Deacon <will@kernel.org>
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Maxwell Bland <mbland@motorola.com>,
	Sami Tolvanen <samitolvanen@google.com>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf] bpf, arm64: Fix jited line info off by kCFI hash
Message-ID: <awnCHo7Y0erVfoQu@willie-the-truck>
References: <20260925-b4-arm64-bpf-linfo-cfi-v1-1-e930ab335170@linux.dev>
 <awmhAIbMV7qo608O@willie-the-truck>
 <20261127-jf-arm64-bpf-linfo-reply-will-r2-648665e850e0@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127-jf-arm64-bpf-linfo-reply-will-r2-648665e850e0@linux.dev>
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

On Fri, Nov 27, 2026 at 05:31:35PM +0000, Jose Fernandez (Anthropic) wrote:
> On Fri, Nov 27, 2026 at 03:25:52PM +0000, Will Deacon wrote:
> > I'm just chasing up old patches sitting around in my inbox and noticed
> > this one. It doesn't _look_ like it's been applied anywhere. Is it still
> > needed?
> 
> No, please drop it. v2 fixed this in the BPF core and landed in
> v7.4-rc2 as commit 3e4279dc5144 ("bpf: Fix jited line info off by the
> CFI preamble").

Ah, thanks for the pointer. That looks like a much nicer fix :)

Will

