Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19239606D816
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ahrPCYvs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VSouJfLI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+5mMH+ae6U1FA4SCfDlLpoRaYWHjV9rRt4QtO/Ofeds=; b=ahrPCYvs+j8hEgEC9oAOXvycb5
	9BUDcjtgGkR+mYL8ix72P0+SCxueChTPdj9EqQihbXEqVax1GbljVBswW/3ioCN00H0zdaQK1CKFL
	GKScXqB764La3f+5zn9krkcgPRCb98RQb49NWwbT55xkLgy4xsWFVRJQnvMpdonMNImkexwVCBu5B
	pDj49Q12irm6ehvWIE8+WTl3smjaEXXHDqrHI6v/McymDjt/57NQz/TH1Nka3uLB15Ht3E1kuf4kZ
	R6hoJyi+c74IbjuIv8nIMItZ9kPgGqMtx4mmi4y6xU4MCA+a4/u1XiL9Qo0IHIxxEYEdWnXeW3uiv
	8aweucqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPik-00000000sf5-0ArS;
	Mon, 09 Nov 2026 13:47:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPig-00000000seW-0WzO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:47:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC0E540221;
	Mon,  9 Nov 2026 13:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B223D1F0089F;
	Mon,  9 Nov 2026 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794232053;
	bh=+5mMH+ae6U1FA4SCfDlLpoRaYWHjV9rRt4QtO/Ofeds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VSouJfLIpck7CNeRnZ/L/Kkp0YXjbA/9IIuZSaiFuNW9voZYJ1+6nyvOgccdKGIVz
	 HngNZh7yKwRqwl3CE+H0UZUoO9Dcuy43S0iRTf8lwKwUB4XUp+ZYAZqBpcLJdv4X86
	 AOUxxmfe0xmQ209GIw7DO0Zfy/dn3mqxlrIM8ZSGlozCWHLbDvq8lR7nx5wT16t/M3
	 H3tPUPFlJ0FbnmjwcVqi2JCkNsTZYXBhd/EQR/5xl9z4YPU71UmktyBKfGBXwRQn8E
	 adplzbfW/kMWVuz9bBkqTn5tPLGM8f/zi4F6gW0VWenGK+jhf5wXCdVmvuO58E3HCt
	 qf3myaB1SBGkQ==
Date: Mon, 9 Nov 2026 14:47:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michal.simek@amd.com, deller@gmx.de, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, git@amd.com
Subject: Re: [PATCH 1/2] fbdev: xilinxfb: remove the driver
Message-ID: <20261109-jumping-dolphin-of-refinement-14df24@quoll>
References: <20261106170902.3656809-1-radhey.shyam.pandey@amd.com>
 <20261106170902.3656809-2-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106170902.3656809-2-radhey.shyam.pandey@amd.com>
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

On Fri, Nov 06, 2026 at 10:39:01PM +0530, Radhey Shyam Pandey wrote:
> Remove xilinx framebuffer soft IP driver. This IP core relies on Xilinx
> Platform Studio (XPS) and the ISE Design suite, both of which were
> discontinued by Xilinx years ago. Furthermore, modern AMD toolchains
> (Vivado Design Suite and Vitis) provide no support for the legacy PLB
> (Processor Local Bus) architecture used by these cores. As a result,
> no new hardware designs can be built using this IP.
> 
> Nothing in the tree document the driver compatible strings. Given the
> complete obsolescence of the supporting hardware development tools
> and the lack of upstream users, remove the dead driver.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---

You can include here defconfig update.

Best regards,
Krzysztof


