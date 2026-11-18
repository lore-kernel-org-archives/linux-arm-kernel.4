Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33F3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CFuYjAk/;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=oaQnw3aV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wVxSIi4bRaqI2NNvgQHyFiPGPX0+mZZDkHVHA/9ddgo=; b=CFuYjAk/1r6NYDzQCenc09BO1Q
	4XDCvHA4EihdvB8DsEx/yFE6LIdVnz0RR+EIHdlkvfDlQYQCuLP1t+V0I+c+WgCGIEUvF6jYSPGiZ
	snaIdOrac34cMwW5ms2/QWFDw9yH0eURICRL6VcHH1u19G0c/BR3ws8aus/3ZTaHzwGo9zK2Ad9pw
	qIv5fz8VKGsWlNbUaNXStq8s/Ik3whhmyXZekzh7OwZDH0OVdrpKZ0uYjJoyK1qWvCPrNySi0q/5l
	aMlX34XSsgROe55aFCEZ6fwWMbIpUCE5nD14U7DApt4lQQ3UrTy7oO242sj9U9BzQ4uZqE7q989ML
	R44gshSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcRe-00000008TK1-0CKb;
	Wed, 18 Nov 2026 09:59:14 +0000
Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcRb-00000008TIe-0AXK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:59:12 +0000
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5A024780331;
	Wed, 18 Nov 2026 10:58:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794995946;
	bh=PWhoRlLKNjf+e4xV0f2mSPdPAM1c5SfrVYrUMaV3T4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oaQnw3aVfnOts8ga92P93O8AsnQL0oPXuJ2clCNHXXjkpLKYQe43SdAtntcQBrCVG
	 TsEz074ulTs4/KGu+ZYB0bkpWZpFkESyq8Uv7ovgeaLAvLNjEqZ8I82QZfygu8hMiQ
	 0Q6ipzXv/xH/91tlCu9+GOjPNHQvE0j1kPxmP5IViu4koP/AOtBRG4AGv+wImgdnO2
	 030X2btsdTzQ8xSttdiJK22GJfzm6z4YLXY8HEbcQmnj/k3xhsq4JcCCsP1FKnoETK
	 aLaLKCGzr/OYT1etXlU8MOuD7ubI5ppHt8Bc3xqUiDZQUo9Iif4h3gUmjQeGO64DmV
	 UziCaH6xhDHvg==
Date: Wed, 18 Nov 2026 10:58:41 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
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
	imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: pinctrl: add the NXP LX2160A RCW pad
 mux
Message-ID: <av120SMcb31YLAWK@L30177.local>
References: <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-0-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-0-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-1-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-1-5d7201970629@free.fr>
 <avzBgDksGfXb-MxZ@lxl00025.wbi.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avzBgDksGfXb-MxZ@lxl00025.wbi.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_015911_215483_6BD2FEA6 
X-CRM114-Status: GOOD (  10.55  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vladimir,

> It's a bit difficult to manually follow all the constraints, which are
> listed in the opposite way as the RM would have them (function -> valid pads
> rather than pad -> valid functions), but AI says it's OK and I'm not
> spotting any obvious problems either.

I am trying a small update into the yaml file, that should be easier to
follow. You are right that this serie is having an heritage that
should be simplified to ease the maintenance. I'd prefer to improve
it before merging it.

I'll send the update later today.

best regards,
  Vincent

