Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE78606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K1VX78rr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKgPZfO0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OY/Zl+lwKH/e6ynWkvNXEhIqQBGIHtdz6KyUOa65gk4=; b=K1VX78rrEn1awn8n/eXTUKvlVo
	r4049Iey4giJzVHMB3j1dh/tgUDUurYFZCixRX61Gm8y5BfRXy1EJWEgfeAWNtMX0s0k1PXUn2sh8
	Q/ZlSCeLNtsU/xOcrKH5oWzH4BsdjSxbagTLdu++lt13A/51LTzgbGBUaJQXYSvoAUIQjb0RSrV6j
	gBnlGgjsDO2WQWIVlXgre74+HjU24lFtc019loO9rHlOsbWgMcQUoaoRLwRKWE9vKdZA29qMwmsQ+
	Wdm3AWN0iGdsEr2Cxh4Yd3xadl2fKuUQhODBldCZ/qCORvNpkt2ccA7vJN61QjDSd1PD1SDqkYab+
	bA8Xoapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtUI-000000078Mg-0wZy;
	Tue, 24 Nov 2026 16:35:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtUH-000000078MW-1tDe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:35:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 390A544377;
	Tue, 24 Nov 2026 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776831F000CF;
	Tue, 24 Nov 2026 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538120;
	bh=OY/Zl+lwKH/e6ynWkvNXEhIqQBGIHtdz6KyUOa65gk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fKgPZfO0bpz+MsGiqhCHtR5RKko4H98ofGIw2qvV9HdCFLxfz/MGHTVsqJ44ThHe3
	 aOOAfDNeCGhQ9LfXOj92uQCVnVXTvGGzAr7id+Uy3ImC9/lgY0OqeE6+KP7oRYoesZ
	 9OdJgQ6SBOdhfXBCaYNEKhy0vqhzkVmzxxbiK9/tZ1j6nFV2shY+8QuaAANbCqpJ77
	 rUz2n/PwgEyvTmtSXWGqXr/FObr3rk7CtmyBoWxicPeb/BTzeMZ+C4WB/ObjqOvP2e
	 puwDHzprzrYA23TTyG8BDkOcQ8DQbBt8jA2meFWw/qPkNwKuHVDSBIUq1OpNYIMaf1
	 4nh0WFVemi07Q==
Date: Tue, 24 Nov 2026 11:35:16 -0500
From: Brian Masney <masneyb@kernel.org>
To: =?utf-8?B?546L5rWp54S2?= <wanghr2026@mail.zgclab.edu.cn>
Cc: linusw@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] clk: versatile-icst: release regmap on registration
 failure
Message-ID: <awW8xNY79j-sP4G-@x1g10>
References: <1795076093787-3-ba1f065a@mail.zgclab.edu.cn>
 <179509997129.279270.1694900680492734463.b4-review@b4>
 <6898ef95.3261f.1a20296984c.Coremail.wanghr2026@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6898ef95.3261f.1a20296984c.Coremail.wanghr2026@mail.zgclab.edu.cn>
User-Agent: Mutt/2.4.3 (2026-10-09)
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

Hi Wang,

On Sun, Nov 22, 2026 at 05:29:13PM +0800, 王浩然 wrote:
> Thanks for the review.
> 
> 
> devm_regmap_init_mmio() cannot be used here: the only in-tree caller
> passes dev == NULL.  icst_clk_register() is reached from
> versatile_auxosc_clk_setup(), registered via CLK_OF_DECLARE:
> 
> 
>     clk = icst_clk_register(NULL, desc, clk_name, parent_name, cm_base);
>       (drivers/clk/versatile/clk-versatile.c:81)

I merged your change. I welcome another patch to remove the unused
struct dev here.

Brian

