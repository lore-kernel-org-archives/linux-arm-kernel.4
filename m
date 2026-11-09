Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3ED606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UiYTA4RA;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=P9KcMmX6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3unQo8WlkCpFMzh/dOetPGuf+DaxLLVXBYgvviJEGVA=; b=UiYTA4RAyLWVT4yuvOyiQFlLA0
	p/ColGjalIxRA6hLH8cw+q6NWwQ4HHPtJ4XJufCYNggYuy0EvWe2tdc5vLk3w4RbcJLnHrD21Kq2Z
	phtqyL5tWCVszsTORZRrcUnlXTEJzKn/09slB53LLtIEcyLgfzUU5ALQvC8PKfAI3mHrPpkWvzzUz
	9UmW+Gb7yMwMx6nwZhHM16+6sK3QcVgtiUXEh3xTNiCcxZn0UZMNvigGV3X3xLaYEr3mOjrxicPL6
	NCf6x80gk/l4pMn5eleYMO0rgyqkrWxvO8e2KctDybUsNJ4qqhjzxTsktcYRifXs3tISN8pqbzpXz
	JhQqYq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS77-00000001BHC-1gYW;
	Mon, 09 Nov 2026 16:20:57 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS74-00000001BGp-13yP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:20:55 +0000
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B196720062C;
	Mon, 09 Nov 2026 17:20:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794241245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3unQo8WlkCpFMzh/dOetPGuf+DaxLLVXBYgvviJEGVA=;
	b=P9KcMmX65ZjtvR9i/6ts0xQ4fBJR8NUyNsRGaAnLchg+oWiQnwyhtW4GCt04sOe6yalih6
	LryAPynYC1gDKrDibmqe+D1jpH1bh3oIseStQkztYgq6D5djAa2nMw0C8WZ1RCCYPCWQPg
	nXbZ3gxjxnUte3uNDBa3yZ1i8WrLvl/dSQ4T+dgMLXNNFCwOhF591K1+uMDI2A3s+wUumw
	qVZzwPiW+xBWXcCFWlyvvcYq1RQvDCCOmfgUxHPyYujLGwn1L8tN9ijJFGV8T7zUcmF2Bc
	d27ItT5AgmkUNOwJ+9zOh0aXVCkoqsNWxx6duzA9gPDQa084nHnrUmfNgb4MQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794241245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3unQo8WlkCpFMzh/dOetPGuf+DaxLLVXBYgvviJEGVA=;
	b=Pw1IIp3Z32rUuuXL2Sq/cW0/Fi9adMQA/hYp17pKFTQkswpnYtXBSvUlRyopHC2iBV+IHj
	BYvUCmnKXPOd7TtRtNCrvfmOPmZXmdVKqtlRgrGw9rnk3cbDj76+PEdXeF/v16+me4RePC
	W44+n/mcvg1DZ8W60lBv8x4d/poqqiR7piJ7YZwhLVPG8R45C5EFLKfNs9sZbecW2KVgpm
	PK0RuAGYdrrA2k5MU80Yxh4uuTCs4MClKyopAA0Xqr092iulpn2Gij8TX0Wy6nnHs361lg
	fsESRoITjU3TinZKIIdOZTezCWiAK2s83p7IfmmfGXGiMpaZNZXe8tr8qftjVA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794241245; a=rsa-sha256;
	cv=none;
	b=Zo9ReRp1D/g8eNY/8B5OdRpwZbO2YnZMWzUtnqrLN3rx9PYfX8Olh/7/jn6jL9oMFfUNZp
	Ci1Jc/+35FaoDYse0tmRnc+1cpJ7g6VTw/xv143XkxjUpn+s/x5zWtGYoDhJFvLIqEKi6u
	ap0347JwZZWKpDlSIQ2qLgVaRYjGVX1qPepzmInS6LAzoW7vyb6OAAXhnVVj8CfpYODdz0
	i3BrxgpoI2buRW7umeWZ5HveSv64kgOheXErFQrKQQ7zeURq0yIeaBHA25IAnHrrVbXIBz
	kE94w08E7EkS19wF4Jjn+LHtrcUKTlS96LHcpmARSSAc2clets5jY/7aCk+ghA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id 9A94E1BF632; Mon, 09 Nov 2026 17:20:45 +0100 (CET)
Date: Mon, 9 Nov 2026 17:20:45 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: dts: nxp/imx6: Drop unused kontron-samx6i .dtsi
Message-ID: <q5fzh5ay25uujgbhztuj4rhf6d2lypxqeqely6jx7uyt3mivg5@a7yxcdiubv4x>
References: <20261109161713.3618477-1-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109161713.3618477-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_082054_442033_2D8101B8 
X-CRM114-Status: GOOD (  10.04  )
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

On 26-11-09 10:17, Rob Herring (Arm) wrote:
> These 2 kontron-samx6i .dtsi files are not included anywhere in the tree
> and can't be tested. The kontron-samx6i support is already in place in
> the imx6(q|dl)-kontron-samx6i-ads2.dts files which just include all the
> necessary .dtsi files directly.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

