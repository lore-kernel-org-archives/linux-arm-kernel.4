Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78968606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bl3xtkd5;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=udgMF85L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=69YlIhpcdRp84o4ABpJJqYwv378wcIs9fm+ouT0CtWw=; b=bl3xtkd57OqIHeHk9IwbDF2jUn
	NSqO0suX58e/TpdtEZE8+bQ+UHgmK+gE/ECaSOHq45bXcD0mm30AWuEQO6NlJ0hlQim0SiyWvq3Mx
	HRDs5Smt0fVQKHzDa8PKpoyM2ASTnGGvbqSC9OwjFiHMl3YPB7asuOYmjVHdLbH6d39WH6zzus98/
	rZDnAkMaWl/AQvkCvK0h75DvGzYits8CH0RkfTnRY+SYEDgjhGfgxYT9Kh+3g9+rtGiRJ1IqqCOzB
	07awepmtVTGX7wN1h1gOQpdH7PPt8q6+hx/npTP5m5t7DMi6IvptuqyG63z5BZwiIaZBy9PG/drlh
	zI93SwhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjmi-0000000F4HI-1q43;
	Sat, 07 Nov 2026 17:00:56 +0000
Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjme-0000000F4Gn-3czZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 17:00:55 +0000
Received: from l3017727.home (unknown [IPv6:2a01:e0a:ac2:22b0:71d9:bc2b:4a47:20c2])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 763DE19F59C;
	Sat,  7 Nov 2026 18:00:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794070850;
	bh=syJyVGNndyaT76xcg3TviaWZJbrAimIaATWckjraIYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udgMF85LazaNU0ZXoRcnJhuQA21gmX/PlbKegAK+KxJJ1+kt3COSyM4r3yyBlo2SB
	 joV2E0iybcwLRKiZcjGbvmlrcGxsmWSkcK2v5/e3MIhT5YCjV5e7ZldqYPSaac9n9a
	 xDGJv45X/pXl86eCC/AxwhHdynJkl5q/tN3nuuWtCWd89D7XzGQadqvNz1rQU4IIzx
	 7oFSepoRUUNROi/gKYXlhpl+FV/iEPGc2KDIJuBNR1uwt3vJ3451smaTQYDYSEU2NN
	 ji35jqiD+doB8aTdWL2ARgfPqfFI/dNsp/9F49p4yxGEP/N5dm5LIH/1zxtb/bT6kR
	 4lz15iEri2+Yg==
Date: Sat, 7 Nov 2026 18:00:28 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
 LX2160A pad-mux child
Message-ID: <au9ZLBSJ_nTuMaVc@l3017727.home>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-2-3aad0860b984@free.fr>
 <20261106-smiling-infrared-dugong-48ee5c@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106-smiling-infrared-dugong-48ee5c@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_090054_022297_3AE7C6D5 
X-CRM114-Status: UNSURE (   7.74  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

> > @@ -32,6 +32,7 @@ properties:
> >        - items:
> >            - enum:
> >                - fsl,ls1028a-dcfg
> > +              - fsl,lx2160a-dcfg
> >            - const: syscon
> >            - const: simple-mfd
> >  
> > @@ -62,6 +63,12 @@ properties:
> >  
> >    ranges: true
> >  
> > +  pinctrl:
> > +    $ref: /schemas/pinctrl/fsl,lx2160a-rcw-pinmux.yaml#
> 
> Why other children are bus-addressed and this one not? Such mixing is
> messy. Either this is a subdevice with its own addressing or not. Keep
> bindings consistent.

ok, I'll provide a v3 accordingly.

thanks for this comment,
  Vincent

