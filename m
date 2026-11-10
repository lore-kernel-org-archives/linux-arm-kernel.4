Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284D3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+4DiyZd;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=KZ7GbPpj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aHn8KcgHhLcXL95P9INTAmVAeZpvAJPCq7Suu5pEHwk=; b=I+4DiyZd9G1A/GwL7wetZbrx8G
	TM5qfSsnpMyD75K4MtCzTPVh3ZPeJ4jkYd4sfL3ZqZMe0nOlTflgZTRruAnJkxHUc61bIbd6EPFZd
	n/FV2t0iGoA9UaY4uAFe36I665JBPc2Y+WM/Jbp8lPssKFki/WwAk6VojdLZXmgLXdJ7euEBglx8r
	9miZg361SdXm98IPP4Oe3QKZ5oKdvNNhFn/Y7JiNcmOvQbfuQR1/HvuXOFcifdMdH3nrGgVtIvsA+
	pfHB7pZn0U5Kj067Bx3Y94luSDlXDiEZwpwGPhQPBnPc4xd9GghJDXbDqD1H7y+SoRIkUPwsyVywK
	jw3nymZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhXw-00000003Af1-2dvG;
	Tue, 10 Nov 2026 08:49:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhXu-00000003AeI-1n8p;
	Tue, 10 Nov 2026 08:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=aHn8KcgHhLcXL95P9INTAmVAeZpvAJPCq7Suu5pEHwk=; b=KZ7GbPpjr8rhjj9TeCSN3isJMo
	4d122GgaAflfPr6ZO4ozp74l8SzqGjVsu5H6TFM2vMhzmL0KHht4wMTwld3FIKNZ8RCqHqHs4jcgV
	v83dvQpMXC0J35H4CocMuWLe3GQWQip4RgxB9bd28fy1oU+bREnQbTP6s89Rxpecyd3teH+M5USVw
	ZhnyQ/EhBeB8TNton7OX7iwnUvu+OQeTaHKe12xysLOnzjUoTwOovZI5eCPjfEW3Tjn10GDXQjiUk
	sMmsr7Jx78SnG58k0FIX2G0gYSMFPfijeXJxkR4cFyERpEqF35KcnYXRp1JFGQaq61Ii8HYqvm/vU
	7OtWoU3A==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: aiyengar1990@gmail.com, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: shawn.lin@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Simon Xue <xxm@rock-chips.com>, "finley.xiao" <finley.xiao@rock-chips.com>
Subject: Re: [PATCH 0/5] iommu/arm-smmu-v3: power domain and clock of the RK3588 PCIe
 SMMU
Date: Tue, 10 Nov 2026 09:49:29 +0100
Message-ID: <10924894.NyiUUSuA9g@diego>
In-Reply-To: <7e053777-31ee-4127-af53-0820e852d375@rock-chips.com>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <7e053777-31ee-4127-af53-0820e852d375@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_004938_491668_E73A44C2 
X-CRM114-Status: GOOD (  15.69  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 10. November 2026, 09:40:44 Mitteleurop=C3=A4ische Normalzeit =
schrieb Shawn Lin:
> Cc: Simon and Finley
>=20
> =E5=9C=A8 2026/11/10 =E6=98=9F=E6=9C=9F=E4=BA=8C 15:11, Arun Iyengar via =
B4 Relay =E5=86=99=E9=81=93:
> > The MMU-600 in front of the PCIe controllers of the Rockchip RK3588
> > (mmu600_pcie) is enabled for every RK3588 board, but its node describes
> > neither the power domain it lives in (RK3588_PD_PCIE) nor its clock
> > (ACLK_MMU_PCIE). Both are held by any enabled PCIe controller, which is
> > why nobody noticed: on a board that enables no PCIe controller in that
> > domain (an Orange Pi 5 with its M.2 slot in SATA mode, or any RK3588
> > board without PCIe), genpd powers the domain off and the clock framework
> > gates the clock as unused after boot, while arm-smmu-v3 stays bound.
> > At reboot, arm_smmu_device_shutdown() then writes CR0 and polls CR0ACK =
on
> > the dead block, the interconnect stalls, "reboot: Restarting system" is
> > never reached and the board only comes back ~90 s later when the
> > watchdog fires.

We have a work-around for that in some boards, manually disabling the
smmu until now. As the SMMU is part of the SoC and always present
the general DT practice is to have it always enabled, as it does not
depend on the actual board design.

Hence we end up in the situation described above.

So this series fixes the actual underlying problem, making these
workarounds unnecessary in the future :-)


So definitly thanks a lot
Heiko



