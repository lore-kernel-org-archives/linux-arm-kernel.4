Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B38606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a7ievg7p;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mu/lHTgV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BTy58CI235BOpxJ6pfHU71EFz0mw9uHArXMAsUbTzDY=; b=a7ievg7pTnr5Q7Vol43yghf6GD
	HhmLmgs6YpA5boOeLqYGl0H81Vkt46lhzNRedcWy2yZMM5vCdRBM1bish0RHtOqqbwMEvgvzFByWs
	p5Dbg6KNzWUYM3oYBOvm5rzH2qtQwmudvD0JL39BGZJbXIzlxgdEpOXRyKeujypD0b78rcl+0Bjb3
	LnR7IRt0A58a2V0pUtjN9QDhgaC7srxkkjHqyFDDjHFNC3PduU1dymbBEZXCMHxHSCftPn0ejP6aK
	Nx5DEYulXCewaspAj6PuYZux5U6X0SDKFUV3aOmkp/v/+W6CoYaZh+9xSG1eVRk0lO1p9kH9hXMua
	FUOPS0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Ms-0000000C55P-3W7t;
	Thu, 19 Nov 2026 13:40:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Mr-0000000C54z-2Mek;
	Thu, 19 Nov 2026 13:40:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A5CD448CA;
	Thu, 19 Nov 2026 13:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104771F000C4;
	Thu, 19 Nov 2026 13:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095601;
	bh=BTy58CI235BOpxJ6pfHU71EFz0mw9uHArXMAsUbTzDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mu/lHTgVB/oWGvFcRqxmEVXLTJBen/gJctOYSQrvcX7Uy1EwGPhUyohO6kZmHncVd
	 3ybMPxb8UZfahZLlJ0zSDNcO1UxlSHGcKg8ZziOZOqez2pnKlM/XMf7mE8CakVsthd
	 8RAygp1nwC6Du6tjc6XkvK1uiNDv4EpclUKdlrR70RMW7RYtsEccxb3vLFbBgkEzYy
	 XjGNIJaH1+eJ5ILdjhDmy4EOkE/jf8H+Ia+Ug1iCqSfZEro9XSHBzZZnaeF5CMTbQS
	 j5Yn3yk/bnAsv8Rd2E0NWAey9R3sbaX46Nu/YvZAi88AmWx5Llu/NNL2hfeyAELwpc
	 AVYk2T+I1wEww==
Date: Thu, 19 Nov 2026 19:09:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 3/9] phy: broadcom: ns-usb3: Coordinate NSP USB2 and USB3
 initialization
Message-ID: <av78LMnP2ck168mC@parshuram>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-4-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021172819.668120-4-florian.fainelli@broadcom.com>
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

Hi,

On 21-10-26, 10:28, Florian Fainelli wrote:
> The iProc SDK holds both USB2 and USB3 cores in reset while programming
> the USB3 PLL, then releases USB2 before USB3. It also enables the USB2
> IDM interface clock. The Northstar Bx initialization used by NSP does
> not perform the USB2 setup or retain the SDK settling intervals.
> 
> Implement an NSP variant with the coordinated reset sequence and
> interface clock enable. Sharing one PHY between the HCDs lets the PHY
> core serialize and reference-count initialization, preventing a later
> host probe from resetting an already active USB2 controller.
> 
> Retain the downstream delays around reset and MDIO operations, and
> leave both NSP cores reset if programming fails. Keep existing
> Northstar Ax and Bx reset behavior unchanged.

This fails to apply for me on phy/next. can you please rebase the phy
parts and send

-- 
~Vinod

