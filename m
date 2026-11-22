Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F88606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 22:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1p/iPPua;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Wb/so95c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bybb0KwOvis1rKSsjZu64GzGwowQo2jgCy7Dlcn92pY=; b=1p/iPPuaYmgEba0Kr0CY8w/Qc/
	Z5vyO0ZznbRJhkoOG56UTKfDBHmky0wxVMN0YJxkLUk2gVMCmdVKZJr5+6WM4ONK7D4j0PObd9HF3
	arLiOTuwXWBem0LAv5AkuxwvWCHISEWFzmEzRgU5C+pfEXLd/7P2HA3Q3GubC3R1WMpZ89gRSqFcU
	hPXoJMrKIovSVKVH60BXezyDkQosHbnx4WtY94DnpUmLrJCFg8YLqxl438oYxvhtP7i1HzKc3rz5z
	Uit2RZyLgCGX2SBP29o4+p3PDJj2JLvF2JNgnsy1t0AQ/5ayZjaamHnAqlv6y+GpLv7lvye8GQLcF
	Lm5e+HaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFeN-00000001pF0-2wWt;
	Sun, 22 Nov 2026 22:03:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFeL-00000001pEE-3oyT;
	Sun, 22 Nov 2026 22:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Bybb0KwOvis1rKSsjZu64GzGwowQo2jgCy7Dlcn92pY=; b=Wb/so95cJ9kddKWhnYYipbulEM
	0scYKO6Pg39vdQLbaZb6yOzPBQbE55H9EymYx5w+jka5TlSJi6EdJPhXnJm/UAcZ6iIYXgsxTQ05B
	smKW4DnQRwRq84gQbVI+xfDFuPSt9y98MmVAFzyfn9jUDmq+WZeWUBazzdeeLGyjjBDs0neA86zvt
	AR2ztYLrq8ZntyDz/i+oMqbE/g93izRzm3GQ5cKolxJ0MPvdpSXKvJbrJ6jmRIsbzsr68j2eag+lp
	A4IA0rHPS2mb6AX8V3svW/8MBy3iavrfJ7kuNeex6uQDJKRup5zGoQA1UhdJJQ6soiGJS5VtqlGLI
	anH7awwQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: rockchip-dw: Allow endpoint supply
Date: Sun, 22 Nov 2026 23:03:01 +0100
Message-ID: <b0JWF81HTBuNN9Ysjciedw@sntech.de>
In-Reply-To: <20261109184948.477095-1-robh@kernel.org>
References: <20261109184948.477095-1-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_140306_015712_5BAC1336 
X-CRM114-Status: UNSURE (   5.85  )
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

Am Montag, 9. November 2026, 19:49:47 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Rob Herring (Arm):
> Rockchip PCIe endpoint DTs describe the 3.3V PCIe regulator with
> vpcie3v3-supply.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



