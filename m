Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C509606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MtVSCu/I;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=BHe8q+No
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DRSIi4zL0XjElxRgpJXubKJ6vjpY3WRDRA60Q34cIVY=; b=MtVSCu/IKnm0ljf/bnp5HBWBmB
	2gYT6+1prOxVsiQvsjFLtsLYu4xIIqW3JiItIY2Je337At0gB0DBza9gbd4kyNW+P51lzD1Ylu0qM
	jCHlsK+y/46MINteyUOnn+fJ8HIKvALKEy9vJo+bLCY0HUQuC8/vQSFSQwOTj3x6kFIOuQVY4nebu
	OSfnzHWOdJPAXpeHW3rUf5lxRgiNG+g8b4U+UVlfNnegwxPQMgulgApZ2ObtZQBV4AIRWbyOsoJ1y
	6vi+Qa+C1kB6mpdh78P+De27PyBpYmpR9qboU0KIwoNt6jyYx8/ry9T6/qItNduWCtGX+q7/vf2Vm
	EIxhWJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1EP-0000000Bq2o-26sU;
	Thu, 19 Nov 2026 12:27:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1EN-0000000Bq21-0W9J;
	Thu, 19 Nov 2026 12:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=DRSIi4zL0XjElxRgpJXubKJ6vjpY3WRDRA60Q34cIVY=; b=BHe8q+NoqqkD67mBYpfyYBEst4
	Ox7m1p2lAIExkj4XidwoaP3+1BNIB3f+4U1kuj5F+9Q6fBc/47w3FKQCGgK9+wkWkzl+G9h9YagvY
	uq6XLaWcNnHxY67EMtAmy8YFfWNC6IAGVCDwOs/RAal135JLXmjXpxn35SRjEAc2shl8Ky1FZb6zO
	3N3ga9K3xB8MqYszfn2ylYamnFCyeOodG2yhDYVxGhWUiBFetC51aWDuKr1SBQJETFxpCy963g3qb
	50efzDz2Z3lmavzYn4rtlKbiLwUQVI/hPVNYZ1Tc6ny2JQRiqlNa6wURCSJWLzOsnzulMOCCPto9j
	Onh0o/Fg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>,
 Ulf Hansson <ulfh@kernel.org>, 1579567540@qq.com
Cc: Cunhao Lu <1579567540@qq.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Finley Xiao <finley.xiao@rock-chips.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: power: rockchip: Add RK3572 power domains
Date: Thu, 19 Nov 2026 13:26:58 +0100
Message-ID: <oNmb42cjQM-T6qufTLI9Jg@sntech.de>
In-Reply-To: <20261118-add-board-ok3572-c-pmdomain-v5-1-f1af919dd434@qq.com>
References: <20261118-add-board-ok3572-c-pmdomain-v5-0-f1af919dd434@qq.com>
 <20261118-add-board-ok3572-c-pmdomain-v5-1-f1af919dd434@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_042711_160488_74474E95 
X-CRM114-Status: UNSURE (   6.76  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Mittwoch, 18. November 2026, 10:11:39 Mitteleurop=C3=A4ische Normalzeit =
schrieb Cunhao Lu via B4 Relay:
> From: Finley Xiao <finley.xiao@rock-chips.com>
>=20
> Describe the RK3572 power controller and define its 14 power-domain IDs.
> Require the system GRF phandle used to check firmware shift-ready status.
>=20
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



