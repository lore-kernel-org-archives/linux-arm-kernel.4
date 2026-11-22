Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4911D606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1woapZt3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a9f+nPtu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8CLyexFisr+loo6bQvDGwbW36TVAaUmS+iGfQnY7nTc=; b=1woapZt3iTJ0mGDhCBnkzPu9jb
	cNhHO+7Yoe8qs35riyl5K0Y6VSAJ6FiS8EI0tA7sxLM1+uvOh3+llsiTZcM7QMaJJ/Z8mqJ+M2tAa
	hYvhpZO/y2PzymAhFQ6yNQNY8FPD1Ry+wlY3UieErXJa9oFOTFxdsMJW2OHXVFjbQjC1YRKMmY2lw
	4uXHpw1FjjyFH53GJNOif+MwufddiFnLoC1x8IAA8AaGdzPZ2qNyTHCJIvmCR8nDOQPoQIfnegg42
	zEw74DrTvfIdu+qAMyIUBlID1vSVsb49aJAs7rebYYE5WJvtX2ylhRXsgrrrjSEhrVc33r4xG8O9S
	8oQzge3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAwq-00000001Oq3-1BFi;
	Sun, 22 Nov 2026 17:01:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAwp-00000001Opw-1U8O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:01:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CAD66405CF;
	Sun, 22 Nov 2026 17:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B071F000C0;
	Sun, 22 Nov 2026 17:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795366910;
	bh=8CLyexFisr+loo6bQvDGwbW36TVAaUmS+iGfQnY7nTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a9f+nPtuAyQAL94oZ1wEVUqzWGO2nfPTX+iFKSatnP584WS9kVpUUcTodjjVVZPvv
	 5uSO9nv7sJga5PadnTVro7+Y8/Llh9aCLiYbTmjrrBerHqevmnq3j/vdvFmAam7ZEQ
	 B5KUrAQVwIo8eyxI98ju7kq1EBVv9U0VCQrnDE7Teo2ftDCZr7KazbaN1o9kqBcF96
	 otSl42mgUtuZe/rz5Hjak6vtvSkmJycjvjVj9egU6c2fvcHH/YHcjOjjXCw8Qcdin3
	 R87u3+RiYhTlVyi9zWrCSMPel80juwi75GMETbVoQJBB8+g5qT1VimKnjPolPWxBJ5
	 mthIC6VrvY6UA==
Date: Sun, 22 Nov 2026 18:01:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cunyuan Liu <cunyuan.liu@cixtech.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com, 
	liviu.dudau@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gary.yang@cixtech.com, fugang.duan@cixtech.com, daniel.almeida@collabora.com, 
	aliceryhl@google.com, p.zabel@pengutronix.de, daniel@fooishbar.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
	robin.wang@cixtech.com
Subject: Re: [PATCH v3 5/7] dt-bindings: gpu: Add CIX Sky1 Mali support
Message-ID: <20261122-efficient-lobster-of-foundation-abd517@quoll>
References: <20261119123850.2994625-1-cunyuan.liu@cixtech.com>
 <20261119123850.2994625-6-cunyuan.liu@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119123850.2994625-6-cunyuan.liu@cixtech.com>
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

On Thu, Nov 19, 2026 at 08:38:48PM +0800, Cunyuan Liu wrote:
> Describe the Mali CSF GPU on CIX Sky1. It uses core and stacks clocks,
> an external reset and a GPU power domain.
> 
> Add the compatible string, resource requirements and an example. Require
> the system-cache allocation policies needed by the Sky1 integration.
> 
> Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)

So what changed here exactly that you decided to drop review? I run b4
diff and there is no relevant difference.

Best regards,
Krzysztof


