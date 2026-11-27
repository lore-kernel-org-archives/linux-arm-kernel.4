Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rw6om2VS;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lYUJXOPO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AWQWqXywBDDIWRU4zWJSNieOsk7Xn0x93AX3BFvtQ/g=; b=Rw6om2VSqdDATE629LYqD4ikbJ
	/fa9lHPLaPymrkDEy9v2qEdw/MVEQ2enr/LbdDCAJN10MJq+A8TbqpNmEs+heNaCInXkZg62HycA1
	WEzW7AiwsZSF5itmgoN1DrvnerknIceegLyVmCJY2+JY9+Wyr3tvetPE7mQ2oRdl8StTUAxlNGqZ/
	9BQPraMTVvQ9wXwwaRwcq+/02Moh1ednYdrVjihKQcK7uayRej4FvuC5KkxknbTOA0LEvdLKbfrQ1
	9AeILLTM/bnQBIdOAJVTHRl9HXqvpy5niozaQftZr/bVdW/kMoJqWGpmb2MSjeacg9VZSPctBs+za
	1/Ten1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWznX-0000000HHY8-0aLf;
	Fri, 27 Nov 2026 17:31:47 +0000
Received: from out-199.mta1.migadu.com ([95.215.58.199] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWznU-0000000HHWm-1u7C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:31:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AWQWqXywBDDIWRU4zWJSNieOsk7Xn0x93AX3BFvtQ/g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795800701; v=1; x=1796405501;
 b=lYUJXOPOld0Hvr3XUnF582/5EMDxc/17bMRAGsF0xD3Q+bPVMxME66GD+mnW69VXhyp6W3Vr
 urKNWECySjoaKSD4BCHhLUxLl29iwyB5JysKweVisx7pUltc+qUj3iCIkLzniGBpH+MeteHv8WW
 dxNGTQyZynAu5OLpjlomY/HI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 30ae3ac87ed445b5;
	Fri, 27 Nov 2026 17:31:40 +0000
X-Mizu-Trace-ID: 30ae3ac87ed445b5
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 17:31:35 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Will Deacon <will@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Maxwell Bland <mbland@motorola.com>, Sami Tolvanen <samitolvanen@google.com>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf] bpf, arm64: Fix jited line info off by kCFI hash
Message-ID: <20261127-jf-arm64-bpf-linfo-reply-will-r2-648665e850e0@linux.dev>
References: <20260925-b4-arm64-bpf-linfo-cfi-v1-1-e930ab335170@linux.dev>
 <awmhAIbMV7qo608O@willie-the-truck>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awmhAIbMV7qo608O@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_093145_004967_59A89185 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 03:25:52PM +0000, Will Deacon wrote:
> I'm just chasing up old patches sitting around in my inbox and noticed
> this one. It doesn't _look_ like it's been applied anywhere. Is it still
> needed?

No, please drop it. v2 fixed this in the BPF core and landed in
v7.4-rc2 as commit 3e4279dc5144 ("bpf: Fix jited line info off by the
CFI preamble").

- Jose

