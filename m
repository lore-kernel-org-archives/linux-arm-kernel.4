Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9434B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uJ/n+IZi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EyJ8DhbF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=B+N77ojB+5okIxP4FGww0vK4os8dkwh+znxCLIQEsBo=; b=uJ/n+IZieNI3a27p1wKoWFMzip
	o/Pa32Y8dxzx3M9r17AE9aIcvw3IfkoeBT2TiipxXVeDKA9e42fEfry5PbqEJ2pv9KerlgK0q4Y6t
	fAm8hMSuEoBSa1I5ye8fmAMdX6svJvd69b8tdqzSsWETF2KWLDX8KFice+9oKORrOF3/ltoaaulxY
	g9H6HdWOaJIeSsi6boeMbbJ1uGQ5WZtf290YrEIIkgqh8U7rUcIvToFoypvEUFlb3L3LCa/dllcTj
	/n3mCtUWJmpufBRgdzGMEXAvyVq2Du/kPPeD9UI3lBM7xqLagO3sbayzzyw1gaJ9/BixGgdjkWnf7
	iFPiJWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVsT-00000001djj-47GF;
	Mon, 09 Nov 2026 20:22:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVsS-00000001djK-1zyj;
	Mon, 09 Nov 2026 20:22:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFACE60DD5;
	Mon,  9 Nov 2026 20:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535D51F0089F;
	Mon,  9 Nov 2026 20:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794255723;
	bh=B+N77ojB+5okIxP4FGww0vK4os8dkwh+znxCLIQEsBo=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=EyJ8DhbFWoPZqp7mVWIgmJ8qxnlt1XWnUrul3lEkLYGnVX4P53qStNYfiPkx0bYTV
	 zYHiUrc4T9hIwZmcc9YJVCkeJiKBiKFWMUrz7WHx/7bXQxw9yBCnLltMqxVSdqknaR
	 n3rWgjP7Zm3cDXi+TkyFqKBzplJAdAnjp6Vy0d/3rDubmbU58yuwkmtu53Mi2zlosm
	 vh+ckIUxR5UT7mzL+A6/Uhk+DejbWsFdJAGeix6mg33M+XvRsu8baK0G8ckSvxvWMN
	 +On49msmgAzxwsFHE/yUA+bWfalrGd4+viw9kOeKdnlh83YcZKP2FEPkMlvOhKTjRe
	 FPGScfYNl01aw==
Date: Mon, 9 Nov 2026 14:22:02 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Igor Velkov <iav@iav.lv>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: rockchip-host: Enable async probe by default
Message-ID: <20261109202202.GA265423@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-rockchip-pcie-async-v1-1-4dcadb94af64@iav.lv>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 06:07:35AM +0000, Igor Velkov wrote:
> The probe waits for the link to come up, and with an empty slot it
> holds the deferred-probe worker for about 0.7 s. On ROCK Pi 4 with
> UHS-I enabled for the SD card, the I/O-domain driver then binds only
> after the card has switched to 1.8 V, and tuning fails ("All phases
> bad!").

I don't know what the SD card has to do with PCIe.  Seems like there's
some SD issue, and making PCIe async happens to avoid it?  Sounds
fragile to me.

Other changes like c0e1eb441b1d justify it by allowing other drivers
to load in parallel to reduce boot time, which is a good reason.  But
apparently here it makes a functional difference as well, which feels
sketchy.  E.g., what other drivers need to use async probe to avoid
similar issues?

> Probe asynchronously, as commit c0e1eb441b1d ("PCI: qcom: Enable async
> probe by default") does for the Qualcomm host driver. This does not
> order the I/O domain before dw_mmc in general; an explicit dependency
> was proposed in [1] and not merged.
> 
> Link: https://lore.kernel.org/all/20230904115816.1237684-1-s.hauer@pengutronix.de/ [1]
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on v7.3.1 with the Armbian rockchip64 config (PCIE_ROCKCHIP_HOST=y):
> - ROCK Pi 4A, empty slot, UHS-I DT change posted separately: SDR104 on
>   3 of 3 cold boots; without this patch tuning fails.
> - Kobol Helios64, JMB585 in the slot: link, SATA and disk reads OK
>   over 3 cold boots and a reboot.
> ---
>  drivers/pci/controller/pcie-rockchip-host.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index 5b071bdc4f90..1e1556e436b8 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -1027,6 +1027,7 @@ static struct platform_driver rockchip_pcie_driver = {
>  		.name = "rockchip-pcie",
>  		.of_match_table = rockchip_pcie_of_match,
>  		.pm = &rockchip_pcie_pm_ops,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  	},
>  	.probe = rockchip_pcie_probe,
>  	.remove = rockchip_pcie_remove,
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-rockchip-pcie-async-42c1c3863617
> 
> Best regards,
> -- 
> Igor Velkov <iav@iav.lv>
> 

