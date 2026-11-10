Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F84606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sE5qZfBz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lQ/+0Nxm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2I8vq1te86R5k4Yvi4aSwE2vl91WuDRteqWewLtKBQg=; b=sE5qZfBzbKe2SR6NCtXQUW3zdQ
	FzzIgK+Gt6MI/TwnOSr/BbTQWdloj4hwT5eXc2xlpzqHI35PpRq6Cj854UxN3mmp+ZxUsQQTla0uJ
	RuaUX0+gjvBzEQzhvvzdVn5BHW/qqdWWq9lnslgDFuhCXll2zNW9MjWL107YSbSEy204O6G3UpCZ5
	CJHaA5+P/rxjzygfJg/3fbudL3zkKpXglN2znGuXjBqrjRmgEvlB+ljhMctZuu3nWZRJqLFTtrcbD
	83PNkUaD1OCrAD1xx1mk0+xwkjVoagOFeDZNYTtiC3nWJlyTyjIlC5YGrJMhImrfYNigqVVlYXlJh
	PaddDmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrTp-00000004tv5-4AKL;
	Tue, 10 Nov 2026 19:26:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrTo-00000004tur-2F3l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 19:26:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C7A4611B8;
	Tue, 10 Nov 2026 19:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20101F0089F;
	Tue, 10 Nov 2026 19:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794338762;
	bh=2I8vq1te86R5k4Yvi4aSwE2vl91WuDRteqWewLtKBQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lQ/+0NxmYvHxSfnSIONTHNAPyURfbEWLrhrOoZJO+2LDWE5xgSmkLnzeiZkASZHeH
	 5o23T5MNbRpKaR7CRy1zV7x68/7qCQQ/ba36ep08wwkca0Db/mEZn0dpmdrYuJTTGs
	 /BW48Jh+fw2tDZFQn24sj/fKvnu7a+BdNcDp6ywgfHBDj6zQeA8ERNyjKEyYt0Rluz
	 +4TvuWD8MGB8c7Ytwr1Wqv8zUMmOKNKcLhNI0NeQ0WGHmeAlMn+6FTZGuK4uyh7Zt/
	 7tGKSdGa4byuApcbhVslzDwNy3HtdzHh31lywsBQWZeRql+bUmFKnm3sZbEpCeMeXs
	 lNiwO/1U9ICFw==
Date: Tue, 10 Nov 2026 13:25:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt
 per implemented bank
Message-ID: <179433875840.1485523.100233134463965104.robh@kernel.org>
References: <20261025142412.112216-1-pmazzini@gmail.com>
 <20261025142412.112216-3-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025142412.112216-3-pmazzini@gmail.com>
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


On Sun, 25 Oct 2026 14:24:11 +0000, Pablo Mazzini wrote:
> The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
> implemented, and the driver no longer counts it. Go back to one
> interrupt, and one debounce period, per implemented bank: 10 for both.
> 
> This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
> increase IRQ banks number").
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


