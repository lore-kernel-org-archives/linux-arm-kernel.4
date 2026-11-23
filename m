Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238FE606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TxcAzQD6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdSNieRG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y35eIMSiZT/nTX9Fpa3jplnBfS4jKOac4FxuSq60JL0=; b=TxcAzQD6U+eS8o
	40IrlXSzkUjHdV1xX/OjaQyd2g/UfQrBF3mvLENb95KtAU5X++VWY/C4SI6uIy+kxWoDpFekcDhdZ
	kkBxrRjtOGi4f6bsGH5PK96NN86o1pOSPVbiGOyUcMJqQL3wcajTYfrzC4LHUHWc3fWoXebJsR3uD
	efNKwiFN2/ojkzQz2c9YnTewvyZ1kQBBE+d53w6pSe4yMDPA2lL5HBcT5JY4LdpMRcB8YW2P7sMkb
	Ihtu9WABJ5W8bjB6e4nPMb+H2aKGdtTVbXCy1Ks0gVo19p0qYNfDs18vZQ78dZY9TGZRvqJo1JJcL
	cYAyCWkuGaovIFTiygpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYPK-00000004SCu-1M5r;
	Mon, 23 Nov 2026 18:04:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYPI-00000004SCo-3pW2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:04:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C65840A12;
	Mon, 23 Nov 2026 18:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC0B1F000C4;
	Mon, 23 Nov 2026 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795457087;
	bh=y35eIMSiZT/nTX9Fpa3jplnBfS4jKOac4FxuSq60JL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CdSNieRGhfYgx+Dm7mrlMeU8yDdEWMqPkRKS+OWrREWFn83cMz+3TMD9ziygV0/D4
	 kDfbQCfLVWNJQr1M4C/eT722iSqt/gMPvdk6snAzl67CWbW5pY+zIlibQbxI9SE3xg
	 uFqUmNDp+uyyWo/yINtUGjnO4k2oPXvOofCT9ORHmkwrVuvsmRjPk2E2S+O0TnWFyA
	 di23SIhRYTyWMixXsiErzrzGDj6ySUbyxa3Or8kenpoISbfQN04S+4Z+ZnwGlVO+5/
	 ecV0MnutE2LVnsmrn70tjmLYAFSeXzliZFI1YibLrnHLhIvqU3DOCpiugX4fsuW4cq
	 J9P2YqUJA8i3g==
From: Brian Masney <masneyb@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Mike Turquette <mturquette@linaro.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261120-ux500-clk-power-upll-v1-1-431041f317ba@kernel.org>
References: <20261120-ux500-clk-power-upll-v1-1-431041f317ba@kernel.org>
Subject: Re: [PATCH] clk: ux500: Power the AB8500 ULP PLL from VintCore12
Message-Id: <179545708005.209212.18146398732794144167.b4-ty@b4>
Date: Mon, 23 Nov 2026 13:04:40 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=308; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=1UzDk8FVrIOGyD/xdVIAtdnxgAhXqPxF+MYLJb6pd68=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZGqyePCk06Pn9qkB258oi70kLvZP95c6c+GF52L/24
 AvV/x+9OkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI7lOMDG/fF6UfDsp8fu1i
 4YH/0vN4b3RW/hL+GX42umi+5h05nocM//3mOjcVStYION49FeD+PG7au+rueUv2b7p/rc76U/O
 9C3wA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 20 Nov 2026 10:02:38 +0100, Linus Walleij wrote:
> clk: ux500: Power the AB8500 ULP PLL from VintCore12

Applied, thanks!

[1/1] clk: ux500: Power the AB8500 ULP PLL from VintCore12
      https://git.kernel.org/clk/linux/c/69e92a94ef27

Best regards,
-- 
Brian Masney <masneyb@kernel.org>


