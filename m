Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B1C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FF1MTG/o;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G7VQlVVc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LKr0GCiGUi3of277BH7HYeRTXkU+4awYVd73tFhYy+Q=; b=FF1MTG/ooX67zVENdP7DZ8uKdm
	L/0YoO8+Yv97knBOpKJE9dO6HuuK2JPzBGvQVNofAQP1DJBKZrToDaZVx4fEj5YaHI6WLSc1nZeCR
	olZM0Z4phN4+9WrbpSXUUFmWbTaEqx8ZYLmjj2/UC4+uxWmGXWxoGECkrAe64cl+iTynK4Mc8stZf
	fUTEp8Wpg6fVkYh+ANOP+oDlIOW0p+6PiiSkd2wV4mz7UGkeIr8/gYa48xXiTUKhLAIjrvZ7IOgb0
	8AzTWhqdtQqasvLndWtgQZvZ5+1ywlq2BWtoJ2TJWv0sA81p7PE4SgzCJcaqmKAivaeulUz7G7dtT
	qiRXyYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxqK-0000000Gm4v-0jCR;
	Fri, 27 Nov 2026 15:26:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxpq-0000000Gm07-0ACf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:26:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C24A440A63;
	Fri, 27 Nov 2026 15:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424D31F00893;
	Fri, 27 Nov 2026 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793161;
	bh=LKr0GCiGUi3of277BH7HYeRTXkU+4awYVd73tFhYy+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G7VQlVVczF/tSHGBXdvLK+anpnD87825Hm2G1IEJL/FB8ORk9qabwkdrrahHskhRF
	 ApKwjCw6baZQiKfWrFK/iUYLvQ3dq9sj08y8mAexDGHaoW5ekX45AOqqQnhpDOD6Xg
	 Tl7OSCFr7AWy6UCckg9sO4n1/XSE5VwEm2coFMjOOEqWFoVVMBeuQqz+pVTbUyA6Kw
	 9xiEhL/0fwNd9LSsnP0n80ggV6yo172/cWwV7rwWXQFlLjrGkCeMZ0KbApF0AUSgbh
	 2ToPAuLuM865xyrygmpIbe+WLVGbHPZxmGv//fnGZ8P7EH27t1fKdLiC8WToHCShT/
	 +ZlaWYRZaH/WA==
Date: Fri, 27 Nov 2026 15:25:52 +0000
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
Message-ID: <awmhAIbMV7qo608O@willie-the-truck>
References: <20260925-b4-arm64-bpf-linfo-cfi-v1-1-e930ab335170@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-b4-arm64-bpf-linfo-cfi-v1-1-e930ab335170@linux.dev>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Sep 25, 2026 at 05:53:21PM +0000, Jose Fernandez (Anthropic) wrote:
> With CONFIG_CFI=y, the jited line info of every arm64 BPF program is
> off by one instruction, so tools that use it show the wrong source line.
> 
> The JIT counts ctx.offset[] from ctx.ro_image. Since commit
> 710618c760c0 ("arm64/cfi,bpf: Support kCFI + BPF on arm64"),
> prog->bpf_func starts past the 4-byte kCFI hash, and
> bpf_prog_fill_jited_linfo() adds the offsets to prog->bpf_func.
> 
> Subtract cfi_get_offset() from the offsets before the fill, and move
> the fill after bpf_prog_update_insn_ptrs(), which needs the offsets
> relative to ctx.ro_image.
> 
> Fixes: 710618c760c0 ("arm64/cfi,bpf: Support kCFI + BPF on arm64")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260904014748.C04AA1F000E9@smtp.kernel.org/
> Reported-by: Alexei Starovoitov <ast@kernel.org>
> Closes: https://lore.kernel.org/all/DLNXZ2WK7TPD.2RZBUNRS4FA4L@gmail.com/
> Assisted-by: LLM
> Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
> ---
> Tested in an arm64 KVM guest with CONFIG_CFI=y. Without this patch
> every line info entry after a function's first was off by one
> instruction, and with it every entry was correct.
> ---
>  arch/arm64/net/bpf_jit_comp.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

I'm just chasing up old patches sitting around in my inbox and noticed
this one. It doesn't _look_ like it's been applied anywhere. Is it still
needed?

Will

> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index c5f55d6161fee..cdc98efc1acf0 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -2345,14 +2345,21 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>  		/* offset[prog->len] is the size of program */
>  		for (i = 0; i <= prog->len; i++)
>  			ctx.offset[i] *= AARCH64_INSN_SIZE;
> -		bpf_prog_fill_jited_linfo(prog, ctx.offset + 1);
>  		/*
>  		 * The bpf_prog_update_insn_ptrs function expects offsets to
>  		 * point to the first byte of the jitted instruction (unlike
> -		 * the bpf_prog_fill_jited_linfo above, which, for historical
> +		 * the bpf_prog_fill_jited_linfo below, which, for historical
>  		 * reasons, expects to point to the next instruction)
>  		 */
>  		bpf_prog_update_insn_ptrs(prog, ctx.offset, ctx.ro_image);
> +		/*
> +		 * Line info is relative to prog->bpf_func, which starts
> +		 * cfi_get_offset() bytes into ro_image. Shift the offsets here,
> +		 * after bpf_prog_update_insn_ptrs(), which needs them unshifted.
> +		 */
> +		for (i = 0; i <= prog->len; i++)
> +			ctx.offset[i] -= cfi_get_offset();
> +		bpf_prog_fill_jited_linfo(prog, ctx.offset + 1);
>  out_off:
>  		if (!ro_header && priv_stack_ptr) {
>  			free_percpu(priv_stack_ptr);
> 
> ---
> base-commit: ad139384ecddb6f3e7e3c3c12765aafae0e39670
> change-id: 20260925-b4-arm64-bpf-linfo-cfi-f5c3897e408c
> 
> Best regards,
> --  
> Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
> 
> 

