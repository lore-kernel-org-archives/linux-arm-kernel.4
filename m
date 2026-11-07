Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A95606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B1p2OQn2;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=K6io2DjS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J3tz+cSiafPLwvvRm44v5Y4E466QIE4boG9uIUbrsH8=; b=B1p2OQn2Q9tgKB6YkoHZPml7q6
	A8n8IK7w067NsH11PEtAqSh3fr9is2tTdDQnH98zsakpBMEYlgOedPFwJYRjQ2Lj9eMhez0efIhWM
	/IFJGG8HbHY0mmLPAXLKUNqeIihWeI08HafQLwTJ5HpViZdanwx73Gyv+599xViGs7gZr0Z3OVaEH
	V+ZkEblb8TTDicAKqfchNoUVSGC96dVr+dKcO7ZXnz6VPL6eHy4XoRBsX4voRFCtFrbK9m/3VXIK8
	bTVIZ0bNSmVXG7GuKNS6P0ofUmvfTb+Lb3Omlli6l0wMj2tTIM8ifARULJGeMB9HpzkvBN+zZNbzx
	6TOMlejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjk0-0000000F44G-4BNd;
	Sat, 07 Nov 2026 16:58:09 +0000
Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjjw-0000000F43k-41OY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:58:07 +0000
Received: from l3017727.home (unknown [IPv6:2a01:e0a:ac2:22b0:71d9:bc2b:4a47:20c2])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7AF7219F5C3;
	Sat,  7 Nov 2026 17:57:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794070680;
	bh=O13tiZdfp/UEGvWDyX95aSMMi3lIWkI/aVlJE/2wuXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6io2DjSWYhFOZfsmOqsqU363wQkYaCYKDCLPsn1jo9U0yhsl/la94ukFdngDKeIg
	 CAswLnqCHWtAa+HWFrndk6DAUroYhIlRxK23ZEXOctOVb5LYKFtNqDkSBEPKvu/O5H
	 Rov12EgGF3LzvNgi8GwTlYCwSQ2CPRI9XBi1TkCzgyTImZMC2VUqeMtdGgN6b9GcDN
	 AXAVW5zFL1UBb06ZpBUsdUCBActaakISAv+M3SzoD23oIwniPG5CKbGDTEafInSNrY
	 2bHpKVrIyC2uDI+zmRR1KraZ8Uv8xPMk1AfFmMPs0dVYJd85cExToldBNf6uMu+LgF
	 JPjANULTh01Rw==
Date: Sat, 7 Nov 2026 17:57:39 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux
 driver
Message-ID: <au9YgytCc4TKfETI@l3017727.home>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-4-3aad0860b984@free.fr>
 <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_085805_441819_04CC6043 
X-CRM114-Status: UNSURE (   7.80  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

> Can this be applied separately once reviewed?

I do not see how: this 4th patch needs fsl_guts_rcw_read(), and
few other fsl_guts_*() which are from the patch 3.

There are the following cross tree dependencies / maintainer depencies:
 patch 1, 2: DT bindings -> to reviewed by Rob/Krzysztof/Conor, but bindings travel with the driver that uses them
 patch 3   : drivers/soc/fsl/guts.c -> soc/fsl, Christophe Leroy (via arm-soc)
 patch 4   : drivers/pinctrl/ -> pinctrl, (you) Linus Walleij
 patch 5   : fsl-lx216x.dtsi -> i.MX DTS, Shawn Guo or Frank Li (via arm-soc)

Could an ack of Christophe Leroy be enough on patch 3 to 1...4 could land into the pinctrl tree ?
Then, patch 5 could be managed apart.

best regards,
  Vincent

