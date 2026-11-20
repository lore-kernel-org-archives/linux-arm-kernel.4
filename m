Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27E6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vGrY2xfN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTyJ47H8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TEM/lwyfYjFDZGkgKWhS1fxpehScreTDFbg06MSARgw=; b=vGrY2xfNUdQReS
	Ck/DW/mGUvcHnvzDUnuu7/9ihDvTHGLd3lGDG+10XWomxKLACaTpMu6ePaBirxeVY5Ivyjj4vtSqR
	g9a8QJ3MfuNwfilUlTBjszqvM0nqeNGALFK4qHYpJ6jhj4rP70atM7azU5YHquNyHFXNFtB77UCFK
	2rbhlM/62t7EsJmM5YgYdPteD/ToGK/Hs91wycIFf0sT1FRTX+xa5ffZaWUFCHLErIAht0hRy2KZ4
	GIxEdOa946nG258JPGmmJCdf5+cO2zud8bzaji+F++KUverj3wloKXuV4nFdnYQ371EkQUO7EoDjG
	6ZjH3mjYvCQplE8HcObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULQg-0000000EY9w-24Yb;
	Fri, 20 Nov 2026 10:01:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULQY-0000000EY8D-1NTk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:01:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B01514092E;
	Fri, 20 Nov 2026 10:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D711F000ED;
	Fri, 20 Nov 2026 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168865;
	bh=TEM/lwyfYjFDZGkgKWhS1fxpehScreTDFbg06MSARgw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eTyJ47H88RxfllOMLe3j4uRy4TDGOMXxDlsrUGB0NkCv7mdelT+iDZz5Vp/AUpsWP
	 kcvxInSd5A+0y4JrnK4CQI+F0FAbylJTG0m7e+zscGOY8Ja5Vel8UByfPJZBR/whBl
	 8soi7Ep2obpUTllFowND+1ZQzUKvhGRzdwwKu5l52oU2BQf7XySa7s4ZLeDgC7udPy
	 6F23xDG69QwDOR3mXqvhUU7Vvbl17b4AXYTHjbQo1g0X9Ycw5zt1gW5+nWecXidYBI
	 C59zpSStvY8G2eIKL32g3Y7iVSjITDnVrlu1vV6iN2atR26u1BN4jPUpLt7prrdiWL
	 lUfQk6f5FwomQ==
From: Vinod Koul <vkoul@kernel.org>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, Frank Li <Frank.Li@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Kees Cook <kees@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260918141622.3022876-1-peng.fan@oss.nxp.com>
References: <20260918141622.3022876-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] dmaengine: use assign_bit() where applicable
Message-Id: <179516886198.45276.2354167655096140791.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:31:01 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 18 Sep 2026 22:16:17 +0800, Peng Fan (OSS) wrote:
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch.
> 
> 
> [...]

Applied, thanks!

[1/1] dmaengine: use assign_bit() where applicable
      commit: 15e06365b056e9e73723295a1de9205159e28f1f

Best regards,
-- 
~Vinod



