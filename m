Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A215606B5BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SFGX3jNE;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=HTjyU8HA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YW52iYa3PS22kVrKBhZRqo+7XMDGvxdxdBLom1iDW5U=; b=SFGX3jNEjI1qoa
	DRT4fH/ExKAq4kIBlNm8hTgEJmPQsih1kMZ7TyDmCdjWPHijMXQPACqUetcipjt5JFY45sTk/Pfyb
	MNCmAyDZ8SxJJamHoSZIukZl5kSt6wB3NcQGMSYWzxT1N9o+gZqz2WHeFcH0vaTKXiNYDB6tiEcXT
	Z+3bzgJpZYWRPk0dZrXH0lp+wPiNxs2tJ1LRGEDvfPVDMsQms2pQyWyuFoHrf77cU4nLVabh281Dz
	yWYfU5SQdBhrfcq+xCX0j9SdTxTFI+XpLgAbdj/d2+iPT9Tsf/2mImwTUuko5Y7weFvTxnVm8smbJ
	cCI5hpMEI3n3i6VDoQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQU4-00000009EOP-1xvY;
	Thu, 12 Nov 2026 08:48:40 +0000
Received: from mail-m81151.netease.com ([47.88.81.151])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQTn-00000009EI3-3ZK9;
	Thu, 12 Nov 2026 08:48:37 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 546f2be92;
	Thu, 12 Nov 2026 16:48:08 +0800 (GMT+08:00)
Message-ID: <051621ab-a8b5-4120-afde-fbeeae48690d@rock-chips.com>
Date: Thu, 12 Nov 2026 16:48:06 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 kernel@collabora.com, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1cef161e603a7kunm25f03da89714c0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSBofVkIeGUgfSEJJQx9KHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=HTjyU8HAzlfGIH2zaWksvL0FatkZsBVvluGDZ0gXv7vdsLYvXtsI1AWIvGnpoKDX4/o3OOAfMNjPJk2bzP/cP7pzvx9KI8SL489WjcGeQL4HNW+4jNEWl43izC+LKg0zo4Ip/zGfA514bSOwoCB604D0QANS08DlCPVPFi8nZk4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=YW52iYa3PS22kVrKBhZRqo+7XMDGvxdxdBLom1iDW5U=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_004827_294825_D7B35FE9 
X-CRM114-Status: GOOD (  12.38  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sebastian,

On 10/22/2026 2:05 AM, Sebastian Reichel wrote:
> The recent Rockchip platform have a combined PHY, which does USB3 and
> DisplayPort as well as muxing the lines in arbitrary order. Changing its
> enabled functionality requires a PHY reset and as the PHY provides a
> clock to the DWC3 controller, this can result in an SError. Apart from
> that the PHY might not start up correctly when the DWC3 PIPE interface
> is running. This series prepares a Rockchip specific DWC3 glue driver to
> help out with these problems. To become useful more patches are needed
> on the Rockchip USBDP PHY side, which are send separately.
> 
> This was split from the USBDP cleanup series. v17 has a dependency on
> the patches that have been merged to phy's for-next branch. There are
> some additional Rockchip USBDP phy fixes, which depend on this series
> (which is effectively also a fix).
> 

I'm not sure whether this is the right thing to do, but I tried applying
all the v18 patches on top of v14 patch1–patch27, and tested Type-C DP
on the RK3576 EVB1 board. And it seems to work fine.

Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi

