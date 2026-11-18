Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11460606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=koKBJlt6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ak41hTEh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XJmqha3jczEcaerimpEtNez8vFhS9CMO3UzYk56rIsY=; b=koKBJlt6i5WMnxaajmEJMBcgYW
	RAidLUYSg1fdavxNDLuaG34mHovI/XtEgdReJpsdIZ50W/hBE05yCUGzB9TAjqa+hawjGi79uryEM
	j5gyaJbu+J/DcxSHK2Vi4DSA3UtXVkdd1JK5ApTTOa2Chr0tNXwFAOBL0HVVczr8lMlGWHZpOASPy
	sNulxI357Pj8GRAiFhkVliBy7gpybgDw3ZshDHTrxU/HyERHctyf9BtYhsOtYZ9pJHcTt2GJfCJ1N
	CwCUWGE/jFTt+/cq0rUtgBt43PxI4M/Ht++Cbv7BEJeD9lXQnXeagu7ETciiSQL7BIVWPRmo7WImM
	q7fZ31Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmKf-0000000ADXL-3fXC;
	Wed, 18 Nov 2026 20:32:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmKe-0000000ADX8-1emM;
	Wed, 18 Nov 2026 20:32:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FCFE63B78;
	Wed, 18 Nov 2026 20:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9666B1F000C6;
	Wed, 18 Nov 2026 20:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795033958;
	bh=XJmqha3jczEcaerimpEtNez8vFhS9CMO3UzYk56rIsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ak41hTEh2Or4toXQzz7176z2UqaczmbWwvTnufoviYFJytOETfRg2aa0QK/68A9Nm
	 gxIYDh6Ag75SdaG3TKZW+16O2wyybY+cPkHsLxDWD/QC6bQ5ym6fGzH9mXMsP5DIN3
	 RHP8zK8feAO8BB4Mab8J7Y97Ukhy6y5e7wtbkPSyl4jNHX5Gx8z9d2Rd9qpgn4b7jr
	 auWnbP5kFSpwUUmbK7pHZg5D0Ah7yuAxK01zgG47x/QVPNEYHIg57EsxCwJ2N6MCb9
	 jY8keMjByapseewDHzDH4TGhtnl06j0T31BCfNER9ddo3G9guNLbixjZlh1e4oJdCw
	 NFaYBExwJyP7A==
Date: Wed, 18 Nov 2026 14:32:36 -0600
From: Rob Herring <robh@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>
Subject: Re: [PATCH v3 2/3] iommu/arm-smmu-v3: Enable an optional clock
Message-ID: <20261118203236.GA823624-robh@kernel.org>
References: <20261113-smmu-v3-pcie-pd-v3-0-39eb4f919529@gmail.com>
 <20261113-smmu-v3-pcie-pd-v3-2-39eb4f919529@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-smmu-v3-pcie-pd-v3-2-39eb4f919529@gmail.com>
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

On Fri, Nov 13, 2026 at 08:45:06AM +0000, Arun Iyengar wrote:
> On the RK3588 the PCIe SMMU's clock is gated as unused when no PCIe
> controller holds it, and the next register access (the CR0 write at
> shutdown) hangs. Enable the clock from the firmware node, if there is
> one, while the driver is bound.
> 
> Do it first in probe, as the firmware probe may take a Tegra CMDQV
> reference that only arm_smmu_impl_probe() releases.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 6d4520c47308..d3f42316b0d6 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -12,6 +12,7 @@
>  #include <linux/acpi.h>
>  #include <linux/acpi_iort.h>
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/crash_dump.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> @@ -5786,12 +5787,22 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	resource_size_t ioaddr;
>  	struct arm_smmu_device *smmu;
>  	struct device *dev = &pdev->dev;
> +	struct clk *clk;
>  
>  	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>  	if (!smmu)
>  		return -ENOMEM;
>  	smmu->dev = dev;
>  
> +	/*
> +	 * Before the firmware probe: it may take a reference on the Tegra
> +	 * CMDQV device that only arm_smmu_impl_probe() releases.
> +	 */
> +	clk = devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to enable clock\n");

The primary point of the "optional" flavor of get functions is so the 
get function itself can print an error rather than every driver doing 
it. So drop the error print here.

Rob

