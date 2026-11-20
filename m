Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A98606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1r/Qfz8V;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=drWCvDpV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8DcVPoMTyDMFeCgP2Bb4hOxIVd8Rzj+Mk/EOJbdxMC4=; b=1r/Qfz8V9nYO9+9f+cjfhPRX3K
	6Gon5k/yzfm44OvUW8jev/pjtOnGFRpim6VdXi079BfVO/n1iFHCuAivv6Q5Y/e2y7n4fnCZoEQEl
	+aMT0whlNAzavJMgODNNr4b3GybgVRncbXPxM/Urynp538e5vqNhn/q800iLkp6AUM78UXSBT/bi0
	5fkPfidnjuPa9/OuiL7g/mFa2jjyAiE3K2evprLz3MR/gCHo5v9S5lg8IYay3TdwoY4RYvyUwWXkV
	t71+NImoH2M7VSfx1jlInLbpy9E4XLHLeSJtwr4pGQLhn/MDzBP6NExtoX261HL7Q+aZZtjLSi+Fo
	lKbOLK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULe3-0000000EaDv-0KgT;
	Fri, 20 Nov 2026 10:15:03 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULe0-0000000EaD2-41iL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:15:02 +0000
Received: from localhost (unknown [IPv6:2a0a:edc0:0:701:a74f:3cb8:3e85:d062])
	(Authenticated sender: fdi@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A6D24202284;
	Fri, 20 Nov 2026 11:14:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795169698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8DcVPoMTyDMFeCgP2Bb4hOxIVd8Rzj+Mk/EOJbdxMC4=;
	b=drWCvDpVxl3m+V11lVhD+cxvKZzjF5JYPItdT5AwcG2WxjmEFdgPhydL/7j7QSmmpkljLI
	vPydlOrSZdKUlUdGlJrtp3ARYuerT3nfEUNtqzJQCkLlz6ore7JBwew97RIxbNsVWl8DK6
	1f71iXdwz7RHtEmpax1c2J9zwwKzom/9DxZmjhwhXsyzp7fgbj+q+T9tmeRCCpNca60ETZ
	/McBIPVeAdkP7dqUd/zCAuJPG4ZHGbu+RsgXMtoZVt4kHh/OQoWtIcP4wBmf8LGZ18m22k
	kggPiq1DSpOP5YoRjkGtPxFrOcJZR24RxYs1ffWNm5ZGtosBGNLFwb8Y9WzCUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795169698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8DcVPoMTyDMFeCgP2Bb4hOxIVd8Rzj+Mk/EOJbdxMC4=;
	b=DNd5fSNZhUpQn0k5AbNKBXhpi4j9kHx4lhWHnLJhIp0oi/fTS8CixBSEucWRF0CTYKi+nd
	PaUeTkYD4XAWPtdStIuOG+DsKlJ6pW+7L5JBxC1yXRGc7ScXvzBZazqfITDQiO9sHdh8By
	kJHZW5yup+AyQTWpt6XMmFZBmctvqiNgEwyJk2trPLuDP1QtF8efzB/u9TSAP4RyUt2epa
	Y/14BT7k0ZH+K0JHXsU0u8VV/UCIqUI4JATpPyr09ZyHChxuh0agcIuqSDzTyd2azyyiUI
	lD8HlHboM4Ys4qeWWnFT4GU7P1Fv6mB7DuRZLOv7CzkA92fQc5PAMVOSS0OnyQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795169698; a=rsa-sha256;
	cv=none;
	b=ViijXAsPeeH+CZynw+5unPSy6CID0wgx0YHSs6qxRgUG4fqbnjoWI0bvPbp7Dy/KbRr6fr
	EKiCeqOw41Lo40Ll52vXNTy5ttjIT5oqGXC6jjOLzNA1xTtV9KjO2cvq7ZgSZGyPX6HqQF
	40bU/nbNVOQWQwo5aeFOGPhFiEb/+u2dYL5Y/5qdrj/54eS8OOAM0oagdGNtbvGNIzMRSx
	wzjWnPZKU3BIGXqzMYOLLCN6m5OQDcTgm9wjvLx1K+gKRMhSQq0RLG2n0fphHJW8Z9b8no
	P0wmApUgdYg2AI16dBojrTHHxxPjZYAoCRUaj5vvrvnt136IKPeZdZOLck6oag==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=fdi@pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
From: Freimut Diener <f.diener@pengutronix.de>
To: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>
Subject: RE: [PATCH 3/5] arm64: dts: freescale: imx93-11x11-frdm: use 8-bit
 eMMC bus
In-Reply-To: <MRWPR04MB12117CE93FD323459E370D08F94782@MRWPR04MB12117.eurprd04.prod.outlook.com>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
 <20261120-imx93-frdm-fixes-v1-3-78dde22a56fe@pengutronix.de>
 <MRWPR04MB12117CE93FD323459E370D08F94782@MRWPR04MB12117.eurprd04.prod.outlook.com>
Date: Fri, 20 Nov 2026 11:14:58 +0100
Message-ID: <87fqwvbyhp.fsf@theta.mail-host-address-is-not-set>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_021501_162426_423867D2 
X-CRM114-Status: UNSURE (   6.94  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Joseph Guo (OSS)" <qijian.guo@oss.nxp.com> writes:

> The usdhc3 connect to SDIO wifi module not eMMC. Are you sure you test it with exactly patch?

Yes, you (and Sashiko) are right in that usdhc3 is not the eMMC. It
actually is the M.2 slot connected to the wifi module and it has 4 data
lines.

The fix proposed by Sashiko is appropriate in my opinion (adding the
no-sd and no-mmc properties to usdhc3) to properly describe the hardware
and also remove the warning.

I tested that in the frdm-imx93 and will update the patch accordingly.

Best,
Freimut

