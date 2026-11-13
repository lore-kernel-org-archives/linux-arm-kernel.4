Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAEB606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xOPDa5WK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0SQ4rzU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+289KWwCUBwSGViqjea0W9Qg4FPkLuVGVzLN0NXnagA=; b=xOPDa5WKHlsSqhrlJczXxOJKgH
	sjddOzuSC0fb4oD3lfalaNpszCvkuiiYgfFzIpfZ3AUVnEISHht+s9NEx7EGnQkeLau3vgLnqDvzP
	h1TqsmXlKNNrUPnVvJR35CUKw8K7SEEcH8tBeoPNt8JWCxwsIfhSYbCaXMxVj8np7d1M//nKnpriZ
	+7sSCBQRsk8yQrG/Y1uGCnRJADXtBEB346i+9Ux/kZqa5HHFqtqfiHX8i9WAwOtooR+P3TU+dI3cJ
	miKcwLZnnfg9q6W6i5D1fxS2fRueAtnl/a9PBOjFbbtnlr0GrEUDH6d48QHPmZxZ++cygsGYuB1cB
	yIkxQQgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsVG-0000000DCne-0vYX;
	Fri, 13 Nov 2026 14:43:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsVC-0000000DCmO-2lRp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:43:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4AA3618AD;
	Fri, 13 Nov 2026 14:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDF71F000C4;
	Fri, 13 Nov 2026 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794581021;
	bh=+289KWwCUBwSGViqjea0W9Qg4FPkLuVGVzLN0NXnagA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V0SQ4rzUxRzFRK4g6VJ+CGzkMySQWEIOsnv+rTId5imAOTMpxQVu2tWEoGRe+VKZa
	 M3I/THA4Z4IDr7qOLGvsMsB1pz3ZhB3XeOBii5bRqjS5g83uE0zJiXc7azAm2HykXu
	 kCD8wPuEYWNFbWX0MQ84R9EONcwGKB3leipchtAFgOwjoFn3ErDYlTsC/hFpwkabNQ
	 R8jiOHzpqqOpSV7vaqypxlRDTTufWdOUWIEn1mYJHL+LNlxRR8dDBU78rpawikdGrC
	 scVfXK5Hj0UKxwxGRb+RhDhFkkNdeHjbGixvCNTMsn8rBjZUoCWQ19aL3UA+XvSMog
	 3D4liuRvDh1QA==
Date: Fri, 13 Nov 2026 08:43:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: NXP S32 Linux Team <s32@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, linux-arm-kernel@lists.infradead.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
 LX2160A pad-mux child
Message-ID: <179458101851.831300.17996837915217986690.robh@kernel.org>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
 <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-2-5a0063f1da9e@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-2-5a0063f1da9e@free.fr>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 08 Nov 2026 11:06:50 +0100, Vincent Jardin wrote:
> On the LX2160A the DCFG node holds the pad mux, overridden through its
> DCSR view. Allow fsl,lx2160a-dcfg with simple-mfd, so that the child is
> populated, and the pinctrl child, on the LX2160A only.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


